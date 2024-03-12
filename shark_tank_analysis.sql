SELECT * FROM shark_project.shark_tank_dataset;


		-- Total episodes
SELECT COUNT(DISTINCT Ep_No) FROM shark_project.shark_tank_dataset;
SELECT MAX(Ep_No) FROM shark_project.shark_tank_dataset;


		-- Total pitches
SELECT COUNT(Brand) FROM shark_project.shark_tank_dataset;


		-- Total pitches invested
SELECT COUNT(Amount_Invested_lakhs) FROM shark_project.shark_tank_dataset
WHERE Amount_Invested_lakhs > 0;


		-- Pitches converted 
	-- Using subquery
SELECT COUNT(conv_stat.converted_status) AS funded 
FROM 
	(SELECT Amount_Invested_lakhs,
		CASE WHEN Amount_Invested_lakhs > 0 THEN 'converted'
		ELSE 'not_converted'
		END AS 'converted_status'
	FROM shark_project.shark_tank_dataset) conv_stat
WHERE converted_status = 'converted';

	-- using CTE
WITH conv_stat AS
	(SELECT Amount_Invested_lakhs,
		CASE WHEN Amount_Invested_lakhs > 0 THEN 'converted'
		ELSE 'not_converted'
		END AS 'converted_status'
	FROM shark_project.shark_tank_dataset)  
SELECT COUNT(converted_status) AS funded FROM conv_stat
WHERE converted_status = 'converted';
		

		-- Amount invested per deal
SELECT ROUND(avg(amount_invested_lakhs), 2) FROM shark_project.shark_tank_dataset
WHERE Deal <> "No Deal";
        
        
		-- Total male & female particpants
SELECT SUM(Male) AS Total_Males, SUM(Female) AS Total_Females
FROM shark_project.shark_tank_dataset;
		
		
        -- Gender ratio
SELECT ROUND(SUM(Male)/SUM(Female), 2) AS Male_over_Female, ROUND(SUM(Female)/SUM(Male), 2) AS Female_over_Male
FROM shark_project.shark_tank_dataset;

		
        -- Total amount invested
SELECT SUM(Amount_Invested_lakhs) AS total_amt_invested
FROM shark_project.shark_tank_dataset;
        
        
		-- Total amount invested in percentage
SELECT ROUND(SUM(Amount_Invested_lakhs)/COUNT(Amount_Invested_lakhs), 2) AS total_amt_invested_p
FROM shark_project.shark_tank_dataset;


		-- Highest Deal Taken
SELECT MAX(Amount_Invested_lakhs) FROM shark_project.shark_tank_dataset;


		-- Average equity taken
-- SELECT ROUND(AVG(Equity_Taken), 4) FROM shark_project.shark_tank_dataset;


		-- Highest equity taken
SELECT MAX(Equity_Taken) FROM shark_project.shark_tank_dataset;


		-- Avg team members
SELECT avg(Team_members) FROM shark_project.shark_tank_dataset;


		-- Avg age group of contestants
SELECT Avg_age,COUNT(Avg_age) As total FROM shark_project.shark_tank_dataset
GROUP BY Avg_age
ORDER BY total DESC;


		-- Grouping members according to location 
SELECT Location, COUNT(Location) As total FROM shark_project.shark_tank_dataset
GROUP BY Location
ORDER BY total DESC;


		-- Grouping members according to sectors 
SELECT Sector, COUNT(Sector) As total FROM shark_project.shark_tank_dataset
GROUP BY Sector
ORDER BY total DESC;


		-- Partners deal 
SELECT Partners, COUNT(Partners) As total
FROM shark_project.shark_tank_dataset
WHERE Partners <> "NA" AND Partners <> "-"
GROUP BY Partners
ORDER BY total DESC;


						
			-- investment analysis on sharks
			-- analyisis on Ashneer
(SELECT 'Ashmeer' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Ashmeer' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Ashmeer' as sharks, COUNT(Ashneer_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Ashneer_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Ashmeer' as sharks, COUNT(Ashneer_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Ashneer_Amount_Invested <> "NA" AND Ashneer_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Ashmeer' as sharks, SUM(Ashneer_Amount_Invested) total_amount_invested, ROUND(AVG(Ashneer_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Ashneer_Amount_Invested <> "NA" AND Ashneer_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks)

UNION ALL

			-- analysis on namita
(SELECT 'Namita' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Namita' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Namita' as sharks, COUNT(Namita_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Namita_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Namita' as sharks, COUNT(Namita_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Namita_Amount_Invested <> "NA" AND Namita_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Namita' as sharks, SUM(Namita_Amount_Invested) total_amount_invested, ROUND(AVG(Namita_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Namita_Amount_Invested <> "NA" AND Namita_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks)

UNION ALL

						-- Anupam analysis
(SELECT 'Anupam' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Anupam' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Anupam' as sharks, COUNT(Anupam_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Anupam_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Anupam' as sharks, COUNT(Anupam_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Anupam_Amount_Invested <> "NA" AND Namita_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Anupam' as sharks, SUM(Anupam_Amount_Invested) total_amount_invested, ROUND(AVG(Anupam_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Anupam_Amount_Invested <> "NA" AND Anupam_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks)

UNION ALL

					-- Vineeta analysis
(SELECT 'Vineeta' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Vineeta' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Vineeta' as sharks, COUNT(Vineeta_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Vineeta_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Vineeta' as sharks, COUNT(Vineeta_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Vineeta_Amount_Invested <> "NA" AND Vineeta_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Vineeta' as sharks, SUM(Vineeta_Amount_Invested) total_amount_invested, ROUND(AVG(Vineeta_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Vineeta_Amount_Invested <> "NA" AND Vineeta_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks)

UNION ALL

				-- Aman analysis
(SELECT 'Aman' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Aman' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Aman' as sharks, COUNT(Aman_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Aman_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Aman' as sharks, COUNT(Aman_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Aman_Amount_Invested <> "NA" AND Aman_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Aman' as sharks, SUM(Aman_Amount_Invested) total_amount_invested, ROUND(AVG(Aman_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Aman_Amount_Invested <> "NA" AND Aman_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks)

UNION ALL

				-- peyush analysis
(SELECT 'Peyush' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Peyush' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Peyush' as sharks, COUNT(Peyush_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Peyush_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Peyush' as sharks, COUNT(Peyush_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Peyush_Amount_Invested <> "NA" AND Peyush_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Peyush' as sharks, SUM(Peyush_Amount_Invested) total_amount_invested, ROUND(AVG(Peyush_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Peyush_Amount_Invested <> "NA" AND Peyush_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks)

UNION ALL

				-- Ghazal analysis
(SELECT 'Ghazal' as sharks, tds.total_deals_present, tds.total_deals,sa.avg_equity_taken,sa.total_amount_invested FROM
(
	 SELECT 'Ghazal' as sharks, tdp.total_deals_present, td.total_deals FROM
		(SELECT 'Ghazal' as sharks, COUNT(Ghazal_Amount_Invested) total_deals_present FROM shark_project.shark_tank_dataset
		WHERE Ghazal_Amount_Invested <> "NA") tdp

	INNER JOIN 

		(SELECT 'Ghazal' as sharks, COUNT(Ghazal_Amount_Invested) total_deals FROM shark_project.shark_tank_dataset
		WHERE Ghazal_Amount_Invested <> "NA" AND Ghazal_Amount_Invested <> 0) td

	ON tdp.sharks = td.sharks
) tds

INNER JOIN 
(
	SELECT 'Ghazal' as sharks, SUM(Ghazal_Amount_Invested) total_amount_invested, ROUND(AVG(Ghazal_Equity_Taken), 4) avg_equity_taken FROM shark_project.shark_tank_dataset
	WHERE Ghazal_Amount_Invested <> "NA" AND Ghazal_Amount_Invested <> 0
) sa

ON tds.sharks = sa.sharks);


			-- Ranking startups according to highest amount invested
SELECT r.* FROM
	(SELECT Brand, Sector, Amount_Invested_lakhs, DENSE_RANK()
		OVER(PARTITION BY Sector 
			 ORDER BY Amount_Invested_lakhs DESC) drnk 
	FROM shark_project.shark_tank_dataset) r;         


			-- 	percentage ranking according to highest amount invested
SELECT r.* FROM
	(SELECT Brand, Sector, Amount_Invested_lakhs, PERCENT_RANK()
		OVER(PARTITION BY Sector 
			 ORDER BY Amount_Invested_lakhs DESC) prnk 
	FROM shark_project.shark_tank_dataset) r;         




