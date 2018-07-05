@echo off
title OCBatch
color 0A
echo ^> OCBatch.bat
:: ^ correspond au carractere d'echapement du batch

set pseudo=osellami
set var1=12
set var2=24

set /a result=%var1%+%var2%
:: /a permet de calculer et non pas concatener
echo. & echo %var1% + %var2% = %result%

echo. & echo Utilisateur actuel : %pseudo%.
set /p user=Saisissez votre pseudo : 
:: /p permet de capturer une saisie utilisateur

echo.
if %user% equ %pseudo% (
	echo Vous revoila !
	) else (
	echo Bonjour %user% !
)

echo. & echo Nous allons maintenant afficher 7x bonjour à l'aide d'une étiquette et d'une condition if :
set count=1
echo.
:etik
if %count% lss 8 (
	echo %count%. Bonjour !
	set /a count=%count%+1
	goto :etik
)

timeout /t 1 /nobreak > nul
echo. & echo Time out...
timeout /t 2 /nobreak > nul

echo. & echo Nous allons maintenant faire exactement la même chose avec une boucle for :
echo.
for /l %%x in (1, 1, 7) do (
	echo %%x. Bonjour !
)

timeout /t 1 /nobreak > nul
echo. & echo Time out...
timeout /t 2 /nobreak > nul

echo. & echo On va maintenant lire l'intégralité du fichier test2.txt :
echo.
for /f "tokens=*" %%a in (test2.txt) do (
	echo %%a
)
:: "tokens=*" permet de séléctionner tous les carractères (ou mots)
:: Sans ça, seul le premier mot de chaque ligne sera affiché

echo. & echo Maintenant, on va jouer à un jeu...
start OCBatch-TP1.bat
:: start permet d'ouvrir des script bat mais aussi des fichiers, dossiers, et même sites internet

echo. & echo Fin.

pause > nul