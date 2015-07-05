#!/bin/bash

javac HelloWorld.java
javah -jni HelloWorld
gcc -shared -o libHelloWorld.so -fPIC HelloWorld.c -I$JAVA_HOME/include -I$JAVA_HOME/include/linux

LD_LIBRARY_PATH=.
export LD_LIBRARY_PATH

java HelloWorld
