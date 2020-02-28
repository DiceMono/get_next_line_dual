chr() {
	printf \\$(printf '%03o' $1)
}
TEST_DIR=random_tests
rm -rf $TEST_DIR
mkdir $TEST_DIR
printf "generating random tests"
for i in {1..15}; do
	printf .
	touch $TEST_DIR/$i.txt
	for j in {1..1000}; do
		RAN_CHAR=$((RANDOM % 95 + 32))
		if [ $((RANDOM % 100)) -lt 5 ];then
			chr 10 >> $TEST_DIR/$i.txt
		fi
		echo $RAN_CHAR >> result.txt
		chr $RAN_CHAR >> $TEST_DIR/$i.txt
	done
done
echo done
echo "run ./gnl_dual.sh"
