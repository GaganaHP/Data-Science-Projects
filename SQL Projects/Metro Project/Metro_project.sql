create database if not exists metro;
use metro;

select * from delhi_metro_network;

alter table delhi_metro_network rename column `Station ID` to station_id;
alter table delhi_metro_network rename column `Station Name` to station_name;
alter table delhi_metro_network rename column `Distance from Start (km)` to distance;
alter table delhi_metro_network rename column Line to line;
alter table delhi_metro_network rename column `Opening Date` to opening_date;
alter table delhi_metro_network rename column `Station Layout` to station_layout;
alter table delhi_metro_network rename column Latitude to latitude;
alter table delhi_metro_network rename column Longitude to longitude;

select * from delhi_metro_network;

# 1. List all underground stations.

select * from delhi_metro_network
where station_layout = 'Underground';


# 2. Show all stations on the Blue line opened before 2010.

select * from  delhi_metro_network
where line = 'Blue line' and opening_date < 2010-01-01;


# 3. Find the 5 stations farthest from the starting point.

select station_name, distance
from delhi_metro_network
order by distance desc
limit 5;


# 4. How many stations exist on each metro line?
select line, count(*) as total_stations from delhi_metro_network
group by line
order by total_stations;


# 5. Find stations that include “Noida” in their names.
select * from delhi_metro_network
where station_name like '%Noida%';


# 6. Find stations that opened between 2015 and 2019.
select * from delhi_metro_network
where opening_date between '2015-01-01' and '2019-12-31';


# 7. List all distinct station layouts used.
select distinct station_layout from delhi_metro_network;


# 8. Find the average distance of stations on the Red line.
select round(avg(distance),2) as avg_distance from delhi_metro_network
where line = 'Red line';


# 9. Which stations have the same coordinates?
select latitude, longitude, count(*) as station_count 
from delhi_metro_network
group by latitude, longitude
having station_count > 1;


# 10. Find the newest station on each line.
SELECT *
FROM delhi_metro_network AS d
WHERE opening_date = (
    SELECT MAX(opening_date)
    FROM delhi_metro_network AS sub
    WHERE sub.line = d.line
);
