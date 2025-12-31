SELECT * FROM supply_chain.`lead table`;

-- Total Leads -- 
select count(*) as TotalLeads
FROM supply_chain.`lead table`;

-- Converted Accounts --
select sum(ConvertedAccounts) as converted_accounts
FROM supply_chain.`lead table`;

-- Converted Opportinities --
Select sum(ConvertedOpportunities) as Converted_opportunities
FROM supply_chain.`lead table`;

-- Lead By Source --
select LeadSource,
count(*) as Total_lead
FROM supply_chain.`lead table`
group by LeadSource;

-- Lead by Industry --
Select Industry,
count(*) as Total_lead
FROM supply_chain.`lead table`
group by Industry;

-- Lead by Stage --
select stage,
count(*) as Total_lead
FROM supply_chain.`lead table`
join supply_chain.`opportuninty table`
on OpportunityID=ConvertedOpportunityID
group by Stage;

-- Expected Amount --
select sum(ExpectedAmount) as total_expected_amount
from supply_chain.`opportuninty table`
inner	join supply_chain.`lead table`on OpportunityID=ConvertedOpportunityID;

-- Conversion Rate --
SELECT 
    CONCAT(ROUND(SUM(ConversionRate) / COUNT(*), 2), '%') AS conversion_percentage
FROM supply_chain.`lead table`;





