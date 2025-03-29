#!/bin/bash

chmod +x export_images.sh

# MySQL database connection details
DB_USER="username"              # Username
DB_PASSWORD="password"         # Password
DB_NAME="database name"       # Magento 2 database name

# Execute SQL query and export the result to a CSV file
mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME -e "
SELECT
    e.entity_id AS id,
    e.sku,
    CONCAT('https://www.yoursite.com/media/catalog/product', mg.value) AS image_path
FROM catalog_product_entity e
JOIN catalog_product_entity_media_gallery_value_to_entity mgvte ON e.entity_id = mgvte.entity_id
JOIN catalog_product_entity_media_gallery mg ON mgvte.value_id = mg.value_id
WHERE e.entity_id IN (
    SELECT entity_id
    FROM catalog_product_entity_int i
    JOIN eav_attribute a ON i.attribute_id = a.attribute_id
    WHERE a.attribute_code = 'status' AND i.value = 1
)
ORDER BY e.entity_id
" > 'output.txt'

# Check if the SQL command succeeded
if [ -f output.txt ]; then
    sed 's/\t/|/g' output.txt > active_product_images.txt
    echo "Active product images exported: active_product_images.txt"
else
    echo "Error: SQL query failed, output.txt was not created"
    exit 1
fi

# If you want to print the directory where the CSV file is located
echo "Active product images exported: active_product_images.txt"

# Path to the CSV file
CSV_FILE="active_product_images.txt"

# Target directory for downloaded images
TARGET_DIR="/home/yourdirectory/releases/202312141316/pub/media/catalog/product"

# Skip the first row of the CSV file, get the 3rd column, and download images using wget
tail -n +2 $CSV_FILE | cut -d'|' -f3 | while read url; do
    # Extract filename from the URL
    filename=$(basename "$url")
    # Extract directory structure from the URL
    directory=$(dirname "${url#https://www.yoursite.com/media/catalog/product}")
    # Create target directory
    mkdir -p "$TARGET_DIR/$directory"
    # Download the file
    wget --progress=dot "$url" -O "$TARGET_DIR$directory/$filename"
done

# Message indicating the download is complete
echo "Images have been successfully downloaded."

