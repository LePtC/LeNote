"C:\Program Files\Sublime\Data\Packages\User\dde.exe" @' 'SUMATRA' 'control' '[ForwardSearch("%~1.pdf","%~1.tex",%2,0)]'
start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%~1.pdf" -reuse-instance
exit /b 0
