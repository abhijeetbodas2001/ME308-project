# Using AMPL CLI
# ./ampl
# ampl: reset;
# ampl: option solver "./minos";
# ampl: model modelfile.mod;
# ampl: solve;


var x;
var y;
maximize revenue:   x*y;
subject to constraint: x + y = 10;
