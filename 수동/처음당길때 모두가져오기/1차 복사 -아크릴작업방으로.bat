@echo off

setlocal

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\아크릴작업" ::복사&붙여넣기 해서 이동될위치


if not exist "%source%" (
  echo Source directory "%source%" does not exist.
  goto EndBatch
)

if not exist "%destination%" (
  echo Destination directory "%destination%" does not exist.
  goto EndBatch
)

xcopy "%source%\끌레르액자\*" "%destination%\끌레르액자\" /s /e /-y /i
xcopy "%source%\N끌레르\*" "%destination%\N끌레르\" /s /e /-y /i
xcopy "%source%\마틸스\*" "%destination%\마틸스\" /s /e /-y /i
xcopy "%source%\기본액자\*" "%destination%\기본액자\" /s /e /-y /i
xcopy "%source%\베이직액자\*" "%destination%\베이직액자\" /s /e /-y /i


::/S파일이 존재하고 있는 경우에만 디렉토리별로 복사한다.
::/E파일이 존재하지 않는 경우에도 디렉토리별로 복사한다.
::/Y동명의 파일이 존재하는 경우에는 덮어쓰기를 확인하지 않는다.
::/-Y동명의 파일이 존재할 경우 덮어쓰기를 확인한다.
::/Z 네트워크를 경유하여 복사를 할 때 네트워크가 끊어져도 복사를 재개할 수 있도록 한다.
::/I복사할 디렉토리가 존재하지 않을 경우 새로 디렉토리를 생성한다

::여기서 액자추가수정가능 %source%는 가져올소스 함수고  %destination%은 도착지입니다.

:EndBatch

:: %%는 변수를 말합니다.%date%는 시스템에서 현재 날짜를 나타냅니다. 
:: :~ 연산자는 문자열을 추출하는 데 사용됩니다. 
:: 따라서 %date:~0,4%-%date:~5,2%-%date:~8,2%는 현재 날짜를 연(Year), 월(Month), 일(Day) 
:: 구성요소로 분리하여 "YYYY-MM-DD" 형식으로 지정합니다.

:: 예를 들어 현재 날짜가 "2023-07-19"라면 다음과 같은 구성요소를 추출합니다:
:: 연도(Year): %date:~0,4% -> "2023"
:: 월(Month): %date:~5,2% -> "07"
:: 일(Day): %date:~8,2% -> "19"

:: 위 코드를 bat 파일로 저장하고 실행하시면
:: C:\attre-down 디렉토리에 있는 오늘 날짜의 폴더
:: (예를 들어 "2023-07-19")에서
:: 끌레르액자, N끌레르, 마틸스, 기본액자, 베이직액자 폴더를 포함하여
:: 모든 파일과 폴더를 C:\아크릴작업으로 복사합니다. 만약 1차로돌릴 액자가 달라지거나 그러면 만들어주십시오
:: by 김윤기 (rklpoi5678@naver.com)