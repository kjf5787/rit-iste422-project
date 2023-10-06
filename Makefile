compile : ./src/main/java/*.java ./src/test/java/*.java
	echo "Compiling source code and unit tests..."
	javac -d build -classpath .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar ./src/main/java/*.java ./src/test/java/*.java

test : compile
	echo "Running unit tests..."
	java -cp .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build org.junit.runner.JUnitCore EdgeConnectorTest

run : compile
	echo "Running application..."
	java -classpath .:build RunEdgeConvert

clean : 
	echo "Removing class files..."
	rm -f ./build/*.class

all : clean test run
	echo "Executing all"
