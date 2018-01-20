## 关系数据库表转Java对象

### 调用存储过程

运行sql2java.sql，创建存储过程

调用存储过程，传入表名即可输出Java对象属性列表：
```sql
call sql2java('person');
```

### 循环遍历所有表

设置好数据库名称，运行sql2java_all.sql，创建存储过程

调用存储过程，可一次性输出所有表的Java类：

```sql
call sql2java_all;
```

### 后期计划

* 支持传入数据库名 

* 支持Python、PHP、C++、go 等多语言输出

* 支持输出Protobuf 的DSL代码