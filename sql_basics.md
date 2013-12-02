SQL: Structured Query Language

# Nomenclature
Database = Table  
Columns = Fields  
Rows = Records  

# 6 basic operations: 
Select  
Join  
Filter  
Append/Update  
Aggregate  
Sort


##1 - Select 
- extracts fields  (retrieving data)
<pre>
	SELECT mycolname1, mycolname2 FROM mytable;
	SELECT DISTINCT mycolname1 FROM mytable; (excl. duplication in the selected column)
	SELECT * FROM mytable;			(all columns)
	SELECT * , mycol2*2 FROM mytable;	(doubles val. in mycol2 and appends col.)
	SELECT * , ROUND(mycol2*2, 2) FROM mytable;	(rounds to 2 dec. places)
</pre>

##2 - Join
- combines 2 (or more) data tables based on true/false conditions
<pre>
	SELECT * FROM tb1 JOIN tb2 ON tb1.id = tb2.id;	(join complete tables)
	SELECT tb1.col1, tb2.* JOIN tb2 ON tb1.id = tb2.id;  (join specific column with 2nd table)
</pre>

##3 - Filter
- exclude by true/false conditions (get records that match certain criteria)
<pre>
	SELECT * FROM mytable WHERE mycol2 < 5;		(all records w. mycol2 smaller than 5)
	SELECT * FROM mytable WHERE mycol2 < 5 AND mycol1 = 'exp1';	
	SELECT * FROM mytable WHERE mycol2 < 5 AND (mycol1 = 'exp1' OR mycol = 'exp2');
	SELECT * FROM mytable WHERE mycol2 < 5 AND mycol1 IN ('exp1', 'exp2');
	SELECT id, SUM(col1) FROM tb GROUP BY id;	(sum of col1 for each id group)
	SELECT id, proj, SUM(col1) FROM tb GROUP BY id, proj;
</pre>
	
##4 - Append/Update
- add a new field
<pre>
	ALTER TABLE my_db ADD COLUMN 'new_var' TEXT;
</pre>

- update records or add new records if they don't exist yet
<pre>
	INSERT OR REPLACE INTO my_db (id, my_var1, my_var2) 
  VALUES (  id_val, 
            my_var1_val,
            (SELECT my_var2 FROM my_db WHERE id = id_val)
          );
</pre>
This will set the value for my_var1.<br>   
a) If the id is already in the database, my_var2 will not be changed.<br>
b) If the id is not in the database, my_var2 will set to NULL

<pre>
	INSERT OR REPLACE INTO my_db (id, my_var1, my_var2) 
  VALUES (  id_val, 
            my_var1_val,
            COALESCE((SELECT my_var2 FROM my_db WHERE id = id_val), 'some_default')
          );
</pre>
This will set the value for my_var1.<br>   
a) If the id is already in the database, my_var2 will not be changed.<br>
b) If the id is not in the database, my_var2 will set to "some_default"



##5 - Aggregate
- summarizes records into new records
<pre>
	SELECT SUM(mycol1) FROM mytable;	(returns sum as 1 row)
	SELECT SUM(mycol1), MIN(mycol1), MAX(mycol1), AVG(mycol1) FROM mytable;
	SELECT COUNT(*) FROM mytable;		(returns number of records)
</pre>

##6 - Sort
- orders results by field
<pre>
	SELECT * FROM mytable ORDER BY mycol2 ASC;	(ascending order, DESC for descending)
	SELECT * FROM mytable ORDER BY mycol2 ASC, mycol1 DESC;
	SELECT mycol2 FROM mytable ORDER BY mycol1;	(don't need to select col. to order)
	SELECT mycol2 FROM mytable ORDER BY RANDOM(); (order randomly)
</pre>
	
## Missing Data
- missing data records for particular columns is handled as NULL
<pre>
	SELECT * FROM tb WHERE col2 != 1 OR col2 is NULL;
	SELECT * FROM tb WHERE col2 IS NULL; 	(note that '=' doesn't work)
	SELECT * FROM tb WHERE col2 IS NOT NULL; 
</pre>
