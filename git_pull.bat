@echo off

REM  AUTO GIT PULL SCRIPT


cd /d "%~dp0"

REM Verifica se o Git está instalado
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ O Git não está instalado ou não está no PATH.
    pause
    exit /b
)

echo.
echo 🔄 Baixando as atualizações do GitHub...
git pull origin main || git pull origin master

echo.
echo ✅ Repositório atualizado com sucesso!
pause
