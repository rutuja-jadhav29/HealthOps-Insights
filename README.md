# HealthOps-Insights: Data-Driven Decision Making in Healthcare

This project analyzes data from 2019 to May 2024 across multiple hospitals to provide critical insights into hospital operations, patient care, and financial management. The goal is to assist healthcare providers and administrators in making data-driven decisions that enhance efficiency, optimize resources, and improve patient care.

**Interactive Dashboard :** https://public.tableau.com/app/profile/rutuja.jadhav4875/viz/HealthcareSystemDashboard_17388746992120/FinanceDashboard

:star: **Key Areas of Analysis:**

:black_medium_small_square: **Patient Stay Duration:**

Evaluated patient stay lengths to improve capacity management for both short- and long-term care.

:black_medium_small_square: **Billing Practices by Insurance Providers:**

Analyzed billing trends and discrepancies to optimize costs across different insurance providers.

:black_medium_small_square: **Blood Supply Management:**

Insights into donor and receiver distributions to ensure efficient blood transfusions during emergencies.

:black_medium_small_square: **Doctor Performance:**

Assessed doctors’ patient counts and billing contributions, identifying top performers and workload distribution.

:black_medium_small_square: **Medication Trends:**

Analyzed the most commonly prescribed medications for various medical conditions to guide pharmacy inventory management.

:star: **Tools & Technologies Used:**

 **Data Cleaning & Preparation:** Excel was used to inspect and clean the data for accurate analysis.

 **SQL:** SQL queries were used to answer business questions and prepare the data for visualization.

**Visualization:** Tableau dashboards were created to provide dynamic, visual insights into patient admissions, finances, and hospital operations.

:star: **Dataset:**
The project utilized a Kaggle dataset containing 55,501 patient records from multiple hospitals, covering hospital stay durations, billing details, insurance providers, and medical conditions.

:star: **Key Insights & Recommendations:**

**Financial & Insurance Insights:**

<img width="1254" alt="Screenshot 2025-02-19 at 11 48 57 AM" src="https://github.com/user-attachments/assets/9ce3e396-cf3d-4a0c-a226-83b421a887eb" />

:small_blue_diamond:Total billing across hospitals reached $1.40B, with an average billing per patient of $25.54K.

:small_blue_diamond: Medicare had the highest average billing per patient at $25.63K.

:small_blue_diamond: Middle-aged patients (30-49 years) contributed the most to overall
hospital revenue, indicating higher healthcare expenditures in this age group.

:small_blue_diamond: Admissions were evenly distributed across elective, urgent, and emergency cases.

**Patient Insights:**

<img width="1261" alt="Screenshot 2025-02-19 at 11 49 10 AM" src="https://github.com/user-attachments/assets/8baccf10-9aef-4c1c-b55a-138680fd3a48" />

:small_blue_diamond: Low-risk patients accounted for $467M in billing, highlighting the importance of frequent checkups for revenue generation.

:small_blue_diamond: Admissions peaked in 2020, with a gradual decline in 2024.

:small_blue_diamond: Patients aged 50-59 and 30-39 had the highest admission rates, indicating critical age groups for hospital planning.

**Hospital & Doctor Insights:**

<img width="1250" alt="Screenshot 2025-02-19 at 11 49 20 AM" src="https://github.com/user-attachments/assets/8ac88ee1-2f1d-4f0d-a250-96943d5d398b" />

:small_blue_diamond: LLC Smith hospital led in overall billing, while Michael Smith was the top-performing doctor with $201K billed for high-risk patients.

:small_blue_diamond: Average length of stay varied between doctors, with elective cases having shorter stays than urgent or emergency cases.

**Medication & Condition Insights:**

:small_blue_diamond: Arthritis ranked highest in medication demand, with 9,218 prescriptions recorded.

:small_blue_diamond:Aspirin, Paracetamol, and Ibuprofen were the most commonly prescribed medications.

**Blood Supply Management:**

:small_blue_diamond: There were 6,804 universal donors (O-) and 6,882 universal receivers (AB+), ensuring a balanced blood supply.

:small_blue_diamond: A stored procedure, Blood_Matcher, was created to prioritize donor-receiver matches within the same hospital for faster transfusions.

:star: **Recommendations:**

:radio_button: Focus preventive care initiatives on high-revenue age groups (30-49 years) to enhance outcomes and reduce long-term healthcare costs.

:radio_button: Prioritize early intervention for conditions like obesity and diabetes to reduce costly treatments.

:radio_button: Strengthen blood bank management by optimizing cross-hospital donor-matching systems.

:radio_button: Recognize top-performing doctors and expand their services to increase patient retention.

:radio_button: Investigate billing declines in 2024 and adjust financial strategies to recapture potential lost revenue.

:radio_button: Optimize pharmacy inventory for high-demand medications and negotiate supplier deals to control costs.

:star: **Assumptions & Caveats:**

:radio_button: The data reflects records only up to May 2024, so trends may change as new data is added.

:radio_button: Duplicate billing records were removed to ensure accurate financial analysis.

:radio_button: Billing amounts were categorized into "Normal" and "Refund" to differentiate transactions.


