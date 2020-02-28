if [ $# -ne 1 ];then
	echo "BUFFER_SIZE를 입력해주세요!"
	echo "need BUFFER_SIZE!"
	exit 1
fi
gcc test.c get_next_line.c get_next_line_utils.c -D BUFFER_SIZE=$1
rm -rf your_output test_output diff_logs
mkdir your_output test_output diff_logs
for FILE in random_tests/*.txt; do
	echo "----------------------------------------------------------"
	echo "RESULT WITH $FILE.."
	./a.out $FILE > your_output/$(basename $FILE)
	./test.out $FILE > test_output/$(basename $FILE)
	diff -s your_output/$(basename $FILE) test_output/$(basename $FILE) > diff_logs/$(basename $FILE)
	cat diff_logs/$(basename $FILE)
done
for FILE in fixed_tests/*.txt; do
	echo "----------------------------------------------------------"
	echo "RESULT WITH $FILE.."
	./a.out $FILE > your_output/$(basename $FILE)
    ./test.out $FILE > test_output/$(basename $FILE)
    diff -s your_output/$(basename $FILE) test_output/$(basename $FILE) > diff_logs/$(basename $FILE)
	cat diff_logs/$(basename $FILE)
done
echo "----------------------------------------------------------"
echo "테스트가 완료되었습니다! 결과는 diff_logs 폴더에 있습니다."
echo "\nTest is done! you can find results in ./diff_logs" 
