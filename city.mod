param num_station_locations;
param num_demand_hotspots;
param num_types;
param budget;

param building_cost{
    station_location in 1..num_station_locations
};

# If we were to build a station at this location, what would it's capacity be?
param station_capacity{
    station_location in 1..num_station_locations,
    type in 1..num_types
};

param demand{
    hotspot in 1..num_demand_hotspots,
    type in 1..num_types
};

# Represents the loss when a vehicle at a hotspot has to travel
# to a station for charging
param distance{
    station_location in 1..num_station_locations,
    hotspot in 1..num_demand_hotspots
};

var should_build{
    station_location in 1..num_station_locations
} binary;

var fraction_assigned{
    station_location in 1..num_station_locations,
    hotspot in 1..num_demand_hotspots
} >= 0;

# Distance between hotspot and the assigned station
var distance_penalty{
    hotspot in 1..num_demand_hotspots
} >= 0;

minimize Objective:
    sum{
        hotspot in 1..num_demand_hotspots,
        type in 1..num_types
    }
        demand[hotspot, type] * distance_penalty[hotspot]
;

subject to budget_constraint:
    sum{
        station_location in 1..num_station_locations
    }
        building_cost[station_location]*should_build[station_location]
    <= budget
;

# For each type, for each station, sum of demands coming into that
# station should not exceed it's capacity
subject to capacity_constraint {
        station_location in 1..num_station_locations,
        type in 1..num_types
    }:
        sum{
            hotspot in 1..num_demand_hotspots
        }
            demand[hotspot, type]*fraction_assigned[station_location, hotspot]
        <= station_capacity[station_location, type]
;

subject to sum_cons {
        hotspot in 1..num_demand_hotspots
    }:
        sum{
            station_location in 1..num_station_locations
        }
            fraction_assigned[station_location,hotspot]
        = 1;

# Calculate distance_penalty based on assigned station
subject to distance_penalty_definition {
        hotspot in 1..num_demand_hotspots
    }:
        sum{
            station_location in 1..num_station_locations
        }
            distance[station_location, hotspot]*fraction_assigned[station_location,hotspot]
        = distance_penalty[hotspot]
;

# Can only assign a station to a demand if station is actually built there
subject to var_cons{
        station_location in 1..num_station_locations,
        hotspot in 1..num_demand_hotspots
    }:
        fraction_assigned[station_location,hotspot]
    <= should_build[station_location];
