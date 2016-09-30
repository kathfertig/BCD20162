select * from curriculo;
create view resumo as
select 
	curso.numero as "Código do Curso",
	curso.nome as "Nome do Curso", 
	curriculo.implantacao as "Data de Implantação", 
	disciplina.codigo as "Código da Disciplina",
	disciplina.nome as "Nome da Disciplina"
from curso
inner join curriculo
on curso.id = curriculo.curso
inner join disciplina
on disciplina.id = curriculo.disciplina;
select * from resumo;