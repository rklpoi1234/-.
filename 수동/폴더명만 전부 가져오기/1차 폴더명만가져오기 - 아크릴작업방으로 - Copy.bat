@echo off

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\아크릴작업"

if exist "%source%\끌레르액자" mkdir "%destination%\끌레르액자"
if exist "%source%\N끌레르" mkdir "%destination%\N끌레르"
if exist "%source%\마틸스" mkdir "%destination%\마틸스"
if exist "%source%\기본액자" mkdir "%destination%\기본액자"
if exist "%source%\베이직액자" mkdir "%destination%\베이직액자"

:: 위 코드를 bat 파일로 저장하고 실행하시면
:: C:\attre-down 디렉토리에 있는 오늘 날짜의 폴더
:: (예를 들어 오늘날짜가"2023-07-19")에서
:: 1차 단순4mm붙일것만 폴더(빈폴더)를가져올수있습니다.
:: 폴더를 C:\아크릴작업으로 복사합니다. 만약 1차로돌릴 액자가 달라지거나 수정이필요하면 그러면 수정하고 만들어주십시오
:: by 김윤기 (rklpoi5678@naver.com)