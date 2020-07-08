# Original Loop Function
sizelimit_function <- function(row) {
  # Create a new LB_pars object for each species
  MyPars <- new("LB_pars")

  MyPars@Linf <- as.numeric(row['Linf'])
  MyPars@L50 <- as.numeric(row['L50'])
  MyPars@L95 <- as.numeric(row['L95'])
  MyPars@MK <- as.numeric(row['MK'])
  MyPars@SL50 <- as.numeric(row['SL50'])
  MyPars@SL95 <- as.numeric(row['SL95'])
  MyPars@SPR <- as.numeric(row['SPR'])
  MyPars@BinWidth <- as.numeric(row['BinWidth'])

  MyPars@L_units <- "mm"
  MyPars@Walpha <- as.numeric(row['LW_A'])
  MyPars@Walpha_units <- "g"
  MyPars@Wbeta <- as.numeric(row['LW_B'])
  MyPars@FecB <- as.numeric(row['LW_B'])

  MyPars@BinMin <- 0

  # Run the simulation model for each species
  MySim <- LBSPRsim(MyPars)
  #MySim@SPR
  #MySim@FM

  # "Print" the results
  #print(MySim@SPR)
  #print(MySim@FM)

  # Plot the simulation for each species
  plotSim(MySim, lf.type = "pop")
}

# Apply function to a given species
apply(species[which(species$Species == 'Naso unicornis_cr'), ], 1, sizelimit_function)

apply(species[which(species$Species == 'Naso unicornis_nr'), ], 1, sizelimit_function)

# To loop thru all species
##apply(species, 1, sizelimit_function)
