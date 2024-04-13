@echo off
setlocal

:: Verifica se a pasta � um reposit�rio Git
if exist .git (
    echo O reposit�rio j� existe. Atualizando e copiando arquivos...
    goto UpdateAndCopy
) else (
    echo Iniciando novo reposit�rio Git...
    git init
    git remote add origin https://github.com/mri-Qbox-Brasil/mri_Qbox.git
    echo.
    echo Puxando a branch main do reposit�rio remoto...
    git pull origin main
    echo.
    echo Copiando arquivos para a pasta de destino...
    xcopy /s /y .\*.* ..\destino\ /exclude:update.bat
    echo.
    echo Arquivos copiados com sucesso!
    pause
    goto End
)

:UpdateAndCopy
echo Atualizando o reposit�rio local...
git pull origin main
echo.
echo Copiando arquivos para a pasta de destino...
xcopy /s /y .\*.* ..\destino\ /exclude:update.bat
echo.
echo Arquivos copiados com sucesso!
pause

:End
endlocal