@echo off

set "source=Y:\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\��ũ���۾�"

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

:: �� �ڵ带 bat ���Ϸ� �����ϰ� �����Ͻø�
:: C:\attre-down ���丮�� �ִ� ���� ��¥�� ����
:: (���� ��� "2023-07-19")����
:: 2�� ���ִ�������Ұ͸� ����(������)�������ü��ֽ��ϴ�.
:: ������ C:\��ũ���۾����� �����մϴ�. ���� 2���ε��� ���ڰ� �޶����ų� �������ʿ��ϸ� �׷��� �����ϰ� ������ֽʽÿ�
:: by ������ (rklpoi5678@naver.com)