--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: especies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.especies (
    id integer NOT NULL,
    nome text
);


--
-- Name: especies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.especies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: especies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.especies_id_seq OWNED BY public.especies.id;


--
-- Name: fotos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fotos (
    id integer NOT NULL,
    foto text NOT NULL,
    comentario text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "idModelo" integer NOT NULL
);


--
-- Name: fotos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fotos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fotos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fotos_id_seq OWNED BY public.fotos.id;


--
-- Name: modelos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modelos (
    id integer NOT NULL,
    nome text NOT NULL,
    descricao text NOT NULL,
    diaria integer NOT NULL,
    avaliable boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    "idUsuario" integer NOT NULL,
    "idQualidade" integer NOT NULL,
    "idEspecie" integer NOT NULL
);


--
-- Name: modelos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modelos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modelos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modelos_id_seq OWNED BY public.modelos.id;


--
-- Name: qualidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qualidades (
    id integer NOT NULL,
    nome text
);


--
-- Name: qualidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.qualidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: qualidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.qualidades_id_seq OWNED BY public.qualidades.id;


--
-- Name: sessao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessao (
    id integer NOT NULL,
    token text NOT NULL,
    idusuario integer NOT NULL
);


--
-- Name: sessao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessao_id_seq OWNED BY public.sessao.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome text NOT NULL,
    phone character varying(11) NOT NULL,
    cpf character varying(11) NOT NULL,
    email text NOT NULL,
    senha text NOT NULL,
    foto text NOT NULL
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: especies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.especies ALTER COLUMN id SET DEFAULT nextval('public.especies_id_seq'::regclass);


--
-- Name: fotos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fotos ALTER COLUMN id SET DEFAULT nextval('public.fotos_id_seq'::regclass);


--
-- Name: modelos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modelos ALTER COLUMN id SET DEFAULT nextval('public.modelos_id_seq'::regclass);


--
-- Name: qualidades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualidades ALTER COLUMN id SET DEFAULT nextval('public.qualidades_id_seq'::regclass);


--
-- Name: sessao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessao ALTER COLUMN id SET DEFAULT nextval('public.sessao_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: especies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.especies VALUES (1, 'milotic');
INSERT INTO public.especies VALUES (2, 'vaporeon');
INSERT INTO public.especies VALUES (3, 'luvidisc');
INSERT INTO public.especies VALUES (4, 'leafeon');
INSERT INTO public.especies VALUES (6, 'flareon');
INSERT INTO public.especies VALUES (7, 'pikachu');


--
-- Data for Name: fotos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fotos VALUES (1, 'https://64.media.tumblr.com/5a428e9b6668f591e150b645f473a4d3/tumblr_njtbuuDnWD1rcp90to5_500.png', 'A coisa mais fofa pousando para foto!', '2023-08-11 19:21:46.535339', 3);
INSERT INTO public.fotos VALUES (2, 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3e72ee55-77cd-469b-86d5-9cabdbe3c074/ddw938i-8cf6b16f-e580-4e8a-9b25-4b5bc7b0c4b4.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNlNzJlZTU1LTc3Y2QtNDY5Yi04NmQ1LTljYWJkYmUzYzA3NFwvZGR3OTM4aS04Y2Y2YjE2Zi1lNTgwLTRlOGEtOWIyNS00YjViYzdiMGM0YjQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.B483sgUlKpSRZ0R39KI5m1DFQS_tMzRtVc1QXHonMsg', 'Fotinha conceitual básica !', '2023-08-11 19:23:09.096556', 1);
INSERT INTO public.fotos VALUES (3, 'https://i.pinimg.com/originals/f7/35/e1/f735e17c0402769543d7c1eaf27fa72b.png', 'Ele adora brincar com bolhas de sabão :3', '2023-08-11 19:25:04.363764', 2);
INSERT INTO public.fotos VALUES (4, 'https://i.pinimg.com/736x/0b/6d/07/0b6d07e962a7f9a6402d0165fe0a08e0.jpg', 'Essa foto é linda, meu deu até vontade de ter um leafeon.', '2023-08-11 21:21:14.093132', 4);
INSERT INTO public.fotos VALUES (5, 'https://64.media.tumblr.com/7a2ff8830d1004c198ce6160a63a9baf/a67248e4d03b669c-b6/s1280x1920/9df365ccbb6e7c5faf3567d406995b03b085f692.png', 'Uma bela carta', '2023-08-13 21:02:29.698178', 8);


--
-- Data for Name: modelos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.modelos VALUES (1, 'Lluvia', 'Minha melhor amiga e companheira de todas as batalhas, sempre aoo meu lado nos piores e melhores momentos. Sua principal qualidade são as belas escamas que ficam simplesmente incríveis na água sob a luz do luar. Se quiser nos conhecer melhor e ver de perto essa beldade nos procure no ginásio de Sootopolis, estamos lá de segunda a sexta em horário comercial', 10000, true, '2023-08-11 12:54:04.507117', 5, 2, 1);
INSERT INTO public.modelos VALUES (2, 'Netuno', 'Grande e forte, o Netuno tem o tom de mistério ideal para conquistar os seu coração. Com sua habilidade única, se torna completamente invisivel em águas rasas e piscinas. Ideal para entradas dramáticas e efeitos artisticos em comerciais. Venha nos procurar em Sootopolis, de segunda a sexta, e veja de perto essas escamas azuis como o oceano profundo.', 10000, true, '2023-08-11 12:59:20.896496', 5, 5, 2);
INSERT INTO public.modelos VALUES (3, 'Nemo', 'Conhece algo mais fofo do que um luvidisc bem cuidado ? Cuido dessa fofurinha desde que era um pequeno ovo e não paro de me impressionar pela sua beleza. Muito dócil e fácil de trabalhar, estamos treinando constantemente novas manobras e piruetas. Quando se apresenta no ginásio de Sootopolis lota as arquibancadas e arranca aplausos de todos com seus saltos graciosos. Seja nosso convidado na próxima apresentação, iremos adorar.', 10000, true, '2023-08-11 13:06:23.895422', 5, 3, 3);
INSERT INTO public.modelos VALUES (4, 'Dionísio', 'Quando estava criando esse site acabei me deparando com essa foto de um leafeon que achei linda, usei como foto mockada e me apeguei a imagem. Agora sem dúvida tem que ser um dos meus pokemons.', 1300, true, '2023-08-11 21:20:13.992893', 6, 1, 4);
INSERT INTO public.modelos VALUES (8, 'Volcano', 'Olho esse flareon como é simplismente incrível. Mesmo da primeira geração, esse pokemoon continua como um dos mais bonitos até hoje', 5000, true, '2023-08-13 21:02:29.694845', 6, 1, 6);


--
-- Data for Name: qualidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.qualidades VALUES (1, 'cool');
INSERT INTO public.qualidades VALUES (2, 'beautiful');
INSERT INTO public.qualidades VALUES (3, 'cute');
INSERT INTO public.qualidades VALUES (4, 'clever');
INSERT INTO public.qualidades VALUES (5, 'tough');


--
-- Data for Name: sessao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario VALUES (1, 'admin', '12345678910', '12345678910', 'admin@admin.com', '123', 'https://1.bp.blogspot.com/-gWBXSIn8uG8/XcmeBNETJsI/AAAAAAAADj8/6zd-98qTDekkyFgOqCjCfjmkHMG9dj-vACLcBGAsYHQ/s1600/20191111_154018.jpg');
INSERT INTO public.usuario VALUES (2, 'jorge', '83999633138', '12345678911', 'admin2@admin.com', '123', 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png');
INSERT INTO public.usuario VALUES (3, 'jorge', '83999633138', '12345678912', 'admin3@admin.com', '$2b$10$UksOMJX.m/ZCWFSJfK6wYu5O5jFfgts/d.b9XrCTTrbTzuBdDbAqC', 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png');
INSERT INTO public.usuario VALUES (4, 'jorge', '83999633138', '12345678914', 'admin4@admin.com', '$2b$10$K8uc9uG7G4l2ADNmE5X.K.GaPXHRPYlV4LULSl9AZdM/uxo5GDUO2', 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png');
INSERT INTO public.usuario VALUES (5, 'wallace', '83999123123', '12312312345', 'wallace@admin.com', '$2b$10$/uLiz1gLP5uW6kCbNuxhS.83s49IWtIKUCnfZITcR1ZQ4ljho29Am', 'https://64.media.tumblr.com/7275740a8042dabd1e9ef8d4687112e1/136be6944501fea7-50/s500x750/7aa47098d77ece39651bd4887e27df739bdaacd6.png');
INSERT INTO public.usuario VALUES (6, 'Jefti Meira', '83999633138', '12312312367', 'jefti@email.com', '$2b$10$KTLRWoPG2vcboGPvo.oFzuXNRNqw8kqFol76Kb4spYk8TZesUySDi', 'https://i.ytimg.com/vi/5dWohRSWP6E/maxresdefault.jpg');


--
-- Name: especies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.especies_id_seq', 8, true);


--
-- Name: fotos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fotos_id_seq', 8, true);


--
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modelos_id_seq', 11, true);


--
-- Name: qualidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.qualidades_id_seq', 5, true);


--
-- Name: sessao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessao_id_seq', 129, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_seq', 6, true);


--
-- Name: especies especies_nome_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.especies
    ADD CONSTRAINT especies_nome_key UNIQUE (nome);


--
-- Name: especies especies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.especies
    ADD CONSTRAINT especies_pkey PRIMARY KEY (id);


--
-- Name: fotos fotos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fotos_pkey PRIMARY KEY (id);


--
-- Name: modelos modelos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT modelos_pkey PRIMARY KEY (id);


--
-- Name: qualidades qualidades_nome_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualidades
    ADD CONSTRAINT qualidades_nome_key UNIQUE (nome);


--
-- Name: qualidades qualidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qualidades
    ADD CONSTRAINT qualidades_pkey PRIMARY KEY (id);


--
-- Name: sessao sessao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessao
    ADD CONSTRAINT sessao_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cpf_key UNIQUE (cpf);


--
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: fotos fotos_idModelo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT "fotos_idModelo_fkey" FOREIGN KEY ("idModelo") REFERENCES public.modelos(id);


--
-- Name: modelos modelos_idEspecie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT "modelos_idEspecie_fkey" FOREIGN KEY ("idEspecie") REFERENCES public.especies(id);


--
-- Name: modelos modelos_idQualidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT "modelos_idQualidade_fkey" FOREIGN KEY ("idQualidade") REFERENCES public.qualidades(id);


--
-- Name: modelos modelos_idUsuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT "modelos_idUsuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public.usuario(id);


--
-- Name: sessao sessao_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessao
    ADD CONSTRAINT sessao_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id);


--
-- PostgreSQL database dump complete
--

