@echo off
title 🚀 Iniciando Servidor Django (Auto Setup)

echo ============================================
echo     💻  START DJANGO PROJECT (AUTO SETUP)
echo ============================================
echo.

REM Ir para a pasta do script
cd /d "%~dp0"

REM 🔍 Localiza o manage.py automaticamente
for /r %%i in (manage.py) do (
    set "MANAGE_PATH=%%~dpi"
    goto found_manage
)

echo ❌ Arquivo manage.py não encontrado. Verifique se o projeto está completo.
pause
exit /b

:found_manage
cd /d "%MANAGE_PATH%"
echo 📁 Local encontrado: %MANAGE_PATH%
echo.

REM 🧠 Verifica se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python não está instalado ou não está configurado no PATH.
    echo Baixe em: https://www.python.org/downloads/
    pause
    exit /b
)

REM 🧩 Cria ambiente virtual se não existir
if not exist "venv\" (
    echo 🛠️  Criando ambiente virtual...
    python -m venv venv
)

REM 🧠 Ativa ambiente virtual
echo 🧠 Ativando ambiente virtual...
call venv\Scripts\activate.bat

REM 📦 Instala dependências se houver arquivo requirements.txt
if exist "requirements.txt" (
    echo 📦 Instalando dependências do requirements.txt...
    pip install -r requirements.txt
) else (
    echo ⚠️ Nenhum requirements.txt encontrado, instalando Django manualmente...
    pip install django
    pip freeze > requirements.txt
)

REM 🌐 Abre o navegador automaticamente
start "" http://127.0.0.1:8000/

REM 🚀 Inicia o servidor Django
echo 🚀 Iniciando servidor Django...
python manage.py runserver

pause
exit
