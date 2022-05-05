<TeXmacs|2.1.1>

<style|<tuple|generic|no-page-numbers>>

<\body>
  <section*|Formulation 1.0>

  <subsection*|Assumptions>

  This version of the formulation makes the following assumptions:

  <\enumerate-numeric>
    <item>All vehicles from a particular demand hotspot travel to a single
    charging station. There is no splitting of vehicles into multiple
    charging stations.

    <item>All vehicles at any demand hotspot always go to the nearest
    charging station available.

    <item>All the charging stations which can be built are assumed to be
    identical in costs and size.

    <item>Each charging station that we build has a very high capacity, and
    can handle as many demands as arrive at it.
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

  Apart from the parameters mentioned above, another variable important which
  we define for the formulation is the <with|font-series|bold|Distance
  Penalty>, or the <with|font-series|bold|Loss>,
  <math|<with|font-series|bold|L<rsub|j>>>. It is defined as the distance
  between \ demand location <math|j> when it and its
  <with|font-series|bold|assigned> charging station. The \Passigned\Q
  charging station is in fact the closest charging station in our case.

  <subsection*|Decision Variables>

  Two decision variables are used to finalize the charging station location
  and the corresponding assingment of demand hotspots to charging stations.
  These are:

  <\itemize-dot>
    <item><with|font-series|bold|Assginment variable, <math|\<alpha\>
    <rsub|i,j>>> <with|font-series|bold|>- Binary
  </itemize-dot>

  <\equation*>
    \<alpha\><rsub|i,j>=<choice|<tformat|<table|<row|<cell|1,<text| if demand
    hotspot <math|j> is assigned to station <math|i>>>>|<row|<cell|0,<text|
    otherwise>>>>>>
  </equation*>

  <\itemize-dot>
    <item><with|font-series|bold|Should-build decision variable,
    <math|x<rsub|i>>> <with|font-series|bold|>- Binary
  </itemize-dot>

  <center| <larger| <center| <math|<tabular|<tformat|<table|<row|<cell|x<rsub|i>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0,>|<cell|<text|if
  station should be built at location <math|i>>>>|<row|<cell|1>|<cell|otherwise>>>>>>>>>>>>>>

  \;

  <subsection*|Objective Function>

  The objective function should minimize the combined ditance travelled by
  all the vehicles as they travel to their assigned charging stations. This
  is represented mathematically as:

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

  If a station is not built at a certain location (<math|x<rsub|i>=0>), then
  we cannot assign this location to any demand (<math|\<alpha\><rsub|i,j>=0
  >must hold for all <math|j>'s). However if the station is built at
  \ location <math|i>, then <math|\<alpha\><rsub|i,j>> can be 0 or 1
  depending on whether demand hotspot <math|j> is assigned to <math|i> or
  not. Hence,

  <\equation*>
    0\<leqslant\>\<alpha\><rsub|i,j>\<leqslant\>x<rsub|i><space|1em>\<forall\>i\<in\>
    1,2,\<ldots\>,N,j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <with|font-shape|italic|<with|font-series|medium|Exactly one assignment>>

  This constraint ensures that only one <math|\<alpha\><rsub|i,j>> is 1 and
  the rest are zero, that is, each demand is assigned one and only one
  charging station. This puts in place the one-to-one map discussed earlier.

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
  chosen and the assignment is made to the <with|font-series|bold|closest
  available charging station> location.

  <with|font-series|medium|<with|font-shape|italic|Number of stations>>

  The number of stations which our model suggests building should be equal to
  the number required to be built (which is, <math|G>). Thus:

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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|?|1>>
    <associate|auto-3|<tuple|4|1>>
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Formulation
      1.0> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Assumptions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Parameters
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Decision Variables
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Objective Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|Constraints
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>
    </associate>
  </collection>
</auxiliary>