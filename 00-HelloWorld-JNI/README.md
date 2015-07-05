## HELLO JNI

JNI -- sometimes pronounced 'genie' -- is how you can interface your java app with native code. This may be necessary when your app requires optimizations for compute-heavy tasks -- like the game physics needed for Angry Birds -- and yowill need to write in C, C++ or assembly in order to address the bottleneck.

## Procedure for using JNI

You can study the source for COMPILESCRIPT.sh to get an idea of the CLI procedure for invoking the JNI.

```bash
#!/bin/bash

# compile .java to .class file
javac HelloWorld.java

# create HelloWorld.h file
javah -jni HelloWorld

#in linux -- create a shared object file
#note 1: assuming you have set your $JAVA_HOME env-variable
#note 2: prefix your .so file name with "lib" or will not work
gcc -shared -o libHelloWorld.so -fPIC HelloWorld.c -I$JAVA_HOME/include -I$JAVA_HOME/include/linux 

#make sure your compiled .so file it looks for HelloWorld.h in this directory (or you can change the linked library path)
LD_LIBRARY_PATH=.
export LD_LIBRARY_PATH

# run the file
java HelloWorld
```

## Troubleshooting/Getting Java Setup


#### Step 1: getting Java

This is the procedure I used in order to get up and running with Ubuntu

```bash
sudo apt-get install openjdk-7-jre
sudo apt-get install openjdk-7-jdk
```

If you would like to just use the provided COMPILESCRIPT.sh, 
then you can use the following code to configure 1.7 as your jdk:

```bash
sudo update-alternatives --config java
sudo update-alternatives --config javac
```

#### Step 2: Setting your `$JAVA_HOME` env-variable

add the following to your `~/.bashrc` file:

`export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64`

then run:

`source ~/.bashrc`

check that your JAVA_HOME env variable is
no longer empty (run `echo $JAVA_HOME`), and your set!

## References

The canonical reference for JNI is:

[The Java™ The Programmer's Guide and Specification](https://www.fer.unizg.hr/_download/repository/jni.pdf)


