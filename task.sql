CREATE DATABASE task;

USE task;


SELECT * FROM insurance_data;



SELECT * FROM insurance_data WHERE region='southwest' AND gender='male';


SELECT * FROM insurance_data WHERE age>=30 AND age <=45;


SELECT MIN(bloodpressure) as 'MinBp',max(bloodpressure) as'Maxbp' FROM insurance_data WHERE diabetic='Yes' AND smoker='Yes' ;



SELECT COUNT(DISTINCT(PatientID)) as 'UNIQUE_Count'FROM insurance_data WHERE region !='southwest';

SELECT ROUND(SUM(claim),2) as'total_amount' FROM insurance_data WHERE gender='male' AND smoker='Yes';


SELECT * FROM insurance_data WHERE region='southwest';
-- alternate query
SELECT * FROM insurance_data WHERE region LIKE 'south%';


SELECT COUNT(PatientID) AS 'number_of_patients' FROM insurance_data WHERE bloodpressure>=90 AND bloodpressure<=100;


	SELECT ROUND(AVG(claim),2) as 'Claim_amount' FROM insurance_data WHERE smoker='No' AND gender='female';


UPDATE insurance_data SET claim=500  WHERE PatientID=1234;





SET SQL_SAFE_UPDATES = 0;

UPDATE insurance_data SET claim=500  WHERE PatientID=1234;

SET SQL_SAFE_UPDATES = 1;

SELECT claim , PatientID FROM insurance_data WHERE PatientID=1234;


SELECT COUNT(PatientID) as 'Number_Of_Patients' FROM insurance_data WHERE age<17 AND bloodpressure>=80+(age * 2) AND bloodpressure<=100 + (age  * 2);



USE task;


SELECT * FROM sleep;


SELECT AVG(`Sleep duration`) AS 'sleep_duration'  FROM sleep WHERE `Sleep duration` >=7.5 and gender='male'  ORDER BY `Sleep duration` DESC LIMIT 15;



SELECT gender , ROUND(AVG(`Sleep duration` * `Deep sleep percentage`),2) AS 'Deep Sleep Time 'FROM sleep GROUP BY gender;





SELECT `Exercise frequency`,`Smoking status` ,
	AVG(`Sleep duration`*(`Deep sleep percentage`/100)) AS'deep sleep',
    AVG(`Sleep duration`*(`REM sleep percentage`/100)) AS 'rem sleep',
    AVG(`Sleep duration`*(`Light sleep percentage`/100)) AS 'light sleep' 
    FROM sleep GROUP BY`Exercise frequency`,`Smoking status`;
    
    
    SELECT AVG(`Sleep duration`*(`Deep sleep percentage`/100)) AS'deep sleep'
		FROM sleep WHERE `Exercise frequency`  >=3
		GROUP BY `Awakenings` ORDER BY `Awakenings` DESC;
        
        
        
SELECT age FROM sleep WHERE `Deep sleep percentage`>=25 AND `Deep sleep percentage` <=45 
	ORDER BY `Light sleep percentage`
    DESC LIMIT 10,30;

USE task;
SELECT * FROM power;


SELECT 	COUNT(*) AS 'occurances', AVG(`Monitored Cap.(MW)`) AS 'avg_capacity'FROM power 
 GROUP BY `Power Station` HAVING avg_capacity>=1000 AND avg_capacity<=2000 AND occurances<200 ORDER BY avg_capacity ASC;

SELECT * FROM cost_undergrad;



SELECT COUNT(*) AS 'occurances' 
FROM cost_undergrad WHERE Year IN(2013,2017,2021) AND Type='Public In-State' 
GROUP BY state  HAVING occurances>=6 AND occurances<=10  
 ORDER BY occurances ASC LIMIT 10;
 
 
 
 SELECT State, AVG(value) FROM cost_undergrad WHERE  Type='Public In-State'  GROUP BY State ORDER BY AVG(value) DESC LIMIT 1;


 SELECT State, AVG(value) FROM cost_undergrad WHERE  Type LIKE '%Private%' AND Year=2021  GROUP BY State ORDER BY AVG(value) DESC LIMIT 1,1;


USE task;


SELECT * FROM shipping_ecommerce;




SELECT  ROUND(AVG(Discount_offered),2) AS 'Discount', SUM(Discount_offered) AS 'Total_Discount' 
	FROM shipping_ecommerce
	WHERE Gender='M' AND Product_importance='high' 
    GROUP BY Mode_of_Shipment,Warehouse_block 
    ORDER BY Mode_of_Shipment DESC,Warehouse_block ASC;
