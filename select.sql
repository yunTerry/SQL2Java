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
		'smallint',
		'bigint'
	) THEN
		'int'
	WHEN data_type IN ('integer', 'id') THEN
		'long'
	WHEN data_type IN ('bit', 'boolean') THEN
		'boolean'
	WHEN data_type IN ('float') THEN
		'float'
	WHEN data_type IN ('double') THEN
		'double'
	WHEN data_type IN ('blob') THEN
		'byte[]'
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