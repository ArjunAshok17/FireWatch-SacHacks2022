# FireWatch-SacHacks2022 #

This is the FireWatch project the "c team", Sanjita Maram (@sanjit2344) and I (@ArjunAshok17), built for the SacHacks 10/15-16/2022 Hackathon.

# Brainstorm #

# Idea #

- An app utilizing machine learning (linear & logistic regression models) to predict the highest risk for fires based on past and present weather patterns

## Plan ##

- We need an interactive app where you can select a date and it will predict the fire risk for that future date (or give the fire risk for the past day vs our prediction for what the fire risk was)
    - Must continuously update the dataset for fire risk data → Stochastic Gradient Descent will help update the model as data comes in
- We need to program a linear regression model (stochastic gradient descent, will reduce learning rate over time)
    - The learning rate shouldn’t decrease too much or else it will not update to trends in climate
    - Weight more recent data (within last year) more heavily than past data to ensure that the model will stay relevant to climate trends
- For the dataset, we can find data for weather pretty easily and then combine that set with another dataset that has the number of fires/area of burning that day (in NORCAL)
    - Again, this dataset must be updated
- The model will rely on numerous weather factors to predict fire risk from the weather that day
    - WILL NOT be predicting the weather ourselves, we just make the connection between the weather and fire risk

## Final Products Needed ##

- Linear/Logistic Regression
    - If we want number of fires we can use linear regression
    - If we want percent chance of fire we can use logistic regression
- App
    - An interface that allows the user to pick a date and it will show the fire risk in a visually pleasing way
    - Dataset will be updated locally on the device with the app whenever it loads it
        - Then the model will run again on the dataset and predict
    
    OR
    
    - Dataset will be updated on the cloud and the model will be run on the cloud, and then the app will simply access the query results from the cloud dataset
- Dataset
    - Can be cloud-based or locally based
    - Cloud is significantly better but cost and complications will arise
    - Locally is easier in some ways, but much worse for the user and less technically impressive

## Roles ##

- Arjun - responsible for model, model training, dataset
- Sanjita - UI/App design w/ Figma, dataset

# Model Notes #

## Overview ##

- Logistic Regression Model to output percent chance of rain given the weather of a certain day
- Will consider the data of the previous year heavily when calculating the prediction, and gauge an overall trend using linear regression to do this year-by-year trend
- Output will be a number called “Fire Threat”, a 0 - 1 output that will fit perfectly with logistic regression models
    - Fire Threat will be 1 if there is a guarantee of a wildfire (higher severity or higher number)
    - Fire Threat will be 0 if there is a guarantee of no wildfire

## Features Considered ##

- Date
    - Get season info from this
- Year
- Weather
    - Temperature (Max)
    - Humidity
    - Air Pressure
    - Wind speeds

## IBM Z-Systems ##
- Environment did not setup, failed to use the cloud service

### ML Presentation ##

[SacHacks_AI-ML_on_LinuxONE_Machine_Learning_Lab_2.pdf](FireWatch%20SacHacks%2010%2015-16%20Brainstorming%206fab63d78f3f4b6ebb05a493965ff259/SacHacks_AI-ML_on_LinuxONE_Machine_Learning_Lab_2.pdf)

# Dataset & Weather Notes #

- Datasets for NorCal, Cal, or region specific areas in Cal will only have monthly data; only day-specific for small cities
    - Use an average of five key cities to find an overall temperature for each region (NorCal, SoCal, Central)
- Try using APIs for the datasets to keep updating dataset
    - Aeris Weather API can track current wildfires, so we can use this to update the dataset continuously after importing old data first
- Use excel to combine and work with the dataset for now, maybe move to a SQL or Cloud based dataset future

# App Notes #

- UI will be a calendar that the user can select a date on to show the predicted percent risk of fire (& the actual number of fires that day if applicable)
