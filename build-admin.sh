#!/bin/bash
set -e 

echo "1. Mencari alamat server aslinya..."
RUMAH="$(pwd)/apps/web-admin"
echo "Alamat ketemu di: $RUMAH"

echo "2. Menyuntik obat ke tsconfig..."
sed -i "s|\"baseUrl\": \".\"|\"baseUrl\": \"$RUMAH\"|g" apps/web-admin/tsconfig.json
sed -i "s|\"baseUrl\": \"./\"|\"baseUrl\": \"$RUMAH\"|g" apps/web-admin/tsconfig.json
sed -i "s|\"baseUrl\":\".\"|\"baseUrl\":\"$RUMAH\"|g" apps/web-admin/tsconfig.json
sed -i "s|\"baseUrl\":\"./\"|\"baseUrl\":\"$RUMAH\"|g" apps/web-admin/tsconfig.json

echo "3. Merakit jantung utama..."
pnpm --filter "@repo/*" build

echo "4. Masuk ke kamar admin..."
cd apps/web-admin

echo "5. Merakit AdonisJS..."
node ace build

echo "6. SELESAI BOSKU! SIAP TERBANG!"
