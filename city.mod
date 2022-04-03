# i: 1 to N denotes charging station locations
# j: 1 to M denotes demand hotspots
# k: 1 to L denotes the different types of demands (to accomodate different
#           charging technologies, battery capacities etc)

param n;
param m;
param l;
param budget;

# Cost incurred for building a charging station at location `i`
param building_cost{i in 1..n};

param station_capacity{i in 1..n, k in 1..l};

# Value of the demand for charging at location `j`
param demand{j in 1..m, k in 1..l};

# loss[i][j] represents the loss when a vehicle at `j` has to travel
# to station `i` for charging
# Will depend mainly on the distance/travel-time between `i` and `j`
param loss{i in 1..n, j in 1..m};

# x[i] = 1 if charging station should be built at location `i`
var x{i in 1..n} binary;

# Stores the charging location `i` assigned to a demand point `j`
var y{i in 1..n, j in 1..m} binary;

# The "actual" loss faced by vehicles at `j`, depending on the subset of
# the `n` locations where charging stations are actually built
var actual_loss{j in 1..m} >= 0;

minimize Objective:
    sum{j in 1..m, k in 1..l} demand[j, k]*actual_loss[j]
;

subject to budget_constraint :
    sum{i in 1..n} building_cost[i]*x[i] <= budget
;

# For each type, for each station, sum of demands coming into that
# station should not exceed it's capacity
subject to capacity_constraint {i in 1..n, k in 1..l}:
    sum{j in 1..m} demand[j, k]*y[i, j] <= station_capacity[i, k]
;

# For each `j`, assign one station `i`
subject to sum_cons {j in 1..m}:
    sum{i in 1..n}y[i,j] = 1;

# Then calculate the actual loss for each `j` based on the
# assigned `i`
subject to actual_loss_definition {j in 1..m}:
    actual_loss[j] = sum{i in 1..n}loss[i, j]*y[i,j]
;

# Can only "assign" a charging station location to a demand is a
# charging station is actually built there
subject to var_cons{i in 1..n, j in 1..m}:
    y[i,j] <= x[i];