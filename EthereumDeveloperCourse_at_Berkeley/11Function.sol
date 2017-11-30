function increment(uint x) returns(uint){
    x+=1;
    return x;
}

//変数は1つ以上でも良い
function increment(uint x, uint y) returns(uint x, uint y){
    x+=1;
    y+=1;
}
uint(a,b) = increment(1,1);
