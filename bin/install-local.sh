#!/usr/bin/env bash
# Instala el brain en tu PC con un solo comando
set -e

VAULT="$HOME/Documents/claude-obsidian"
OBSIDIAN_PLUGINS="$VAULT/.obsidian/plugins"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Instalando tu Brain en Obsidian    ║"
echo "╚══════════════════════════════════════╝"
echo ""

# 1. Clonar el repo
if [ -d "$VAULT" ]; then
  echo "→ El vault ya existe en $VAULT, actualizando..."
  git -C "$VAULT" pull
else
  echo "→ Clonando repo..."
  git clone https://github.com/duvanchat2/claude-obsidian "$VAULT"
fi

# 2. Setup inicial del vault
echo "→ Configurando vault..."
bash "$VAULT/bin/setup-vault.sh" "$VAULT"

# 3. Descargar plugins de Obsidian (Dataview, Templater, Obsidian Git)
echo "→ Descargando plugins de la comunidad..."

install_plugin() {
  local REPO="$1"
  local NAME="$2"
  local DIR="$OBSIDIAN_PLUGINS/$NAME"
  mkdir -p "$DIR"
  RELEASE=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")
  MAIN_URL=$(echo "$RELEASE" | grep '"browser_download_url"' | grep 'main.js"' | head -1 | cut -d'"' -f4)
  MANIFEST_URL=$(echo "$RELEASE" | grep '"browser_download_url"' | grep 'manifest.json"' | head -1 | cut -d'"' -f4)
  STYLES_URL=$(echo "$RELEASE" | grep '"browser_download_url"' | grep 'styles.css"' | head -1 | cut -d'"' -f4)
  [ -n "$MAIN_URL" ]     && curl -sL "$MAIN_URL"     -o "$DIR/main.js"
  [ -n "$MANIFEST_URL" ] && curl -sL "$MANIFEST_URL" -o "$DIR/manifest.json"
  [ -n "$STYLES_URL" ]   && curl -sL "$STYLES_URL"   -o "$DIR/styles.css"
  echo "  ✓ $NAME"
}

install_plugin "blacksmithgu/obsidian-dataview"    "dataview"
install_plugin "SilentVoid13/Templater"            "templater-obsidian"
install_plugin "denolehov/obsidian-git"            "obsidian-git"

# 4. Habilitar los plugins en community-plugins.json
COMMUNITY_JSON="$VAULT/.obsidian/community-plugins.json"
cat > "$COMMUNITY_JSON" << 'JSON'
["dataview","templater-obsidian","obsidian-git","calendar","better-word-count","obsidian-excalidraw-plugin","obsidian-banners"]
JSON

echo ""
echo "╔══════════════════════════════════════╗"
echo "║          ✓ Todo listo                ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Ahora:"
echo "  1. Abre Obsidian"
echo "  2. 'Open folder as vault' → $VAULT"
echo "  3. Activa los plugins cuando te lo pida"
echo ""
echo "Tu vault está en: $VAULT"
