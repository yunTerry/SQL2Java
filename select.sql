SELECT
	concat(
		'public  ',
		CASE
	WHEN data_type IN ('varchar', 'char', 'text') THEN
		'String'
	WHEN data_type IN (
		'int',
		'tinyint',
		'mediumint',
		'smallint'
	) THEN
		'Integer'
	WHEN data_type IN ('bigint') THEN
		'Long'
	when data_type in ('datetime') then
		'Date'
	WHEN data_type IN ('bit', 'boolean') THEN
		'Boolean'
	WHEN data_type IN ('float') THEN
		'Float'
	WHEN data_type IN ('double') THEN
		'Double'
	WHEN data_type IN ('blob') THEN
		'Byte[]'
	ELSE
		'类型不确定'
	END,
	'  ',
	column_name,
	';     //',
	column_comment
	) AS java
FROM
	information_schema. COLUMNS
WHERE
	table_name = "person";