
--SHEET 1 ---- Enrolments by source, centre and enrolment date	
--for 2011

drop table tmp1;

select o.hotel_id as "store_code", m.source_code as "source_code", 
t.start_date,
--year(t.start_date) as year, month(t.start_date)as month, 
count(distinct m.member_no) as count 
into tmp1
from member m, operator o , member_tier t
where m.preferred_consultant = o.operator_id
and m.member_no = t.member_no
and m.member_type <> 'G'
and t.tier_status = 'A'
and year(t.start_date ) = '2011'
group by o.hotel_id, m.source_code,t.start_date
--, year(t.start_date), month(t.start_date)
order by o.hotel_id, m.source_code,t.start_date,
--, year(t.start_date), month(t.start_date);



select * from tmp1 order by 4 desc;

select distinct source_code from tmp1;

--Pivot Table

select a.store_code,a.source_code,a.[Jan_2011],a.[Feb_2011],a.[Mar_2011],a.[Apr_2011]
from
(
select store_code,source_code,[Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011]
from
(
select store_code,source_code,
cast(left(Datename(month,start_date),3) as varchar(25)) +'_'+cast(year(start_date) as varchar(25)) as themonth,
count
from tmp1
)p pivot
(sum(p.count) for themonth in
([Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011])  )AS pvt
)a


--To include all store_code,source_code 

--Refer D:\NISHA\VLCC\ACTIVITY FILE UPLOAD AND MANAGEMENT REPORT\Management Report\Easy Methods for Management Report\SHEET 1_PROFILE--Enrolments by source_centre and enrolment date.txt
--for table tmp_store_source

select b.store,b.source,a.[Jan_2011],a.[Feb_2011],a.[Mar_2011],a.[Apr_2011]
from
(
select store_code,source_code,[Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011]
from
(
select store_code,source_code,
cast(left(Datename(month,start_date),3) as varchar(25)) +'_'+cast(year(start_date) as varchar(25)) as themonth,
count
from tmp1
)p pivot
(sum(p.count) for themonth in
([Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011])  )AS pvt
)a
right outer join tmp_store_source b
on b.store=a.store_code
and b.source=a.source_code;

select count(*) from tmp_store_source;

--40 rows

--For Including Dec 2010 Data


select o.hotel_id as "store_code", m.source_code as "source_code", count(distinct m.member_no) as count 
into tmp2
from member m, operator o , member_tier t
where m.preferred_consultant = o.operator_id
and m.member_no = t.member_no
and m.member_type <> 'G'
and t.tier_status = 'A'
and t.start_date < '01-jan-2011'
group by o.hotel_id, m.source_code
order by o.hotel_id, m.source_code;

drop table tmp2;

select * from tmp2;


select b.store,b.source,
c.count as As_of_Dec10,
a.[Jan_2011],a.[Feb_2011],a.[Mar_2011],a.[Apr_2011]
from
(
select store_code,source_code,[Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011]
from
(
select store_code,source_code,
cast(left(Datename(month,start_date),3) as varchar(25)) +'_'+cast(year(start_date) as varchar(25)) as themonth,
count
from tmp1
)p pivot
(sum(p.count) for themonth in
([Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011])  )AS pvt
)a

right outer join tmp_store_source b
on b.store=a.store_code
and b.source=a.source_code

inner join tmp2 c
on c.store_code=b.store
and c.source_code=b.source;

--correct inner & left outer join query

select b.store,b.source,
c.count as As_of_Dec10,
a.[Jan_2011],a.[Feb_2011],a.[Mar_2011],a.[Apr_2011]
from
tmp_store_source b left outer join
(
select store_code,source_code,[Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011]
from
(
select store_code,source_code,
cast(left(Datename(month,start_date),3) as varchar(25)) +'_'+cast(year(start_date) as varchar(25)) as themonth,
count
from tmp1
)p pivot
(sum(p.count) for themonth in
([Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011])  )AS pvt
)a
on b.store=a.store_code
and b.source=a.source_code
left outer join tmp2 c
on b.store=c.store_code
and b.source=c.source_code
order by b.row_order;


select * from tmp_store_source