<TeXmacs|2.1.1>

<style|generic>

<\body>
  <section*|Further work>

  <\itemize>
    <item>The total time spent by a vehicle for getting it's batteries
    charged is actually made up of two factors:

    <\enumerate>
      <item>The time spent travelling to a charging station, which depends on
      the distance to the station

      <item>Waiting at the charging station in a queue, and while the
      batteries are actually getting charged (which is also a significant
      amount of time)
    </enumerate>

    In our project, we have touched only the first component, i.e the
    travelling time. Further work in this project should be on expanding the
    formulation to include the second component, which would involve working
    on a <with|font-series|bold|job-scheduling> problem having very different
    parameters and semantics.

    <item>The data which we have used is the one which was easily available
    and reasonable to work with. However, in actuality, there are various
    government norms in place which put restrictions on where charging
    stations can be built. For example, the minimum distance between two
    charging stations must be <math|\<sim\>3km>. Further work on this project
    may take into account such government norms and regulations, and will
    need to collect on-ground data as appropriate.

    <item>There exists different type of chargers like AC/DC, which we
    haven't considered in this project. Updating the formulation for such
    types could be a good follow-up task.

    <item>We have taken a simplistic formula for the charging station cost,
    considering it to be proportional to the capacity. In reality, the cost
    would depend on not just the capacity, but also the rate at which the
    land is leased from the government, the
    <with|font-series|bold|operational costs> of the charging station (which
    in turn would depend on how much demand is assigned to that station,
    making this a recursive problem!) and many other factors. We can improve
    the project by accounting for some or all of these factors.
  </itemize>
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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Further
      work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>