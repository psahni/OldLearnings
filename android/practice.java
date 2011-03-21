ByteCode
--------

The bytecode format
______________________
Bytecodes are the machine language of the Java virtual machine. When a JVM loads a class file, it gets one stream of bytecodes for each method in the class. The bytecodes streams are stored in the method area of the JVM. The bytecodes for a method are executed when that method is invoked during the course of running the program. They can be executed by intepretation, just-in-time compiling, or any other technique that was chosen by the designer of a particular JVM.


Intermittant Code


Data types
-----------

Simple type

8 types

Byte(8)
Short
Integer(16)
Long type


Network se data aa raha hai
ByteArray
Io Stream

Short is least used data type


Long is for bigger


Float type

- Float (32 bit)
- Double (64 bit) 

int a;
double b;
b = a*1.002

Downcasting and upcasting
------------------------


Double is default

float f = 1.02; -> This will show error

float f = (float)(1.02);

double f  = 1.02; - > This will not show error;


byte s = 1201;
byte s = (byte)1201; -> This will truncate value (Calculated Internally)


Long

Object Data Type
-----------------

Wrapper Classes
--------------
Byte
Integer and so on

Varibles and methods( action that are performed on variables)

Operators
---------
++ operator
& and && operator
| and || pipe


Object obj == null;
if(obj == null && obj.toString.equals("")){  --> NULL POINTER EXCEPTION
 SOP("Alok")
}

#Only One
if(obj == null || obj.toString.equals("")){
 SOP("Alok")
}

#Both
if(obj == null | obj.toString.equals("")){  --> NULL POINTER EXCEPTION
 SOP("Alok")

}

------------------

Array And ArrayList


Switch 

we can only pass
int and enums


Loops

return nad continue

Constructors

* if we define another constructor, then default constructor will not be there
public


Access Modifiers

- public
- private
- protected
- default

class, variable and methods on which access modifiers are applied
class is either default or public
defualt - >  same package


for methods

http://www.codemiles.com/java/access-modifiers-t3595.html


Static and final
Top level classes can never be static

static methods can be accessod with name of class
static variables
-------------------------------------------------------
import static Constants.*;
public class Test {
       static int b;
       public static void main(String[] s) {
               int version = MY_APPLICATION_VERSION;
       }
}

class B {
       Test test = new Test();
}
-------------------------------------------------------
Final classes
we cant subclass a final class

Final methods

cant  be overridden 
can be overloaded(different signature)

NOT ALLOWED
int move(){
}

float move(){
}


ALLOWED
int move(){

}

float move(int a){
 return 100.1f;
}

-------------------------------------------------------

Interface and abstract classes

Interface A;

- we only write the method signature and name

usecase: we want that some classes must implement that methods.

eg: Say Http class:
8 methods
 get
 post
 head
..
..
i  want to make http client then i must have these 8 methods

if we have two implementations
then we just have to change the implementation name i.e, class name a
Abstract classes

Abstract some_method; //No body


Why wrapper  classes

1. Utility methods
2. collection
3. Some methods only accpets object, 
   u can't pass primitive  data types

-------------------------------------------------------

Package

namespace
java is itself a namespace


set the class path

You can compile java program from any place

import java.util.* //fully qualified name

import java.util.ArrayList


package com.vinsol; 

ctrl+shift+o -> command for importing the package in Eclipse


Static Import


import static java.lang.Math.*;

All variables that are static ( we make Constants as static)
http://www.leepoint.net/notes-java/language/10basics/import.html
http://javaworkshop.sourceforge.net/chapter3.html

-------------------------------------------------------
*Exception Handling

Try
Catch
Finally
throw
throws



Throwable class is the Parent class of all the classes
- Exception (checked and unchecked)
- Error (catastropic failure, eg: Stackoverflow)


checked    exceptions are handled in code
unchecked exceptions are handled are in run time (Null pointer Exception)

Run time errors
---------------
 
checked    exceptions

Some exceptions are outside the control of java

represent invalid conditions in areas outside the immediate control of the program (invalid user input, database problems, network outages, absent files)
are subclasses of Exception

a method is obliged to establish a policy for all checked exceptions thrown by its implementation (either pass the checked exception further up the stack, or handle it somehow)

Checked exceptions are those that are handled inside the code using a try-catch block. Unchecked exceptions are those that are not and should not be handled using a try-catch block.

try ke saath 'catch' ya 'finally' must be
catch can be multiple


// This is now correct. 
class ThrowsDemo { 
static void throwOne() throws IllegalAccessException { 
System.out.println("Inside throwOne."); 
throw new IllegalAccessException("demo"); 
} 
public static void main(String args[]) { 
try { 
 throwOne(); 
} catch (IllegalAccessException e) { 
System.out.println("Caught " + e); 
  } 
 } 
}


PACKAGES some more details

http://javaworkshop.sourceforge.net/chapter3.html
http://www.jarticles.com/package/package_eng.html


------------------------------------------------------------------------------
Thread based multitask

with in a program (two tasks)

- Implemenet Runnable interface
- extend the third class (override & many tasks to be )

when a class extend thread class then 
obj_of_class.start() will call the run method

When we are implementing Runnable interface
then Thread t = new Thread(obj_of_class, "threadname")
t.start();

PRIORITY OF THREADS

Communication of threads
----------------------
Multithreading in android
UI thread -> Main thread
Ui ka modification sirf Ui thread se hoga

concept of handler
Ui thread mein handler ka object
there is method called handler




