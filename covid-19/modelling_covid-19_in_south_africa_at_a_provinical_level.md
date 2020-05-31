Introduction
============

In this report we model the COVID-19 epidemic in South Africa. In this
paper mobility data is used to model the reproduction number of the
COVID-19 epidemic over time using Bayesian hierarchical model. Results
are calibrated to reported deaths only. This is achieved by adapting the
work in \[1\] for South Africa. Similar models have been built for
Brazil \[2\] and the United States \[3\].

We use data as compiled in \[4\]. We use mobility movement indexes by
province from \[5\]. This report is automatically generated using R
\[6\] and contains data available on 29 May 2020.

Methodology
===========

Key features of the approach employed are:

-   It uses a Bayesian Hierarchical Model to calibrate model parameters
    based on observed death data and prior assumptions.
-   Changes in the reproductive number are linked to mobility data
    \[5\].
-   The model uses population weighted infection fatality ratio (IFRs)
    with some noise added.
-   There is a single model for all provinces sharing information
    between provinces, but province specific effects are also allowed.
-   The model does not allow for interventions that are not observable
    via mobility changes. This includes testing and contact tracing,
    mask wearing, workplace screening etc.

See a more detailed description of the [methodology and assumptions
below](#detailed-assumptions-and-Methodology).

Mobility
========

Below we show the mobility data from \[5\]. We use the indexes at a
provincial level but here we plot the national indexes.

Residential
-----------

Below we plot the mobility data from \[5\] for South Africa as a whole.
Clear trends are observable over:

-   Mobility generally reduces before the lockdown on 27 March.
-   There is an increase in mobility in the days just before the
    lockdown. In particular the Grocery & Pharmacy and Retail indexes.
    Perhaps an indication of pre-lockdown “panic buying”?
-   Mobility is relatively stable during level 5 lockdown at low levels.
-   Mobility increases when level 4 starts.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-2-1.png)

Below we summarise this chart into the 3 indicators used in the model:

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-3-1.png)

We do not show them separately, but, in the model, we use the provincial
versions of these indexes.

Calibration
===========

This section shows the calibration of data for various provinces. Three
panels are plotted for each province:

1.  The first panel shows the modelled daily number of infections (blue)
    compared to confirmed case counts (brown) as reported for the
    province. Note that this model does not calibrate to case data, but
    this data is shown for reference.
2.  The second shows the daily count of deaths reported in the province
    (brown) and the modelled deaths in blue.
3.  The third panel shows the estimates for *R*<sub>*t*, *m*</sub> for
    each province.

In all the charts the darker shaded area represents a confidence
interval of 50% and the lighter shaded area represents a confidence
interval of 95%.

In general, it is noted:

-   The model appears to be a reasonable fit to daily number of deaths
    reported (where there is enough data).
-   *R*<sub>*t*, *m*</sub> dropped significantly from the declaration of
    state of disaster, closure of schools and the implementation of
    lockdown.
-   *R*<sub>*t*, *m*</sub> picked up in the days ahead of the start of
    Level 5 lockdown, presumably as people prepared for lockdown.
-   *R*<sub>*t*, *m*</sub> dropped significantly during Level 5
    lockdown. For most provinces it did not drop below 1.
-   *R*<sub>*t*, *m*</sub> moved higher after the start of Level 4
    lockdown.

Western Cape
------------

The Western Cape has the most reported deaths of all provinces and hence
the most data to calibrate. Below we plot the modelled infections. It’s
clear that infections are far outpacing reported cases. Over the last 14
days it would appear that the Western Cape only tested 2.7% of all new
infections.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-4-1.png)

Below we plot reported deaths in brown vs. modelled deaths in blue. This
province has increasing numbers of deaths. The model appears to have a
reasonable fit. The data does seem quite variable from day to day which
may be perhaps data processing delays causing clumping of reported
deaths.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-5-1.png)

Western Cape *R*<sub>*t*, *m*</sub> is currently in a band between 1.5
and 2.0 after never truly moving much below 1.5. Thus, we are probably
dealing with an already rapidly spreading epidemic.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-6-1.png)

Eastern Cape
------------

Eastern Cape also has a recently had an increase in deaths. Data is
still relatively sparse, but the model is clearly trending upwards to
accommodate more frequent reporting of deaths. *R*<sub>*t*, *m*</sub>
for Eastern Cape appears to be slightly higher than Western Cape. A
concerning trend. Over the last 14 days it would appear that 2.7% of all
new infections were tested.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-7-1.png)

Gauteng
-------

Gauteng has limited reported deaths. The long period of relatively low
deaths is pulling the values of *R*<sub>*t*, *m*</sub> during level 4
lockdown to be around 1. It is encouraging to see a slower epidemic in
Gauteng. Over the last 14 days it would appear that 17.3% of all new
infections were tested.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-8-1.png)

KwaZulu-Natal
-------------

KwaZulu-Natal also has limited reported deaths. The long period of
relatively low deaths is pulling the values of *R*<sub>*t*, *m*</sub>
during level 4 lockdown below 1. Over the last 14 days it would appear
that 53.7% of all new infections were tested.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-9-1.png)

Other Provinces
---------------

The other provinces have extremely limited data. We should await more
deaths to form a conclusive opinion on these provinces. Over the last 14
days it would appear that 12.3% of all new infections were tested.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-10-1.png)

Reproduction Number Estimates
=============================

Initial Reproduction Number
---------------------------

Below we plot estimates for *R*<sub>0, *m*</sub> for each province. It
is clear that the posterior estimates for *R*<sub>0, *m*</sub> is not
heavily influenced by the data. This is probably due to the relatively
early lockdown implemented in South Africa. There was not deaths that
resulted from infection prior to lockdown to develop an independent
estimate for each province of *R*<sub>0, *m*</sub>.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-11-1.png)

Current Reproduction Number as at 29 May 2020
---------------------------------------------

Below we plot current estimates and 95% confidence intervals for
*R*<sub>*t*, *m*</sub> (current reproduction number) for each province.
It’s clear that currently the values of *R*<sub>*t*, *m*</sub> are not
below 1 (which would indicate an epidemic that is slowing). Only
KwaZulu-Natal and Other provinces confidence intervals include 1. It is
however clear that the spread of the epidemic is somewhat slowed
compared to the initial *R*<sub>0, *m*</sub>.

The wide confidence intervals would indicate that we need to wait for
the epidemic to further develop to include more data in our models. The
confidence intervals for Western Cape is narrowing already.

![](C:/Users/lrossou/Desktop/lrossouw.github.io/covid-19/modelling_covid-19_in_south_africa_at_a_provinical_level_files/figure-markdown_github/unnamed-chunk-12-1.png)

Attack Ratio as at 29 May 2020
==============================

With this epidemic it’s difficult to know how many people has been
infected to date. This is known as the *attack ratio*. Because a number
of people experience no or mild symptoms, they may not seek medical
advice and not be tested. Therefore, below we plot estimates of the
attack ratio of the disease to date. That is the proportion of the
population of each province that have been infected. Western Cape has
the highest estimated prevalence to date, but with fairly wide
confidence intervals. Eastern Cape currently has the second highest
prevalence.

| Province     | Attack Ratio           |
|:-------------|:-----------------------|
| EC           | 1.44% \[0.68%-2.79%\]  |
| GP           | 0.12% \[0.06%-0.24%\]  |
| KZN          | 0.14% \[0.09%-0.21%\]  |
| WC           | 8.33% \[4.70%-13.80%\] |
| OTH          | 0.03% \[0.01%-0.08%\]  |
| South Africa | 1.20% \[0.77%-1.85%\]  |

Projections
===========

One of the reasons we build models is so that we can make sense of the
future or indeed the past. We can project forward models and assess the
impact of varying assumptions on future outcomes to get a sense of how
changes in actions may impact the future. I.e. it allows us to answer
“what if” questions.

Note however that in projecting the future (or indeed alternate pasts)
we are extrapolating, and due care needs to be taken.

No change in Mobility
---------------------

***TO DO***

Future changes in Mobility
--------------------------

Below we consider future scenarios on mobility. Given that we are
generally seeing a relaxation of lockdown we a may well see increased
mobility in the future. So, we will consider a scenario of mobility
increasing from current 50% to normal. I.e. halfway between what we have
now and what we would have under normal circumstances as implied by
\[5\].

***TO DO***

Alternate Past - No Lockdown?
-----------------------------

***TO DO***

Alternate Past - Early Lockdown Release
---------------------------------------

***TO DO***

Back-Testing
============

Here the intention is to test the model on data up to say x-days ago and
test the x-day projection accuracy. This period can be extended over
time.

7-day Back Test
---------------

***TO DO***

14-day Back Test
----------------

***TO DO***

Discussion
==========

Limitations
-----------

This analysis has some limitations:

-   The models are based on somewhat limited data for South Africa. In
    particular the effects of lockdown in some of the provinces may be
    simple “extrapolations” using the fixed effects (*α*<sub>*k*</sub>)
    and shared prior of *R*<sub>0, *m*</sub>, based on the effect in
    provinces with more data such as Western Cape. As these fits are
    updated with new data though the models should be more accurate for
    each province resulting in better estimates given.
-   No back-testing has yet been done given the limited data. The author
    is keeping past projections of the model to test accuracy of the
    model over time.
-   The models are simplistic high-level single population models for
    each province. It contains no differentiation by age groups or any
    further details. This is required to make the hierarchical models
    manageable. It seems still to provide useful information on
    potential movements in the epidemic.
-   The models do not take account to changes of interventions that do
    not impact general mobility such as mask wearing, social distancing,
    handwashing and testing, tracing and isolation. The models do take
    account of the average impact of these interventions over time, but
    changes in these interventions will not be taken account of. For
    example, increases in masks usage and testing may result in
    *R*<sub>*t*, *m*</sub> increases to be less with increased mobility.
-   Google Mobility data may not effectively cover the South African
    population. It’s unclear how uniform the coverage is in say lower
    income populations who may have limited data and hence not
    contribute significantly to the mobility indexes.
-   IFR assumptions may be wrong:
    -   It’s based on Chinese data and may therefore be higher or lower
        in SA. The IFR employed though has been found consistent with
        various sources \[7\].
    -   It does not consider health system capacity. In adverse
        scenarios the IFR is likely to increase if health system
        capacity is exceeded.
-   The model assumes that all COVID-19 deaths are captured and reported
    via NICD into \[4\]. If this record is not complete the model may
    underestimate deaths.

Impact of Interventions
-----------------------

From the results it’s clear that *R*<sub>*t*, *m*</sub> in all provinces
has likely been reduced from *R*<sub>0, *m*</sub> and this has slowed
the spread of the epidemic in South Africa saving lives. However, in
Europe the lockdowns have been able to reduce *R*<sub>*t*</sub> for
various countries below 1 \[8\]. South Africa’s lockdowns and other
interventions have not been as successful as in most European countries.

Lockdown - Level 4
------------------

It’s clear that mobility has increase somewhat following the
commencement of level 4 lockdowns. This results in an increasing the
*R*<sub>*t*, *m*</sub> in various provinces since the start of May. The
death data corresponding to this increased *R*<sub>*t*, *m*</sub> is
unlikely to be significant as yet and we will soon see whether this
model is handling this accurately, or if potentially through other
interventions the Level 4 is not increasing *R*<sub>*t*, *m*</sub>.

Further Relaxation of Lockdown
------------------------------

It’s clear that projections on current mobility levels would already
result in significant peaks in deaths in July and August.  
Further to that an increase from current mobility 50% back to normal
mobility would significantly worsen these peaks.

Relevance of IFR
----------------

The IFR is not treated as a parameter but as a constant with random
noise. Changes to the IFR will change the modelled infections that
correlate with the observed deaths. Sensitivity to the IFR could be
modelled.

Using Mobility Data
-------------------

Using mobility data is useful to not only measure the impact of
government interventions but also include the societal response to those
interventions (as they affect mobility). This means that changes in the
reaction to new regulations can be modelled. It may also be useful going
forward as many new regulations are introduced possibly at a provincial
level to summarise the impact of interventions numerically.

Further Work
------------

The author intends to:

-   Continually update these model fits as new data emerges.
-   Search and include further indexes that may track other
    interventions to model their effect.
-   Produce similar models for a selection of countries.
-   Back test earlier models against new data.
-   Analyse the sensitivity of results to changes in IFR.

Detailed Assumptions and Methodology
====================================

The model assumes that current reproduction number,
*R*<sub>*t*, *m*</sub>, is a function of the initial reproduction
number, *R*<sub>0, *m*</sub>, and mobility changes over time. It then
calculates infections as a function of *R*<sub>*t*, *m*</sub> over time,
and then, using these infections calculates deaths from the infections
based on a distribution of time to death. Various prior distributions
are assumed. The model structure is identical to that in \[1\] but is
briefly documented below. The parameters are estimated jointly using a
single hierarchical model covering all provinces. This means that data
in different provinces are combined to inform all parameters in the
model. As per \[1\], fitting was done in R using Stan with an adaptive
Hamiltonian Monte Carlo sampler.

The Model
---------

The model assumes a base reproduction number (*R*<sub>0, *m*</sub>) for
each province (*m*) and models future values of the reproduction number
using mobility indexes as follows:

$R\_{t,m}=R\_{0,m}(\\phi^{-1}(-\\sum\_{k=1}^{3}(\\alpha\_{k}+\\beta\_{k,m})I\_{k,t,m}))$

Here:

-   *t* is the day.
-   *ϕ*<sup> − 1</sup> is the inverse logit function.
-   *I*<sub>*k*, *t*, *m*</sub> are the mobility indexes from Google
    Mobility \[5\] data for each province over time. Typical movements
    are presented by 0 and atypically movements are represented by
    increases or decreases to the above.
-   *α*<sub>*k*</sub> is the effect of mobility index
    *I*<sub>*k*, *t*, *m*</sub> on *R*<sub>*t*, *m*</sub> independent of
    province.
-   *β*<sub>*k*, *m*</sub> is the province specific effect of mobility
    index *I*<sub>*k*, *t*, *m*</sub> on *R*<sub>*t*, *m*</sub>.

Infections are modelled as:

$c\_{t,m}=S\_{t,m}R\_{t,m}\\sum\_{\\tau=0}^{t-1}c\_{\\tau,m}g\_{t-\\tau}$
where $S\_{t,m}=1 - \\frac{\\sum\_{i=0}^{t-1}c\_{i,m}}{N\_{m}}$.

Infections, *c*<sub>*t*, *m*</sub> at time *t* are a function of
proportion of population not yet infected (*S*<sub>*t*, *m*</sub>), the
reproduction number (*R*<sub>*t*, *m*</sub>) and infections prior to
that *c*<sub>*τ*, *m*</sub> as well as an infectiousness curve
*g*<sub>*t* − *τ*</sub>. *N*<sub>*m*</sub> is the population in province
*m*.

Deaths, *d*<sub>*t*, *m*</sub> are modelled as:

$d\_{t,m}=ifr\_{m}^\*\\sum\_{\\tau=0}^{t-1}c\_{\\tau,m}\\pi\_{t-\\tau}$

Here:

-   *i**f**r*<sub>*m*</sub><sup>\*</sup> is the average infection
    fatality rate (IFR) in the province (with random noise added).
-   *π*<sub>*t* − *τ*</sub> is a distribution of time to death since
    infection.

Prior Assumptions and Random Noise
----------------------------------

The following assumptions are taken as is from \[1\].

We add random noise to the IFR as follows:

*i**f**r*<sub>*m*</sub><sup>\*</sup> = *i**f**r*<sub>*m*</sub> ⋅ *N*(1, 0.1)

*α*<sub>*k*</sub> is normally distributed with a 0 mean:

*α*<sub>*k*</sub> ∼ *N*(0, 0.5)

If *Y* ∼ *N*(*μ*, *σ*) then we define *N*<sup>+</sup> to mean the
distribution of \|*Y*\| ∼ *N*<sup>+</sup>(0, 0.5).

Then for the provincial specific index effects we use:

*β*<sub>*k*, *m*</sub> ∼ *N*(0, *γ*) with *γ* ∼ *N*<sup>+</sup>(0, 0.5)

The *R*<sub>0, *m*</sub> are defined to be distributed normally as
follows:

*R*<sub>0, *m*</sub> ∼ *N*(3.28, *κ*) with *κ* ∼ *N*<sup>+</sup>(0, 0.5)

Infectiousness follows this distribution:

*g* ∼ *G**a**m**m**a*(6.5, 0.62)

Time to death follows this distribution:

*π* ∼ *G**a**m**m**a*(5.1, 0.86) + *G**a**m**m**a*(17.8, 0.45)

Death and Confirmed Case Data
-----------------------------

Death and case data were used from \[4\]. This data set contains,
amongst other, provincial case and deaths data digitised mainly from
daily tweets by National Institute of Communicable Diseases (NICD).

We note again that the model calibrates to only the deaths. The reason
for not calibrating to confirmed cases is that the bias in the testing
is unknown. The degree to which testing has focussed on symptomatic and
people seeking medical treatment or hospital treatment is unknown and
could have changed over time. This would present a biased estimate and
would require adjustment in this model.

Based on limited death data, provinces were aggregated as follows:

-   EC – Eastern Cape
-   GP – Gauteng
-   KZN – KwaZulu Natal
-   WC – Western Cape
-   OTH (all other provinces)

Infection Fatality Rates (IFR)
------------------------------

The IFR (*i**f**r*<sub>*m*</sub>) for each province was calculated using
the output of the squire R package \[9\]. It produces an age-specific
infection attack ratios (IAR), infections and deaths. The per age band
IFR were used together with the per age band IAR and these were applied
to provincial populations \[10\]. The IFRs from squire package are based
on \[11\], \[12\] and \[9\].

The projection was done doing the default parameters for South Africa
and the resultant attack ratio (*a*<sub>*x*</sub>) and IFR
(*i**f**r*<sub>*x*</sub>) for each 5-year age band was obtained (*x*).

These *a*<sub>*x*</sub> and *i**f**r*<sub>*x*</sub> were then applied to
the South African population per province and age band as per \[10\] and
weighted IFRs calculated as follows.

$ifr\_{m}=\\frac{\\sum\_{x}N\_{x,m} \\cdot a\_{x} \\cdot ifr\_{x}}{\\sum\_{x}N\_{x,m}}$

Here *N*<sub>*x*, *m*</sub> is the population in a particular province
(*m*) and age band (*x*).

Below we tabulate the resultant *i**f**r*<sub>*m*</sub>:

| Province     | IFR   |
|:-------------|:------|
| EC           | 0.59% |
| GP           | 0.39% |
| KZN          | 0.4%  |
| WC           | 0.48% |
| OTH          | 0.44% |
| South Africa | 0.44% |

The differences between provinces reflect the different age profiles in
those provinces as per \[10\]. This seems low compared to the IFRs in
\[7\], but may be reasonable given the younger profile of the South
African population.

Mobility Indexes
----------------

These data contain the mobility indexes for each province. These are
described in \[5\] as follows:

-   Grocery & pharmacy: Mobility trends for places like grocery markets,
    food warehouses, farmers markets, specialty food shops, drug stores,
    and pharmacies.
-   Parks: Mobility trends for places like local parks, national parks,
    public beaches, marinas, dog parks, plazas, and public gardens.
-   Transit stations: Mobility trends for places like public transport
    hubs such as subway, bus, and train stations.
-   Retail & recreation: Mobility trends for places like restaurants,
    cafes, shopping centres, theme parks, museums, libraries, and movie
    theatres.
-   Residential: Mobility trends for places of residence.
-   Workplaces: Mobility trends for places of work.

These measure relative changes in mobility in above dimensions relative
to a baseline established before the epidemic. For example, -30% implies
a 30% reduction in mobility from pre-COVID-19 mobility.

As per \[1\] these data were combined into 2 indexes for each province
as follows:

-   Residential
-   Average of the rest

In \[1\] three indexes were used (Residential, Transit and the rest).
This was reduced for this paper due to limited data.

We calculated indexes for OTH by weighting the individual provinces by
population.

Author
======

This report was prepared by Louis Rossouw. Please get in contact with
Louis Rossouw if you have comments or wish to receive this regularly.

**Louis Rossouw**  
Head of Research & Analytics  
Gen Re \| Life/Health Canada, South Africa, Australia, NZ, UK &
Ireland  
Email: [LRossouw@GenRe.com](mailto:LRossouw@genre.com) Mobile: +27 71
355 2550

***The views in this document represents that of the author and may not
represent those of Gen Re. Also note that given the significant
uncertainty involved with the parameters, data and methodology care
should be taken with these numbers and any use of these numbers.***

References
==========

\[1\] Volmer et al., “Report 20 - using mobility to estimate the
transmission intensity of COVID-19 in Italy: A subnational analysis with
future scenarios,” Imperial College, London, 2020 \[Online\]. Available:
<https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-20-italy/>

\[2\] Mellan et al., “Report 21: Estimating COVID-19 cases and
reproduction number in brazil,” Imperial College, London, 2020
\[Online\]. Available:
<https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-21-brazil/>

\[3\] Unwin et al., “Report 23 - state-level tracking of COVID-19 in the
united states,” Imperial College, London, 2020 \[Online\]. Available:
<https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-23-united-states/>

\[4\] Marivate et al., “Coronavirus disease (COVID-19) case data - South
Africa.” \[Online\]. Available: <https://github.com/dsfsi/covid19za>

\[5\] Google LLC, “Google covid-19 community mobility reports.”
\[Online\]. Available: <https://www.google.com/covid19/mobility/>

\[6\] R Core Team, *R: A language and environment for statistical
computing*. Vienna, Austria: R Foundation for Statistical Computing,
2019 \[Online\]. Available: <https://www.R-project.org/>

\[7\] G. Meyerowitz-Katz and L. Merone, “A systematic review and
meta-analysis of published research data on COVID-19 infection-fatality
rates,” Cold Spring Harbor Laboratory Press, 2020 \[Online\]. Available:
<https://www.medrxiv.org/content/early/2020/05/27/2020.05.03.20089854>

\[8\] Flaxman et al., “Report 13 - estimating the number of infections
and the impact of non-pharmaceutical interventions on COVID-19 in 11
European countries,” Imperial College, London, 2020 \[Online\].
Available:
<https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-13-europe-npi-impact/>

\[9\] Walker et al., “Report 12 - the global impact of COVID-19 and
strategies for mitigation and suppression,” Imperial College, London,
2020 \[Online\]. Available:
<https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-12-global-impact-covid-19/>

\[10\] Statistics South Africa, “Mid-year population estimates 2019,”
Republic of South Africa, London, 2019.

\[11\] Verity et al., “Estimates of the severity of coronavirus disease
2019: A model-based analysis,” *The Lancet Infectious Diseases*, 2020
\[Online\]. Available:
<https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(20)30243-7/fulltext>

\[12\] Ferguson et al., “Report 9 - impact of non-pharmaceutical
interventions (NPIs) to reduce COVID-19 mortality and healthcare
demand,” Imperial College, London, 2020 \[Online\]. Available:
<https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-9-impact-of-npis-on-covid-19/>
