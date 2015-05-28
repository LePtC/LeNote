@echo off
call xelatex -interaction=nonstopmode --quiet %1.tex 2>nul
if errorlevel 1 goto END
if exist %1.bib bibtex --quiet %1 2>nul
xelatex --synctex=1 -interaction=nonstopmode --quiet %1.tex > nul 2>nul
del /f /a /q %1.out > nul 2>nul
del /f /a /q %1.log > nul 2>nul
del /f /a /q %1.aux > nul 2>nul
del /f /a /q %1.toc > nul 2>nul
del /f /a /q %1.blg > nul 2>nul
del /f /a /q texput.log > nul 2>nul
rem "C:\Program Files\Sublime\Data\Packages\User\esc.vbs"
exit /b 0
:end
echo.
REM find "tex" < %1.log
exit /b 1
