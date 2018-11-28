-- 不等于的符号<>
SELECT * FROM emp;

-- 1：找出佣金(奖金)高于薪金的员工
SELECT * FROM EMP WHERE IFNULL(comm,0)>sal;

-- 2：找出佣金高于薪金的百分之60的员工
SELECT * FROM EMP WHERE IFNULL(comm,0)>sal*0.6;

-- 3：找出部门10中所有经理(manager)和部门20所有办事员(clerk)的详细资料
SELECT * FROM emp WHERE (deptno = 10 AND job = "manager") OR (deptno=20 AND job="clerk")

-- 4：找出部门10中所有经理(manger)和部门20所有办事员(clerk) 既不是经理也不是办事员但薪金大于等于2000的员工信息
SELECT * FROM emp WHERE (deptno = 10 AND job = "manager") OR (deptno=20 AND job="clerk")
 OR((job<>"manager" AND job<>"clerk") AND sal>=2000)
 
-- 5：找出收取佣金的员工的不同工作
SELECT * FROM emp WHERE comm IS NOT NULL AND comm>0;

-- 6：找出不收取佣金或收取的佣金低于100的员工
SELECT * FROM emp WHERE comm<100 OR comm IS NULL;

-- *********************7：找出各月倒数第三天受雇的所有员工*************************
SELECT * FROM emp WHERE

-- *********************8：找出早于12年前受雇的员工****************
SELECT * FROM emp WHERE DATEDIFF(NOW(),hiredate)>12; 

-- *********************9：以首字母大写的方式显示所有员工*********************
SELECT  CONCAT (UPPER(SUBSTRING(ename,1,1)) , LOWER(SUBSTRING(ename,2,LENGTH(ename)))) AS ename FROM emp;

-- 10：显示正好为5个字符的员工的姓名
-- 法一
SELECT * FROM emp WHERE ename LIKE '_____';

-- 法二 获取ename的字符长度看是否等于5
SELECT * FROM emp WHERE CHAR_LENGTH(ename)=5

SELECT CHAR_LENGTH("ab")

-- 11：显示所有员工姓名的前三个字符
-- substring(str,1,3) 1<=下标<=3
SELECT SUBSTRING(ename,1,3) FROM emp;

-- 12：显示所有员工姓名，用a替换所有"A"
SELECT REPLACE(ename,'A','神') FROM emp;
 
-- 13：显示满10年服务年限的员工的姓名和受雇日期
SELECT ename,hiredate FROM emp WHERE DATEDIFF(NOW(),hiredate)>10

-- 14：显示员工的详细资料，按姓名排序
SELECT * FROM emp ORDER BY ename;

-- 15：显示员工的姓名和受雇日期，根据其服务年限，将最老的员工排在最前面

-- 标准答案
SELECT  ename,hiredate FROM emp ORDER BY hiredate;

-- 利用年份相减函数
SELECT  ename,hiredate FROM emp ORDER BY TIMESTAMPDIFF(YEAR,hiredate,NOW()) DESC;

SELECT  ename,hiredate,TIMESTAMPDIFF(YEAR,hiredate,NOW()) AS 入职时长 FROM emp ORDER BY 入职时长 DESC;

SELECT NOW(),hiredate,TIMESTAMPDIFF(YEAR,hiredate,NOW())FROM emp;

--  (后面的减去前面的)
SELECT TIMESTAMPDIFF(YEAR,hiredate,NOW())

-- 16：显示所有员工姓名，工作和薪金，按工作的降序排序，若工作相同则按薪水排序
-- 	1:两个都降序
SELECT ename,job,sal FROM emp ORDER BY job DESC,sal ASC
--      2:job降序，sal升序
SELECT ename,job,sal FROM emp ORDER BY job,sal DESC

-- 17：显示所有员工的姓名，加入公司的年份和月份，按受雇日期所在月排序，若月份相同，则将最早年份的员工排在最前面
SELECT ename,YEAR(hiredate) AS years,MONTH(hiredate) AS months FROM emp ORDER BY months,years; 

