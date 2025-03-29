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
   chmod +x export_images.sh
   ```

## Usage
Run the following command
```sh
./export_images.sh
```

## Contributing
Feel free to submit issues or pull requests to improve this script.

## License
This project is licensed under the MIT License.

