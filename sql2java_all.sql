-- 循环查询，一次性输出所有表结构
drop procedure
if exists sql2java_all;

create procedure sql2java_all ()
begin
	declare
		done boolean default true;

declare
	t_name char (30);

-- 获取数据库所有表名，供游标循环
declare
	cur cursor for select
		table_name
	from
		information_schema. tables
	where
		table_schema = 'db_name';

declare
	continue handler for not found
set done = false;

-- 打开游标
open cur;


while done do
	-- 获取数据
	fetch cur into t_name;

-- 直接调用之前的存储过程
call sql2java (t_name);


end
while;

-- 关闭游标
close cur;


end;