@echo off

setlocal

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\��ũ���۾�"

if not exist "%source%" (
  echo Source directory "%source%" does not exist.
  goto EndBatch
)

if not exist "%destination%" (
  echo Destination directory "%destination%" does not exist.
  goto EndBatch
)

xcopy "%source%\���尶����\*" "%destination%\���尶����\" /s /e /-y /i
xcopy "%source%\PAS\*" "%destination%\PAS\" /s /e /-y /i
xcopy "%source%\N��Ƽ�\*" "%destination%\N��Ƽ�\" /s /e /-y /i
xcopy "%source%\��Ƽ�\*" "%destination%\��Ƽ�\" /s /e /-y /i
xcopy "%source%\���������\*" "%destination%\���������\" /s /e /-y /i
xcopy "%source%\����������\*" "%destination%\����������\" /s /e /-y /i
xcopy "%source%\�����ӿ��\*" "%destination%\�����ӿ��\" /s /e /-y /i
xcopy "%source%\�����ӵ���\*" "%destination%\�����ӵ���\" /s /e /-y /i
xcopy "%source%\ĵ��������\*" "%destination%\ĵ��������\" /s /e /-y /i
xcopy "%source%\ĵ����(����)����\*" "%destination%\ĵ����(����)����\" /s /e /-y /i
xcopy "%source%\��Ż����\*" "%destination%\��Ż����\" /s /e /-y /i
xcopy "%source%\�������\*" "%destination%\�������\" /s /e /-y /i
xcopy "%source%\������\*" "%destination%\������\" /s /e /-y /i
xcopy "%source%\�к긯����\*" "%destination%\�к긯����\" /s /e /-y /i
xcopy "%source%\����\*" "%destination%\����\" /s /e /-y /i
xcopy "%source%\��Ʈ��\*" "%destination%\��Ʈ��\" /s /e /-y /i
xcopy "%source%\��Ʈ�÷���\*" "%destination%\��Ʈ�÷���\" /s /e /-y /i
xcopy "%source%\������\*" "%destination%\������\" /s /e /-y /i
xcopy "%source%\������(��Ʈ)\*" "%destination%\������(��Ʈ)\" /s /e /-y /i
xcopy "%source%\�������\*" "%destination%\�������\" /s /e /-y /i
xcopy "%source%\���ξ�Ʈ\*" "%destination%\���ξ�Ʈ\" /s /e /-y /i
xcopy "%source%\���¸�(���)\*" "%destination%\���¸�(���)\" /s /e /-y /i
xcopy "%source%\���¸�(ȭ��Ʈ)\*" "%destination%\���¸�(ȭ��Ʈ)\" /s /e /-y /i
xcopy "%source%\��������\*" "%destination%\��������\" /s /e /-y /i

:EndBatch

:: �� �ڵ带 bat ���Ϸ� �����ϰ� �����Ͻø�
:: C:\attre-down ���丮�� �ִ� ���� ��¥�� ����
:: (���� ��� "2023-07-19")����
:: ���ִ�������۾��� ������ �����Ͽ�
:: ��� ���ϰ� ������ C:\��ũ���۾����� �����մϴ�. ���� 2���ε��� ���ڰ� �޶����ų� �׷��� ������ֽʽÿ�
:: by ������ (rklpoi5678@naver.com)