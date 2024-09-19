pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input inputA;
   signal input inputB;

   signal X;
   signal Y;

   signal output outputQ;

   component andgate=AND();
   component orgate=OR();
   component notgate=NOT();

   andgate.a <== inputA ;
   andgate.b <== inputB ;
   X <== andgate.out ;

   notgate.in <== inputB ;
   Y <== notgate.out;

   orgate.a <== X;
   orgate.b <== Y;
   outputQ <== orgate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
