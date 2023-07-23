@echo off

setlocal

set "source=Y:\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\아크릴작업"

if not exist "%source%" (
  echo Source directory "%source%" does not exist.
  goto EndBatch
)

if not exist "%destination%" (
  echo Destination directory "%destination%" does not exist.
  goto EndBatch
)

xcopy "%source%\AdminClaim\*" "%destination%\AdminClaim\" /s /e /-y /i
xcopy "%source%\arttreAlbum\*" "%destination%\arttreAlbum\" /s /e /-y /i
xcopy "%source%\Benefit\*" "%destination%\Benefit\" /s /e /-y /i
xcopy "%source%\BenefitMulti\*" "%destination%\BenefitMulti\" /s /e /-y /i
xcopy "%source%\BenefitWhite\*" "%destination%\BenefitWhite\" /s /e /-y /i
xcopy "%source%\Bezel\*" "%destination%\Bezel\" /s /e /-y /i
xcopy "%source%\Clair\*" "%destination%\Clair\" /s /e /-y /i
xcopy "%source%\Mordernwood\*" "%destination%\Mordernwood\" /s /e /-y /i
xcopy "%source%\Nature\*" "%destination%\Nature\" /s /e /-y /i
xcopy "%source%\Primewood\*" "%destination%\Primewood\" /s /e /-y /i
xcopy "%source%\Prism\*" "%destination%\Prism\" /s /e /-y /i
xcopy "%source%\TinK\*" "%destination%\TinK\" /s /e /-y /i
xcopy "%source%\ClairCDCase\*" "%destination%\ClairCDCase\" /s /e /-y /i
xcopy "%source%\Milky\*" "%destination%\Milky\" /s /e /-y /i
xcopy "%source%\NatureArc\*" "%destination%\NatureArc\" /s /e /-y /i
xcopy "%source%\SpecialBezel\*" "%destination%\SpecialBezel\" /s /e /-y /i
xcopy "%source%\UniqueArc\*" "%destination%\UniqueArc\" /s /e /-y /i
xcopy "%source%\Galaxy\*" "%destination%\Galaxy\" /s /e /-y /i
xcopy "%source%\GArc\*" "%destination%\GArc\" /s /e /-y /i
xcopy "%source%\NWGallery\*" "%destination%\NWGallery\" /s /e /-y /i
xcopy "%source%\Bitro\*" "%destination%\Bitro\" /s /e /-y /i
xcopy "%source%\Beliefwood\*" "%destination%\Beliefwood\" /s /e /-y /i

:EndBatch

:: 위 코드를 bat 파일로 저장하고 실행하시면
:: C:\attre-down 디렉토리에 있는 오늘 날짜의 폴더
:: (예를 들어 "2023-07-19")에서
:: 뉴겔더블라인작업할 폴더를 포함하여
:: 모든 파일과 폴더를 C:\아크릴작업으로 복사합니다. 만약 2차로돌릴 액자가 달라지거나 그러면 만들어주십시오
:: by 김윤기 (rklpoi5678@naver.com)