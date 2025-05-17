#!/bin/bash

# Nome do repositório GitHub (substitui pelo teu utilizador e nome do repo)
REPO_URL="https://github.com/fasgoncalves/fragmentoscaos.git"
BRANCH="main"

# Caminho local para o site
SITE_DIR="$HOME/Sites/fragmentoscaos"

# Mensagem de commit (pode ser passada como argumento)
COMMIT_MSG="${1:-Atualização automática do site}"

# Geração do site (assumindo uso de Hugo)
echo "A gerar site com Hugo..."
cd "$SITE_DIR" || exit 1
hugo || { echo "Erro ao gerar o site com Hugo"; exit 1; }

# Verificar mudanças e fazer push
echo "A atualizar repositório Git..."
git add .
git commit -m "$COMMIT_MSG"
git push origin "$BRANCH"

echo "Site publicado com sucesso no Netlify via GitHub!"

