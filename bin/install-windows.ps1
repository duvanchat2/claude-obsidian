# install-windows.ps1
# Pega esto en PowerShell como Administrador
# Instala Git, descarga el vault e instala plugins de Obsidian

$VAULT = "$env:USERPROFILE\Documents\claude-obsidian"
$PLUGINS = "$VAULT\.obsidian\plugins"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   Instalando tu Brain en Obsidian         " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 1. Instalar Git si no existe
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "-> Instalando Git..." -ForegroundColor Yellow
    winget install --id Git.Git -e --source winget --silent
    $env:PATH += ";C:\Program Files\Git\cmd"
}
Write-Host "OK Git" -ForegroundColor Green

# 2. Clonar o actualizar el repo
if (Test-Path $VAULT) {
    Write-Host "-> Vault ya existe, actualizando..." -ForegroundColor Yellow
    git -C $VAULT pull
} else {
    Write-Host "-> Clonando vault..." -ForegroundColor Yellow
    git clone https://github.com/duvanchat2/claude-obsidian $VAULT
}
Write-Host "OK Vault en: $VAULT" -ForegroundColor Green

# 3. Crear carpeta de plugins
New-Item -ItemType Directory -Force -Path $PLUGINS | Out-Null

function Install-Plugin {
    param($Repo, $Name)
    $dir = "$PLUGINS\$Name"
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $release = Invoke-RestMethod "https://api.github.com/repos/$Repo/releases/latest"
    foreach ($asset in $release.assets) {
        if ($asset.name -match "^(main\.js|manifest\.json|styles\.css)$") {
            Invoke-WebRequest $asset.browser_download_url -OutFile "$dir\$($asset.name)" -UseBasicParsing
        }
    }
    Write-Host "  OK $Name" -ForegroundColor Green
}

Write-Host "-> Descargando plugins..." -ForegroundColor Yellow
Install-Plugin "blacksmithgu/obsidian-dataview"  "dataview"
Install-Plugin "SilentVoid13/Templater"           "templater-obsidian"
Install-Plugin "denolehov/obsidian-git"           "obsidian-git"

# 4. Habilitar plugins
$json = '["dataview","templater-obsidian","obsidian-git","calendar","obsidian-excalidraw-plugin","obsidian-banners"]'
Set-Content "$VAULT\.obsidian\community-plugins.json" $json

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "   TODO LISTO                              " -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Pasos finales:" -ForegroundColor White
Write-Host "  1. Abre Obsidian"
Write-Host "  2. 'Open folder as vault'"
Write-Host "  3. Selecciona: $VAULT"
Write-Host "  4. Activa los plugins cuando te lo pida"
Write-Host ""
Write-Host "Tu vault esta en: $VAULT" -ForegroundColor Cyan
