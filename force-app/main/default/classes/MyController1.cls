Public class MyController1 {

 public String myString;
 
 Public String getMyString(){
  Return 'getMyString';
 }

 Public string getStringMethod1(){
  Return myString;
 }

 Public string getStringMethod2(){
  If(myString==null){
   myString='method2';
  }
  return mystring;
 }
}