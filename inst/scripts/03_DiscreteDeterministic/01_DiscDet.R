##########################################################
# Discrete time deterministic models Section 1           #
##########################################################

#############################
#Load packages
library(ggplot2)
library(forcats)
library(tidyr)
#############################


#############################
# A. SIR Model from lecture
#############################

# A.1 Implement the SIR model from the slides and plot the proportion of the
# population in each state over time.

time_sir <- seq(0, 20, by = 1)
y_sir    <- matrix(data = NA,
                   nrow = length(time_sir),
                   ncol = 3)

update_sir <- function(t, y, parms) {
    S <- y[1]
    I <- y[2]
    R <- y[3]

    beta  <- parms["beta"]
    gamma <- parms["gamma"]

    out <- ???



    return(out)
}

parms_sir <- c(beta = 1.3,
               gamma = 0.23)

# initial values at t=0: S = ????, I = ????, R = ????
y_sir[1, ] <- c(???, ???, ???)
for (i in 2:nrow(y_sir)) {
    y_sir[i, ] <- y_sir[i-1, ] + ???



}

# convert matrix to data.frame
y_sir_df <- as.data.frame(y_sir)

# name each column
names(y_sir_df) <- c(???, ???, ???)

# bind to the time_sir vector
y_sir_df <- cbind(time = time_sir, y_sir_df)

# convert to "long" format for plotting using ggplot2
y_sir_long <- pivot_longer(y_sir_df,
                           cols = c(???, ???, ???),
                           names_to = "state",
                           values_to = "proportion",
                           names_transform = list(state = fct_inorder))

head(y_sir_long)

# produce plot
ggplot(data  = y_sir_long,
       aes(x = time,
           y = proportion)) +
    geom_step() +
    theme_bw() +
    xlab("Time (days)") +
    ylab("Population proportion") +
    facet_wrap(facets = vars(state))


# a) At approximately what time does the peak in infectious population occur
# and what proportion of the population is infectious?
#
# Answer:
#
# b) Approximately how long does it take for the susceptibles to go to 0?
#
# Answer:
#
# A.2 Change the mean time spent infectious from 4.35 days to 2 days, keeping
# the rate of transmission the same.
#
# a) At approximately what time does the peak in infectious population occur
# and what proportion of the population is infectious?
#
# Answer:
#
# b) Approximately how long does it take for the susceptibles to go to 0?
#
# Answer:

parms_sir <- c(beta = ???,
               gamma = ???)

y_sir[1, ] <- ???
for (i in 2:nrow(y_sir)) {
    y_sir[i, ] <- y_sir[i-1, ] + ???



}

# convert matrix to data.frame
y_sir_df <- as.data.frame(y_sir)

# name each column
names(y_sir_df) <- c(???, ???, ???)

# bind to the time_sir vector
y_sir_df <- cbind(time = time_sir, y_sir_df)

#convert to "long" format for plotting using ggplot2
y_sir_long <- pivot_longer(y_sir_df,
                           cols = c(???, ???, ???),
                           names_to = "state",
                           values_to = "proportion",
                           names_transform = list(state = fct_inorder))

# produce plot
ggplot(data  = y_sir_long,
       aes(x = time,
           y = proportion)) +
    geom_step() +
    theme_bw() +
    xlab("Time (days)") +
    ylab("Population proportion") +
    facet_wrap(facets = vars(state))

# A.4 Change the mean time spent infectious back to 4.35 days and set the
# transmission rate to be half what is has been
#
# a) At approximately what time does the peak in infectious population occur
# and what proportion of the population is infectious?
#
# Answer:
#
# b) Approximately how long does it take for the susceptibles to go to 0?
#
# Answer:

parms_sir <- ???


y_sir[1, ] <- c(0.99, 0.01, 0)
for (i in 2:nrow(y_sir)) {
    y_sir[i, ] <- ???



}

# convert matrix to data.frame
y_sir_df <- ???

# name each column
names(y_sir) <- c(???, ???, ???)

# bind to the time_sir vector
y_sir_df <- ???

# convert to "long" format for plotting using ggplot2
y_sir_long <- ???





# produce plot
ggplot(???)








#############################
# B. SIR model
#############################

# B.1 Adapt the SIR model in the slides to incorporate birth of new susceptibles
# proportional to the sum of the S I and R populations. Balance these new births
# with deaths from each of the S I and R groups, with both the per capita birth
# and death rates being delta=0.01

new_sir <- function(t, y, parms) {
    ??? <- ???
    ??? <- ???
    ??? <- ???

    beta  <- parms["beta"]
    gamma <- parms["gamma"]
    delta <- parms["delta"]

    ??? <- c(???,
             ???,
             ???)

    return(???)
}

new_parms <- ???

time_sir <- seq(0, 20, by = 1)
y_sir    <- matrix(data = NA, ncol = 3, nrow = length(time_sir))
y_sir[1, ] <- c(0.99, 0.01, 0)

for (i in 2:nrow(y_sir)) {
  y_sir[i, ] <- ???



}

# convert matrix to data.frame
y_sir_df <- ???

# name each column
names(y_sir_df) <- ???

# bind to the time_sir vector
y_sir_df <- cbind(time = time_sir, y_sir_df)

# convert to "long" format for plotting using ggplot2
y_sir_long <- ???





# produce plot
ggplot(???)








# B.2 Calculate N(t) = S(t) + I(t) + R(t) the total number of alive individuals.
# Make a plot of S(t), I(t), R(t) and N(t). Your function N(t) should be
# constant at 1 for all values of t. If this is not the case, ensure the model
# contains births of new S proportional to N, and deaths of each of S I and R

# calculate the total number of alive individuals over time
y_sir_df$Alive <- ???

# convert to "long" format for plotting using ggplot2
y_sir_long <- ???






ggplot(???)








# B.2
# a) At approximately what time does the peak in infectious population occur
# and what proportion of the population is infectious?
#
# Answer:
#
# b) Approximately how long does it take for the susceptibles to go to 0?
#
# Answer:
#
#
# B.3
# Discuss what happens to the population of S, I and R over time. Consider the
# parameters of the model, what they represent, and whether the assumptions
# they represent are realistic
#
# S(t):
#
#
#
# I(t):
#
#
#
#
# R(t):
#
#
#
# Assumptions:
#
#
#
#
#
#
#
#
#
