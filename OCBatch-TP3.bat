@echo off
title OCBatch-TP3
color 0a
echo ^> OCBatch-TP2.bat & echo.

setlocal enableDelayedExpansion

:start

set a=0
echo * Cas normal :
echo. & echo Avant le if : [a] = %a%
if %a%==0 (
	set a=1
	echo Dans le if : [a] = %a%
)
echo Après le if : [a] = %a%

set a=0;

echo. & echo. & echo * Cas corrigé avec l'expansion retardée :
echo. & echo Avant le if : [a] = %a%
if %a%==0 (
	set a=1
	echo Dans le if : [a] = !a!
)
echo Après le if : [a] = %a%