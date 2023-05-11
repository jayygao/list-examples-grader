CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

cd 'student-submission'
echo "CheckPoint"
file="ListExamples.java"
cd '..'
file2="TestListExamples.java"
cd 'student-submission'
    echo "Checkpoint 1"
    echo $file
    if [[ -f $file ]]
    then 
        cp $file '../grading-area'
        echo "Checkpoint 2"
        cd '..'
        cp $file2 'grading-area'
        cd 'grading-area'
        javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
        java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
        if [[ $? > 0 ]]
        then
            echo "Error within $file"
        else
            echo "Pass"
        fi
    else
        echo "None"
    fi
