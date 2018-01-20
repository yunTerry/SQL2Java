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
			'smallint',
			'bigint'
		) then
			'int'
		when data_type in ('integer', 'id') then
			'long'
		when data_type in ('bit', 'boolean') then
			'boolean'
		when data_type in ('float') then
			'float'
		when data_type in ('double') then
			'double'
		when data_type in ('blob') then
			'byte[]'
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