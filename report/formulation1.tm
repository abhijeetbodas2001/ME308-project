<TeXmacs|2.1.1>

<style|<tuple|generic|no-page-numbers>>

<\body>
  <section*|Formulation 1.0>

  <subsection*|Assumptions>

  This version of the formulation makes the following assumptions:

  <\enumerate-numeric>
    <item>All vehicles from a particular demand hotspot travel to a single
    charging station i.e the map from demand hotspots to charging station
    location is a one-to-one map. There is no splitting of vehicles into
    multiple charging stations.

    <item>This map is such that the vehicles travel to the nearest available
    charging station. If the closest charging station cannot accomodate all
    the vehicles from a particular demand hotspots, then the vehicles would
    move to the next closest charging station which can accomodate all the
    vehicles.

    <item>The number of charging stations that can be built is taken as an
    input and will dictate the addignment of demand hotspots to charging
    stations

    <item>The goal is to minimize the total distance travelled by vehicles
    from all the demand hotspots as they travel to the assigned charging
    stations
  </enumerate-numeric>

  <subsection*|Parameters>

  As dicussed in the Problem Statement, two sets of locations are important
  for the mathetical formulaion:

  <center|<tabular|<tformat|<table|<row|<cell|<math|i\<in\>
  <around*|[|1,N|]>>>|<cell|:>|<cell|Charging station
  locations>>|<row|<cell|<math|j\<in\> <around*|[|1,M|]>>>|<cell|:>|<cell|Demand
  hotspots>>>>>>

  The formulation will depend on a few input parameterss that are described
  below:\ 

  <\center>
    <tabular|<tformat|<table|<row|<cell|<math|D<rsub|j>>>|<cell|:>|<cell|Demand
    (value) at demand hotspot <math|j>>>|<row|<cell|<math|S<rsub|i,j>>>|<cell|:>|<cell|Distance
    (by road) between station location <math|i> and demand hotspot
    <math|j>>>|<row|<cell|<math|G>>|<cell|:>|<cell|Number of stations
    required to be built in the network (<math|\<leqslant\>N>)>>>>>
  </center>

  \;

  Apart from the parameters mentioned above, another variable is important
  for the formulation viz. the Distance Penalty/Loss,
  <math|<with|font-series|bold|L<rsub|j>>>. It us defined as the distance
  between \ demand location <math|j> when it and its
  <with|font-series|bold|assigned> charging station.

  <subsection*|Decision Variables>

  Two decision variables are used to finalize the charging station location
  and the corresponding assingment of demand hotspots to charging stations.
  These are:

  <\itemize-dot>
    <item><with|font-series|bold|assgnment variable, <math|\<alpha\>
    <rsub|i,j>>> <with|font-series|bold|>- Binary
  </itemize-dot>

  <\equation*>
    \<alpha\><rsub|i,j>=<choice|<tformat|<table|<row|<cell|1,<text| if demand
    hotspot <math|j> is assigned to station <math|i>>>>|<row|<cell|0,<text|
    otherwise>>>>>>
  </equation*>

  <\itemize-dot>
    <item><with|font-series|bold|should_build variable, <math|x<rsub|i>>>
    <with|font-series|bold|>- Binary
  </itemize-dot>

  <center| <larger| <center| <math|<tabular|<tformat|<table|<row|<cell|x<rsub|i>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0,>|<cell|<text|if
  station should be built at location <math|i>>>>|<row|<cell|1>|<cell|otherwise>>>>>>>>>>>>>>

  \;

  <subsection*|Objective Function>

  The objective function should minimize the combined ditance travvled by all
  the vehicels as they travel to their assigned charging stations. This is
  represented mathematically as

  <center|minimize <math|<big|sum><rsub|j><rsup|>D<rsub|j>\<times\>
  L<rsub|j>>>

  The nomenclature <with|font-shape|italic|distance penalty> now makes sense
  - greater the value of <math|L<rsub|j>>, greater is the distance travelled
  by the vehicles at demand hotspot <math|j>. This goes against our objective
  of minimizing the distance, hence a penalty has to be imposed which will be
  be proportional to the value of <math|L<rsub|j>>

  <subsection*|Constraints>

  <with|font-shape|italic|<with|font-series|medium|Assignment variable
  bounds>>

  The assignemnt variable should be such that, if a station is not built at a
  charging station location, the it has to be zero. However if the station is
  built at \ location <math|i>, then <math|\<alpha\><rsub|i,j>> can be 0 or 1
  depending on whether demand hotspot <math|j> is assigned to <math|i> or not

  <\equation*>
    0\<leqslant\>\<alpha\><rsub|i,j>\<leqslant\>x<rsub|i><space|1em>\<forall\>i\<in\>
    1,2,\<ldots\>,N,j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <with|font-shape|italic|<with|font-series|medium|Exactly one assignment>>

  This constraint ensures that only one <math|\<alpha\><rsub|i,j>> is 1 and
  the rest are zero (this putis ib place the one-to-one map discussed
  earlier)

  <\equation*>
    <big|sum><rsup|N><rsub|i=1>\<alpha\><rsub|i,j>=1
    <space|1em>\<forall\>j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <with|font-shape|italic|<with|font-series|medium|Distance penalty
  definition>>

  The distance penalty is defined mathematically as follows:

  <\equation*>
    L<rsub|j>=<big|sum><rsup|N><rsub|i=1>S<rsub|i,j>\<times\>
    \<alpha\><rsub|i,j><space|1em>\<forall\>j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  Since only one assignment variable takes a non zero value for a particular
  <math|i>, the value of <math|L<rsub|j>> is the distance bewteen hotspot
  <math|i> and one of the charging station locations among the <math|N>. The
  rationale behind this definition is that when this is passed to the
  objective function, only station which minimizes <math|L<rsub|j> > is
  chosen and the assignment is made to the closest available charging
  station.

  <with|font-series|medium|<with|font-shape|italic|Number of stations>>

  The total number of charging stations built should not exceed the maximimum
  number allowed (<math|G>)

  <\equation*>
    <big|sum><rsup|N><rsub|i=1>x<rsub|i>=G
  </equation*>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-2|<tuple|?|?>>
    <associate|auto-3|<tuple|4|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
  </collection>
</references>