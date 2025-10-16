@echo off
title 🚀 Auto Git Push Script
color 0a

echo ============================================
echo      AUTO GIT PUSH - ENVIO AUTOMATICO
echo ============================================

REM Ir para o diretório onde o script está
cd /d "%~dp0"

REM Verifica se o Git está disponível
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ O Git nao esta instalado ou nao foi encontrado no PATH.
    pause
    exit /b
)

REM Verifica se há repositório Git
if not exist ".git" (
    echo ❌ Nenhum repositório Git encontrado neste diretório.
    pause
    exit /b
)

echo.
echo 📄 Status atual do repositório:
git status
echo.

REM Adiciona todas as alterações automaticamente
git add -A

REM Gera a data/hora atual formatada
for /f %%i in ('powershell -Command "Get-Date -Format yyyy-MM-dd_HH-mm"') do set DATA=%%i

REM Solicita descrição opcional do commit
set /p DESCRICAO=Digite uma descricao para o commit (ou deixe em branco): 

if "%DESCRICAO%"=="" (
    set COMMIT_MSG=Atualizacao_automatica_%DATA%
) else (
    set COMMIT_MSG=%DESCRICAO%_%DATA%
)

REM Realiza o commit
echo.
echo 📝 Fazendo commit: "%COMMIT_MSG%"
git commit -m "%COMMIT_MSG%" >nul 2>&1

if errorlevel 1 (
    echo ⚠️ Nenhuma mudanca para commit ou erro ao commitar.
    pause
    exit /b
)

REM Detecta automaticamente o nome da branch atual
for /f "tokens=*" %%B in ('git rev-parse --abbrev-ref HEAD') do set BRANCH=%%B

REM Faz o push para a branch atual
echo.
echo 🌐 Enviando para o GitHub (branch: %BRANCH%)...
git push origin %BRANCH%

if errorlevel 1 (
    echo ❌ Erro ao enviar para o GitHub!
    pause
    exit /b
)

echo.
echo ✅ Alteracoes enviadas com sucesso em: %DATA%
echo ============================================
pause
exit /b
