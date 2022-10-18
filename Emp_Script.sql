Use Emp;

select * from Emp

--exe LoginAuthentication 'ABC','ABC123'
create proc LoginAuthentication
@name varchar(20),
@pass Varchar(20)
as
begin
declare @userid Varchar(20)
if exists (select 1 from emp where name=@name and Password=@pass and active=1)
begin
select @userid=id from emp where name=@name and Password=@pass and active=1
select @userid as id
end
else
begin
select '' as id
end
end


--exec Registration 'ABC','abc123'
alter Proc Registration
@name varchar(20),
@pass Varchar(20)
as
begin
begin try
begin transaction
if exists (select 1 from emp where name=@name and Password=@pass)
begin
update emp set active=1 where name=@name and Password=@pass;
select 0 as id;
end
else
begin
insert into emp(name,Password,active)values(@name,@pass,1);
select 1 as id;
end
commit transaction
end try
begin catch
Rollback Transaction
select ERROR_MESSAGE();
end catch
end

--create empmaster
create table empmaster(id int identity primary key, Empname varchar(20),EmpAdd varchar(20),Empdob varchar(30), active int, createdate datetime default getdate())
select * from empmaster
create proc MSP_Addemployee
@empname varchar(20),
@Empadd varchar(20),
@empdob varchar(30),
@userid int
as
begin
begin try
begin transaction
insert into empmaster(Empname,EmpAdd,Empdob)values(@empname,@Empadd,@empdob)
commit transaction
end try
begin catch
Rollback transaction
declare @err varchar(max)
set @err=(select ERROR_MESSAGE());
exec MSP_Errorsp @err,@userid
end catch
end


--Error Table
create table tblemperror(id int identity, Error_msg varchar(max),create_date datetime default getdate(), flag int default 0, Userid int);
select * from tblemperror

create proc MSP_Errorsp
(
@errormsg varchar(max),
@Userid int
)
as
begin
begin try
insert into tblemperror(Error_msg,Userid)values(@errormsg,@Userid);
end try
begin catch
select ERROR_MESSAGE();
end catch
end
