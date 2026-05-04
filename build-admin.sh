#!/bin/bash
set -e 

echo "1. Mengobati mesin SWC AdonisJS..."
sed -i 's|"baseUrl": "./"|"baseUrl": "/app/apps/web-admin"|g' apps/web-admin/tsconfig.json

echo "2. Merakit jantung utama..."
pnpm --filter "@repo/*" build

echo "3. Masuk ke kamar admin..."
cd apps/web-admin

echo "4. Merakit AdonisJS..."
node ace build

echo "5. Berhasil merakit! Mesin siap dinyalakan."
