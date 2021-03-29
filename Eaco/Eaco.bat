@echo off
goto reset

:reset
cls
@echo off
title EACO Enviroment
echo EACO v1.0.1
echo Created by MESYETI
echo Type eaco(help) for a list of commands
type %cd%\RESOURCES\blankline.txt

:recieve-command
set mycommand="__"
set /p mycommand="EACO> "
goto processcommand

:processcommand
if %mycommand%==eaco(loc)        (echo %cd%)
if %mycommand%==display(var)     (goto varco)
if %mycommand%==display(file)    (goto typefile)
if %mycommand%==eaco(ver)        (echo Eaco v1.0.1)
if %mycommand%==eaco(exit)       (exit)
if %mycommand%==eaco(help)       (type %cd%\RESOURCES\help.txt)
if %mycommand%==file(direct)     (goto filedir)
if %mycommand%==file(delete)     (goto filedel)
if %mycommand%==direct(make)     (goto dirmake)
if %mycommand%==eaco(reset)      (goto reset)
if %mycommand%==process(new)     (goto newproc)
if %mycommand%==process(kill)    (goto killproc)
if %mycommand%==process(list)    (tasklist)
if %mycommand%==video(colour)    (goto ccol)
if %mycommand%==sleep(save)      (goto scrnsaver)
if %mycommand%==internet(open)   (goto webopen)
if %mycommand%==app(start)       (goto openapp)
if %mycommand%==intapp(cmdemu)   (goto cmdemu)
if %mycommand%==immersive(on)    (goto imm1)
if %mycommand%==immersive(off)   (goto imm0)


goto recieve-command


:varco
set /p varco-input="Type the variable you want to see> "
echo %%varco-input%%
goto recieve-command

:typefile
set /p typefile-input="Type the file you want to view> "
type %typefile-input%
goto recieve-command

:filedir
set /p filedirpath="File Path> "
dir %filedirpath%
goto recieve-command

:filedel
set /p filedelpath="File Path> "
set /p ays1="Are you sure? (Y/N) "
if %aysl%==Y (del (filedelpath)
goto recieve-command

:dirmake
set /p dirmakepath="Type the new directory name> "
md %dirmakepath%
echo Directory created
goto recieve-command

:newproc
set /p newprocnam="New process name> "
start %newprocnam%
goto recieve-command

:killproc
set /p killprocname="Kill process> "
taskkill /f /im %killprocname%
goto recieve-command

:ccol
type %cd%\RESOURCES\colours.txt
set /p %scrncolour%="Type a colour ID to set the screen to> "
if %scrncolour%==7p (color 07)
if %scrncolour%==9g (color 17)
if %scrncolour%==8s (color 27)
goto recieve-command

goto recieve-command

:scrnsaver
echo E
timeout 1 >nul
echo EA
timeout 1 >nul
echo EAC
timeout 1 >nul
echo EACO
timeout 1 >nul
echo EAC
timeout 1 >nul
echo EA
timeout 1 >nul
goto scrnsaver

:webopen
set /p webopen="Page URL: "
cmd "start /max %webopen%"
goto recieve-command

:openapp
set /p apptoopen="Type the app directory> "
call %apptoopen%
echo App not found!
pause
goto recieve-command

:cmdemu
echo Are you sure you want to exit EACO to go to the CMD Emulator?
set /p cmdemuyn="(Y/N) "
if %cmdemuyn%==Y (goto cmdemuec)
goto recieve-command

:cmdemuec
set /p cmdemuecc="%cd%> "
%cmdemuecc%
goto cmdemuec

:imm1
taskkill /f /im explorer.exe >nul
echo Immersive mode has been entered!
pause
goto recieve-command

:imm0
start explorer.exe >nul
echo Immersive mode exited
pause
goto recieve-command