CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
CPATHTEST=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore"
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f "student-submission/ListExamples.java" ]]; then

    cp TestListExamples.java grading-area
    cp -r student-submission/. grading-area

    javac -cp $CPATH grading-area/*.java

    if [[ $? -eq 0 ]]; then
        echo "Compiled successfully"
    else
        echo "Compiled failed"
        exit 1
    fi

    java -cp $CPATHTEST grading-area/TestListExamples

    if [[ $? -eq 0 ]]; then
        echo "Tests passed"
    else
        echo "Tests failed"
        
        
    fi


else
    echo "ListExamples.java not found"
fi


