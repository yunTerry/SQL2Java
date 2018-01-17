## 根据数据库表输出Java对象属性

### 调用存储过程

运行sql2java.sql，创建存储过程

调用存储过程，传入表名即可输出Java类：
```sql
call sql2java('person');
```

### 循环遍历所有表

设置好数据库名称，运行sql2java_all.sql，调用存储过程，可一次性输出所有表的Java类

### 后期计划

* 支持传入数据库名 

* 支持Python、PHP、go等多语言输出