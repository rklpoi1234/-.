@echo off

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\��ũ���۾�"

if exist "%source%\����������" mkdir "%destination%\����������"
if exist "%source%\N������" mkdir "%destination%\N������"
if exist "%source%\��ƿ��" mkdir "%destination%\��ƿ��"
if exist "%source%\�⺻����" mkdir "%destination%\�⺻����"
if exist "%source%\����������" mkdir "%destination%\����������"

:: �� �ڵ带 bat ���Ϸ� �����ϰ� �����Ͻø�
:: C:\attre-down ���丮�� �ִ� ���� ��¥�� ����
:: (���� ��� ���ó�¥��"2023-07-19")����
:: 1�� �ܼ�4mm���ϰ͸� ����(������)�������ü��ֽ��ϴ�.
:: ������ C:\��ũ���۾����� �����մϴ�. ���� 1���ε��� ���ڰ� �޶����ų� �������ʿ��ϸ� �׷��� �����ϰ� ������ֽʽÿ�
:: by ������ (rklpoi5678@naver.com)