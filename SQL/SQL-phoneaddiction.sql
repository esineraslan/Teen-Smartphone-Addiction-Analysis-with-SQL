--Names and ages of teens who use their phones more than 10 hours per day.
select Name, age
from phone_addiction
where Daily_Usage_Hours > 10

--Names and academic performance of students with an academic performance above 85.
select Name , Academic_Performance
from phone_addiction
where Academic_Performance > 85

--Names and weekend usage hours of the top 5 teens with the highest weekend usage.
select top 5
Name, Weekend_Usage_Hours
from phone_addiction
order by Weekend_Usage_Hours desc

--Names of teens who spend more than 2 hours on social media but less than 1 hour on gaming.
select name
from phone_addiction
where Time_on_Social_Media > 2 and Time_on_Gaming < 1

--Names and sleep hours of teens who sleep less than 35 hours.
select Name, Sleep_Hours
from phone_addiction
where Sleep_Hours < 35

--Names and phone check counts of the top 10 teens who check their phones the most.
select top 10
Name, phone_checks_per_day
from phone_addiction
order by phone_checks_per_day desc

--Names and addiction levels of teens whose addiction level is above 80.
select Name,Addiction_Level
from phone_addiction
where Addiction_Level > 80

--Names of students with both academic performance above 80 and addiction level above 8
select Name, Academic_Performance, Addiction_Level
from phone_addiction
where Academic_Performance > 80 and Addiction_Level > 8

--Show the average daily usage hours per gender, sorted from highest to lowest
select Gender, avg(Daily_Usage_Hours) as avg_daily
from phone_addiction
group by Gender
order by avg_daily desc

--Top 5 teens with the most phone checks among those who sleep less than 40 hours.
select top 5
Name, Phone_Checks_Per_Day
from phone_addiction
where Sleep_Hours < 40
order by Phone_Checks_Per_Day desc

select * from phone_addiction
-- Names, ages, and daily usage hours of teens whose daily usage is above their age group’s average.
select Name, Age, Daily_Usage_Hours
from phone_addiction d
where Daily_Usage_Hours > (
	select avg(Daily_Usage_Hours)
	from phone_addiction
	where Age = d.Age)

-- The student with the highest number of daily apps used for each school grade, along with the count and school grade.
select School_grade, Name, Apps_Used_Daily
from ( select School_grade, Name, Apps_Used_Daily, 
		rank() over(partition by school_grade
		order by apps_used_daily desc) as rank
		from phone_addiction ) t
		where rank = 1






