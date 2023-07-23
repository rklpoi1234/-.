@echo off

setlocal

set "source=Y:\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\��ũ���۾�"

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

:: �� �ڵ带 bat ���Ϸ� �����ϰ� �����Ͻø�
:: C:\attre-down ���丮�� �ִ� ���� ��¥�� ����
:: (���� ��� "2023-07-19")����
:: ���ִ�������۾��� ������ �����Ͽ�
:: ��� ���ϰ� ������ C:\��ũ���۾����� �����մϴ�. ���� 2���ε��� ���ڰ� �޶����ų� �׷��� ������ֽʽÿ�
:: by ������ (rklpoi5678@naver.com)