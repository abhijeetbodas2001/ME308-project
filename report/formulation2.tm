<TeXmacs|2.1.1>

<style|generic>

<\body>
  <section*| Formulation 2.0>

  <\enumerate>
    <item>Over and above telling <with|font-series|bold|where> the charging
    stations should be built, the model now also tells us what
    <with|font-series|bold|capacity> charging stations should be built at
    each location.

    Assuming that, there is a fixed of charging station designs, having
    capacities <math|c<rsub|1>,c<rsub|2>,\<ldots\>.>, we create a set
    <math|T> (<with|font-series|bold|assumed to be the same on all station
    locations>), of all <math|k<rprime|'>s>, where
    <math|k<rsub|r>=c<rsub|r>/d<rsub|avg>>. Here, <math|d<rsub|avg>> is the
    <with|font-series|bold|average expected demand>, over all demand
    hotspots. In our case, since we have already scaled down all the demands
    with respect to the mean, <with|font-series|bold|<math|d<rsub|avg>=1>>.

    This construction of the set essentially gives us a non-dimentional form
    of station capacities. The decision variable <math|x> is then changed as
    follows:

    <\equation*>
      x<rsub|i>=<choice|<tformat|<table|<row|<cell|0, <text| if no station
      should be built at <math|i>>>>|<row|<cell|k\<in\> T,<text| if a station
      at <math|i> should have capacity equal to <math|k\<times\>
      d<rsub|avg>>>>>>>>
    </equation*>

    Thus, if the model settles on having some <math|x<rsub|i>=k>, then that
    means we should build a charging station having capacity <math|k\<times\>
    d<rsub|avg>> on the location <math|i>. Note that, given how we have
    defined the <math|k<rprime|'>>s, this capacity is not a random value, but
    corresponds to one of the available station desings.

    We also now need to add a new <with|font-series|bold|capacity
    constraint>:

    <\equation*>
      <big|sum><rsup|M><rsub|j=1><around*|(|<frac|
      D<rsub|j>|d<rsub|avg>>|)>\<times\> \<alpha\><rsub|i,j>\<leqslant\>x<rsub|i><space|1em>\<forall\>i\<in\>
      1,2,\<ldots\>,N\ 
    </equation*>

    <item>Since the charging stations which we built now may be different
    from one location to another, it is required to define a
    <with|font-series|bold|budget> available to build the network, instead of
    just taking the total number of stations to build as input. Let us
    introduce a new budget parameter as follows:

    <center| <math|B> : The maximum budget available for building the
    charging network>

    <with|font-series|bold|Assuming> that the cost of building a station is
    <math|C> times it's capacity, we add a budget constraint:

    <\equation*>
      <big|sum><rsup|N><rsub|i=1>x<rsub|i>\<leqslant\><frac| B|C>
    </equation*>

    Here, <math|B/C> is the non-dimentional form of the total available
    budget.

    <item>Because of the added capacity constrint, it is now necessary to
    allow for <with|font-series|bold|demand splitting>, meaning, the
    assumption used in formulation 1.0 that all vahicles on a demand hotspot
    would only go to a single charging station, may not work well here.

    We have assumed, for ease of formulating that, in (1) that the set
    <math|T> is the same for all station locations, but in real world
    situations, this probably won't be the case. One station location may be
    much smaller than another, meaning that the maximum capacity on such a
    station would be smaller than the other station. In such cases, the
    following (undesired) scenario may occur:

    <center| <image|file:///home/abhijeetbodas2001/academic/ME308/project/for_presentation/why_fractional_assignment.jpg|1par|||>>

    There is a demand (of 100 units), and the two charging station locations
    closest to this demand have maximum possible-capacities of 50 units each.
    A third station having maximum capacity of 100 units is much far of.

    If we defined <math|\<alpha\> > as before, the model would now,
    considering capacity constraints, assign this demand to station 3,
    leading to a much higher objective function. This is undesired, and it
    would be much better if the demand of 100 <with|font-series|bold|split>
    and utilized the two smaller (but closer) charging stations. To make
    choosing the two closer charging stations possible, and thus to make the
    demand<math|\<rightarrow\>>station assignment more efficient, we
    re-define <math|\<alpha\> >as follows:

    <center| <center| <tabular|<tformat|<table|<row|<cell|<math|\<alpha\>
    <rsub|i,j>>>|<cell|:>|<cell|Fraction of demand at <math|j> assigned to
    station <math|i>>>>>>>>
  </enumerate>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|
      Formulation 2.0> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>