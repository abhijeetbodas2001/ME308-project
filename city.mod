param num_station_locations;
param num_demand_hotspots;
param num_to_build;
param budget;

# 0 denotes "do not build here"
set possible_station_capacities = {0, 1, 2, 3};

param demand{
    hotspot in 1..num_demand_hotspots
};

param distance{
    station_location in 1..num_station_locations,
    hotspot in 1..num_demand_hotspots
};

var should_build{
    station_location in 1..num_station_locations
} in possible_station_capacities;

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
        hotspot in 1..num_demand_hotspots
    }
        demand[hotspot] * distance_penalty[hotspot]
        #demand[hotspot] * distance_penalty[hotspot]
;

subject to budget_constraint:
    sum{
        station_location in 1..num_station_locations
    }
        should_build[station_location]
    <= budget
;

# Sum of demands coming into that station should not exceed it's capacity
subject to capacity_constraint {
        station_location in 1..num_station_locations
    }:
        sum{
            hotspot in 1..num_demand_hotspots
        }
            demand[hotspot]*fraction_assigned[station_location, hotspot]    # Demand must be scaled here
        <= should_build[station_location]
;

subject to should_assign_all_demands_to_some_station {
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

subject to cannot_assign_to_unbuilt_station{
        station_location in 1..num_station_locations,
        hotspot in 1..num_demand_hotspots
    }:
        fraction_assigned[station_location,hotspot]
    <= should_build[station_location];
