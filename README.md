# 💻 RESPALDO DE MI ENTORNO CORE-TERMUX

Este repositorio contiene mi configuracion personal para Termux en Android. 
Aqui guardo la estructura de mi entorno de desarrollo, incluyendo mi configuracion de ZSH, mi editor Neovim (NvChad) y mi logo de inicio generado con arte ASCII usando Chafa.

## 🚀 COMO RESTAURAR ESTE ENTORNO

### 1. Descargar el respaldo:
```bash
git clone [https://github.com/knotasu/termux-backup.git](https://github.com/knotasu/termux-backup.git)
```

### 2. Restaurar configuraciones base:
```bash
cd termux-backup
cp .gitconfig ~/
cp .zshrc ~/
cp .p10k.zsh ~/
cp -r .config ~/
cp -r .termux ~/
```

### 3. Restaurar el logo a color de inicio:
```bash
mkdir -p ~/.local/share/core-termux/assets/banner
cp assets/banner/devcorex.txt ~/.local/share/core-termux/assets/banner/
```

### 4. Aplicar los cambios:
```bash
zsh
```

## ⚙️ SI QUIERES USAR ESTA PLANTILLA
Si quieres usar mi estructura para guardar tus propias configuraciones, sigue estos pasos:

### 1. Clona este repositorio en tu Termux:
```bash
git clone [https://github.com/knotasu/termux-backup.git](https://github.com/knotasu/termux-backup.git)
cd termux-backup
```

### 2. Conecta tu propio GitHub:
```bash
git remote remove origin
git remote add origin [https://github.com/TU_USUARIO/TU_REPOSITORIO.git](https://github.com/TU_USUARIO/TU_REPOSITORIO.git)
```

### 3. Sube la configuracion:
```bash
git branch -M main
git push -u origin main
```

## 🔄 COMO ACTUALIZAR EL RESPALDO

### 1. Entra a tu carpeta de respaldo local:
```bash
cd ~/termux-backup
```

### 2. Copia solo los archivos que modificaste:
```bash
cp ~/.zshrc ~/termux-backup/
cp -r ~/.config ~/termux-backup/
```

### 3. Sube la actualizacion a GitHub:
```bash
git add .
git commit -m "Actualizacion de mi entorno"
git push
```
