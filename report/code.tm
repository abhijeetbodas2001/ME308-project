<TeXmacs|2.1.1>

<style|<tuple|generic|no-page-numbers>>

<\body>
  <section*|Code>

  This section contains the code for the file - <math|<verbatim|
  city>>.<verbatim|mod> which describes the parameters, decision variables,
  objective functions and the constraints for the final formulation i.e.
  Formulation 2.0

  <\python-code>
    param num_station_locations;

    param num_demand_hotspots;

    param num_to_build;

    param budget;

    \;

    # 0 denotes "do_not_build_here"

    set possible_station_capacities = {0, 1, 2, 3};

    \;

    #parameters

    param demand{

    \ \ \ \ hotspot in 1..num_demand_hotspots

    };

    \;

    param distance{

    \ \ \ \ station_location in 1..num_station_locations,

    \ \ \ \ hotspot in 1..num_demand_hotspots

    };

    \;

    #decision_variables

    var should_build{

    \ \ \ \ station_location in 1..num_station_locations

    } in possible_station_capacities;

    \;

    var fraction_assigned{

    \ \ \ \ station_location in 1..num_station_locations,

    \ \ \ \ hotspot in 1..num_demand_hotspots

    } \<gtr\>= 0;

    \;

    # Distance between hotspot and the assigned station

    var distance_penalty{

    \ \ \ \ hotspot in 1..num_demand_hotspots

    } \<gtr\>= 0;

    \;

    #objective

    minimize Objective:

    \ \ \ \ sum{

    \ \ \ \ \ \ \ \ hotspot in 1..num_demand_hotspots

    \ \ \ \ }

    \ \ \ \ \ \ \ \ demand[hotspot] * distance_penalty[hotspot]

    \ \ \ \ \ \ \ \ #demand[hotspot] * distance_penalty[hotspot]

    ;

    \;

    #constraints

    subject to budget_constraint:

    \ \ \ \ sum{

    \ \ \ \ \ \ \ \ station_location in 1..num_station_locations

    \ \ \ \ }

    \ \ \ \ \ \ \ \ should_build[station_location]

    \ \ \ \ \<less\>= budget

    ;

    \;

    # Sum of demands coming into that station should not exceed it's capacity

    subject to capacity_constraint {

    \ \ \ \ \ \ \ \ station_location in 1..num_station_locations

    \ \ \ \ }:

    \ \ \ \ \ \ \ \ sum{

    \ \ \ \ \ \ \ \ \ \ \ \ hotspot in 1..num_demand_hotspots

    \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ \ \ \ \ demand[hotspot]*fraction_assigned[station_location,
    hotspot] # Demand must be scaled here

    \ \ \ \ \ \ \ \ \<less\>= should_build[station_location]

    ;

    \;

    subject to should_assign_all_demands_to_some_station {

    \ \ \ \ \ \ \ \ hotspot in 1..num_demand_hotspots

    \ \ \ \ }:

    \ \ \ \ \ \ \ \ sum{

    \ \ \ \ \ \ \ \ \ \ \ \ station_location in 1..num_station_locations

    \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ \ \ \ \ fraction_assigned[station_location,hotspot]

    \ \ \ \ \ \ \ \ = 1;

    \;

    # Calculate distance_penalty based on assigned station

    subject to distance_penalty_definition {

    \ \ \ \ \ \ \ \ hotspot in 1..num_demand_hotspots

    \ \ \ \ }:

    \ \ \ \ \ \ \ \ sum{

    \ \ \ \ \ \ \ \ \ \ \ \ station_location in 1..num_station_locations

    \ \ \ \ \ \ \ \ }

    \ \ \ \ \ \ \ \ \ \ \ \ distance[station_location,
    hotspot]*fraction_assigned[station_location,hotspot]

    \ \ \ \ \ \ \ \ = distance_penalty[hotspot]

    ;

    \;

    subject to cannot_assign_to_unbuilt_station{

    \ \ \ \ \ \ \ \ station_location in 1..num_station_locations,

    \ \ \ \ \ \ \ \ hotspot in 1..num_demand_hotspots

    \ \ \ \ }:

    \ \ \ \ \ \ \ \ fraction_assigned[station_location,hotspot]

    \ \ \ \ \<less\>= should_build[station_location];

    \;

    \;
  </python-code>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
  </collection>
</references>