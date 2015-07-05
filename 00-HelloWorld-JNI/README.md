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

## References

The canonical reference for JNI is:

[The Java™ The Programmer's Guide and Specification](https://www.fer.unizg.hr/_download/repository/jni.pdf)


