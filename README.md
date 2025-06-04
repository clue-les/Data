# 🧹 Data Cleaning Project: Layoffs Dataset

## 📌 Overview  
This project focuses on cleaning a dataset related to layoffs that occurred in 2022. The data, sourced from Kaggle, contains important information about companies that conducted layoffs, including the number of employees affected, the industries they belong to, and the geographical locations of these companies.  

The **primary objective** is to prepare the dataset for analysis by addressing:
- Duplicate rows  
- Missing values  
- Inconsistent formatting  

---

## 📑 Table of Contents  
- [Technologies Used](#technologies-used)  
- [Dataset](#dataset)  
- [Data Cleaning Steps](#data-cleaning-steps)  
- [Conclusion](#conclusion)  

---

## 🛠️ Technologies Used  
- **SQL**: For data manipulation and cleaning tasks  
- **MySQL**: The database management system used for executing SQL queries  

---

## 📂 Dataset  
The dataset used for this project is the **"Layoffs 2022"** dataset available on [Kaggle](https://www.kaggle.com/datasets).  

### Key Columns:
- `Company`  
- `Location`  
- `Industry`  
- `Total laid off`  
- `Percentage laid off`  
- `Date`  
- `Stage of layoffs`  
- `Country`  
- `Funds raised in millions`  

---

## 🔍 Data Cleaning Steps

### ✅ 1. Create a Staging Table  
A **staging table** was created to store the original raw data as a backup.

### ✅ 2. Remove Duplicates  
Checked and removed **duplicate records** to ensure data uniqueness.

### ✅ 3. Standardize Data  
Corrected **inconsistencies in text** fields such as industry names for uniformity.

### ✅ 4. Handle Null Values  
Analyzed missing values and:
- Removed rows where critical data was missing  
- Filled or kept nulls based on the importance of the column  

### ✅ 5. Final Cleanup  
Dropped unnecessary columns to keep only the fields needed for analysis.

---

## ✅ Conclusion  
The data cleaning process significantly improved the quality and consistency of the dataset, making it ready for **exploratory data analysis** and **visualization**. This project highlights the crucial role of **data preprocessing** in ensuring reliable and insightful results in any data-driven task.

---


