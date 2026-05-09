/*
  Create a table events (id, event_name, event_date).​
2. Insert events with different dates.​
3. Use NOW() to display current date & time.​
4. Format event_date using DATE_FORMAT().​
5. Extract YEAR and MONTH from event_date.​
6. Use CONCAT() to combine event_name and event_date. F 
*/

use salesandservices;
-- create table events --

create table events  (
   id int primary key,
   event_name varchar(20),
   event_date date 
   );
   
   -- insert --
   insert into events (id,event_name,event_date)values
   (1,'wedding', '2026-04-15'),
   (2,'birthday', '2026-04-16'),
   (3,'wedding', '2026-04-15');
   
   select * from events;
   
   -- use now() --
   select now() as current_date_time;
   
   -- format the date --
   select 
     id,
     event_date,
     date_format(event_date, '%d-%m-%y') as formatted_date from events;
     
     -- extract year and month --
     select 
       id,
       event_date,
	    year(event_date) AS event_year,
       month(event_date) as event_month from events;
       
       -- use concat() --
       select 
         concat(event_name , '-',event_date) as event_details from events;
       