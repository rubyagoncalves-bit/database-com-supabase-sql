-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.alunos (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  name text,
  CONSTRAINT alunos_pkey PRIMARY KEY (id),
  CONSTRAINT alunos_name_fkey FOREIGN KEY (name) REFERENCES public.sala-de-aula(alunos)
);
CREATE TABLE public.professores (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  id_disciplina bigint NOT NULL,
  name text,
  CONSTRAINT professores_pkey PRIMARY KEY (id)
);
CREATE TABLE public.sala-de-aula (
  sala_id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  alunos text NOT NULL UNIQUE,
  disciplinas bigint,
  CONSTRAINT sala-de-aula_pkey PRIMARY KEY (sala_id)
);
CREATE TABLE public.turma (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  name text,
  CONSTRAINT turma_pkey PRIMARY KEY (id)
);
CREATE TABLE public.turma_professor (
  professor_id bigint,
  turma_id bigint,
  CONSTRAINT turma_professor_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professores(id),
  CONSTRAINT turma_professor_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES public.turma(id)
);
