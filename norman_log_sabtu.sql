--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: asisten; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.asisten (
    id integer NOT NULL,
    nama character varying(100),
    email character varying(100),
    hp character varying(100),
    addr character varying(100),
    avatar character varying(100)
);


ALTER TABLE public.asisten OWNER TO "Admin";

--
-- Name: asisten_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.asisten_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asisten_id_seq OWNER TO "Admin";

--
-- Name: asisten_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.asisten_id_seq OWNED BY public.asisten.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.client (
    id integer NOT NULL,
    nik_client character varying(100),
    nm_client character varying(100),
    hp_client character varying(100),
    email character varying(100),
    mandiri boolean,
    penghubung boolean,
    nama_penghubung character varying(100),
    no_kontak_penghubung character varying(100),
    alamat character varying(100),
    file_scan_ktp character varying
);


ALTER TABLE public.client OWNER TO "Admin";

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO "Admin";

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: list_jns_perkara; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.list_jns_perkara (
    id integer NOT NULL,
    jns_perkara_reg_id character varying(30),
    jns_perkara character varying(100)
);


ALTER TABLE public.list_jns_perkara OWNER TO "Admin";

--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.list_jns_perkara_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_jns_perkara_id_seq OWNER TO "Admin";

--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.list_jns_perkara_id_seq OWNED BY public.list_jns_perkara.id;


--
-- Name: log_activity; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.log_activity (
    id integer NOT NULL,
    no_perkara character varying(100),
    id_client character varying(100),
    id_asisten character varying(100),
    log_text character varying,
    log_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.log_activity OWNER TO "Admin";

--
-- Name: log_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.log_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_activity_id_seq OWNER TO "Admin";

--
-- Name: log_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.log_activity_id_seq OWNED BY public.log_activity.id;


--
-- Name: penasehat_hukum; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.penasehat_hukum (
    id integer NOT NULL,
    nama character varying(100),
    email character varying(100),
    hp character varying(100),
    addr character varying(100),
    avatar character varying(100)
);


ALTER TABLE public.penasehat_hukum OWNER TO "Admin";

--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.penasehat_hukum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.penasehat_hukum_id_seq OWNER TO "Admin";

--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.penasehat_hukum_id_seq OWNED BY public.penasehat_hukum.id;


--
-- Name: perkara; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.perkara (
    id integer NOT NULL,
    id_client integer NOT NULL,
    id_asisten integer NOT NULL,
    reg_id character varying(100),
    no_perkara character varying(100),
    no_laporan_polisi character varying(100),
    no_dll character varying(100),
    id_jns_perkara character varying(100),
    judul character varying(100),
    deskripsi character varying,
    lokasi character varying(100),
    nm_penggugat character varying(100),
    para_pihak_tergugat jsonb,
    tgl_dibuat_perkara timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tgl_selesai_perkara timestamp without time zone
);


ALTER TABLE public.perkara OWNER TO "Admin";

--
-- Name: perkara_id_asisten_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.perkara_id_asisten_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perkara_id_asisten_seq OWNER TO "Admin";

--
-- Name: perkara_id_asisten_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.perkara_id_asisten_seq OWNED BY public.perkara.id_asisten;


--
-- Name: perkara_id_client_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.perkara_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perkara_id_client_seq OWNER TO "Admin";

--
-- Name: perkara_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.perkara_id_client_seq OWNED BY public.perkara.id_client;


--
-- Name: perkara_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.perkara_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perkara_id_seq OWNER TO "Admin";

--
-- Name: perkara_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.perkara_id_seq OWNED BY public.perkara.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100),
    password character varying,
    level character varying(100)
);


ALTER TABLE public.users OWNER TO "Admin";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Admin";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: asisten id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.asisten ALTER COLUMN id SET DEFAULT nextval('public.asisten_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: list_jns_perkara id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.list_jns_perkara ALTER COLUMN id SET DEFAULT nextval('public.list_jns_perkara_id_seq'::regclass);


--
-- Name: log_activity id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.log_activity ALTER COLUMN id SET DEFAULT nextval('public.log_activity_id_seq'::regclass);


--
-- Name: penasehat_hukum id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.penasehat_hukum ALTER COLUMN id SET DEFAULT nextval('public.penasehat_hukum_id_seq'::regclass);


--
-- Name: perkara id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id SET DEFAULT nextval('public.perkara_id_seq'::regclass);


--
-- Name: perkara id_client; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id_client SET DEFAULT nextval('public.perkara_id_client_seq'::regclass);


--
-- Name: perkara id_asisten; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id_asisten SET DEFAULT nextval('public.perkara_id_asisten_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: asisten; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.asisten (id, nama, email, hp, addr, avatar) FROM stdin;
1	andi santoso	asd@ad	123	asdasd	\N
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.client (id, nik_client, nm_client, hp_client, email, mandiri, penghubung, nama_penghubung, no_kontak_penghubung, alamat, file_scan_ktp) FROM stdin;
\.


--
-- Data for Name: list_jns_perkara; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.list_jns_perkara (id, jns_perkara_reg_id, jns_perkara) FROM stdin;
\.


--
-- Data for Name: log_activity; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.log_activity (id, no_perkara, id_client, id_asisten, log_text, log_time) FROM stdin;
\.


--
-- Data for Name: penasehat_hukum; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.penasehat_hukum (id, nama, email, hp, addr, avatar) FROM stdin;
6	budi santoso	email@ads	123	asdasd	\N
7	 				\N
\.


--
-- Data for Name: perkara; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.perkara (id, id_client, id_asisten, reg_id, no_perkara, no_laporan_polisi, no_dll, id_jns_perkara, judul, deskripsi, lokasi, nm_penggugat, para_pihak_tergugat, tgl_dibuat_perkara, tgl_selesai_perkara) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Admin
--

COPY public.users (id, username, password, level) FROM stdin;
\.


--
-- Name: asisten_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.asisten_id_seq', 1, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.list_jns_perkara_id_seq', 87, true);


--
-- Name: log_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.log_activity_id_seq', 1, false);


--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.penasehat_hukum_id_seq', 7, true);


--
-- Name: perkara_id_asisten_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.perkara_id_asisten_seq', 1, false);


--
-- Name: perkara_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.perkara_id_client_seq', 1, false);


--
-- Name: perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.perkara_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: asisten asisten_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.asisten
    ADD CONSTRAINT asisten_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: list_jns_perkara list_jns_perkara_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.list_jns_perkara
    ADD CONSTRAINT list_jns_perkara_pkey PRIMARY KEY (id);


--
-- Name: log_activity log_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.log_activity
    ADD CONSTRAINT log_activity_pkey PRIMARY KEY (id);


--
-- Name: penasehat_hukum penasehat_hukum_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.penasehat_hukum
    ADD CONSTRAINT penasehat_hukum_pkey PRIMARY KEY (id);


--
-- Name: perkara perkara_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.perkara
    ADD CONSTRAINT perkara_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

