@echo off
setlocal enableDelayedExpansion
title OCBatch-TP2
color 0a
echo ^> OCBatch-TP2.bat

:gameStart

echo. & set /p niv=Choisissez un niveau de difficulté entre 1 et 10 : 

if %niv% gtr 10 (
	echo. & echo Il n'existe actuellement que 10 niveaux de difficulté ! Failed. & exit
) else (
	if niv equ 1 goto :niv1
	if niv equ 2 goto :niv2
	if niv equ 3 goto :niv3
	if niv equ 4 goto :niv4
	if niv equ 5 goto :niv5
	if niv equ 6 goto :niv6
	if niv equ 7 goto :niv7
	if niv equ 8 goto :niv8
	if niv equ 9 goto :niv9
	if niv equ 10 goto :niv10
)

:niv1
set /a x=%RANDOM%*10/32769+1 & echo %x%
goto tryResult

:niv2
set /a x=%RANDOM%*100/32769+1 & echo %x%
goto tryResult

:niv3
set /a x=%RANDOM%*250/32769+1 & echo %x%
goto tryResult

:niv4
set /a x=%RANDOM%*500/32769+1 & echo %x%
goto tryResult

:niv5
set /a x=%RANDOM%*1000/32769+1 & echo %x%
goto tryResult

:niv3
set /a x=%RANDOM%*5000/32769+1 & echo %x%
goto tryResult

:niv7
set /a x=%RANDOM%*10000/32769+1 & echo %x%
goto tryResult

:niv8
set /a x=%RANDOM%*20000/32769+1 & echo %x%
goto tryResult

:niv9
set /a x=%RANDOM%*30000/32769+1 & echo %x%
goto tryResult

:niv10
set /a x=%RANDOM%* & echo %x%
goto tryResult



:tryResult
echo. & echo L'ordinateur pense à un nombre... Trouvez le ! (%x%)
set /p saisie=Saisissez un nombre : 
set nbCoups=1

:tryResult2
if %saisie% equ %x% (
	echo Bravo, vous avez trouvez en %nbCoups% coups !
) else (
	set /a nbCoups = %nbCoups%+1
	if %saisie% lss %x% (
		set /p saisie=!nbCoups!. Le nombre est trop petit, recommencez : 
	) else (
		set /p saisie=!nbCoups!. Le nombre est trop grand, recommencez : 
	) rem On utilise l'expansion retardée, avec les !, pour afficher le resultat de la variable après calcul par le préprocesseur
	goto :tryResult2
)

rem enregistrer le score dans un fichier
set score=\nVous avez trouvé le resultat (= %x%) en %nbCoups% coups.
echo %score%>>result.txt


echo. & set /p doItAg=Recommencer ? (O/N^)
if /i %doItAg% equ O (
	goto gameStart
) else (
	if doItAg equ Y goto gameStart
)

echo. & echo Fin.
pause > nul