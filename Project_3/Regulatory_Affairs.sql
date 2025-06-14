# Display the table;
select * from regulatory_affairs_data;
# Top 5 Cities with most accidents;
select Cities, sum(COUNT) as total_accidents from regulatory_affairs_data 
where Outcome_of_Incident = "Total number of Accidents" group by Cities
order by total_accidents desc limit 5;
# Total number of accidents in 2020;
select sum(COUNT) as total_accidents from regulatory_affairs_data 
where Outcome_of_Incident = "Total number of Accidents";
# Accident distribution across city;
select Cities, sum(COUNT) as total_accidents from regulatory_affairs_data 
where Outcome_of_Incident = "Total number of Accidents" group by Cities;
# Most common causes of accidents;
select cause_category, sum(COUNT) as total_accidents from regulatory_affairs_data 
where Outcome_of_Incident = "Total number of Accidents" group by cause_category
order by total_accidents desc;
# Total number of injured peoples by cause of accident;
select cause_category, sum(COUNT) as total_injured from regulatory_affairs_data 
where Outcome_of_Incident = "Total Injured" group by cause_category;
# Total deaths in accidents;
select sum(COUNT) as total_deaths from regulatory_affairs_data 
where Outcome_of_Incident = "Persons Killed";
# Let's see accidents of top 5 Cities and its Cause;
select Distinct Cities, cause_category, sum(COUNT) as total_accidents from regulatory_affairs_data 
where Outcome_of_Incident = "Total number of Accidents" group by Cities,
cause_category order by total_accidents desc; 
# Total Accidents due to Weather;
select sum(COUNT) as total_accidents_weather from regulatory_affairs_data 
where cause_category = "Weather";
# Accidents at Junctions and it's factors(cause_subcategory);
select cause_subcategory, sum(COUNT) as total_accidents from regulatory_affairs_data
where cause_category = "Junction" group by cause_subcategory
order by total_accidents desc;
# Impact of Weather on Accidents and number of deaths;
select cause_subcategory, sum(COUNT) as total_deaths from regulatory_affairs_data
where cause_category = "Weather" and Outcome_of_Incident = "Persons Killed" 
group by cause_subcategory
order by total_deaths desc;
# Total Accidents at junctions;
select sum(COUNT) as total_accidents from regulatory_affairs_data
where cause_category = "Junction";
# Accidents on the Junction and number of deaths;
select cause_subcategory, sum(COUNT) as total_deaths_on_junction from regulatory_affairs_data
where cause_category = "Junction" and Outcome_of_Incident = "Persons Killed" 
group by cause_subcategory
order by total_deaths_on_junction desc;
# Impact of Road Features on Accidents and number of deaths;
select cause_subcategory, sum(COUNT) as total_deaths_on_road from regulatory_affairs_data
where cause_category = "Road Features" and Outcome_of_Incident = "Persons Killed" 
group by cause_subcategory
order by total_deaths_on_road desc;
# Impact of junctions on Accidents and number of Injuries;
select cause_subcategory, sum(COUNT) as total_injuries_on_junction from regulatory_affairs_data
where cause_category = "Junction" and Outcome_of_Incident = "Total Injured" 
group by cause_subcategory
order by total_injuries_on_junction desc;
# Impact of Road Features on Acciodents;
select cause_subcategory, sum(COUNT) as total_accidents_by_road from regulatory_affairs_data
where cause_category = "Road Features" group by cause_subcategory
order by total_accidents_by_road desc;
# Impact of Road Features on Accidents and number of injuries;
select cause_subcategory, sum(COUNT) as total_injuries_by_road from regulatory_affairs_data
where cause_category = "Road Features" and Outcome_of_Incident = "Total Injured"  
group by cause_subcategory
order by total_injuries_by_road desc;
# Let's see most severe accidents which led fatalities;
select cause_subcategory, COUNT(Count) as total_accidents,
SUM(CASE WHEN Outcome_of_Incident = "Persons Killed" THEN 1 ELSE 0 END) as total_fatalities
from regulatory_affairs_data group by cause_subcategory order by total_fatalities desc;
# Let's see top 5 Fatalities by Cities; 
select Cities, sum(COUNT) as Total_fatalities from regulatory_affairs_data
where Outcome_of_Incident = "Persons Killed" 
group by Cities order by Total_fatalities desc 
limit 5;
# Let's compare Fatalities with total number of accidents;
select count(COUNT) as total_accidents,
SUM(CASE WHEN Outcome_of_Incident = "Persons Killed" 
THEN 1 ELSE 0 END) as total_fatalities 
from regulatory_affairs_data;
# Which Vehiches were specifically involved in accidents;
select cause_subcategory, sum(COUNT) as accident_count
from regulatory_affairs_data where cause_category = "Impacting Vehicle/Object"
group by cause_subcategory order by accident_count desc;
# Multiple causes like (Road Features + Traffic Violation);
select cause_category, count(COUNT) as total_accidents from regulatory_affairs_data
where cause_category like "%Traffic Violation%" OR cause_category like "%Road Features%"
group by cause_category order by total_accidents desc;
# Accidents involving pedestrians and their death;
select count(COUNT) as total_accidents,
sum(CASE WHEN cause_subcategory = "Pedestrian" and Outcome_of_Incident = "Persons Killed" 
THEN 1 ELSE 0 END) as total_fatalities from regulatory_affairs_data
order by total_fatalities desc;
# Accidents due to traffic violations;
select cause_subcategory, sum(COUNT) as total_accidents 
from regulatory_affairs_data where cause_category = "Traffic Violation"
group by cause_subcategory order by total_accidents desc;
# Seasonal Impact on accidents;
select cause_subcategory, sum(COUNT) as accident_count 
from regulatory_affairs_data where cause_category = "Weather"
group by cause_subcategory order by accident_count desc; 

