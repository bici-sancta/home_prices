# home_prices
Ask a home buyer to describe their dream house, and they probably won't begin with the height of the basement ceiling or the proximity to an east-west railroad. But this playground competition's dataset proves that much more influences price negotiations than the number of bedrooms or a white-picket fence.  With 79 explanatory variables describing (almost) every aspect of residential homes in Ames, Iowa, this competition challenges you to predict the final price of each home.


   
### Tip : to render the .html pages that are referenced on this repo ...  
go to this site : http://htmlpreview.github.io/?  
and copy/paste the .html link from this page into the text box  


###File descriptions  
  
    train.csv - the training set  
    test.csv - the test set  
    data_description.txt - full description of each column, originally prepared by Dean De Cock but lightly edited to match the column names used here  
    sample_submission.csv - a benchmark submission from a linear regression on year and month of sale, lot square footage, and number of bedrooms  
  
###Data fields  
  
####Here's a brief version of what you'll find in the data description file.  
  
    SalePrice - the property's sale price in dollars. This is the target variable that you're trying to predict.  
    MSSubClass: The building class  
    MSZoning: The general zoning classification  
    LotFrontage: Linear feet of street connected to property  
    LotArea: Lot size in square feet  
    Street: Type of road access  
    Alley: Type of alley access  
    LotShape: General shape of property  
    LandContour: Flatness of the property  
    Utilities: Type of utilities available  
    LotConfig: Lot configuration  
    LandSlope: Slope of property  
    Neighborhood: Physical locations within Ames city limits  
    Condition1: Proximity to main road or railroad  
    Condition2: Proximity to main road or railroad (if a second is present)  
    BldgType: Type of dwelling  
    HouseStyle: Style of dwelling  
    OverallQual: Overall material and finish quality  
    OverallCond: Overall condition rating  
    YearBuilt: Original construction date  
    YearRemodAdd: Remodel date  
    RoofStyle: Type of roof  
    RoofMatl: Roof material  
    Exterior1st: Exterior covering on house  
    Exterior2nd: Exterior covering on house (if more than one material)  
    MasVnrType: Masonry veneer type  
    MasVnrArea: Masonry veneer area in square feet  
    ExterQual: Exterior material quality  
    ExterCond: Present condition of the material on the exterior  
    Foundation: Type of foundation  
    BsmtQual: Height of the basement  
    BsmtCond: General condition of the basement  
    BsmtExposure: Walkout or garden level basement walls  
    BsmtFinType1: Quality of basement finished area  
    BsmtFinSF1: Type 1 finished square feet  
    BsmtFinType2: Quality of second finished area (if present)  
    BsmtFinSF2: Type 2 finished square feet  
    BsmtUnfSF: Unfinished square feet of basement area  
    TotalBsmtSF: Total square feet of basement area  
    Heating: Type of heating  
    HeatingQC: Heating quality and condition  
    CentralAir: Central air conditioning  
    Electrical: Electrical system  
    1stFlrSF: First Floor square feet  
    2ndFlrSF: Second floor square feet  
    LowQualFinSF: Low quality finished square feet (all floors)  
    GrLivArea: Above grade (ground) living area square feet  
    BsmtFullBath: Basement full bathrooms  
    BsmtHalfBath: Basement half bathrooms  
    FullBath: Full bathrooms above grade  
    HalfBath: Half baths above grade  
    Bedroom: Number of bedrooms above basement level  
    Kitchen: Number of kitchens  
    KitchenQual: Kitchen quality  
    TotRmsAbvGrd: Total rooms above grade (does not include bathrooms)  
    Functional: Home functionality rating  
    Fireplaces: Number of fireplaces  
    FireplaceQu: Fireplace quality  
    GarageType: Garage location  
    GarageYrBlt: Year garage was built  
    GarageFinish: Interior finish of the garage  
    GarageCars: Size of garage in car capacity  
    GarageArea: Size of garage in square feet  
    GarageQual: Garage quality  
    GarageCond: Garage condition  
    PavedDrive: Paved driveway  
    WoodDeckSF: Wood deck area in square feet  
    OpenPorchSF: Open porch area in square feet  
    EnclosedPorch: Enclosed porch area in square feet  
    3SsnPorch: Three season porch area in square feet  
    ScreenPorch: Screen porch area in square feet  
    PoolArea: Pool area in square feet  
    PoolQC: Pool quality  
    Fence: Fence quality  
    MiscFeature: Miscellaneous feature not covered in other categories  
    MiscVal: $Value of miscellaneous feature  
    MoSold: Month Sold  
    YrSold: Year Sold  
    SaleType: Type of sale  
    SaleCondition: Condition of sale  
    
    
    
2) ANALYSIS 2: Build the most predictive model for sales prices of homes in all of Ames Iowa.  This includes all neighborhoods.  Your group is limited to only the techniques we have learned in 6371 (no random forests or other methods we have not yet covered.)  Specifically, you should produce 4 models: one from forward selection, one from backwards elimination, one from stepwise selection and one that you build custom.  The custom model could be one of the three preceding models or one that you build by adding or subtracting variables at your will.  Generate an adjusted R2, CV Press and Kaggle Score for each of these models and clearly describe which model you feel is the best in terms of being able to predict future sale prices of homes in Ames, Iowa.  In your paper, please include a table similar to the one below.  The group with the lowest public Kaggle score will receive an extra 2 bonus points on the final exam!    
Hint: for this analysis, start with the included SAS code written by Bivin and you may want to revisit the YouTube video linked above.  
Quick note on Kaggle completion:  `We only have one course under our belts so far (almost), but you can compete in this competition with the tools you have now (Top 40th percentile or less)!   And, after your next course (6372) you will really be able to do well top 25th percentile (or less)!  With these skills and the skills you pick up in Data Mining and Quantifying the World, you will be able to compete with anyone!  
  
Predictive Models  
Adjusted R2  
CV PRESS  
Kaggle Score  
Forward    
.89  
1272  
.721  
Backward  
.78  
1590  
.945  
Stepwise  
.81  
2001  
.888  
CUSTOM  
.87  
900  
.2345  
  
NOTE 1: ALL ANALYSIS MUST BE DONE IN SAS and all code must be placed in the appendix.  Part of the grading process will be to run the code and verify the Kaggle score for each group.    
  
Note 2: An extra 2 points on the final exam will be awarded to the team with the model with the lowest (best) Kaggle Score.  In the unlikely event of a tie we will split these points.    
