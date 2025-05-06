CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO alunos (nome, turma, curso, data_nascimento)
VALUES 
  ('Felipe Caiafa',               '1B', 'CC',  '2006-09-14'),
  ('Carlos Icaro Kauã',           '1B', 'SI',  '2005-12-02'),
  ('João Pedro Gonçalves',        '1B', 'EC',  '2007-04-25'),
  ('Jaime Andrade de Almeida',    '1B', 'ES',  '2004-11-10'),
  ('Victor Garcia Dos Santos',    '1B', 'ADM', '2008-02-18'),
  ('Maria Vitória dos Santos',    '1B', 'CC',  '2005-06-30'),
  ('Adriana Fernandes Polícia',   '1B', 'SI',  '2007-09-08'),
  ('Pedro Jorge Alves Soares',    '1B', 'EC',  '2006-01-27'),
  ('Vinicius Lucas Ciardi',       '1B', 'ES',  '2004-08-05'),
  ('Marcela Amorim da Costa',     '1B', 'ADM', '2007-12-19');


INSERT INTO cursos (nome, duracao_anos)
VALUES ('CC', 4),
       ('SI', 4),
       ('EC', 4),
       ('ES', 4),
       ('ADM', 4);


INSERT INTO matriculas (aluno_id, curso_id)
VALUES
  (1, 1),   -- Felipe Caiafa               → CC
  (2, 2),   -- Carlos Icaro Kauã           → SI
  (3, 3),   -- João Pedro Gonçalves        → EC
  (4, 4),   -- Jaime Andrade de Almeida    → ES
  (5, 5),   -- Victor Garcia Dos Santos    → ADM
  (6, 1),   -- Maria Vitória dos Santos    → CC
  (7, 2),   -- Adriana Fernandes Polícia   → SI
  (8, 3),   -- Pedro Jorge Alves Soares    → EC
  (9, 4),   -- Vinicius Lucas Ciardi       → ES
  (10, 5);  -- Marcela Amorim da Costa     → ADM

-- SELECT * FROM alunos;

-- SELECT * FROM cursos;

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;

