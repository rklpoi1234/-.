@echo off

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\��ũ���۾�"

if exist "%source%\���尶����" mkdir "%destination%\���尶����"
if exist "%source%\PAS" mkdir "%destination%\PAS"
if exist "%source%\N��Ƽ�" mkdir "%destination%\N��Ƽ�"
if exist "%source%\��Ƽ�" mkdir "%destination%\��Ƽ�"
if exist "%source%\���������" mkdir "%destination%\���������"
if exist "%source%\����������" "%destination%\����������"
if exist "%source%\�����ӿ��" mkdir "%destination%\�����ӿ��"
if exist "%source%\�����ӵ���" mkdir "%destination%\�����ӵ���"
if exist "%source%\ĵ��������" mkdir "%destination%\ĵ��������"
if exist "%source%\ĵ����(����)����" mkdir "%destination%\ĵ����(����)����"
if exist "%source%\��Ż����" mkdir "%destination%\��Ż��"
if exist "%source%\�������" mkdir "%destination%\�������"
if exist "%source%\������" mkdir "%destination%\������"
if exist "%source%\�к긯����" mkdir "%destination%\�к긯����"
if exist "%source%\����" mkdir "%destination%\����"
if exist "%source%\��Ʈ��" mkdir "%destination%\��Ʈ��"
if exist "%source%\��Ʈ�÷���" mkdir "%destination%\��Ʈ�÷���"
if exist "%source%\������" mkdir "%destination%\������"
if exist "%source%\������(��Ʈ)" mkdir "%destination%\������(��Ʈ)"
if exist "%source%\�������" mkdir "%destination%\�������"
if exist "%source%\���ξ�Ʈ" mkdir "%destination%\���ξ�Ʈ"
if exist "%source%\���¸�(���)" mkdir "%destination%\���¸�(���)"
if exist "%source%\���¸�(ȭ��Ʈ)" mkdir "%destination%\���¸�(ȭ��Ʈ)"
if exist "%source%\��������" mkdir "%destination%\��������"
if exist "%source%\��Ż����" mkdir "%destination%\��Ż����"

:: �� �ڵ带 bat ���Ϸ� �����ϰ� �����Ͻø�
:: C:\attre-down ���丮�� �ִ� ���� ��¥�� ����
:: (���� ��� "2023-07-19")����
:: 2�� ���ִ�������Ұ͸� ����(������)�������ü��ֽ��ϴ�.
:: ������ C:\��ũ���۾����� �����մϴ�. ���� 2���ε��� ���ڰ� �޶����ų� �������ʿ��ϸ� �׷��� �����ϰ� ������ֽʽÿ�
:: by ������ (rklpoi5678@naver.com)