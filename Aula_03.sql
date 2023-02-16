select * from employees;

create table teste (
    identificador int,
    nome varchar2(30),
    valor number(10,2),
    primary key (identificador)
    );
    
    insert into teste values (1, 'Felipe', 10.5);
    
    insert into teste (identificador, nome, valor) values (2, null, null);
    insert into teste (nome, valor, identificador) values ('Maria', 4.6, 3);
    insert into teste (nome, identificador) values ('Pedro', 4);
    
    insert into teste select employee_id, first_name, salary from employees;
    
    --Retorna todos os campos e todas as linhas de uma tabela
    select * from teste;
    
    
    delete from teste where identificador = 100;
    
    delete from teste where identificador > 100 and identificador < 150 and valor > 5000;
    
    update teste 
    set valor = 30
    where identificador = 100;
    
    --Reetorna nome, sobrenome e sal�rio de todos os funcion�rios
    select first_name, last_name, salary from employees;
    
    --Retorna valores renomeando campo
    select first_name as nome, last_name as sobrenome, salary as salario from employees;
    
    --Renomeando o campo e colocando express�es
    select 100 as n�mero, 'Abacaxi' as texto, first_name as nome, last_name as sobrenome,
    salary as salario, salary * 1.10 as aumento,(salary * 1.10) - salary as dif from employees;
    
    --Colocando condi��es
    select * from employees
    where salary > 10000 and job_id = 'SA_MAN';
    
    --Jun��o
    select first_name, department_id from employees 
    where employee_id = 100;
    
    select department_name from departments where department_id = 90;
    
    select emp.first_name, emp.department_id, dep.department_name, dep.department_id, loc.city, country_name, jb.job_title
    from employees emp
    inner join departments dep on dep.department_id = emp.department_id
    inner join locations loc on loc.location_id = dep.location_id
    inner join countries ctr on ctr.country_id = loc.country_id
    inner join jobs jb on jb.job_id = emp.job_id
    where salary > 10000;
    
    -- Fun��es agregadas
    
    select count(commission_pct) from employees;
    --soma
    select sum(salary) from employees;
    --m�nimo
    select min(salary) from employees;
    --m�ximo
    select max(salary) from employees;
    --m�dia
    select avg(salary) from employees;
    
    select d.department_name, sum(salary), count(*) from employees e
    inner join departments d on d.department_id = e.department_id
    group by d.department_name;
    
    --Buscar todos os funcion�rios com sal�rio > 8000
    --exibindo o nome, salario e data de contrata��o;
    --tabela employees
    
    select first_name, salary, hire_date
    from employees
    where salary > 8000;
    
    --Listar os funcion�rios com cargos SA_REP ou SA_MAn e 
    --exibir nome,sobrenome e descri��o do cargo
    --tabelas employees e jobs - Jun��o
    
    select e.first_name, e.last_name, j.job_title from employees e
    inner join jobs j on j.job_id = e.job_id
    where e.job_id = 'SA_REP' or e.job_id = 'SA_MAN';
    
    --listar os departamentos do canada
    
    select d.department_name from departments d
    inner join locations l on l.location_id = d.location_id
    where l.country_id = 'CA';
    
    select * from regions;
    --inserir uma nova regi�o chamada Antartida.
    insert into regions (region_id, region_name) values (5, 'ANTARTIDA');
    
    insert into regions (region_id, region_name) values (6, '�FRICA');
    delete from regions where region_id = 6;
    
    -- atualizar o nome da regi�o Antartida para polar
    update
        regions
    set 
        region_name = 'Polar'
    where
        region_id = 5;