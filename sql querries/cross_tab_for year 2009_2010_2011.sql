
--SHEET 1--> PROFILE-->Enrolments by source, centre and enrolment date
-----------------------------------------------------------------------

--Refer document
--D:\NISHA\VLCC\ACTIVITY FILE UPLOAD AND MANAGEMENT REPORT\Management Report\
--WOL Management Report - January_New 2011 for the result

drop table tmp_store_source;
drop table tmp1;
drop table tmp2;

--Create a temp table for Store code & Source code

create table tmp_store_source
(store varchar(25),
source varchar(25),
row_order integer);



INSERT INTO tmp_store_source(store,source,row_order) values('AAIN','APPLN',1);
INSERT INTO tmp_store_source(store,source,row_order) values('AAIN','AUTEN',2);
INSERT INTO tmp_store_source(store,source,row_order) values('AAIN','WEBENROL',3);


INSERT INTO tmp_store_source(store,source,row_order) values('ABD','APPLN',4);
INSERT INTO tmp_store_source(store,source,row_order) values('ABD','AUTEN',5);
INSERT INTO tmp_store_source(store,source,row_order) values('ABD','MIGTD ',6);
INSERT INTO tmp_store_source(store,source,row_order) values('ABD','PROMO',7);

INSERT INTO tmp_store_source(store,source,row_order) values('AWL','APPLN',8);
INSERT INTO tmp_store_source(store,source,row_order) values('AWL','AUTEN',9);
INSERT INTO tmp_store_source(store,source,row_order) values('AWL','MIGTD',10);
INSERT INTO tmp_store_source(store,source,row_order) values('AWL','PROMO',11);

INSERT INTO tmp_store_source(store,source,row_order) values('DERA','APPLN',12);
INSERT INTO tmp_store_source(store,source,row_order) values('DERA','AUTEN',13);

INSERT INTO tmp_store_source(store,source,row_order) values('MDR','APPLN',14);
INSERT INTO tmp_store_source(store,source,row_order) values('MDR','AUTEN',15);
INSERT INTO tmp_store_source(store,source,row_order) values('MDR','MIGTD',16);

INSERT INTO tmp_store_source(store,source,row_order) values('MRN','APPLN',17);
INSERT INTO tmp_store_source(store,source,row_order) values('MRN','AUTEN',18);
INSERT INTO tmp_store_source(store,source,row_order) values('MRN','MIGTD',19);

INSERT INTO tmp_store_source(store,source,row_order) values('PROMO','APPLN',20);
INSERT INTO tmp_store_source(store,source,row_order) values('PROMO','AUTEN',21);
INSERT INTO tmp_store_source(store,source,row_order) values('PROMO','PROMO',22);

INSERT INTO tmp_store_source(store,source,row_order) values('QSIS','APPLN',23);
INSERT INTO tmp_store_source(store,source,row_order) values('QSIS','AUTEN',24);
INSERT INTO tmp_store_source(store,source,row_order) values('QSIS','MIGTD',25);
INSERT INTO tmp_store_source(store,source,row_order) values('QSIS','WEBENROL',26);


INSERT INTO tmp_store_source(store,source,row_order) values('RAK','APPLN',27);
INSERT INTO tmp_store_source(store,source,row_order) values('RAK','AUTEN',28);

INSERT INTO tmp_store_source(store,source,row_order) values('SHJ','APPLN',29);
INSERT INTO tmp_store_source(store,source,row_order) values('SHJ','AUTEN',30);
INSERT INTO tmp_store_source(store,source,row_order) values('SHJ','MIGTD',31);

INSERT INTO tmp_store_source(store,source,row_order) values('SPN','APPLN',32);
INSERT INTO tmp_store_source(store,source,row_order) values('SPN','AUTEN',33);
INSERT INTO tmp_store_source(store,source,row_order) values('SPN','MIGTD',34);
INSERT INTO tmp_store_source(store,source,row_order) values('SPN','WEBENROL',35);


INSERT INTO tmp_store_source(store,source,row_order) values('SZR','APPLN',36);
INSERT INTO tmp_store_source(store,source,row_order) values('SZR','AUTEN',37);
INSERT INTO tmp_store_source(store,source,row_order) values('SZR','MIGTD',38);


INSERT INTO tmp_store_source(store,source,row_order) values('TMP','APPLN',39);
INSERT INTO tmp_store_source(store,source,row_order) values('TMP','AUTEN',40);


------



--As of Dec 2009

select o.hotel_id as "store_code", m.source_code as "source_code", count(distinct m.member_no) as count 
into tmp1
from member m, operator o , member_tier t
where m.preferred_consultant = o.operator_id
and m.member_no = t.member_no
and m.member_type <> 'G'
and t.tier_status = 'A'
and t.start_date < '01-jan-2010'
group by o.hotel_id, m.source_code
order by o.hotel_id, m.source_code;

--For 2010

select o.hotel_id as "store_code", m.source_code as "source_code", 
t.start_date,
--year(t.start_date) as year, month(t.start_date)as month, 
count(distinct m.member_no) as count 
into tmp2
from member m, operator o , member_tier t
where m.preferred_consultant = o.operator_id
and m.member_no = t.member_no
and m.member_type <> 'G'
and t.tier_status = 'A'
and year(t.start_date ) = '2010'
group by o.hotel_id, m.source_code,t.start_date
--, year(t.start_date), month(t.start_date)
order by o.hotel_id, m.source_code,t.start_date;
--, year(t.start_date), month(t.start_date);

--For 2011

select o.hotel_id as "store_code", m.source_code as "source_code", 
t.start_date,
--year(t.start_date) as year, month(t.start_date)as month, 
count(distinct m.member_no) as count 
into tmp3
from member m, operator o , member_tier t
where m.preferred_consultant = o.operator_id
and m.member_no = t.member_no
and m.member_type <> 'G'
and t.tier_status = 'A'
and year(t.start_date ) = '2011'
group by o.hotel_id, m.source_code,t.start_date
--, year(t.start_date), month(t.start_date)
order by o.hotel_id, m.source_code,t.start_date;
--, year(t.start_date), month(t.start_date);


--FINAL EXTRACT QUERY


select a.store,a.source,
d.count as As_of_Dec09,
b.[Jan_2010],b.[Feb_2010],b.[Mar_2010],b.[Apr_2010],b.[May_2010],b.[Jun_2010],
b.[Jul_2010],b.[Aug_2010],b.[Sep_2010],b.[Oct_2010],b.[Nov_2010],b.[Dec_2010],
c.[Jan_2011],c.[Feb_2011],c.[Mar_2011],c.[Apr_2011]
from
tmp_store_source a left outer join

(
select store_code,source_code,
[Jan_2010],[Feb_2010],[Mar_2010],[Apr_2010],[May_2010],[Jun_2010],[Jul_2010],[Aug_2010],[Sep_2010],[Oct_2010],[Nov_2010],[Dec_2010]
from
(
select store_code,source_code,
cast(left(Datename(month,start_date),3) as varchar(25)) +'_'+cast(year(start_date) as varchar(25)) as themonth,
count
from tmp2
)p pivot
(sum(p.count) for themonth in
(
[Jan_2010],[Feb_2010],[Mar_2010],[Apr_2010],[May_2010],[Jun_2010],[Jul_2010],[Aug_2010],[Sep_2010],[Oct_2010],[Nov_2010],[Dec_2010]
)  )AS pvt
)b
on a.store=b.store_code
and a.source=b.source_code
left outer join
(
select store_code,source_code,[Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011]
from
(
select store_code,source_code,
cast(left(Datename(month,start_date),3) as varchar(25)) +'_'+cast(year(start_date) as varchar(25)) as themonth,
count
from tmp3
)p pivot
(sum(p.count) for themonth in
([Jan_2011],[Feb_2011],[Mar_2011],[Apr_2011])  )AS pvt
)c
on a.store=c.store_code
and a.source=c.source_code
left outer join tmp1 d
on a.store=d.store_code
and a.source=d.source_code
order by a.row_order;





