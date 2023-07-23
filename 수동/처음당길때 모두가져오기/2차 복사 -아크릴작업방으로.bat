@echo off

setlocal

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\아크릴작업"

if not exist "%source%" (
  echo Source directory "%source%" does not exist.
  goto EndBatch
)

if not exist "%destination%" (
  echo Destination directory "%destination%" does not exist.
  goto EndBatch
)

xcopy "%source%\뉴욕갤러리\*" "%destination%\뉴욕갤러리\" /s /e /-y /i
xcopy "%source%\PAS\*" "%destination%\PAS\" /s /e /-y /i
xcopy "%source%\N디아섹\*" "%destination%\N디아섹\" /s /e /-y /i
xcopy "%source%\디아섹\*" "%destination%\디아섹\" /s /e /-y /i
xcopy "%source%\빌리프우드\*" "%destination%\빌리프우드\" /s /e /-y /i
xcopy "%source%\빌리프데코\*" "%destination%\빌리프데코\" /s /e /-y /i
xcopy "%source%\프라임우드\*" "%destination%\프라임우드\" /s /e /-y /i
xcopy "%source%\프라임데코\*" "%destination%\프라임데코\" /s /e /-y /i
xcopy "%source%\캔버스액자\*" "%destination%\캔버스액자\" /s /e /-y /i
xcopy "%source%\캔버스(무광)액자\*" "%destination%\캔버스(무광)액자\" /s /e /-y /i
xcopy "%source%\메탈라인\*" "%destination%\메탈라인\" /s /e /-y /i
xcopy "%source%\원목액자\*" "%destination%\원목액자\" /s /e /-y /i
xcopy "%source%\모던우드\*" "%destination%\모던우드\" /s /e /-y /i
xcopy "%source%\패브릭데코\*" "%destination%\패브릭데코\" /s /e /-y /i
xcopy "%source%\루이\*" "%destination%\루이\" /s /e /-y /i
xcopy "%source%\빌트랩\*" "%destination%\빌트랩\" /s /e /-y /i
xcopy "%source%\아트플러스\*" "%destination%\아트플러스\" /s /e /-y /i
xcopy "%source%\프리즘\*" "%destination%\프리즘\" /s /e /-y /i
xcopy "%source%\프리모(마트)\*" "%destination%\프리모(마트)\" /s /e /-y /i
xcopy "%source%\엣지우드\*" "%destination%\엣지우드\" /s /e /-y /i
xcopy "%source%\파인아트\*" "%destination%\파인아트\" /s /e /-y /i
xcopy "%source%\이태리(골드)\*" "%destination%\이태리(골드)\" /s /e /-y /i
xcopy "%source%\이태리(화이트)\*" "%destination%\이태리(화이트)\" /s /e /-y /i
xcopy "%source%\블랙갤러리\*" "%destination%\블랙갤러리\" /s /e /-y /i

:EndBatch

:: 위 코드를 bat 파일로 저장하고 실행하시면
:: C:\attre-down 디렉토리에 있는 오늘 날짜의 폴더
:: (예를 들어 "2023-07-19")에서
:: 뉴겔더블라인작업할 폴더를 포함하여
:: 모든 파일과 폴더를 C:\아크릴작업으로 복사합니다. 만약 2차로돌릴 액자가 달라지거나 그러면 만들어주십시오
:: by 김윤기 (rklpoi5678@naver.com)