/*
Question: Ad Campaign ROAS - Google
URL: https://datalemur.com/questions/ad-campaign-roas

Description:
Calculate the Return on Ad Spend (ROAS) for each advertiser.
ROAS = Total Revenue / Total Spend. Round ROAS to 2 decimal places and sort by advertiser_id.

Table: ad_campaigns (campaign_id, spend, revenue, advertiser_id)
*/

SELECT
    advertiser_id,
    ROUND(SUM(revenue::NUMERIC) / SUM(spend::NUMERIC), 2) AS ROAS
FROM
    ad_campaigns
GROUP BY
    advertiser_id
ORDER BY
    advertiser_id;

/*
Explanation:
1. Groups by dvertiser_id.
2. Sums total revenue and total spend.
3. Computes ROUND(CAST(SUM(revenue) AS DECIMAL) / SUM(spend), 2) AS roas.
4. Orders by dvertiser_id ASC.
*/