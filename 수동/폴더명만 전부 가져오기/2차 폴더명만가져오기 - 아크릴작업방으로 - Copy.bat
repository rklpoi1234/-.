@echo off

set "source=\\arttre-down\tmp_client\%date:~0,4%-%date:~5,2%-%date:~8,2%"
set "destination=E:\아크릴작업"

if exist "%source%\뉴욕갤러리" mkdir "%destination%\뉴욕갤러리"
if exist "%source%\PAS" mkdir "%destination%\PAS"
if exist "%source%\N디아섹" mkdir "%destination%\N디아섹"
if exist "%source%\디아섹" mkdir "%destination%\디아섹"
if exist "%source%\빌리프우드" mkdir "%destination%\빌리프우드"
if exist "%source%\빌리프데코" "%destination%\빌리프데코"
if exist "%source%\프라임우드" mkdir "%destination%\프라임우드"
if exist "%source%\프라임데코" mkdir "%destination%\프라임데코"
if exist "%source%\캔버스액자" mkdir "%destination%\캔버스액자"
if exist "%source%\캔버스(무광)액자" mkdir "%destination%\캔버스(무광)액자"
if exist "%source%\메탈라인" mkdir "%destination%\메탈라"
if exist "%source%\원목액자" mkdir "%destination%\원목액자"
if exist "%source%\모던우드" mkdir "%destination%\모던우드"
if exist "%source%\패브릭데코" mkdir "%destination%\패브릭데코"
if exist "%source%\루이" mkdir "%destination%\루이"
if exist "%source%\빌트랩" mkdir "%destination%\빌트랩"
if exist "%source%\아트플러스" mkdir "%destination%\아트플러스"
if exist "%source%\프리즘" mkdir "%destination%\프리즘"
if exist "%source%\프리모(마트)" mkdir "%destination%\프리모(마트)"
if exist "%source%\엣지우드" mkdir "%destination%\엣지우드"
if exist "%source%\파인아트" mkdir "%destination%\파인아트"
if exist "%source%\이태리(골드)" mkdir "%destination%\이태리(골드)"
if exist "%source%\이태리(화이트)" mkdir "%destination%\이태리(화이트)"
if exist "%source%\블랙갤러리" mkdir "%destination%\블랙갤러리"
if exist "%source%\메탈라인" mkdir "%destination%\메탈라인"

:: 위 코드를 bat 파일로 저장하고 실행하시면
:: C:\attre-down 디렉토리에 있는 오늘 날짜의 폴더
:: (예를 들어 "2023-07-19")에서
:: 2차 뉴겔더블라인할것만 폴더(빈폴더)를가져올수있습니다.
:: 폴더를 C:\아크릴작업으로 복사합니다. 만약 2차로돌릴 액자가 달라지거나 수정이필요하면 그러면 수정하고 만들어주십시오
:: by 김윤기 (rklpoi5678@naver.com)