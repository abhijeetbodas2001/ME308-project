param num_station_locations;
param num_demand_hotspots;
param num_types;
param num_to_build;

# If we were to build a station at this location, what would it's capacity be?
param station_capacity{
    station_location in 1..num_station_locations,
    type in 1..num_types
};

param demand{
    hotspot in 1..num_demand_hotspots,
    type in 1..num_types
};

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

subject to should_build_exactly_num_to_build:
    sum{
        station_location in 1..num_station_locations
    }
        should_build[station_location]
    <= num_to_build
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
    # This also enforces fraction_assigned[station_location,hotspot] <= 1
