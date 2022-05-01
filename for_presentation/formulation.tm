<TeXmacs|2.1.1>

<style|beamer>

<\body>
  <doc-data|<doc-title|Formulation 1.0>>

  <center| <tabular|<tformat|<table|<row|<cell|<math|i\<in\>
  <around*|[|1,N|]>>>|<cell|:>|<cell|Charging station
  locations>>|<row|<cell|<math|j\<in\> <around*|[|1,M|]>>>|<cell|:>|<cell|Demand
  hotspots>>>>>>

  <with|font-series|bold|Parameters:>

  <\center>
    <tabular|<tformat|<table|<row|<cell|<math|D<rsub|j>>>|<cell|:>|<cell|Demand
    (value) at demand hotspot <math|j>>>|<row|<cell|<math|S<rsub|i,j>>>|<cell|:>|<cell|Distance
    (by road) between station location <math|i> and demand hotspot
    <math|j>>>|<row|<cell|<math|G>>|<cell|:>|<cell|Number of stations
    required to be built in the network (<math|\<leqslant\>N>)>>>>>
  </center>

  \;

  <with|font-series|bold|<math| ><with|font-base-size|12|>Other variables
  used:>

  <math|L<rsub|j>> : Penalty/Loss incurred by vehicles at demand location
  <math|j> to travel to the <with|font-series|bold|assigned> station for
  charging

  \;

  \;

  <doc-data|<doc-title|Decision Variables>>

  <\equation*>
    \<alpha\><rsub|i,j>=<choice|<tformat|<table|<row|<cell|1,<text| if demand
    hotspot <math|j> is assigned to station <math|i>>>>|<row|<cell|0,<text|
    otherwise>>>>>>
  </equation*>

  <center| <larger| <center| <math|<tabular|<tformat|<table|<row|<cell|x<rsub|i>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0,>|<cell|<text|if
  station should be built at location <math|i>>>>|<row|<cell|1>|<cell|otherwise>>>>>>>>>>>>>>

  \;

  <doc-data|<doc-title|Objective Function>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|minimize>|<cell|:>|<cell|<big|sum><rsub|j=1><rsup|M>D<rsub|j>\<times\>
    L<rsub|j> \ >>>>
  </eqnarray*>

  \;

  \;

  <doc-data|<doc-title|Constraints>>

  <with|font-series|bold|Assignment variable bounds:>

  <\equation*>
    0\<leqslant\>\<alpha\><rsub|i,j>\<leqslant\>x<rsub|i><space|1em>\<forall\>i\<in\>
    1,2,\<ldots\>,N,j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <with|font-series|bold|Exactly one assignment:>

  <\equation*>
    <big|sum><rsup|N><rsub|i=1>\<alpha\><rsub|i,j>=1
    <space|1em>\<forall\>j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <with|font-series|bold|Distance penalty definition:>

  <\equation*>
    L<rsub|j>=<big|sum><rsup|N><rsub|i=1>S<rsub|i,j>\<times\>
    \<alpha\><rsub|i,j><space|1em>\<forall\>j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <with|font-series|bold|Number of stations:>

  <\equation*>
    <big|sum><rsup|N><rsub|i=1>x<rsub|i>=G
  </equation*>

  <new-page>\ 

  <doc-data|<doc-title|Formulation 2.0>>

  <\enumerate>
    <item>The solver now also tells us, at each location, the
    <with|font-series|bold|capacity> (among available options) of the
    charging station to build.

    <math|T> : The set of all <math|k>'s, where
    <math|k<rsub|r>=c<rsub|r>/d<rsub|avg><rsub|>>, with <math|c<rsub|r>>
    being one of the possible station capacities, and <math|d<rsub|avg>>
    being the average of all demands.

    The decision variable <math|x> is then modified as:

    <\equation*>
      x<rsub|i>=<choice|<tformat|<table|<row|<cell|0, <text| if no station
      should be built at <math|i>>>>|<row|<cell|k\<in\> T,<text| if a station
      at <math|i> should have capacity equal to <math|k\<times\>
      d<rsub|avg>>>>>>>>
    </equation*>

    The new <with|font-series|bold|capacity constraint> is as follows:

    <\equation*>
      <big|sum><rsup|M><rsub|j=1><around*|(|<frac|
      D<rsub|j>|d<rsub|avg>>|)>\<times\> \<alpha\><rsub|i,j>\<leqslant\>x<rsub|i><space|1em>\<forall\>i\<in\>
      1,2,\<ldots\>,N\ 
    </equation*>

    <new-page>\ 

    <item>Instead of taking the number of stations to build, we take the
    total <with|font-series|bold|budget> as an input. The <math|G> from
    earlier is replaced by:

    <math|B> : The maximum budget available for building the charging network

    Assuming that the cost of building a station is <math|C> times it's
    capacity, we add a budget constraint:

    <\equation*>
      <big|sum><rsup|N><rsub|i=1>x<rsub|i>\<leqslant\><frac| B|C>
    </equation*>

    <item><math| >With the added capacity constraint, some weird scenarios
    (like below) may happen.

    So, we need to allow for <with|font-series|bold|fractional assigning> of
    demands to make the demand<math|\<rightarrow\>>station assignment more
    efficient. Thus, <math|\<alpha\> >is now defined as:

    <center| <tabular|<tformat|<table|<row|<cell|<math|\<alpha\>
    <rsub|i,j>>>|<cell|:>|<cell|Fraction of demand at <math|j> assigned to
    station <math|i>>>>>>>

    \;
  </enumerate>

  \;

  \;

  <center| <image|file:///home/abhijeetbodas2001/academic/ME308/project/why_fractional_assignment.jpg|1par|||>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|heading-color|black>
    <associate|info-flag|minimal>
    <associate|page-medium|paper>
  </collection>
</initial>