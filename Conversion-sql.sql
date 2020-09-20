-- Create database
USE Defaultersdb;


-- RETRIEVE ALL FROM DB
-- SELECT [Estimated_Connected_Load] FROM [bye] 
----------------------------- Byepassers table --------------------
-- REMOVE NON NUMBERS
UPDATE [byepassers]
SET [Estimated_Connected_Load] = '0'
WHERE CONVERT(varchar, [Estimated_Connected_Load]) = '#DIV/0!'
/*
-- CONVERT NULL TO ZERO
UPDATE [byepassers]
SET [Estimated_Connected_Load] = '0'
WHERE [Estimated_Connected_Load] LIKE 'NULL'
*/


/*
SELECT SUM(CAST(CAST([Estimated_Connected_Load] AS varchar) AS float))
FROM [byepassers]
*/

-- Alter table to the right datatype
-- to var char
ALTER TABLE [byepassers]
ALTER COLUMN Estimated_Connected_Load varchar(255) 

-- to float
ALTER TABLE [byepassers]
ALTER COLUMN Estimated_connected_Load float

-------------------------non byepassers table--------------------

UPDATE [Nonbyepassers]
SET [Estimated_Connected_Load] = '0'
WHERE CONVERT(varchar, [Estimated_Connected_Load]) = '#DIV/0!'

-- Alter table to the right datatype
ALTER TABLE [Nonbyepassers]
ALTER COLUMN Estimated_Connected_Load varchar(255) 


ALTER TABLE [Nonbyepassers]
ALTER COLUMN Estimated_connected_Load float


/*
-- Unite the entire db
SELECT * FROM [byepassers]
UNION ALL
SELECT * FROM [Nonbyepassers]
*/