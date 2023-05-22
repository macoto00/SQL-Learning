--https://sqlbolt.com/

--// === SELECT ===

Select query for a specific columns
SELECT column, another_column, …
FROM mytable;

Select query for all columns
SELECT *
FROM mytable;

Select query with constraints
SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;

--// === OPERATORS ===

--Operator			    Condition								            	    SQL Example
--=, !=, < <=, >, >=	    Standard numerical operators					            col_name != 4
--BETWEEN … AND …		    Number is within range of two values (inclusive)	    	col_name BETWEEN 1.5 AND 10.5
--NOT BETWEEN … AND …	    Number is not within range of two values (inclusive)		col_name NOT BETWEEN 1 AND 10
--IN (…)			        Number exists in a list							            col_name IN (2, 4, 6)
--NOT IN (…)			    Number does not exist in a list					            col_name NOT IN (1, 3, 5)
--
--Operator			Condition											                    Example
--=				    Case sensitive exact string comparison (notice the single equals)		col_name = "abc"
--!= or <>	    	Case sensitive exact string inequality comparison				        col_name != "abcd"
--LIKE		    	Case insensitive exact string comparison					        	col_name LIKE "ABC"
--NOT LIKE	    	Case insensitive exact string inequality comparison			        	col_name NOT LIKE "ABCD"
--%			    	Used anywhere in a string to match a sequence of zero or more characters (only with LIKE or NOT LIKE)																	col_name LIKE "%AT%"
--(matches "AT", "ATTIC", "CAT" or even "BATS")
--_			    	Used anywhere in a string to match a single character (only with LIKE or NOT LIKE)																				col_name LIKE "AN_"
--(matches "AND", but not "AN")
--IN (…)		    	String exists in a list									                col_name IN ("A", "B", "C")
--NOT IN (…)	    	String does not exist in a list							                col_name NOT IN ("D", "E", "F")

--// === FILTERING ===

Select query with ordered results
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC;

Select query with limited rows
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC
LIMIT num_limit OFFSET num_offset;

--// === INSERT DATA ===

INSERT INTO mytable
VALUES (value_or_expr, another_value_or_expr, …),
       (value_or_expr_2, another_value_or_expr_2, …),
       …;

INSERT INTO mytable
(column, another_column, …)
VALUES (value_or_expr, another_value_or_expr, …),
       (value_or_expr_2, another_value_or_expr_2, …),
       …;

--// === UPDATING ROWS ===

UPDATE mytable
SET column = value_or_expr,
    other_column = another_value_or_expr,
    …
WHERE condition;

--// === DELETING ROWS ===

Delete statement with condition
DELETE FROM mytable
WHERE condition;

--// === CREATE TABLE ===

--Create table statement w/ optional table constraint and default value
CREATE TABLE IF NOT EXISTS mytable (
    column DataType TableConstraint DEFAULT default_value,
    another_column DataType TableConstraint DEFAULT default_value,
    …
);


--Data type	                                        Description
--INTEGER, BOOLEAN	                                The integer datatypes can store whole integer values like the count of a number or an age. In some implementations, the boolean value is just represented as an integer value of just 0 or 1.
--FLOAT, DOUBLE, REAL	                                The floating point datatypes can store more precise numerical data like measurements or fractional values. Different types can be used depending on the floating point precision required for that value.
--CHARACTER(num_chars), VARCHAR(num_chars), TEXT      The text based datatypes can store strings and text in all sorts of locales. The distinction between the various types generally amount to underlaying efficiency of the database when working with these columns.
--
--                                                    Both the CHARACTER and VARCHAR (variable character) types are specified with the max number of characters that they can store (longer values may be truncated), so can be more efficient to store and query with big tables.
--
--DATE, DATETIME	                                    SQL can also store date and time stamps to keep track of time series and event data. They can be tricky to work with especially when manipulating data across timezones.
--BLOB	                                            Finally, SQL can store binary data in blobs right in the database. These values are often opaque to the database, so you usually have to store them with the right metadata to requery them.

------

--Constraint	            Description
--PRIMARY KEY	            This means that the values in this column are unique, and each value can be used to identify a single row in this table.
--AUTOINCREMENT	        For integer values, this means that the value is automatically filled in and incremented with each row insertion. Not supported in all databases.
--UNIQUE	                This means that the values in this column have to be unique, so you can't insert another row with the same value in this column as another row in the table. Differs from the `PRIMARY KEY` in that it doesn't have to be a key for a row in the table.
--NOT NULL	            This means that the inserted value can not be `NULL`.
--CHECK (expression)	    This allows you to run a more complex expression to test whether the values inserted are valid. For example, you can check that values are positive, or greater than a specific size, or start with a certain prefix, etc.
--FOREIGN KEY	            This is a consistency check which ensures that each value in this column corresponds to another value in a column in another table.
--
--                        For example, if there are two tables, one listing all Employees by ID, and another listing their payroll information, the `FOREIGN KEY` can ensure that every row in the payroll table corresponds to a valid employee in the master Employee list.

--Movies table schema
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER,
    length_minutes INTEGER
);

