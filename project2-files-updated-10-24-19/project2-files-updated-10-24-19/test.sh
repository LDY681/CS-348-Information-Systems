#!/bin/sh
username="" #use you username
password="" #use you password
mysql -h mydb.itap.purdue.edu -u $username --password=$password < scripts/tables.sql #Run this command in maven where you have saved your scripts
mysql -h mydb.itap.purdue.edu -u $username --password=$password < scripts/data.sql
mysql -h mydb.itap.purdue.edu -u $username --password=$password < scripts/answers.sql > response.txt
diff -u expected_sql.txt response.txt > log
if [[ -s log ]]; then
	echo "Sql Failed,check your log file for more details"
else
	echo "Sql Test cases passed!"
fi
javac -cp .:mysql-connector-java-8.0.17.jar Answers.java
java -cp .:mysql-connector-java-8.0.17.jar Answers > response_java.txt
diff -u expected_java.txt response_java.txt > log_java #please make sure that you have a line break after the first question so that this test case wouldn't fail
if [[ -s log_java ]]; then
	echo "Java Failed, check your log_java file for more details"
else
	echo "Java Test cases passed!" 
#mysql -h mydb.itap.purdue.edu -u $username --password=$password < scripts/drop.sql Might want to uncomment this while testing for the sql test cases
fi
