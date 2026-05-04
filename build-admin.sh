#!/bin/bash
set -e 

echo "1. Merakit jantung utama..."
pnpm --filter "@repo/*" build

echo "2. Masuk ke kamar admin..."
cd apps/web-admin

echo "3. Merakit AdonisJS..."
node ace build

echo "4. Berhasil merakit! File siap dijalankan."
