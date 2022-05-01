<TeXmacs|2.1.1>

<style|beamer>

<\body>
  <screens|<\shown>
    <doc-data|<doc-title|Parameters>>

    <center| <tabular|<tformat|<table|<row|<cell|<math|i\<in\>
    <around*|[|1,N|]>>>|<cell|:>|<cell|Charging station
    location>>|<row|<cell|<math|j\<in\> <around*|[|1,M|]>>>|<cell|:>|<cell|Demand
    hotspot>>|<row|<cell|<math|k\<in\> <around*|[|1,K|]>>>|<cell|:>|<cell|Demand
    type>>>>>>

    <tabular|<tformat|<table|<row|<cell|<math|\<alpha\>
    <rsub|i,j>>>|<cell|:>|<cell|Fraction of demand at <math|j> assigned to
    station <math|i>>>|<row|<cell|<math|D<rsub|j,k>>>|<cell|:>|<cell|Demand
    for type <math|k> at demand hotspot <math|j>>>|<row|<cell|<math|S<rsub|i,j>>>|<cell|:>|<cell|Distance
    (by road) between station location <math|i> and demand hotspot
    <math|j>>>|<row|<cell|<math|B<rsub|i>>>|<cell|:>|<cell|Estimated cost of
    building a station at location <math|i>>>|<row|<cell|<math|C<rsub|i,k>>>|<cell|:>|<cell|Capacity
    of the station at <math|i> (if built) for demand type
    <math|k>>>|<row|<cell|<math|G>>|<cell|:>|<cell|Total budget available for
    building the charging network>>>>>

    <math| >

    <large| Other variables used:>

    <tabular|<tformat|<table|<row|<cell|<math|L<rsub|j>>>|<cell|:>|<cell|Penalty/Loss
    incurred by vehicles at <math|i> to travel to a station for charging>>>>>

    \;

    \;

    \;

    <doc-data|<doc-title|Decision Variable>>

    <center| <larger| <center| <math|<tabular|<tformat|<table|<row|<cell|x<rsub|i>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0,>|<cell|<text|if
    station should be built at location <math|i>>>>|<row|<cell|1>|<cell|otherwise>>>>>>>>>>>>>>

    \;

    \;

    <doc-data|<doc-title|Objective Function>>

    <\eqnarray*>
      <tformat|<table|<row|<cell|minimize>|<cell|:>|<cell|<big|sum><rsub|k=1><rsup|K><big|sum><rsub|j=1><rsup|M>D<rsub|j,k>\<times\>
      L<rsub|j> \ >>>>
    </eqnarray*>

    \;

    \;

    \;

    \;
  </shown>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|heading-color|black>
    <associate|page-medium|paper>
  </collection>
</initial>