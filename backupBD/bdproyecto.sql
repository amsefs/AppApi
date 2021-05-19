--
-- PostgreSQL database dump
--

-- Dumped from database version 11.12 (Debian 11.12-1.pgdg100+1)
-- Dumped by pg_dump version 12.7 (Debian 12.7-1.pgdg100+1)

-- Started on 2021-05-19 13:50:32 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 200 (class 1259 OID 1331829)
-- Name: persona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_seq
    START WITH 190535
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 201 (class 1259 OID 1331831)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    idpersona integer DEFAULT nextval('public.persona_id_seq'::regclass) NOT NULL,
    ci integer NOT NULL,
    idproyecto integer NOT NULL,
    nombrecompleto character varying(150) NOT NULL,
    estaactivo integer NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 1331785)
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_id_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 1331797)
-- Name: proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyecto (
    idproyecto integer DEFAULT nextval('public.proyecto_id_seq'::regclass) NOT NULL,
    descripcion character varying(150) NOT NULL,
    estaactivo integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.proyecto OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 1331807)
-- Name: tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarea_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 1331809)
-- Name: tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea (
    idtarea integer DEFAULT nextval('public.tarea_id_seq'::regclass) NOT NULL,
    idproyecto integer,
    descripcion character varying(150) NOT NULL,
    estaactivo numeric DEFAULT 1 NOT NULL
);


ALTER TABLE public.tarea OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 1331831)
-- Dependencies: 201
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (idpersona, ci, idproyecto, nombrecompleto, estaactivo) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 1331797)
-- Dependencies: 197
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proyecto (idproyecto, descripcion, estaactivo) FROM stdin;
2	proyecto2	1
3	proyecto3	1
4	Proyecto desarrollo de Aplicaciones web	1
1	Proyecto de Auditoria de Sistemas.	1
\.


--
-- TOC entry 2925 (class 0 OID 1331809)
-- Dependencies: 199
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea (idtarea, idproyecto, descripcion, estaactivo) FROM stdin;
1	1	tarea 1	1
2	1	tarea 2	1
3	1	tarea 3	1
\.


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 200
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_seq', 190535, false);


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 196
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyecto_id_seq', 5, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 198
-- Name: tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarea_id_seq', 1, false);


--
-- TOC entry 2798 (class 2606 OID 1331836)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (idpersona);


--
-- TOC entry 2794 (class 2606 OID 1331806)
-- Name: proyecto proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (idproyecto);


--
-- TOC entry 2796 (class 2606 OID 1331818)
-- Name: tarea tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (idtarea);


--
-- TOC entry 2800 (class 2606 OID 1331837)
-- Name: persona persona_idproyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_idproyecto_fkey FOREIGN KEY (idproyecto) REFERENCES public.proyecto(idproyecto);


--
-- TOC entry 2799 (class 2606 OID 1331819)
-- Name: tarea tarea_id_proyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_id_proyecto_fkey FOREIGN KEY (idproyecto) REFERENCES public.proyecto(idproyecto);


-- Completed on 2021-05-19 13:50:33 -04

--
-- PostgreSQL database dump complete
--

