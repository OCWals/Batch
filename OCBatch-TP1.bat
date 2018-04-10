@echo off
title OCBatch-TP1
color 0a
echo ^> OCBatch-TP1.bat

:gameStart

set nbCoups = 1
set x=%RANDOM%
echo. & echo L'ordinateur pense à un nombre... Trouvez le ! %x%

set /p saisie=Saisissez un nombre : 

:TryAg

if %saisie% equ %x% (
	echo Bravo, vous avez trouvez !
) else (
	if %saisie% lss %x% (
		set /a nbCoups = %nbCoups%+1
		set /p saisie=%nbCoups%. Le nombre est trop petit, recommencez : 
	) else (
		set /a nbCoups = %nbCoups%+1
		set /p saisie=%nbCoups%. Le nombre est trop grand, recommencez : 
	)
	goto :TryAg
)

echo. & set /p doItAg=Recommencer ? (O/N^) 
if %doItAg% equ O (
	goto gameStart
) else (
	if doItAg equ Y goto gameStart
)

echo.
echo Fin.
pause > nul