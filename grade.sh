CPATH=".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

cd student-submission
if [[ -f ListExamples.java ]]
    then 
        echo "Found"
else
    echo "File not found"
    exit 1
fi

echo 'Finished cloning'

cp ../*.java ./

javac -cp $CPATH *.java
if [[ $? -ne 0 ]]
    then
        echo "Fail to Compile"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
echo "Done with Junit"