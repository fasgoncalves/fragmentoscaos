#!/bin/bash

echo "🚀 Iniciando deploy da Biblioteca Livre..."

# Caminhos
PROJECT_DIR="/home/fgoncalves/Sites/fragmentoscaos"
DESTINATION_DIR="/var/www/html/ebooks.fragmentoscaos.eu"

# 1. Entrar no diretório do projeto
#cd "$PROJECT_DIR" || { echo "❌ Falha ao entrar em $PROJECT_DIR"; exit 1; }

# 2. Gerar o site com todos os conteúdos (incluindo futuros e drafts)
#cd "$PROJECT_DIR"
echo "🛠️ Gerando site Hugo com opções completas..."
hugo --buildDrafts --buildFuture --cleanDestinationDir

# 3. Apagar conteúdo anterior
echo "🧹 Limpando destino anterior..."
sudo rm -rf "$DESTINATION_DIR"/*

# 4. Copiar novo site para o destino
echo "📥 Copiando novo site para o destino..."
sudo cp -r public/* "$DESTINATION_DIR"

# 5. Corrigir permissões
echo "🔧 Corrigindo permissões..."
sudo chown -R www-data:www-data "$DESTINATION_DIR"
sudo chmod -R 755 "$DESTINATION_DIR"

# 6. Reiniciar Apache
echo "🔄 Reiniciando Apache..."
sudo systemctl reload apache2

echo "✅ Deploy completo! A tua Biblioteca Livre está atualizada no universo!"

