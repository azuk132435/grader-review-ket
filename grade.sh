CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

Expected_file = "ListExamples.java"
if [[ ! -e "student-submission/$Expected_file"]];
then echo "Error"
exit 1
fi

cp "student-submission/$Expected_file" grading-area/
cd grading-area
javac -cp "$CPATH" "Expected_file" TestListExamples.java

if [[ $? -ne 0]]; then 
echo "Error"
exit 1
fi

java -cp "$CPATH" org.junit.runner.JunitCore testlistexamples > test_output.txt 2>&1
if [[ $? -eq 0]]; then
    grade=$(grep-oP "your grade is \k\d+" test_output.txt)
    echo "Grade: $grade/100"
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests


