
drop table tmp_homephne;

select flyer_id, international_code, area_code, contact_number,type  
into tmp_homephne
 from member_contact_numbers e where type in ('BPH', 'HPH') ;

-------------------------------------

--Query 1

delete from tmp_homephne
WHERE 
(international_code IS NULL AND area_code IS NULL AND contact_number IS NULL)
or
(international_code IS NULL AND area_code IS NULL AND len(dbo.udf_getnumeric(contact_number))<=7)
or international_code = '91'
or (international_code NOT LIKE '%966%' AND international_code IS NOT NULL )
or (
international_code  LIKE '%966%' AND AREA_CODE LIKE '5%' AND len(dbo.udf_getnumeric(AREA_CODE)) <=2
)
or (
international_code  LIKE '%966%' AND AREA_CODE LIKE '05' AND len(dbo.udf_getnumeric(AREA_CODE)) <=2
)
or
(
international_code  LIKE '966' AND AREA_CODE IS NULL AND CONTACT_NUMBER LIKE '5%'
)or
(
international_code  LIKE '00966' AND AREA_CODE IS NULL AND CONTACT_NUMBER LIKE '5%')
or
(international_code  LIKE '9665' AND AREA_CODE IS NULL AND CONTACT_NUMBER LIKE '5%')
or
(
international_code  LIKE '0966' AND AREA_CODE IS NULL AND CONTACT_NUMBER LIKE '5%')
or
(
international_code  LIKE '%966' AND AREA_CODE IS NULL AND CONTACT_NUMBER LIKE '05%')
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '05%')
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '5%')
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '96605%')
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '9665%')
or
(
international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' and dbo.udf_getnumeric(contact_number) like '9660%'
and substring(dbo.udf_getnumeric(contact_number),5,1) in (1,2,3,4,6,7,8,9)
and  charindex('X',contact_number) = 0
and len(dbo.udf_getnumeric(contact_number))>13
)
or
(
international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '9660%'
and substring(dbo.udf_getnumeric(contact_number),5,1) in (1,2,3,4,6,7,8,9)
and  charindex('X',contact_number) > 0 
and len(dbo.udf_getnumeric(substring(contact_number,1,charindex('X',contact_number)-1)))<12
)
or
(
international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and charindex('X',CONTACT_NUMBER)=0
and len(dbo.udf_getnumeric(contact_number))<>11
)
or
(
international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and charindex('X',CONTACT_NUMBER)>0
and charindex('-',right(substring(contact_number,1,charindex('X',contact_number)-1),7))>0
)
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '009665%')
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '0096605%')
or
(
international_code is null and AREA_CODE is null and CONTACT_NUMBER like '009660%')
or
(international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)=0 
and len(dbo.udf_getnumeric(contact_number))>13)
or
(
international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)>0 
and substring(dbo.udf_getnumeric(contact_number),6,1)=5
)
or
(
international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)>0 
and charindex('-',CONTACT_NUMBER)>0
)
or
(
international_code is null and AREA_CODE is null 
and dbo.udf_getnumeric(contact_number) like '0%'
and charindex('X',contact_number)=0
and len(dbo.udf_getnumeric(contact_number))=8)
or
(
international_code is null and AREA_CODE is null 
and dbo.udf_getnumeric(contact_number) like '0%'
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '%966%'
and len(dbo.udf_getnumeric(contact_number))<>9
)
or
(
international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '%966%'
and len(dbo.udf_getnumeric(contact_number))<>8
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '00966%'
and len(dbo.udf_getnumeric(contact_number))<>13
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '09660%'
and len(dbo.udf_getnumeric(contact_number))<>13
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '0966%'
and len(dbo.udf_getnumeric(contact_number))<>12
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(dbo.udf_getnumeric(contact_number))<>8
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)>0
and charindex('-',contact_number)=0
and dbo.udf_getnumeric(contact_number) like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('X',contact_number)-1))<>9
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)>0
and charindex('-',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('X',contact_number)-1))<>8
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number) not like '0%'
and len(
dbo.udf_getnumeric(
replace
(contact_number,
substring(contact_number,charindex('x',contact_number),(len(contact_number))),
''
))
)<>8
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number)  like '000%'
)
or
(
international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number)  like '0%'
and len(
dbo.udf_getnumeric(
replace
(contact_number,
substring(contact_number,charindex('x',contact_number),(len(contact_number))),
''
))
)<>9
)
or
(
international_code is null
and area_code like '%966'
and len(dbo.udf_getnumeric(contact_number))<>9
)
or
(
international_code is not null and area_code is null 
and contact_number is null
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code='966' and contact_number like '5%'
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code='966' and contact_number like '05%'
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code like '5%'
)
or
(
contact_number like '00000%' and len(dbo.udf_getnumeric(area_code))<8
)
or
(
contact_number like '0000%' and len(dbo.udf_getnumeric(area_code))=9
and area_code not like '000%'
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and contact_number=area_code
and len(dbo.udf_getnumeric(area_code))<8
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and area_code like '%966'
and  len(dbo.udf_getnumeric(contact_number)) not in(8,9)
and contact_number not like '%966%'
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and area_code like '%966'
and  len(dbo.udf_getnumeric(contact_number)) not in(13,14,11,12)
and contact_number  like '%966%'
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and area_code like '%966'
and contact_number  like '%966%'
and contact_number  like '00966%'
)
or
(
len(dbo.udf_getnumeric(area_code))>2 and area_code like '5%')
or
(
len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(area_code)) + len(dbo.udf_getnumeric(contact_number))<8
)
or
(
len(dbo.udf_getnumeric(area_code))>2
and dbo.udf_getnumeric(area_code) like '%966%' and dbo.udf_getnumeric(contact_number) not like '%966%'
and dbo.udf_getnumeric(area_code) like '%966'
and contact_number not like '0%'
and len(dbo.udf_getnumeric(contact_number))<>8
);

select count(*) from tmp_homephne;

--1364616

alter table tmp_homephne add flag int null;

Update tmp_homephne
set flag =1
where international_code = '966'
and len(area_code)=1
and len(contact_number)=7;

--616248 rows

Update tmp_homephne
set flag =1
where international_code = '0966'
and len(area_code)=1
and len(contact_number)=7;

--144 rows

Update tmp_homephne
set flag =1
where international_code = '00966'
and len(area_code)=1
and len(contact_number)=7;

--6770 rows

Update tmp_homephne
set flag =1
where international_code = '966'
and len(area_code)=2 and area_code like '0%'
and len(contact_number)=7;

--325212 rows

select * from tmp_homephne where flag is null;

--416242

tmp_homephne where flag = 1 has valid phone.move others to another temp table

select * from tmp_homephne where flag is null;

---Update Queries

select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '9660%' and  charindex('X',contact_number) > 0;

--0 rows


update tmp_homephne
set international_code='966',
area_code=right(substring(contact_number,1,5),2),
contact_number=substring(contact_number,6,7)
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '9660%' and  charindex('X',contact_number) > 0;

----

select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '9660%'
and substring(dbo.udf_getnumeric(contact_number),5,1) in (1,2,3,4,6,7,8,9)
and  charindex('X',contact_number) = 0--2

--0 rows

update tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),5,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),6,7)
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '9660%'
and substring(dbo.udf_getnumeric(contact_number),5,1) in (1,2,3,4,6,7,8,9)
and  charindex('X',contact_number) = 0--2

------
select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '9660%'
and substring(dbo.udf_getnumeric(contact_number),5,1) in (1,2,3,4,6,7,8,9);

--0 rows


update tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),5,1),
contact_number=right(substring(contact_number,1,charindex('X',contact_number)-1),7)
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and dbo.udf_getnumeric(contact_number) like '9660%'
and substring(dbo.udf_getnumeric(contact_number),5,1) in (1,2,3,4,6,7,8,9);

----------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and charindex('X',CONTACT_NUMBER)=0;

--0 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),4,1) ,
contact_number=right(dbo.udf_getnumeric(contact_number),7)
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and charindex('X',CONTACT_NUMBER)=0;

-----------
select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and charindex('X',CONTACT_NUMBER)>0;

--0 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),4,1) ,
contact_number=right(substring(contact_number,1,charindex('X',contact_number)-1),7)
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '966%' 
and charindex('X',CONTACT_NUMBER)>0;

------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)=0 ;

--0 rows


update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),6,1),
contact_number=right(dbo.udf_getnumeric(contact_number),7) 
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)=0 ;

--------------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)>0 ;

--0 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),6,1),
contact_number=right(substring(contact_number,1,charindex('X',contact_number)-1),7)
where international_code is null and AREA_CODE is null
and CONTACT_NUMBER like '00966%'
and charindex('X',CONTACT_NUMBER)>0 ;
-------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null 
and dbo.udf_getnumeric(contact_number) like '0%'
and charindex('X',contact_number)=0
and len(dbo.udf_getnumeric(contact_number))=9

--0 rows


update  tmp_homephne
set international_code='966',
area_code=left(contact_number,2),
contact_number=right(contact_number,7) 
where international_code is null and AREA_CODE is null 
and dbo.udf_getnumeric(contact_number) like '0%'
and charindex('X',contact_number)=0
and len(dbo.udf_getnumeric(contact_number))=9;

-----------
select * from tmp_homephne
where international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '%966%'
and len(dbo.udf_getnumeric(contact_number))=8;

--218128 rows
--if all flyer_ids in address table with campany = 'SV'


update  tmp_homephne
set international_code='966',
area_code=left(dbo.udf_getnumeric(contact_number),1) ,
contact_number=right(dbo.udf_getnumeric(contact_number),7) 
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '%966%'
and len(dbo.udf_getnumeric(contact_number))=8;

--------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '009660%'
and len(dbo.udf_getnumeric(contact_number))=14;


--0 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),7,1),
contact_number=right(dbo.udf_getnumeric(contact_number),7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '009660%'
and len(dbo.udf_getnumeric(contact_number))=14;

----------
select * from tmp_homephne
where international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '00966%'
and len(dbo.udf_getnumeric(contact_number))=13;

--0 rows


update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),6,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),7,7)
where international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '00966%'
and len(dbo.udf_getnumeric(contact_number))=13;

-------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '09660%'
and len(dbo.udf_getnumeric(contact_number))=13;

--0 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),6,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),7,7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '09660%'
and len(dbo.udf_getnumeric(contact_number))=13;

--------------------

select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '0966%'
and len(dbo.udf_getnumeric(contact_number))=12;

--0 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),5,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),6,7) 
where international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
and dbo.udf_getnumeric(contact_number)  like '0966%'
and len(dbo.udf_getnumeric(contact_number))=12;
----------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(dbo.udf_getnumeric(contact_number))=8;

--218949 rows
--if all flyer_ids in address table with campany = 'SV',execute below query

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),1,1) ,
contact_number=substring(dbo.udf_getnumeric(contact_number),2,7) 
where international_code is null and AREA_CODE is null 
and charindex('X',contact_number)=0
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(dbo.udf_getnumeric(contact_number))=8;
----------------

select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)>0
and charindex('-',contact_number)=0
and dbo.udf_getnumeric(contact_number) like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('X',contact_number)-1))=9;

--1375 rows
--if all flyer_ids in address table with campany = 'SV',execute below query

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),2,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),3,7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)>0
and charindex('-',contact_number)=0
and dbo.udf_getnumeric(contact_number) like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('X',contact_number)-1))=9;

-------------------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)>0
and charindex('-',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('X',contact_number)-1))=8;

--1337 rows
--if all flyer_ids in address table with campany = 'SV',execute below query



update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),1,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),2,7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('X',contact_number)>0
and charindex('-',contact_number)=0
and dbo.udf_getnumeric(contact_number) not like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('X',contact_number)-1))=8;

------------------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number) not like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('x',contact_number)-1))=9;

--6787 rows
--if all flyer_ids in address table with campany = 'SV',execute below query


update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),1,1),
contact_number=substring(dbo.udf_getnumeric(contact_number),2,7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number) not like '0%'
--and dbo.udf_getnumeric(contact_number)  like '%966%'
and len(substring(dbo.udf_getnumeric(contact_number),1,charindex('x',contact_number)-1))=9;

-----------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number) not like '0%';

--30144 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),1,1),
contact_number=substring(
dbo.udf_getnumeric(
replace
(contact_number,
substring(contact_number,charindex('x',contact_number),(len(contact_number))),
''
)),2,7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number) not like '0%';

------------------
select * from tmp_homephne
where international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number)  like '0%';

--2662 rows

update  tmp_homephne
set international_code='966',
area_code=substring(dbo.udf_getnumeric(contact_number),2,1),
contact_number=substring(
dbo.udf_getnumeric(
replace
(contact_number,
substring(contact_number,charindex('x',contact_number),(len(contact_number))),
''
)),3,7)
where international_code is null and AREA_CODE is null --22927 rows
and charindex('x',contact_number)>0
and charindex('-',contact_number)>0
and dbo.udf_getnumeric(contact_number)  like '0%';

---------------------
select * from tmp_homephne
where international_code is null--
and area_code = '966'
and len(dbo.udf_getnumeric(contact_number))=9;


update  tmp_homephne
set international_code='966',
area_code=left(contact_number,2),
contact_number=right(contact_number,7),
--flag = 1
where international_code is null--
and area_code = '966'
and len(dbo.udf_getnumeric(contact_number))=9;

--33 rows updated

--------
select * from tmp_homephne
where international_code is null--
and area_code = '966'
and len(dbo.udf_getnumeric(contact_number))=8;

--0 rows

update  tmp_homephne
set international_code='966',
area_code=left(contact_number,1),
contact_number=right(contact_number,7)
where international_code is null--
and area_code = '966'
and len(dbo.udf_getnumeric(contact_number))=8;

--------------
select * from tmp_homephne
where international_code is null
and area_code = '00966'
and len(dbo.udf_getnumeric(contact_number))=9;



update  tmp_homephne
set international_code='966',
area_code=left(contact_number,2),
contact_number=right(contact_number,7),
--flag = 1
where international_code is null
and area_code = '00966'
and len(dbo.udf_getnumeric(contact_number))=9;

--17 rows updated

-----------
select * from tmp_homephne
where international_code is null
and area_code = '00966'
and len(dbo.udf_getnumeric(contact_number))=8;

update  tmp_homephne
set international_code='966',
area_code=left(contact_number,1),
contact_number=right(contact_number,7)
where international_code is null
and area_code = '00966'
and len(dbo.udf_getnumeric(contact_number))=8;

-----------------
select * from tmp_homephne
where international_code is null
and area_code like '%966'
and len(dbo.udf_getnumeric(contact_number))=9;

--4 rows


update tmp_homephne
set international_code='966',
area_code='04',contact_number='4227087',
flag = 1
where international_code is null
and area_code like '%966'
and len(dbo.udf_getnumeric(contact_number))=9;

--4 rows updated

-----------------
select * from tmp_homephne
where international_code is null
and area_code like '%966%'
and len(dbo.udf_getnumeric(contact_number))=7;

--19 rows

update tmp_homephne
set international_code='966',
area_code=right(area_code,1),
--flag = 1
where international_code is null
and area_code like '%966%'
and len(dbo.udf_getnumeric(contact_number))=7;

--19 rows updated

------------
select * from tmp_homephne
where international_code is not null and area_code is not null 
and contact_number is null
and len(dbo.udf_getnumeric(area_code))=8;


update tmp_homephne
set area_code=left(area_code,1),
contact_number=right(area_code,7),
--flag = 1
where international_code is not null and area_code is not null 
and contact_number is null
and len(dbo.udf_getnumeric(area_code))=8;

--13 rows updated

-------------
select * from tmp_homephne
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code='966'  and contact_number not like '0%'
and len(dbo.udf_getnumeric(contact_number))=8;



update tmp_homephne
set area_code=left(contact_number,1),
contact_number=right(contact_number,7),
--flag = 1
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code='966'  and contact_number not like '0%'
and len(dbo.udf_getnumeric(contact_number))=8;

--316 rows updated

---------
select * from tmp_homephne
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code='966'  and contact_number like '0%'
and len(dbo.udf_getnumeric(contact_number))=9;



update tmp_homephne
set area_code=left(contact_number,2),
contact_number=right(contact_number,7),
flag = 1
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code='966'  and contact_number like '0%'
and len(dbo.udf_getnumeric(contact_number))=9;

--914 rows updated

--------
select * from tmp_homephne
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code=contact_number
and contact_number like '0%'
and len(dbo.udf_getnumeric(contact_number))=9;


update tmp_homephne
set area_code=left(contact_number,2),
contact_number=right(contact_number,7),
flag = 1
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code=contact_number
and contact_number like '0%'
and len(dbo.udf_getnumeric(contact_number))=9;

--322 rows updated
--------

SELECT flyer_id, international_code, area_code,
contact_number,
left(contact_number,1) area,
right(contact_number,7)cntct_new
FROM tmp_homephne
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code=contact_number
and len(dbo.udf_getnumeric(contact_number))=8;


update tmp_homephne
set area_code=left(contact_number,1),
contact_number=right(contact_number,7),
flag = 1
where len(dbo.udf_getnumeric(area_code))>2
and len(dbo.udf_getnumeric(contact_number))>7
and area_code=contact_number
and len(dbo.udf_getnumeric(contact_number))=8;

--136 rows updated

-----

select * from tmp_homephne
where flag is null
and len(dbo.udf_getnumeric(international_code))= 3
and len(dbo.udf_getnumeric(area_code))=1 and area_code is not null
and len(dbo.udf_getnumeric(contact_number))=7;

--1459 rows

Update tmp_homephne
set flag = 1
where flag is null
and len(dbo.udf_getnumeric(international_code))= 3
and len(dbo.udf_getnumeric(area_code))=1 and area_code is not null
and len(dbo.udf_getnumeric(contact_number))=7;

--1459 rows updated

-------------------

select * from tmp_homephne
where flag is null
and len(dbo.udf_getnumeric(international_code))= 3
and len(dbo.udf_getnumeric(area_code))=2 and area_code like '0%'
and area_code not like '%0'
and len(dbo.udf_getnumeric(contact_number))=7;

--815 rows

Update tmp_homephne
set international_code = '966',
area_code = 
























