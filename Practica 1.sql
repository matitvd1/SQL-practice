update clientes
set Sexo = 'Femenino'
where ID = 2

insert into clientes (ID, Nombre, Apellido, Sexo, Fecha_Nacimiento) values
 (5, 'Alejandro', 'Enzo', 'Masculino', '1996-04-20')
 
 alter table clientes
 add Ingresos INT
 
 select * 
 from clientes 
 where Sexo = 'Masculino'
 
 update clientes 
 set Fecha_Nacimiento = '1955-06-02'
 where ID = 3
 
select Ingresos 
from clientes
where Nombre = 'Matias'

insert into clientes
values (6, 'Javier', 'Rocha', 32, 'Masculino', '1990-02-27', 20000)

select  * from clientes
where Edad < 20 or Edad > 30

select * from clientes
where Edad not between 20 and 30

select count(distinct Nombre), avg(Ingresos)
from clientes
where Sexo = 'Masculino'

select count(Ingresos) from clientes 
where Sexo = 'Masculino'

select distinct Sexo from clientes

insert into clientes (ID, Nombre, Apellido, Edad, Fecha_Nacimiento, Ingresos)
values (7,'Matias', 'Pedri', 30, '1990-01-11', 14000)

update clientes
set Sexo = 'Masculino'
where ID = 7

select Nombre, avg(Ingresos) as Income
from clientes
where Sexo = 'Masculino'
group by Nombre
having Income >= 10000

insert into clientes (ID, Nombre, Apellido, Sexo, Fecha_Nacimiento)
values (8,'Martin', 'Pedri', 'Masculino', '1996-08-01')

update Clientes
set Edad = 25, Ingresos = 10000
where ID = 8

select Sexo, avg(Ingresos) as Promedio
from Clientes
where Sexo = 'Femenino'
group by Sexo

select Nombre, Apellido, Ingresos
from Clientes
having Ingresos > 5000

alter table Clientes
add Hijos int

select Nombre, Apellido, Ingresos
from Clientes
where Nombre like '%o'

select Nombre, Apellido
from clientes
where Fecha_Nacimiento between '1994-01-01' and '1996-12-31'

select Apellido, Ingresos
from clientes
order by Ingresos desc
limit 5

select Nombre, Apellido, max(Ingresos) as Maximo
from clientes
where Sexo = 'Masculino'
group by ID
order by Maximo desc
limit 1

select count(distinct ID) as 'Numeros ID'
from Clientes

select Nombre, Apellido, Ingresos,
case when Ingresos < 10000 then 'Junior'
	 when Ingresos between 10000 and 15000 then 'Intermedio'
     when Ingresos > 15000 then 'Veterano'
end as Categoria
from clientes

update clientes
set Hijos = 0 
where Edad <= 25

alter table clientes
drop Fecha_Nacimiento

select * from Clientes

update clientes 
set Hijos =0
where ID = 1

select Hijos,avg(Ingresos) as promedio
from clientes
where Hijos > 1
group by Hijos

select count(ID) 
from clientes
where Hijos = 3
group by Hijos

select Hijos, avg(Edad) as promedio
from clientes
where Hijos >= 2 and Sexo = 'Masculino'
group by Hijos

select * from clientes

select ingresos, to_char(ingresos, '$9,999.99')
from clientes

