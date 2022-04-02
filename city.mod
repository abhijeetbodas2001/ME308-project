# Barebones model for the "city" case
# Consider 5 demand hotspots, and 10 possible charging station locations
# i: 1 to N (=10) denotes charging station locations
# j: 1 to M (=5) denotes demand hotspots

param n;
param m;
param budget;
param costs{i in 1..n};
param demands{j in 1..m};
param loss{i in 1..n, j in 1..m};

var x{i in 1..n} binary;
var y{i in 1..n, j in 1..m} binary;

var tau{j in 1..m} >= 0;

minimize Objective:
    sum{j in 1..m} demands[j]*tau[j]
;

subject to budget_constraint :
    sum{i in 1..n} costs[i]*x[i] <= budget
;

subject to tau_definition {j in 1..m}:
    tau[j] = sum{i in 1..n}loss[i, j]*y[i,j]
;
subject to sum_cons {j in 1..m}:
    sum{i in 1..n}y[i,j] = 1;

subject to var_cons{i in 1..n, j in 1..m}:
    y[i,j] <= x[i];