##Data Cleaning Project: Layoffs Dataset
##Overview
This project focuses on cleaning a dataset related to layoffs that occurred in 2022. The data, sourced from Kaggle, contains important information about companies that conducted layoffs, including the number of employees affected, the industries they belong to, and the geographical locations of these companies. The primary objective is to prepare the dataset for analysis by addressing issues such as duplicates, missing values, and inconsistent formatting.

##Table of Contents
Technologies Used
Dataset
Data Cleaning Steps
Conclusion
##Technologies Used
SQL: For data manipulation and cleaning tasks.
MySQL: The database management system employed for executing SQL queries.
##Dataset
The dataset used for this project is the "Layoffs 2022" dataset available on Kaggle.
Key columns include:
Company
Location
Industry
Total laid off
Percentage laid off
Date
Stage of layoffs
Country
Funds raised in millions
##Data Cleaning Steps
Create a Staging Table: A staging table was established to hold the original data, providing a backup for reference throughout the cleaning process.

Remove Duplicates: The dataset was assessed for duplicate entries, which were identified and subsequently removed to ensure data integrity.

Standardize Data: Variations in entries, particularly in industry names, were standardized to create consistency within the dataset.

Handle Null Values: Missing values in critical fields were reviewed, and decisions were made regarding whether to retain or fill these values based on their significance to future analysis.

Final Cleanup: Unnecessary columns were eliminated from the dataset to streamline the final cleaned version.

##Conclusion
The data cleaning process has enhanced the quality of the layoffs dataset, making it suitable for thorough exploratory analysis. This project underscores the essential role of data cleaning in preparing datasets for reliable analytical insights. 


