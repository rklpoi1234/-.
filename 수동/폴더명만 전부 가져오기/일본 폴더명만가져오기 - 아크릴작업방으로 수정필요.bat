@echo off

set "source=Y:\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\아크릴작업"

if exist "%source%\AdminClaim" mkdir "%destination%\AdminClaim"
if exist "%source%\arttreAlbum" mkdir "%destination%\arttreAlbum"
if exist "%source%\Benefit" mkdir "%destination%\Benefit"
if exist "%source%\BenefitMulti" mkdir "%destination%\BenefitMulti"
if exist "%source%\BenefitWhite" mkdir "%destination%\BenefitWhite"
if exist "%source%\Bezel" mkdir "%destination%\Bezel"
if exist "%source%\Clair" mkdir "%destination%\Clair"
if exist "%source%\Mordernwood" mkdir "%destination%\Mordernwood"
if exist "%source%\Nature" mkdir "%destination%\Nature"
if exist "%source%\Primewood" mkdir "%destination%\Primewood"
if exist "%source%\Prism" mkdir "%destination%\Prism"
if exist "%source%\TinK" mkdir "%destination%\TinK"
if exist "%source%\ClairCDCase" mkdir "%destination%\ClairCDCase"
if exist "%source%\Milky" mkdir "%destination%\Milky"
if exist "%source%\NatureArc" mkdir "%destination%\NatureArc"
if exist "%source%\SpecialBezel" mkdir "%destination%\SpecialBezel"
if exist "%source%\UniqueArc" mkdir "%destination%\UniqueArc"
if exist "%source%\Galaxy" mkdir "%destination%\Galaxy"
if exist "%source%\GArc" mkdir "%destination%\GArc"
if exist "%source%\NWGallery" mkdir "%destination%\NWGallery"
if exist "%source%\Bitro" mkdir "%destination%\Bitro"

:: 위 코드를 bat 파일로 저장하고 실행하시면
:: C:\attre-down 디렉토리에 있는 오늘 날짜의 폴더
:: (예를 들어 "2023-07-19")에서
:: 2차 뉴겔더블라인할것만 폴더(빈폴더)를가져올수있습니다.
:: 폴더를 C:\아크릴작업으로 복사합니다. 만약 2차로돌릴 액자가 달라지거나 수정이필요하면 그러면 수정하고 만들어주십시오
:: by 김윤기 (rklpoi5678@naver.com)