# Magento2-Image-Downloader only enabled products

Magento2-Image-Downloader is a shell script designed to export and download product images from a Magento 2 database. It extracts image URLs of active products and downloads them to a specified directory.

## Features
- Exports active product image URLs from Magento 2 database.
- Formats output with a `|` separator for clean parsing.
- Downloads images using `wget` with a progress display.

## Requirements
- Linux-based system with MySQL and Bash.
- Magento 2 database access.
- `wget` and `sed` installed.

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/Magento2-Image-Downloader.git
   cd Magento2-Image-Downloader
   ```
2. Make the scripts executable:
   ```sh
   chmod +x export_images.sh download_images.sh
   ```

## Usage
### 1. Export Product Image URLs
Run the following command to extract active product image URLs into `product_images.txt`:
```sh
./export_images.sh
```
This script:
- Connects to the Magento 2 database.
- Extracts active product image paths.
- Saves them in `product_images.txt`, using `|` as a separator.

### 2. Download Images
Use the command below to download images to the Magento media directory:
```sh
./download_images.sh
```
This script:
- Reads `product_images.txt`.
- Extracts the image URLs.
- Uses `wget` to download them with a progress indicator.

## Contributing
Feel free to submit issues or pull requests to improve this script.

## License
This project is licensed under the MIT License.

