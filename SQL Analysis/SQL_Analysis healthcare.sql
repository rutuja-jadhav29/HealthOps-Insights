/*

Problem Statement : Hospitals face increasing challenges in optimizing patient care while managing operational costs and resources effectively. 
Key areas of concern include hospital bed allocation, billing discrepancies, managing critical resources such as blood supply, and ensuring 
efficient staff performance. With the diverse needs of urgent, elective, and emergency cases, hospital administrators require a comprehensive 
data-driven approach to optimize patient stay durations, streamline billing practices, manage inventory for essential medications, and evaluate 
the performance of healthcare providers.

Goal : The goal of this project is to use SQL to analyze patient data, providing actionable insights to improve hospital stay management, 
optimize billing processes, manage blood supply efficiently, and evaluate the performance of doctors and hospitals.

Key Findings : 
Patient Stay Durations: Majority of patients stayed between 1-30 days, with the highest at 21 days, aiding hospital capacity management.

Billing Practices: Cigna had the highest minimum bill, Blue Cross had the highest maximum, and some negative bills indicated overpayments.

Blood Donors and Receivers: A balanced number of universal blood donors (O-) and receivers (AB+) supports blood supply management.

Medical Conditions and Billing: Obesity, diabetes, and hypertension were the top billing contributors, with obesity-related treatments being the most costly.

Preferred Insurance Providers: Cigna led in hospital admissions, followed by Medicare and UnitedHealthcare.

Medication Trends: Chronic conditions like arthritis and diabetes increased demand for Aspirin, Paracetamol, and Ibuprofen.

Hospital Preferences: Large hospitals like Smith and Johnson had strong patient preferences, while smaller hospitals might need growth strategies.

Billing Variability: Significant billing variations were found in some hospitals, raising consistency concerns.

Doctor Performance: Top-performing doctors treated the most patients and had high average billing, often linked to specialized treatments.

*/
Use healthcare;

-- Viewing Data on Database
SELECT * FROM patient_records;
 
-- 1.What is the overall distribution of the number of days patients spend in the hospital across all hospitals?
SELECT 
    DATEDIFF(Discharge_Date, Date_of_Admission) AS total_days,
    COUNT(*) AS count,
    RPAD('', COUNT(*) / 50, '#') AS bar
FROM
    patient_records
GROUP BY total_days
ORDER BY total_days;
    
    

-- 2.Find the average, minimum, and maximum billing amount for each insurance provider.
SELECT 
    Insurance_Provider,
    ROUND(AVG(Billing_Amount), 2) AS Avg_Bill_Amount,
    ROUND(MIN(Billing_Amount), 2) AS Min_Bill_Amount,
    ROUND(MAX(Billing_Amount), 2) AS Max_Bill_Amount
FROM
    patient_records
GROUP BY Insurance_Provider;


-- 3.Calculate the number of Universal Blood Donors (O-) and Universal Blood Receivers (AB+) in the dataset.
SELECT 
    SUM(CASE
        WHEN Blood_Type = 'O-' THEN 1
        ELSE 0
    END) AS Universal_Blood_Donor,
    SUM(CASE
        WHEN Blood_Type = 'AB+' THEN 1
        ELSE 0
    END) AS Universal_Blood_Receiver
FROM

    patient_records;

-- 4.Find the average billing amount by medical condition across all hospitals.
SELECT 
    Medical_Condition,
    ROUND(AVG(Billing_Amount), 2) AS Avg_Billing_Amount
FROM
    patient_records
GROUP BY Medical_Condition;

-- 5.Identify the most preferred insurance provider by patients hospitalized, ranked by the number of admissions.
SELECT 
    Insurance_Provider, 
    COUNT(*) AS Total_Admissions,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS Admission_Rank
FROM 
    patient_records
GROUP BY 
    Insurance_Provider
ORDER BY 
    Total_Admissions DESC;
    
-- 6.Find the rank and maximum number of medications prescribed to patients based on their medical condition.
SELECT 
    Medical_Condition, 
    COUNT(Medication) AS Total_Medications,
    RANK() OVER (ORDER BY COUNT(Medication) DESC) AS Medication_Rank
FROM 
    patient_records
GROUP BY 
    Medical_Condition
ORDER BY 
    Total_Medications DESC;


-- 7.Finding Rank & Maximum number of medicines recommended to patients based on Medical Condition pertaining to them.   
SELECT 
	Medical_Condition, 
    Medication, 
	COUNT(medication) as Total_Medications_to_Patients, 
	RANK() OVER(PARTITION BY Medical_Condition ORDER BY 
		COUNT(medication) DESC) as Rank_Medicine
FROM patient_records
GROUP BY 1,2
ORDER BY 1;

-- 8.Finding out most preffered Hospital 
SELECT 
    Hospital, COUNT(hospital) AS Total
FROM
    patient_records
GROUP BY Hospital
ORDER BY Total DESC;

-- 9.Identify hospitals with a significant variation in billing amounts by calculating the standard deviation of billing amounts per hospital.
SELECT 
    Hospital,
    ROUND(STDDEV(Billing_Amount), 2) AS Billing_Std_Dev
FROM
    patient_records
GROUP BY Hospital
ORDER BY Billing_Std_Dev DESC;

-- 10 Using a CTE, calculate the top 5 doctors based on the number of patients they treated, ranked by the average billing amount per patient.
    WITH DoctorBilling AS (
    SELECT 
        Doctor,
        COUNT(*) AS Total_Patients,
        AVG(Billing_Amount) AS Avg_Billing_Per_Patient
    FROM 
        patient_records
    GROUP BY 
        Doctor
)
SELECT 
    Doctor, 
    Total_Patients, 
    Avg_Billing_Per_Patient
FROM 
    DoctorBilling
ORDER BY 
    Avg_Billing_Per_Patient DESC
LIMIT 5;






-- Selecting required fields only (removed columns: Name, Age, Medical Condition, Room_No, Medication, Test_Results)
-- and creating new calculated columns for Tableau dashboard visualization
-- Age_Bucket: Categorizes Age into groups for easier segmentation and analysis of age-related trends
-- Length_of_Stay: Calculates the total number of days a patient stayed in the hospital based on admission and discharge dates
-- Type_of_Bill: Classifies billing amounts into 'Normal' or 'Refund' based on whether the amount is positive or negative
-- Risk_Category: Segments patients into different risk categories (High, Medium, Low) based on their medical condition and test results

SELECT 
-- Categorizing Age into buckets for easier analysis
    CASE                                               
        WHEN Age BETWEEN 10 AND 19 THEN '10-19 years'
        WHEN Age BETWEEN 20 AND 29 THEN '20-29 years'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39 years'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49 years'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59 years'
        WHEN Age BETWEEN 60 AND 69 THEN '60-69 years'
        WHEN Age BETWEEN 70 AND 79 THEN '70-79 years'
        WHEN Age BETWEEN 80 AND 89 THEN '80-89 years'
        ELSE 'Unknown'
    END AS Age_Bucket,
    Gender,
    Blood_Type,
    Date_of_Admission,
    Discharge_Date,
    -- Calculating length of stay in the hospital
    DATEDIFF(Discharge_Date, Date_of_Admission) AS Length_of_Stay,  
    Doctor,
    Hospital,
    Insurance_Provider,
    Billing_Amount,
     -- Classifying Billing Amount into types, either 'Refund' if negative, or 'Normal' if positive
    CASE                                           
        WHEN Billing_Amount < 0 THEN 'Refund'
        ELSE 'Normal'
    END AS Type_of_Bill,
    Admission_Type,
     -- Categorizing patients into different risk levels based on medical condition and test results
    CASE                                            
        WHEN
            Medical_Condition IN ('Cancer' , 'Diabetes')
                AND Test_Results = 'Abnormal'
        THEN
            'High Risk - Needs Immediate Attention'
        WHEN
            Medical_Condition IN ('Obesity' , 'Asthma')
                AND Test_Results IN ('Abnormal' , 'Inconclusive')
        THEN
            'Medium Risk - Further Checks Required'
        WHEN Test_Results = 'Normal' THEN 'Low Risk - Can be Discharged, Follow Up Required'
        WHEN Test_Results = 'Inconclusive' THEN 'Need More Checks / CANNOT be Discharged'
        ELSE 'Low Risk - General Monitoring'
    END AS Risk_Category
FROM
    patient_records;
    




    
    
    
    




