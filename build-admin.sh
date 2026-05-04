#!/bin/bash
echo "Memperbaiki lokasi folder untuk Railway..."
sed -i 's|"baseUrl": "./"|"baseUrl": "/app/apps/web-admin"|g' apps/web-admin/tsconfig.json

echo "Merakit jantung aplikasi..."
pnpm --filter "@repo/*" build

echo "Masuk ke kamar dan merakit AdonisJS..."
cd apps/web-admin
node ace build

echo "Selesai bossku!"

