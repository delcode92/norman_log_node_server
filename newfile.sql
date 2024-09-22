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
    email character varying(100),
    hp character varying(100),
    addr character varying(100)
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
    email character varying(100),
    mandiri boolean,
    nama_penghubung character varying(100),
    no_kontak_penghubung character varying(100),
    alamat character varying(100),
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
-- Name: list_jns_perkara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_jns_perkara (
    id integer NOT NULL,
    jns_perkara_reg_id character varying(30),
    jns_perkara character varying(100)
);


ALTER TABLE public.list_jns_perkara OWNER TO postgres;

--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_jns_perkara_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_jns_perkara_id_seq OWNER TO postgres;

--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_jns_perkara_id_seq OWNED BY public.list_jns_perkara.id;


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
-- Name: penasehat_hukum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penasehat_hukum (
    id integer NOT NULL,
    nama character varying(100),
    email character varying(100),
    hp character varying(100),
    addr character varying(100),
    avatar character varying(100)
);


ALTER TABLE public.penasehat_hukum OWNER TO postgres;

--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penasehat_hukum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.penasehat_hukum_id_seq OWNER TO postgres;

--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.penasehat_hukum_id_seq OWNED BY public.penasehat_hukum.id;


--
-- Name: perkara; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.perkara OWNER TO postgres;

--
-- Name: perkara_id_asisten_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perkara_id_asisten_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perkara_id_asisten_seq OWNER TO postgres;

--
-- Name: perkara_id_asisten_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perkara_id_asisten_seq OWNED BY public.perkara.id_asisten;


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
-- Name: list_jns_perkara id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_jns_perkara ALTER COLUMN id SET DEFAULT nextval('public.list_jns_perkara_id_seq'::regclass);


--
-- Name: log_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_activity ALTER COLUMN id SET DEFAULT nextval('public.log_activity_id_seq'::regclass);


--
-- Name: penasehat_hukum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penasehat_hukum ALTER COLUMN id SET DEFAULT nextval('public.penasehat_hukum_id_seq'::regclass);


--
-- Name: perkara id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id SET DEFAULT nextval('public.perkara_id_seq'::regclass);


--
-- Name: perkara id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id_client SET DEFAULT nextval('public.perkara_id_client_seq'::regclass);


--
-- Name: perkara id_asisten; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perkara ALTER COLUMN id_asisten SET DEFAULT nextval('public.perkara_id_asisten_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: asisten; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asisten (id, id_user, nama, email, hp, addr) FROM stdin;
1	1	yuni sari	yuni@gmail.com	123	123
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, nik_client, nm_client, hp_client, email, mandiri, nama_penghubung, no_kontak_penghubung, alamat, file_scan_ktp) FROM stdin;
\.


--
-- Data for Name: list_jns_perkara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_jns_perkara (id, jns_perkara_reg_id, jns_perkara) FROM stdin;
5	reg.1.1.1.1.1	Ganti Rugi
6	reg.1.1.1.1.2	Wanprestasi
7	reg.1.1.1.1.3	Perceraian
8	reg.1.1.1.1.4	Harta Bersama
9	reg.1.1.1.1.5	lain-lain
10	reg.1.1.2	perdata gugatan sederhana
11	reg.1.1.2.1	perbuatan melawan hukum
12	reg.1.1.2.2	Wanprestasi
13	reg.1.1.2.3	lain-lain
14	reg.1.1.3	perdata permohonan
15	reg.1.1.3.1	pengampunan
16	reg.1.1.3.2	perbaikan kesalahan dalam akta kelahiran
17	reg.1.1.3.3	Pengangkatan Wali Bagi Anak
18	reg.1.1.3.4	Akta Kematian
19	reg.1.1.3.5	Permohonan Ganti Nama
20	reg.1.1.3.6	Wali dan Izin Jual
21	reg.1.1.3.7	lain-lain
22	reg.1.2	perdata khusus
23	reg.1.2.1	HKI
24	reg.1.2.2	Partai Politik
25	reg.1.2.3	Kepailitan & PKPU
26	reg.1.2.4	Pengadilan Hubungan Industrial
27	reg.1.2.4.1	Perselisihan Pemutusan Hubungan Kerja Massal
28	reg.1.2.4.2	Perselisihan Pemutusan Hubungan Kerja Sepihak
29	reg.1.2.4.3	Perselisihan Hak Pekerja Yang Sudah Diperjanjikan Tidak Dipenuhi
30	reg.1.2.4.4	Pemutusan Hubungan Kerja Tanpa Memperhatikan Hak Pekerja
31	reg.1.2.4.5	Perselisihan Pemutusan Hubungan Kerja Karena Pekerja Melakukan Tindak Pidana
32	reg.1.2.4.6	Perselisihan Hubungan Kerja Karena Pekerja Indisipliner
33	reg.1.2.4.7	Perselisihan Hak Pekerja Karena Upah Tidak Dibayar
34	reg.1.2.4.8	lain-lain
35	reg.1.2.4.9	KPPU
36	reg.1.3	Pidana
37	reg.1.3.1	Pencurian
38	reg.1.3.2	Imigrasi
39	reg.1.3.3	Penggelapan
40	reg.1.3.4	Perlindungan Anak
41	reg.1.3.5	Kejahatan Terhadap Nyawa
42	reg.1.3.6	Penipuan
43	reg.1.3.7	Kesehatan
44	reg.1.3.8	Pengeroyokan
45	reg.1.3.9	Penganiayaan
46	reg.1.3.10	Pidana Pra Peradilan
47	reg.1.3.10.1	Sah atau tidaknya penghentian penyidikan
48	reg.1.3.10.2	Sah atau tidaknya penetapan tersangka
49	reg.1.3.10.3	Sah atau tidaknya penangkapan
50	reg.1.3.10.4	Sah atau tidaknya penahanan
51	reg.1.3.11	Perkara Lalu Lintas
52	reg.1.3.12	lain-lain
53	reg.2	pengadilan tata usaha negara
54	reg.2.1	perkara
55	reg.2.1.1	perdata gugatan
56	reg.2.1.1.1	Tender
57	reg.2.1.1.2	Pertanahan
58	reg.2.1.1.3	Kepala Desa dan Perangkat Desa
59	reg.2.1.1.4	Kepegawaian
60	reg.2.1.1.5	Perizinan
61	reg.2.1.1.6	Tindakan Administrasi Pemerintah/Tindakan Faktual
62	reg.2.1.1.7	Partai Politik
63	reg.2.1.1.8	lain-lain
64	reg.2.1.2	Permohonan UU AP
65	reg.2.1.2.1	Permohonan Fiktif Positif
66	reg.2.1.2.2	Lain-Lain
67	reg.2.1.3	Gugatan Keberatan (KIP)
68	reg.2.1.3.1	Keterbukaan Informasi Publik (KIP)
69	reg.2.1.3.2	Lain-Lain
70	reg.3	mahkamah syariyah
71	reg.3.1	jinayat
72	reg.3.1.1	Praperadilan Jinayat
73	reg.3.1.1.1	Sah atau tidaknya penangkapan
74	reg.3.1.1.2	Lain-Lain
75	reg.3.2	Registrasi Perkara Jinayat
76	reg.3.2.1	Maisir
77	reg.3.2.2	Khamar
78	reg.3.2.3	Pelecehan Seksual
79	reg.3.2.4	Pemerkosaan
80	reg.3.2.5	Ikhtilath
81	reg.3.2.6	Khalwat
82	reg.3.2.7	Zina
83	reg.3.2.8	Lain-Lain
84	reg.3.3	jinayat anak
85	reg.3.3.1	Register Perkara Jinayat Anak
86	reg.3.3.1.1	Pemerkosaan
87	reg.3.3.1.2	Lain-Lain
2	reg.1.13	perdata umum
4	reg.1.1.1	perbuatan melawan hukum coba 123
1	reg.10	pengadilan negeri
3	reg.1.1	perdata gugatan xyz trest
\.


--
-- Data for Name: log_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_activity (id, no_perkara, id_client, id_asisten, log_text, log_time) FROM stdin;
\.


--
-- Data for Name: penasehat_hukum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penasehat_hukum (id, nama, email, hp, addr, avatar) FROM stdin;
1	budi susanto	budi@gmail	123	asdasd	\N
\.


--
-- Data for Name: perkara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perkara (id, id_client, id_asisten, reg_id, no_perkara, no_laporan_polisi, no_dll, id_jns_perkara, judul, deskripsi, lokasi, nm_penggugat, para_pihak_tergugat, tgl_dibuat_perkara, tgl_selesai_perkara) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, level) FROM stdin;
\.


--
-- Name: asisten_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asisten_id_seq', 1, true);


--
-- Name: asisten_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asisten_id_user_seq', 1, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_jns_perkara_id_seq', 87, true);


--
-- Name: log_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_activity_id_seq', 1, false);


--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penasehat_hukum_id_seq', 1, true);


--
-- Name: perkara_id_asisten_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_asisten_seq', 1, false);


--
-- Name: perkara_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_client_seq', 1, false);


--
-- Name: perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_seq', 1, false);


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
-- Name: list_jns_perkara list_jns_perkara_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_jns_perkara
    ADD CONSTRAINT list_jns_perkara_pkey PRIMARY KEY (id);


--
-- Name: log_activity log_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_activity
    ADD CONSTRAINT log_activity_pkey PRIMARY KEY (id);


--
-- Name: penasehat_hukum penasehat_hukum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penasehat_hukum
    ADD CONSTRAINT penasehat_hukum_pkey PRIMARY KEY (id);


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

