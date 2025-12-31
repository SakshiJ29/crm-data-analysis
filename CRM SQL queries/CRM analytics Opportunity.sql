SELECT * FROM supply_chain.`opportuninty table`;

-- Total Opportunities --
Select	count(*) as Total_opportunities
FROM supply_chain.`opportuninty table`;

-- Expected Amount --
Select sum(ExpectedAmount) as total_expected_amount
FROM supply_chain.`opportuninty table`;

-- Active Opportunities --
select count(*) as Active_opportunities
FROM supply_chain.`opportuninty table`
where Closed = FALSE;

-- Closed won --
select count(*) as Closed_won
FROM supply_chain.`opportuninty table`
where Closed =true and Won = true;

-- Expected Amount by Opportunity Type --
select OpportunityType ,
sum(ExpectedAmount) as ExpectedAmount
FROM supply_chain.`opportuninty table`
group by OpportunityType;

-- Opportunities by Industry --
select Industry,
count(*) as Opportunities
FROM supply_chain.`opportuninty table`
group by Industry
order by Opportunities desc;

-- Conversion rate --
select(sum (case when Closed =true and Won = true then 1 else 0 end)*100)/count(*) as conversion_rate
FROM supply_chain.`opportuninty table`;

-- Expected vs forecast --
SELECT 
    FiscalYear,
    SUM(ExpectedAmount) AS total_expected_amount,
    SUM(CASE WHEN ForecastQCommit = 'commit' THEN Amount ELSE 0 END) AS total_forecast_commit
FROM supply_chain.`opportuninty table`
GROUP BY FiscalYear
ORDER BY FiscalYear;










