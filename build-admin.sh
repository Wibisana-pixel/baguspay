#!/bin/bash
set -e 

echo "1. Merakit jantung utama..."
pnpm --filter "@repo/*" build

echo "2. Masuk ke kamar admin..."
cd apps/web-admin

echo "3. Bikin peta anti-nyasar buat mesin SWC..."
cat << 'EOF' > .swcrc
{
  "jsc": {
    "baseUrl": "/app/apps/web-admin"
  }
}
EOF

echo "4. Merakit AdonisJS..."
node ace build

echo "5. ALHAMDULILLAH KELAR BOSKU!"
