<TeXmacs|2.1.1>

<style|beamer>

<\body>
  <doc-data|<doc-title|Formulation 1.0>>

  <center| <tabular|<tformat|<table|<row|<cell|<math|i\<in\>
  <around*|[|1,N|]>>>|<cell|:>|<cell|Charging station
  location>>|<row|<cell|<math|j\<in\> <around*|[|1,M|]>>>|<cell|:>|<cell|Demand
  hotspot>>>>>>

  \;

  <\center>
    <tabular|<tformat|<table|<row|<cell|<math|D<rsub|j>>>|<cell|:>|<cell|Demand
    (value) at demand hotspot <math|j>>>|<row|<cell|<math|S<rsub|i,j>>>|<cell|:>|<cell|Distance
    (by road) between station location <math|i> and demand hotspot
    <math|j>>>|<row|<cell|<math|G>>|<cell|:>|<cell|Maximum number of stations
    to build in the network (<math|\<leqslant\>N>)>>>>>
  </center>

  \;

  <math| ><with|font-base-size|12|><large| Other variables used:>

  <math|L<rsub|j>> : Penalty/Loss incurred by vehicles at <math|i> to travel
  to the assigned station for charging

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

  <section*|Fractional Demand>

  <\equation*>
    0\<leqslant\>\<alpha\><rsub|i,j>\<leqslant\>x<rsub|i><space|1em>\<forall\>i\<in\>
    1,2,\<ldots\>,N,j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  <section*|Fractional Demand Sum>

  <\equation*>
    <big|sum><rsup|N><rsub|i=1>\<alpha\><rsub|i,j>=1
    <space|1em>\<forall\>j\<in\> 1,2,\<ldots\>.,M
  </equation*>

  \;

  <section*|Distance Penalty Definition>

  <\equation*>
    <big|sum><rsup|N><rsub|i=1>D<rsub|i,j>\<times\>
    \<alpha\><rsub|i,j>=L<rsub|j><space|1em>\<forall\>j\<in\>
    1,2,\<ldots\>.,M
  </equation*>

  <new-page>\ 

  <doc-data|<doc-title|Formulation 2.0>>

  More complexity! New parameters as follows:

  <center| <tabular|<tformat|<table|<row|<cell|<math|k\<in\>
  <around*|[|1,K|]>>>|<cell|:>|<cell|Demand type>>>>>>

  <center| <tabular|<tformat|<table|<row|<cell|<math|D<rsub|j,k>>>|<cell|:>|<cell|Demand
  for type <math|k> at demand hotspot <math|j>>>|<row|<cell|<math|C<rsub|i,k>>>|<cell|:>|<cell|Capacity
  of the station at <math|i> (if built) for demand type <math|k>>>>>>>

  New constraints:

  <\equation*>
    <big|sum><rsub|j>D<rsub|j,k>\<times\>
    \<alpha\><rsub|i,j>\<leqslant\>c<rsub|i,k><space|1em>\<forall\>i\<in\>
    1,2,\<ldots\>,N,k\<in\> 1,2,\<ldots\>.,K\ 
  </equation*>

  <new-page>\ 

  <center| <image|file:///home/abhijeetbodas2001/academic/ME308/project/why_fractional_assignment.jpg|1par|||>>

  <math| >With the added capacity constraint, some weird scenarios may
  happen.

  So, we need to allow for <with|font-series|bold|fractional assigning> of
  demands to make the assignment even more efficient. Thus, <math|\<alpha\>
  >is now defined as:

  <center| <tabular|<tformat|<table|<row|<cell|<math|\<alpha\>
  <rsub|i,j>>>|<cell|:>|<cell|Fraction of demand at <math|j> assigned to
  station <math|i>>>>>>>

  \;

  Objective function updated to sum over all demand types:

  <\eqnarray*>
    <tformat|<table|<row|<cell|minimize>|<cell|:>|<cell|<big|sum><rsub|k=1><rsup|K><big|sum><rsub|j=1><rsup|M>D<rsub|j,k>\<times\>
    L<rsub|j> \ >>>>
  </eqnarray*>

  <math| >
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|heading-color|black>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|3>>
    <associate|auto-2|<tuple|?|3>>
    <associate|auto-3|<tuple|?|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Fractional
      Demand> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Fractional
      Demand Sum> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Distance
      Penalty Definition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>