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
    
    --Reetorna nome, sobrenome e salário de todos os funcionários
    select first_name, last_name, salary from employees;