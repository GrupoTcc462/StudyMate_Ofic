@echo off
title 🚀 GIT PUSH AUTOMÁTICO
color 0A

echo ============================================
echo        🔄 ENVIO AUTOMÁTICO PARA GITHUB
echo ============================================
echo.

REM Muda para o diretório do script
cd /d "%~dp0"

REM Verifica se o Git está instalado
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ O Git não está instalado ou não está no PATH.
    echo.
    pause
    exit /b
)

REM Verifica se é um repositório Git
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ❌ Esta pasta não é um repositório Git.
    echo.
    pause
    exit /b
)

echo 🔍 Verificando alterações...
git status
echo.

REM Adiciona todos os arquivos modificados
git add .
if errorlevel 1 (
    echo ❌ Falha ao adicionar arquivos.
    echo.
    pause
    exit /b
)

REM Pega a data atual (formato amigável)
for /f %%i in ('powershell -Command "Get-Date -Format yyyy-MM-dd_HH-mm"') do set DATA=%%i

REM Solicita a mensagem do commit
set /p COMMIT_MSG=📝 Digite o nome do commit (ou deixe em branco para padrão): 

if "%COMMIT_MSG%"=="" (
    set COMMIT_MSG=Atualizacao_automatica_%DATA%
)

REM Faz o commit
echo.
echo 🧱 Criando commit: "%COMMIT_MSG%"
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo ⚠️ Nenhuma alteração para enviar ou erro no commit.
    echo.
    pause
    exit /b
)

REM Faz o push
echo.
echo 🚀 Enviando alterações para o GitHub...
git push origin main || git push origin master
if errorlevel 1 (
    echo ❌ Falha ao enviar alterações!
    echo 💡 Tente rodar "git pull" antes.
    echo.
    pause
    exit /b
)

echo.
echo ============================================
echo ✅ Commit enviado com sucesso!
echo 🕒 Mensagem: %COMMIT_MSG%
echo ============================================
echo.
pause
