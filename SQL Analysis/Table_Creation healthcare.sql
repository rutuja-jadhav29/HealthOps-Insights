USE healthcare;

-- Creating the table 'patient_records' to store patient data in the healthcare system
CREATE TABLE patient_records (
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Blood_Type VARCHAR(3),
    Medical_Condition VARCHAR(50),
    Date_of_Admission DATE,
    Doctor VARCHAR(100),
    Hospital VARCHAR(100),
    Insurance_Provider VARCHAR(50),
    Billing_Amount DECIMAL(15, 4),
    Room_Number INT,
    Admission_Type VARCHAR(20),
    Discharge_Date DATE,
    Medication VARCHAR(50),
    Test_Results VARCHAR(50)
);



