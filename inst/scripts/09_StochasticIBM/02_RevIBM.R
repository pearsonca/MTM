# Individual-based SARS-CoV-2 transmission model, practical 2
library(ggplot2)


## Model parameters
beta <- 0.5      # Transmission parameter
iota <- 1e-5     # Importation rate
delta <- 1/2.5   # Rate of transitioning out of latent state
gamma <- 1/5     # Rate of transitioning out of infectious state
omega <- 1/180   # Rate of waning immunity

dt <- 1          # Time step of simulation (1 day)
days <- 365*2    # Duration of simulation (2 years)
steps <- days/dt # Total number of time steps
n <- 1000        # Population size


## Some helper functions
# Calculates infectiousness as a function of state and age: zero if state is
# not "I"; nonzero if state is "I", and slightly decreasing with age
infectiousness <- function(state, age) {
    ifelse(state == "I", 1.25 - age / 160, 0)
}

# Calculates susceptibility of individuals with antibody level(s) ab
susceptibility <- function(ab) {
    1 - pnorm(ab, 5, 1)
}

# Generates n random delays from the latent-period distribution
# (approximately 2 days, on average)
latent_delay <- function(n) {
    rlnorm(n, meanlog = 0.5, sdlog = 0.6)
}

# Generates n random delays from the infectious-period distribution
# (approximately 5 days, on average)
infectious_delay <- function(n) {
    rlnorm(n, meanlog = 1.5, sdlog = 0.5)
}

# Generates n random increments to antibody levels following recovery
ab_increment <- function(n) {
    rnorm(n, mean = 12, sd = 2)
}


## Data frame to store simulation results
results <- data.frame(ts = 1:steps, S = 0, E = 0, I = 0, R = 0)


## Initialize simulation

# Set the seed for the pseudorandom number generator, for reproducibility
set.seed(12345)

# Initialize state variables
state <- rep("S", n)   # Each individual's state: start with all susceptible
state[1:10] <- "E"     # Start 10 individuals in the "exposed" state


## Run simulation

# Initialize progress bar
bar <- txtProgressBar(min = 1, max = steps, style = 3)

# Loop over each time step . . .
for (ts in 1:steps) {
    # Calculate the force of infection
    lambda <- beta * sum(state == "I") / n + iota

    # Loop through each host . . .
    for (i in 1:n) {
        # Update individual i's non-state variables
        # . . .

        # Update individual i's state
        if (state[i] == "S") {
            # Transition S -> E (infection) at rate lambda
            if (runif(1) < 1 - exp(-lambda * dt)) {
                state[i] <- "E"
            }
        } else if (state[i] == "E") {
            # Transition E -> I (latent to infectious) at rate delta
            if (runif(1) < 1 - exp(-delta * dt)) {
                state[i] <- "I"
            }
        } else if (state[i] == "I") {
            # Transition I -> R (infectious to recovered) at rate gamma
            if (runif(1) < 1 - exp(-gamma * dt)) {
                state[i] <- "R"
            }
        } else if (state[i] == "R") {
            # Transition R -> S (waning of immunity) at rate omega
            if (runif(1) < 1 - exp(-omega * dt)) {
                state[i] <- "S"
            }
        }
    }

    # Save population state for this time step
    results[ts, "S"] <- sum(state == "S")
    results[ts, "E"] <- sum(state == "E")
    results[ts, "I"] <- sum(state == "I")
    results[ts, "R"] <- sum(state == "R")

    # Update progress bar; close progress bar if we are finished
    setTxtProgressBar(bar, ts)
    if (ts == steps) {
        close(bar)
    }
}

## Plot simulation results
ggplot(results) +
  geom_line(aes(x = ts, y = S, colour = "S")) +
  geom_line(aes(x = ts, y = E, colour = "E")) +
  geom_line(aes(x = ts, y = I, colour = "I")) +
  geom_line(aes(x = ts, y = R, colour = "R"))
