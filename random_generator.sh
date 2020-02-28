chr() {
	printf \\$(printf '%03o' $1)
}
TEST_DIR=random_tests
SET1=$(seq 1 15)
SET2=$(seq 1 1000)
rm -rf $TEST_DIR
mkdir $TEST_DIR
printf "generating random tests"
for i in $SET1; do
	printf .
	touch $TEST_DIR/$i.txt
	for j in $SET2; do
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
