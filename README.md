## 실행 방법

1. git clone https://github.com/DiceMono/get_next_line_dual.git

2. 테스트할 get_next_line.c, get_next_line_utils.c get_next_line.h를 루트 폴더로 복사.

3. bash random_generator.sh

   테스트 파일을 생성합니다.

4. bash gnl_dual.sh {BUFFER_SIZE}

   gcc -Wall -Werror -Wextra로 compile후 테스트합니다.

   BUFFER_SIZE를 지정해줘야 정상 작동합니다 ex) bash gnl_dual.sh 1000

5. ./diff_logs 디렉토리에서 결과 확인.

## 주의사항 

* 본 테스트 툴은 메모리 leak, norm, static 변수 등을 검사하지 않습니다.
* 우분투 환경에서 테스트되었습니다.
