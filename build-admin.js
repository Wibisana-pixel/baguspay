const fs = require('fs');
const path = require('path');

const files = [
  'tsconfig.json',
  'packages/db/tsconfig.json',
  'packages/ui/tsconfig.json',
  'packages/configs/tsconfig.json',
  'apps/web-admin/tsconfig.json',
  'apps/web-admin/inertia/tsconfig.json'
];

console.log("=== Dokter Skrip Mulai Bekerja ===");

files.forEach(file => {
  const filePath = path.join(__dirname, file);
  if (fs.existsSync(filePath)) {
    let content = fs.readFileSync(filePath, 'utf8');
    const absolutePath = path.dirname(filePath);
    
    // Ganti "." dan "./" jadi alamat asli mutlak
    content = content.replace(/"baseUrl"\s*:\s*"\."/g, `"baseUrl": "${absolutePath}"`);
    content = content.replace(/"baseUrl"\s*:\s*"\.\/"/g, `"baseUrl": "${absolutePath}"`);
    
    fs.writeFileSync(filePath, content);
    console.log(`
    
