CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'


rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -e ListExamples.java ]]
then
    echo "ListExamples.java found"
else 
    echo
    echo "${bold}ListExamples.java not found"
    echo "${bold}Exiting Autograder"
    exit
fi 
#mkdir testing
#cp ListExamples.java testing
cd ..
cp TestListExamples.java student-submission
cp -r lib student-submission
cd student-submission
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java > Errors1.txt 2>&1
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > Errors2.txt
if [[ $? -ne 0 ]]
then    
    echo "Compiler Error"
fi     

