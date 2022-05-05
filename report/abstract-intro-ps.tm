<TeXmacs|2.1.1>

<style|<tuple|generic|no-page-numbers>>

<\body>
  <section*|Abstract>

  There has been a clear rise in demand for electric vehicles in the past few
  years. This has led to an increased impetus on setting up infrastructure
  (which includes charging stations, production and maintenance units) that
  can cater to this increased demand of EVs.

  The goal of this project is to explore the various ways in which charging
  stations can be placed and operated in a given region so as to reduce the
  number of stations and the total costs involved in constructing and/or
  operating them. An optimal charging station network will minimize capital
  cost and improve driver experience.

  <section*|Introuduction>

  The Electric Vehicle (EV) industry has seen tremendous growth in recent
  times due to favourable government regulations and/or incentives and growth
  in demand among middle-aged urban consumers. Across the globe, there has
  been an increased focus on shifting to electric mobility. The US and some
  Nordic countries (Norway, Sweden and Finland) have seen an exponential
  increase in the number of EVs owned per unit population. In recent years,
  EVs have become a hot topic for discussion in India as well - for
  politicians, businessmen and tech giants alike. Several points have been
  made in favour of EVs, the most common one being that they are
  environment-friendly (which in hindsight may not be very accurate).\ 

  <with|font-shape|italic|Advantages of electric vehicles>

  <\itemize>
    <item>Economical in the long run (low Total Cost of Ownership)

    <item>No emissions

    <item>Quiet operation (no sound pollution)

    <item>Smooth running

    <item>Good resale value\ 
  </itemize>

  However, the limiting factors to the growth of the industry today are

  <\itemize>
    <item>Lack of infrastructure

    <item>High purchase costs\ 
  </itemize>

  <section*|Problem Statement>

  This projet aims to optimize a charging station network in a city assuming
  no existing charging infrastructure. The city is divided into several
  <with|font-series|bold|demand hotspots>, where the demand of a particular
  locality is assumed to be concentrated. Given a set of possible locations
  for constructing charging stations, we need to choose a subset which will
  lead to minimum total customer travel from demand hotspots to charging
  stations.

  The problem is tackled by a mathemtaical
  <with|font-series|bold|formulation> that has evolved over the course of of
  the project. Two major versions of the formulations will be discussed in
  the subsequent sections along with the accompanying results, which aim to
  give a detailed insight into our project.
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
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introuduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Problem
      Statement> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>