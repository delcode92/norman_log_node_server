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
    id_penasehat_hukum jsonb,
    id_asisten jsonb,
    no_perkara character varying(100),
    no_laporan_polisi character varying(100),
    no_dll character varying(100),
    jns_perkara_order character varying,
    judul character varying(100),
    deskripsi character varying,
    para_pihak_tergugat jsonb,
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
    id_asisten integer,
    level character varying
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
3	123	sandi	123	test@gmail.com	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1726734308/nourman_client_file/jebclx2k67m31wqk7a5w.jpg
4	123	sandi	123	test@gmail.com	f	ahmad	123	pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1726734471/nourman_client_file/dqab05caa0dvirhxpjtd.jpg
5	1232	budi	123	test@gmail.com	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041123/nourman_client_file/mnunodncwqriutt5pytm.jpg
6	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041244/nourman_client_file/h8gysvunbygaduvlhuhu.jpg
7	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041428/nourman_client_file/cifzrhq71csqgjotnshq.jpg
8	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041588/nourman_client_file/j2l0iwf7xubi1f7jbilk.jpg
9	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041632/nourman_client_file/cm4w3sibbsw566ajzuc8.jpg
10	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041676/nourman_client_file/f1s35r2uef7vqlmpvzw9.jpg
11	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727041750/nourman_client_file/jiadk8jvaxnvzbh8gffq.jpg
12	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727042475/nourman_client_file/kilayzvw2hiproemucj8.jpg
13	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727042655/nourman_client_file/sxrkgxnc8u74bzmpygpq.jpg
14	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727043083/nourman_client_file/nogufvu72egkg2hfba6a.jpg
15	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727043101/nourman_client_file/ii0athgk6oyrrjos4fqh.jpg
16	123	anto	123	test@asdm	t			pango	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1727043193/nourman_client_file/uww5gnugwu1yuxb3fvkg.jpg
17	123	penggt jumat	123	peng@gmail.com	t			lamapsh	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1729221243/nourman_client_file/n0wmcy9tdkn5sbkm2j5c.jpg
18	123	penggt jumat 123	123	peng@gmail.com	t			lamapsh	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1729222692/nourman_client_file/yoq7sjavblrkkxrprndt.jpg
19	123	penggt jumat 1234	123	peng@gmail.com	t			lamapsh	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1729223155/nourman_client_file/qrgxribqsnt9ywdteul8.jpg
20	123	penggt jumat 1234	123	peng@gmail.com	t			lamapsh	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1729223312/nourman_client_file/jno6sclhda1eueleatlw.jpg
21	12312	andi	1112312	andi@gmail.com	t			lampanah	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1729247501/nourman_client_file/m8z4klfjj8plxkes7tf6.jpg
22	123	penggt 1	123414	user@gmail.com	t			asdas	https://res.cloudinary.com/ddjjyf2fw/image/upload/v1729249634/nourman_client_file/od4jzxp63yqyldclanov.jpg
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
61	reg.2.1.1.6	Tindakan postgresistrasi Pemerintah/Tindakan Faktual
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
1	123	13	1	test log 123	2024-12-18 09:55:38.140248
2	123	13	1	test log 123... blaalsdlasd	2024-12-18 10:04:25.876272
12	123	13	1	test 123 log activity	2024-12-20 07:25:25.18131
\.


--
-- Data for Name: penasehat_hukum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penasehat_hukum (id, nama, email, hp, addr, avatar) FROM stdin;
1	budi susanto	budi@gmail	123	asdasd	\N
2	rahmat udin	rahmat@gmail.com	123	123	\N
\.


--
-- Data for Name: perkara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perkara (id, id_client, id_penasehat_hukum, id_asisten, no_perkara, no_laporan_polisi, no_dll, jns_perkara_order, judul, deskripsi, para_pihak_tergugat, tgl_dibuat_perkara, tgl_selesai_perkara) FROM stdin;
2	14	[]	[]	123	123	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum->ganti-rugi->perbuatan-melawan-hukum	test ju	test deskripsi	[]	2024-09-23 05:11:22.42778	\N
3	15	[]	[]	123	123	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum->ganti-rugi->perbuatan-melawan-hukum	test ju	test deskripsi	[]	2024-09-23 05:11:40.623983	\N
4	16	["1"]	[]	123	123	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum->ganti-rugi->perbuatan-melawan-hukum	test ju	test deskripsi	[]	2024-09-23 05:13:12.747002	\N
5	17	[]	[]	12	1234	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum	perkara jumat	test deskripsi	[]	2024-10-18 10:14:04.096231	\N
6	18	["budi susanto"]	[]	12	1234	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum	perkara jumat	test deskripsi	[]	2024-10-18 10:38:12.725778	\N
7	19	["budi susanto"]	[]	12	1234	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum	perkara jumat	test deskripsi	[]	2024-10-18 10:45:55.881941	\N
8	20	["-- pilih penasihat hukum --", "1", "-- pilih penasihat hukum --", "1"]	[]	12	1234	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum	perkara jumat	test deskripsi	[]	2024-10-18 10:48:33.168642	\N
9	21	[]	[]	123	123	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum	pekrara 123	test deskripsi	[]	2024-10-18 17:31:41.711924	\N
1	13	[]	["5", "1"]	123	123	123	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum->ganti-rugi->perbuatan-melawan-hukum	test ju	test deskripsi	["pihak-1", "pihak-2"]	2024-09-23 05:04:15.088189	\N
10	22	[]	["1", "5"]	12	234	234	->pengadilan-negeri->perdata-umum->perdata-gugatan->perbuatan-melawan-hukum	terst judul	test deskripsi	["pihak1", "pihak 2", "", "", ""]	2024-10-18 18:07:14.231048	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, id_asisten, level) FROM stdin;
1	user	user123	1	asisten
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

SELECT pg_catalog.setval('public.client_id_seq', 22, true);


--
-- Name: list_jns_perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_jns_perkara_id_seq', 87, true);


--
-- Name: log_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_activity_id_seq', 17, true);


--
-- Name: penasehat_hukum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penasehat_hukum_id_seq', 2, true);


--
-- Name: perkara_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_client_seq', 1, false);


--
-- Name: perkara_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perkara_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


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

