

# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#  ...	directories
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

home_dir <- "~/_smu/_src/home_prices/"
data_dir <- "./data"
lda_dir <- "./stats_ii/lda"

sas_dir <- "~/sas/SASUniversityEdition/myfolders/stats_ii"

setwd(home_dir)

# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#  ...	read in test data set
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	setwd(data_dir)
	test_homes <- read.csv("test.csv", stringsAsFactors = FALSE)
	setwd(home_dir)
	
	names(test_homes) <- tolower(names(test_homes))
	
	for (i in 2:(length(test_homes)))
	{
		if (class(test_homes[,i]) == "character")
		{
			test_homes[,i] <- factor (test_homes[,i])
		}
	}
	
	ncol <- length(test_homes)
	n_imp <- 0
	for (i in 1 : (length(test_homes)))
	{
		if(class(test_homes[,i]) == "integer"
		   			|| class(test_homes[,i]) == "numeric"
		   			|| class(test_homes[,i]) == "matrix")
		{
			n_imp <- n_imp + 1
			test_homes[ncol+n_imp] <- 0
			test_homes[, (ncol+n_imp)][is.na (test_homes[,i])] <- 1
			
			new_name <- paste0("imp_", names(test_homes)[i])
			names(test_homes)[ncol+n_imp] <- new_name
			
			test_homes[,i][is.na (test_homes[,i])] <- mean(test_homes[,i], na.rm = TRUE)
		}
	}
	
	for (i in 1 : (length(test_homes)))
	{
		if(class(test_homes[,i]) == "factor")
		{
			levels <- levels(test_homes[,i])
			levels[length(levels) + 1] <- "None"
			test_homes[,i] <- factor(test_homes[,i], levels = levels)
			test_homes[,i][is.na (test_homes[,i])] <- "None"
		}
	}
	
	test_homes$log_lotfrontage <- log(test_homes$lotfrontage)
	test_homes$log_lotarea <- log(test_homes$lotarea)
	test_homes$log_grlivarea <- log(test_homes$grlivarea)
	
	
	write.csv(test_homes, file = "test_set_cleaned.csv", row.names = FALSE)
	
	setwd(sas_dir)
	write.csv (test_homes, file = "test_set_cleaned.csv", row.names = FALSE)
	

# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# ...	Columns to retain for LDA - based on visual inspection of histograms / boxplots
# ...	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	test_homes_lda_keep <- subset(test_homes,
			select = c(
				lotfrontage, # ... wood
				overallqual,
				overallcond,
				yearbuilt,	# !!!
				yearremodadd, # !!!
				masvnrarea,	# BrkTil
				bsmtfinsf1,
				bsmtunfsf,
				totalbsmtsf,
				x2ndflrsf,	# stone & wood
				grlivarea,
				bedroomabvgr,
				kitchenabvgr,	# stone & slab
				totrmsabvgrd,	# stone
				garageyrblt,	# !!!
				garagecars,	# P Conc
				garagearea,	# Pconc $& wood
				openporchsf,	# pconc & impute 0s to median
				miscval,	# maybe wood & impute 0s to median
				yrsold))	# stone .. maybe by chance

# ...	--> 	saleprice #	impute in test set based on regression ??

	setwd(home_dir)
	setwd(lda_dir)
	write.csv(test_homes_lda_keep, file = "lda_test_set_cleaned.csv", row.names = FALSE)
	setwd(home_dir)
	
	setwd(sas_dir)
	write.csv (test_homes_lda_keep, file = "lda_test_set_cleaned.csv", row.names = FALSE)
	setwd(home_dir)


