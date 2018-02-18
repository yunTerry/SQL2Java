drop procedure
if exists sql2java;

-- 以表名为输入参数，输出对应的java对象属性
create procedure sql2java (in t_name char(30))
begin
	select
		concat(
			'public  ',
			case
		when data_type in ('varchar', 'char', 'text') then
			'String'
		when data_type in (
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
		else
			'类型不确定'
		end,
		' ',
		column_name,
		';     //',
		column_comment
		) as java
	from
		information_schema. columns
	where
		table_name = t_name;


end;