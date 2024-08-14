--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: asisten; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asisten (
    id integer NOT NULL,
    id_user integer NOT NULL,
    nama character varying(100),
    hp character varying(100)
);


ALTER TABLE public.asisten OWNER TO postgres;

--
-- Name: asisten_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asisten_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asisten_id_seq OWNER TO postgres;

--
-- Name: asisten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asisten_id_seq OWNED BY public.asisten.id;


--
-- Name: asisten_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asisten_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asisten_id_user_seq OWNER TO postgres;

--
-- Name: asisten_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asisten_id_user_seq OWNED BY public.asisten.id_user;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    nik_client character varying(100),
    nm_client character varying(100),
    hp_client character varying(100),
    file_scan_ktp character varying
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: log_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_activity (
    id integer NOT NULL,
    no_perkara character varying(100),
    id_client character varying(100),
    id_asisten character varying(100),
    log_text character varying,
    log_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_activity OWNER TO postgres;

--
-- Name: log_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_activity_id_seq OWNER TO postgres;

--
-- Name: log_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_activity_id_seq OWNED BY public.log_activity.id;


--
-- Name: perkara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perkara (
    id integer NOT NULL,
    id_client integer NOT NULL,
    no_perkara character varying(100),
    jns_perkara character varying(100),
    judul character varying(100),
    deskripsi character varying,
    lokasi character varying(100),
    nm_penggugat character varying(100),
    nm_tergugat character varying(100),
    tgl_dibuat_perkara timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tgl_selesai_perkara timestamp without time zone
);


ALTER TABLE public.perkara OWNER TO postgres;

--
-- Name: perkara_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perkara_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perkara_id_client_seq OWNER TO postgres;

--
-- Name: perkara_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perkara_id_client_seq OWNED BY public.perkara.id_client;


--
-- Name: perkara_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perkara_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perkara_id_seq OWNER TO postgres;

--
-- Name: perkara_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perkara_id_seq OWNED BY public.perkara.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100),
    password character varying,
    level character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: asisten id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asisten ALTER COLUMN id SET DEFAULT nextval('public.asisten_id_seq'::regclass);


--
-- Name: asisten id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asisten ALTER COLUMN id_user SET DEFAULT nextval('public.asisten_id_user_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: log_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_activity ALTER COLUMN id SET DEFAULT nextval('public.log_activity_id_seq'::regclass);


--
-- Name: perkara id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id SET DEFAULT nextval('public.perkara_id_seq'::regclass);


--
-- Name: perkara id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id_client SET DEFAULT nextval('public.perkara_id_client_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: asisten; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asisten (id, id_user, nama, hp) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, nik_client, nm_client, hp_client, file_scan_ktp) FROM stdin;
\.


--
-- Data for Name: log_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_activity (id, no_perkara, id_client, id_asisten, log_text, log_time) FROM stdin;
23	101	\N	\N	hello	2024-05-07 10:22:51.271907
24	101	\N	\N	hello Dua	2024-05-07 10:23:02.242919
25	101	\N	\N	hello cat	2024-05-07 10:32:11.977669
\.


--
-- Data for Name: perkara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perkara (id, id_client, no_perkara, jns_perkara, judul, deskripsi, lokasi, nm_penggugat, nm_tergugat, tgl_dibuat_perkara, tgl_selesai_perkara) FROM stdin;
1	1	101	perdata	gugat warisan	pihak A menggugat pihak B	\N	\N	\N	2024-05-05 18:17:58.49641	\N
2	4	102	perdata	gugat hibah	pihak A menggugat hibah pihak B	\N	\N	\N	2024-05-05 18:18:11.41325	\N
3	7	103	perdata	gugat warisan	pihak x menggugat pihak z	\N	\N	\N	2024-05-05 18:18:17.91135	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, level) FROM stdin;
\.


--
-- Name: asisten_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asisten_id_seq', 1, false);


--
-- Name: asisten_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asisten_id_user_seq', 1, false);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: log_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_activity_id_seq', 25, true);


--
-- Name: perkara_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_client_seq', 1, false);


--
-- Name: perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: asisten asisten_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asisten
    ADD CONSTRAINT asisten_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: log_activity log_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_activity
    ADD CONSTRAINT log_activity_pkey PRIMARY KEY (id);


--
-- Name: perkara perkara_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perkara
    ADD CONSTRAINT perkara_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

