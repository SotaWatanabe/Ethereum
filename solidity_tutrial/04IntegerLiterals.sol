//Integer Literals

var x = 1 - 2;
//The value of 1 - 2 is -1, which is assigned to x and thus x receives the type int8
//the smallest type that contains -1

//one and two both have type uint8 which is also propagated to x
//The subtraction inside the type uint8 causes wrapping and thus the value of x will be 255.
var one = 1;
var two = 2;
var x = one - two;
//256-1だから
