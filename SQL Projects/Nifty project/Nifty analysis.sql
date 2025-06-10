create database NSEI_NIFTY;
use NSEI_NIFTY;


select * from nifty;


#1What is the total volume traded on all recorded dates?
select sum(Volume) as total_volume from nifty;

#2What is the highest opening price recorded?
select max(Open) as highest_opening_price from nifty;

#3On which date did the NIFTY index reach its highest value?
select date from nifty where Close in (select max(Close) from nifty);

#4What is the lowest closing price recorded?
select min(Close) as lowest_closing_price from nifty;

#5On which date did the NIFTY index reach its lowest value?
select date from nifty where Close in (select min(Close) from nifty);

#6What is the average closing price over the entire dataset period?
select avg(Close) as avg_closing_price from nifty;

#7What is the average volume traded on each recorded date?
select Date,avg(Volume) as avg_volume from nifty group by Date;

#8How many trading days are included in the dataset?
select count(distinct(Date)) as unique_dates from nifty;

#9What is the percentage change in the NIFTY index from the beginning to the end of the dataset period?
select ((max(Close)-min(Close))/min(Close))*100 as percentage_change from nifty;

#10What is the average daily price range (High - Low)?
select avg(high-low) as avg_daily_price_range from nifty;

#11How many times did the NIFTY index close higher than the previous day's close?
select count(*) as higher_close from (select Close,lag(close) over (order by Date) as previous_day_close from nifty) as daily_close where Close>previous_day_close;


#12How many times did the NIFTY index close lower than the previous day's close?
select count(*) as lower_closes from (select Close, lag(Close) over (order by Date) as previous_day_close from nifty) as daily_close where Close<previous_day_close;

#13How many trading days experienced a positive percentage change?
select count(*) as positive_percentage_change_days from(
select(Close-lag(Close) over (order by date))/lag(Close) over(order by Date) as percentage_change from nifty ) as daily_percentage_changes where percentage_change>0;

#14How many trading days experienced a negative percentage change?
select count(*) as negative_percentage_change_days from(
select(Close-lag(Close) over (order by date))/lag(Close) over(order by Date) as neagtive_change from nifty ) as daily_negative_changes where neagtive_change<0;

#15What is the highest volume of trades recorded on a single day?
select max(Volume) as highest_trade_volume from nifty;

#16What is the average closing price for each month?
select year(Date) as year,month(Date) as month,avg(Close) as average_closing_price from nifty group by year (date), month(Date) order by year(Date),month(Date);

#17What is the average daily trading volume for each month?
select year(Date) as year,month(Date) as month,avg(Volume) as average_traded_volume from nifty group by year (date), month(Date) order by year(Date),month(Date);

#18What is the average daily price range for each month?
select year(Date) as year,month(Date) as month,avg(High-Low) as average_price_range from nifty group by year (date), month(Date) order by year(Date),month(Date);

#19How many trading days experienced a price increase of more than 1%?
select count(*) as days_with_price_increase from (
select Date, Close, lag(Close) over (order by Date) as previous_close from nifty) as daily_closes where ((Close - previous_close) / previous_close) * 100 > 1;

#20How many days had no trading activity (zero volume)?
select count(*) as days_with_zero_trading from nifty where volume=0;

#21How many times did the NIFTY index close exactly at its opening price?
select count(*) as closing_at_opening_price from nifty where Close=Open;

#22How many times did the NIFTY index cross a certain threshold (e.g., 10,000 points)?
select count(*) as crosses_threshold from(
select Date,Close,lag(Close) over (order by Date) as previous_close from nifty) as daily_closes where (
previous_close <10000 and Close>=10000) or (previous_close>=10000 and Close<10000);

#23How many days had the highest opening price?
select count(*) as days_highest_opening_price from nifty where open=(
select max(open) from nifty);

#24How many days had the highest closing price?
select count(*) as days_highest_closing_price from nifty where Close=(
select max(Close) from nifty);

#25How many days had the opening price higher than the closing price?
select count(*) as opening_price_higher_than_closing_price from nifty where Open>Close;

#26What is the average opening price?
select avg(Open) as Opening_price from nifty;

#27What is the average high price?
select avg(High) as High_price from nifty;

#28What is the average low price?
select avg(Low) as Low_price from nifty;

#29What is the average volume traded?
select avg(Volume) as Volume_traded from nifty;

#30What is the average closing price?
select avg(Close) as Closing_Price from nifty;

