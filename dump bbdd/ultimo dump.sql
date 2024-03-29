--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-16 14:10:34

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
-- TOC entry 18 (class 2615 OID 58426)
-- Name: innova; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA innova;


ALTER SCHEMA innova OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 58582)
-- Name: innova_dm; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA innova_dm;


ALTER SCHEMA innova_dm OWNER TO postgres;

--
-- TOC entry 19 (class 2615 OID 58502)
-- Name: innova_dw; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA innova_dw;


ALTER SCHEMA innova_dw OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 264 (class 1259 OID 58447)
-- Name: cust_segmentos; Type: TABLE; Schema: innova; Owner: g3wsuite
--

CREATE TABLE innova.cust_segmentos (
    id integer NOT NULL,
    nombre character varying(20)
);


ALTER TABLE innova.cust_segmentos OWNER TO g3wsuite;

--
-- TOC entry 261 (class 1259 OID 58432)
-- Name: cust_ubicaciones; Type: TABLE; Schema: innova; Owner: g3wsuite
--

CREATE TABLE innova.cust_ubicaciones (
    nombre character varying(20),
    id integer NOT NULL
);


ALTER TABLE innova.cust_ubicaciones OWNER TO g3wsuite;

--
-- TOC entry 260 (class 1259 OID 58427)
-- Name: customers; Type: TABLE; Schema: innova; Owner: g3wsuite
--

CREATE TABLE innova.customers (
    id integer NOT NULL,
    nombre character varying(50),
    ubicacion integer NOT NULL,
    segmento integer NOT NULL
);


ALTER TABLE innova.customers OWNER TO g3wsuite;

--
-- TOC entry 268 (class 1259 OID 58482)
-- Name: invoices; Type: TABLE; Schema: innova; Owner: g3wsuite
--

CREATE TABLE innova.invoices (
    id integer NOT NULL,
    fecha character varying(50),
    id_customer integer,
    id_product integer,
    cantidad integer
);


ALTER TABLE innova.invoices OWNER TO g3wsuite;

--
-- TOC entry 267 (class 1259 OID 58471)
-- Name: prod_categorias; Type: TABLE; Schema: innova; Owner: g3wsuite
--

CREATE TABLE innova.prod_categorias (
    id integer NOT NULL,
    nombre character varying(20)
);


ALTER TABLE innova.prod_categorias OWNER TO g3wsuite;

--
-- TOC entry 266 (class 1259 OID 58469)
-- Name: prod_categorias_id_seq; Type: SEQUENCE; Schema: innova; Owner: g3wsuite
--

CREATE SEQUENCE innova.prod_categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova.prod_categorias_id_seq OWNER TO g3wsuite;

--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 266
-- Name: prod_categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: innova; Owner: g3wsuite
--

ALTER SEQUENCE innova.prod_categorias_id_seq OWNED BY innova.prod_categorias.id;


--
-- TOC entry 265 (class 1259 OID 58463)
-- Name: products; Type: TABLE; Schema: innova; Owner: g3wsuite
--

CREATE TABLE innova.products (
    id integer NOT NULL,
    nombre character varying(50),
    precio real,
    categoria integer NOT NULL
);


ALTER TABLE innova.products OWNER TO g3wsuite;

--
-- TOC entry 263 (class 1259 OID 58445)
-- Name: segmentos_id_seq; Type: SEQUENCE; Schema: innova; Owner: g3wsuite
--

CREATE SEQUENCE innova.segmentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova.segmentos_id_seq OWNER TO g3wsuite;

--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 263
-- Name: segmentos_id_seq; Type: SEQUENCE OWNED BY; Schema: innova; Owner: g3wsuite
--

ALTER SEQUENCE innova.segmentos_id_seq OWNED BY innova.cust_segmentos.id;


--
-- TOC entry 262 (class 1259 OID 58437)
-- Name: ubicaciones_id_seq; Type: SEQUENCE; Schema: innova; Owner: g3wsuite
--

CREATE SEQUENCE innova.ubicaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova.ubicaciones_id_seq OWNER TO g3wsuite;

--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 262
-- Name: ubicaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: innova; Owner: g3wsuite
--

ALTER SEQUENCE innova.ubicaciones_id_seq OWNED BY innova.cust_ubicaciones.id;


--
-- TOC entry 279 (class 1259 OID 60620)
-- Name: dm_compras_mensuales_clientes_top10; Type: TABLE; Schema: innova_dm; Owner: g3wsuite
--

CREATE TABLE innova_dm.dm_compras_mensuales_clientes_top10 (
    id integer NOT NULL,
    customer character varying(50),
    anio integer,
    mes integer,
    cantidad_productos integer,
    cantidad_compras integer,
    facturado real
);


ALTER TABLE innova_dm.dm_compras_mensuales_clientes_top10 OWNER TO g3wsuite;

--
-- TOC entry 278 (class 1259 OID 60618)
-- Name: dm_compras_mensuales_clientes_top10_id_seq; Type: SEQUENCE; Schema: innova_dm; Owner: g3wsuite
--

CREATE SEQUENCE innova_dm.dm_compras_mensuales_clientes_top10_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova_dm.dm_compras_mensuales_clientes_top10_id_seq OWNER TO g3wsuite;

--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 278
-- Name: dm_compras_mensuales_clientes_top10_id_seq; Type: SEQUENCE OWNED BY; Schema: innova_dm; Owner: g3wsuite
--

ALTER SEQUENCE innova_dm.dm_compras_mensuales_clientes_top10_id_seq OWNED BY innova_dm.dm_compras_mensuales_clientes_top10.id;


--
-- TOC entry 281 (class 1259 OID 60634)
-- Name: dm_evolucion_mensual_ventas_region; Type: TABLE; Schema: innova_dm; Owner: g3wsuite
--

CREATE TABLE innova_dm.dm_evolucion_mensual_ventas_region (
    id integer NOT NULL,
    cantidad_ventas integer,
    cantidad_productos_vendidos integer,
    productos_por_venta real,
    total_facturado real,
    ubicacion character varying(20),
    anio integer,
    mes integer
);


ALTER TABLE innova_dm.dm_evolucion_mensual_ventas_region OWNER TO g3wsuite;

--
-- TOC entry 280 (class 1259 OID 60632)
-- Name: dm_evolucion_mensual_ventas_region_id_seq; Type: SEQUENCE; Schema: innova_dm; Owner: g3wsuite
--

CREATE SEQUENCE innova_dm.dm_evolucion_mensual_ventas_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova_dm.dm_evolucion_mensual_ventas_region_id_seq OWNER TO g3wsuite;

--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 280
-- Name: dm_evolucion_mensual_ventas_region_id_seq; Type: SEQUENCE OWNED BY; Schema: innova_dm; Owner: g3wsuite
--

ALTER SEQUENCE innova_dm.dm_evolucion_mensual_ventas_region_id_seq OWNED BY innova_dm.dm_evolucion_mensual_ventas_region.id;


--
-- TOC entry 275 (class 1259 OID 58585)
-- Name: dm_productos_mas_vendidos_trimestre; Type: TABLE; Schema: innova_dm; Owner: g3wsuite
--

CREATE TABLE innova_dm.dm_productos_mas_vendidos_trimestre (
    id integer NOT NULL,
    producto character varying(50),
    anio integer,
    trimestre integer,
    total_vendido integer
);


ALTER TABLE innova_dm.dm_productos_mas_vendidos_trimestre OWNER TO g3wsuite;

--
-- TOC entry 274 (class 1259 OID 58583)
-- Name: dm_productos_mas_vendidos_trimestre_id_seq; Type: SEQUENCE; Schema: innova_dm; Owner: g3wsuite
--

CREATE SEQUENCE innova_dm.dm_productos_mas_vendidos_trimestre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova_dm.dm_productos_mas_vendidos_trimestre_id_seq OWNER TO g3wsuite;

--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 274
-- Name: dm_productos_mas_vendidos_trimestre_id_seq; Type: SEQUENCE OWNED BY; Schema: innova_dm; Owner: g3wsuite
--

ALTER SEQUENCE innova_dm.dm_productos_mas_vendidos_trimestre_id_seq OWNED BY innova_dm.dm_productos_mas_vendidos_trimestre.id;


--
-- TOC entry 277 (class 1259 OID 58744)
-- Name: dm_top3_productos_por_top10_cliente; Type: TABLE; Schema: innova_dm; Owner: g3wsuite
--

CREATE TABLE innova_dm.dm_top3_productos_por_top10_cliente (
    id integer NOT NULL,
    top3productos character varying[],
    customer character varying(50)
);


ALTER TABLE innova_dm.dm_top3_productos_por_top10_cliente OWNER TO g3wsuite;

--
-- TOC entry 276 (class 1259 OID 58742)
-- Name: dm_top3_productos_por top10_cliente_id_seq; Type: SEQUENCE; Schema: innova_dm; Owner: g3wsuite
--

CREATE SEQUENCE innova_dm."dm_top3_productos_por top10_cliente_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova_dm."dm_top3_productos_por top10_cliente_id_seq" OWNER TO g3wsuite;

--
-- TOC entry 4554 (class 0 OID 0)
-- Dependencies: 276
-- Name: dm_top3_productos_por top10_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: innova_dm; Owner: g3wsuite
--

ALTER SEQUENCE innova_dm."dm_top3_productos_por top10_cliente_id_seq" OWNED BY innova_dm.dm_top3_productos_por_top10_cliente.id;


--
-- TOC entry 269 (class 1259 OID 58507)
-- Name: dim_customers; Type: TABLE; Schema: innova_dw; Owner: g3wsuite
--

CREATE TABLE innova_dw.dim_customers (
    id_customer integer NOT NULL,
    nombre character varying(50),
    segmento character varying(20),
    ubicacion character varying(20)
);


ALTER TABLE innova_dw.dim_customers OWNER TO g3wsuite;

--
-- TOC entry 270 (class 1259 OID 58512)
-- Name: dim_products; Type: TABLE; Schema: innova_dw; Owner: g3wsuite
--

CREATE TABLE innova_dw.dim_products (
    id_product integer NOT NULL,
    nombre character varying(50),
    precio real,
    categoria character varying(20)
);


ALTER TABLE innova_dw.dim_products OWNER TO g3wsuite;

--
-- TOC entry 272 (class 1259 OID 58522)
-- Name: dim_tiempo; Type: TABLE; Schema: innova_dw; Owner: g3wsuite
--

CREATE TABLE innova_dw.dim_tiempo (
    fecha_dia character varying(10) NOT NULL,
    dia integer,
    mes integer,
    anio integer,
    trimestre integer,
    cuatrimestre integer,
    dia_semana integer,
    id_tiempo integer NOT NULL
);


ALTER TABLE innova_dw.dim_tiempo OWNER TO g3wsuite;

--
-- TOC entry 273 (class 1259 OID 58529)
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE; Schema: innova_dw; Owner: g3wsuite
--

CREATE SEQUENCE innova_dw.dim_tiempo_id_tiempo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE innova_dw.dim_tiempo_id_tiempo_seq OWNER TO g3wsuite;

--
-- TOC entry 4555 (class 0 OID 0)
-- Dependencies: 273
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE OWNED BY; Schema: innova_dw; Owner: g3wsuite
--

ALTER SEQUENCE innova_dw.dim_tiempo_id_tiempo_seq OWNED BY innova_dw.dim_tiempo.id_tiempo;


--
-- TOC entry 271 (class 1259 OID 58517)
-- Name: fct_invoices; Type: TABLE; Schema: innova_dw; Owner: g3wsuite
--

CREATE TABLE innova_dw.fct_invoices (
    id_invoice integer NOT NULL,
    fecha integer,
    customer integer,
    product integer,
    cantidad integer,
    total real
);


ALTER TABLE innova_dw.fct_invoices OWNER TO g3wsuite;

--
-- TOC entry 4348 (class 2604 OID 58450)
-- Name: cust_segmentos id; Type: DEFAULT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.cust_segmentos ALTER COLUMN id SET DEFAULT nextval('innova.segmentos_id_seq'::regclass);


--
-- TOC entry 4347 (class 2604 OID 58439)
-- Name: cust_ubicaciones id; Type: DEFAULT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.cust_ubicaciones ALTER COLUMN id SET DEFAULT nextval('innova.ubicaciones_id_seq'::regclass);


--
-- TOC entry 4349 (class 2604 OID 58474)
-- Name: prod_categorias id; Type: DEFAULT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.prod_categorias ALTER COLUMN id SET DEFAULT nextval('innova.prod_categorias_id_seq'::regclass);


--
-- TOC entry 4353 (class 2604 OID 60623)
-- Name: dm_compras_mensuales_clientes_top10 id; Type: DEFAULT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_compras_mensuales_clientes_top10 ALTER COLUMN id SET DEFAULT nextval('innova_dm.dm_compras_mensuales_clientes_top10_id_seq'::regclass);


--
-- TOC entry 4354 (class 2604 OID 60637)
-- Name: dm_evolucion_mensual_ventas_region id; Type: DEFAULT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_evolucion_mensual_ventas_region ALTER COLUMN id SET DEFAULT nextval('innova_dm.dm_evolucion_mensual_ventas_region_id_seq'::regclass);


--
-- TOC entry 4351 (class 2604 OID 58588)
-- Name: dm_productos_mas_vendidos_trimestre id; Type: DEFAULT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_productos_mas_vendidos_trimestre ALTER COLUMN id SET DEFAULT nextval('innova_dm.dm_productos_mas_vendidos_trimestre_id_seq'::regclass);


--
-- TOC entry 4352 (class 2604 OID 58747)
-- Name: dm_top3_productos_por_top10_cliente id; Type: DEFAULT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_top3_productos_por_top10_cliente ALTER COLUMN id SET DEFAULT nextval('innova_dm."dm_top3_productos_por top10_cliente_id_seq"'::regclass);


--
-- TOC entry 4350 (class 2604 OID 58531)
-- Name: dim_tiempo id_tiempo; Type: DEFAULT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.dim_tiempo ALTER COLUMN id_tiempo SET DEFAULT nextval('innova_dw.dim_tiempo_id_tiempo_seq'::regclass);


--
-- TOC entry 4525 (class 0 OID 58447)
-- Dependencies: 264
-- Data for Name: cust_segmentos; Type: TABLE DATA; Schema: innova; Owner: g3wsuite
--

COPY innova.cust_segmentos (id, nombre) FROM stdin;
1	Grande
2	Mediano
3	Pequeño
\.


--
-- TOC entry 4522 (class 0 OID 58432)
-- Dependencies: 261
-- Data for Name: cust_ubicaciones; Type: TABLE DATA; Schema: innova; Owner: g3wsuite
--

COPY innova.cust_ubicaciones (nombre, id) FROM stdin;
Querétaro	1
Cancún	2
Mérida	3
León	4
Puebla	5
Monterrey	6
Guadalajara	7
Tijuana	8
Morelia	9
Ciudad de México	10
\.


--
-- TOC entry 4521 (class 0 OID 58427)
-- Dependencies: 260
-- Data for Name: customers; Type: TABLE DATA; Schema: innova; Owner: g3wsuite
--

COPY innova.customers (id, nombre, ubicacion, segmento) FROM stdin;
1	José Cruz	5	3
2	Juan García	3	3
3	Manuel García	1	1
4	Pedro González	2	2
5	Jorge Ramírez	9	2
6	Carlos González	5	3
7	Alejandro Rodríguez	4	1
8	Juan Rodríguez	2	2
9	Juan Hernández	9	2
10	Luis López	9	2
11	Carlos Hernández	3	2
12	Fernando García	9	3
13	Alejandro Cruz	4	2
14	Fernando Cruz	5	2
15	José López	4	2
16	José García	5	1
17	José Hernández	8	2
18	Luis González	2	2
21	Miguel Martínez	8	1
49	Juan González	8	3
50	Carlos García	3	3
51	Manuel Martínez	8	1
52	Pedro Sánchez	3	2
53	Jorge García	8	3
54	Fernando Ramírez	1	1
55	Jorge Sánchez	4	2
56	Alejandro García	8	3
57	Jorge González	6	3
58	Manuel González	4	3
59	Fernando Martínez	5	1
60	Carlos Ramírez	8	2
61	Pedro García	7	3
62	Luis Hernández	3	3
63	Juan Pérez	2	2
64	Luis Ramírez	5	2
65	Alejandro Hernández	7	3
66	Juan Ramírez	10	2
67	Pedro Rodríguez	9	1
68	Manuel Pérez	7	2
69	Fernando Hernández	10	2
70	José González	2	1
71	Pedro Ramírez	6	1
72	Miguel Rodríguez	3	2
73	José Sánchez	3	2
74	Manuel Hernández	2	1
75	Pedro Hernández	9	2
76	Jorge Hernández	3	1
77	José Pérez	7	3
78	Jorge López	10	2
79	Jorge Rodríguez	5	1
80	Luis Cruz	9	3
81	Miguel Sánchez	5	2
82	Juan López	10	2
83	Carlos Pérez	6	2
84	Luis Rodríguez	5	1
85	Luis García	9	1
86	Alejandro López	3	3
87	Alejandro Sánchez	7	2
88	Luis Martínez	7	1
89	Carlos Cruz	5	1
90	Alejandro Pérez	10	2
91	Jorge Martínez	2	3
92	Manuel Rodríguez	6	1
93	Manuel López	2	3
94	Carlos Martínez	3	3
95	Fernando López	5	2
96	Fernando Pérez	1	2
97	Carlos Sánchez	3	2
98	Jorge Cruz	5	3
99	Pedro López	3	3
100	Manuel Sánchez	1	2
19	Miguel Hernández	8	2
20	Miguel Ramírez	8	3
22	José Ramírez	9	2
23	Miguel González	2	3
24	Manuel Ramírez	9	3
25	Fernando Sánchez	10	3
26	José Martínez	9	1
27	Miguel Cruz	7	1
28	Miguel García	1	2
29	Pedro Pérez	8	3
30	Juan Sánchez	5	3
31	Luis Pérez	1	3
32	Pedro Martínez	3	3
33	Carlos Rodríguez	9	2
34	Fernando González	10	1
35	Miguel Pérez	4	2
36	Miguel López	4	3
37	Juan Martínez	6	3
38	José Rodríguez	4	3
39	Jorge Pérez	4	2
40	Luis Sánchez	9	1
41	Alejandro Ramírez	6	1
42	Manuel Cruz	9	3
43	Juan Cruz	10	3
44	Pedro Cruz	7	2
45	Carlos López	4	3
46	Fernando Rodríguez	7	3
47	Alejandro González	3	3
48	Alejandro Martínez	4	1
\.


--
-- TOC entry 4529 (class 0 OID 58482)
-- Dependencies: 268
-- Data for Name: invoices; Type: TABLE DATA; Schema: innova; Owner: g3wsuite
--

COPY innova.invoices (id, fecha, id_customer, id_product, cantidad) FROM stdin;
1	2023-11-10	62	24	6
2	2023-04-05	10	32	10
3	2023-08-11	14	48	1
4	2023-01-31	100	7	8
5	2023-12-30	66	20	6
6	2023-07-10	27	6	4
7	2023-02-22	13	16	1
8	2023-10-22	87	29	6
9	2023-02-14	72	31	10
10	2023-08-02	49	18	9
11	2023-10-27	29	34	10
12	2023-07-18	99	1	4
13	2023-04-08	67	3	8
14	2023-07-23	34	1	3
15	2023-05-14	54	24	7
16	2023-10-31	75	26	3
17	2023-09-23	58	17	8
18	2023-04-23	33	4	1
19	2023-10-15	47	16	1
20	2023-10-08	69	16	9
21	2023-04-16	39	19	6
22	2023-10-29	38	30	2
23	2023-06-02	48	31	10
24	2023-04-13	23	43	6
25	2023-10-30	4	23	2
26	2023-06-28	3	31	5
27	2023-10-31	99	33	2
28	2023-09-03	50	16	1
29	2023-01-18	9	49	4
30	2023-01-04	42	30	4
31	2023-03-26	21	39	1
32	2023-08-09	93	3	4
33	2023-08-15	26	3	4
34	2023-07-15	34	8	5
35	2023-01-11	100	13	7
36	2023-05-16	13	24	6
37	2023-08-13	30	15	2
38	2023-10-31	91	30	4
39	2023-01-24	91	44	5
40	2023-12-14	86	26	5
41	2023-09-18	100	21	7
42	2023-10-10	12	33	4
43	2023-11-21	96	18	5
44	2023-11-30	62	18	5
45	2023-12-29	53	33	7
46	2023-10-30	97	45	1
47	2023-05-02	22	28	9
48	2023-08-29	55	38	8
49	2023-12-04	82	2	6
50	2023-04-15	2	25	2
51	2023-11-28	52	48	10
52	2023-01-11	53	24	7
53	2023-11-30	80	12	6
54	2023-03-17	72	26	1
55	2023-07-07	66	29	9
56	2023-12-04	100	16	5
57	2023-11-01	70	25	6
58	2023-07-17	54	30	1
59	2023-07-30	55	5	1
60	2023-07-15	51	11	8
61	2023-06-08	91	6	5
62	2023-01-28	85	25	1
63	2023-03-12	16	9	8
64	2023-08-06	64	36	8
65	2023-06-02	39	4	2
66	2023-06-03	71	40	6
67	2023-03-31	68	2	5
68	2023-07-16	94	41	7
69	2023-06-29	57	16	6
70	2023-11-16	17	17	1
71	2023-11-02	31	16	1
72	2023-08-09	86	26	10
73	2023-08-19	90	8	4
74	2023-04-13	69	37	4
75	2023-01-16	88	42	5
76	2023-01-04	56	7	2
77	2023-05-17	58	36	3
78	2023-08-23	62	7	5
79	2023-04-12	7	50	10
80	2023-09-19	51	1	6
81	2023-10-31	25	16	9
82	2023-07-09	53	24	1
83	2023-05-04	20	45	1
84	2023-09-08	72	16	8
85	2023-10-21	98	7	6
86	2023-07-17	36	34	3
87	2023-08-26	6	42	7
88	2023-11-30	65	27	9
89	2023-12-06	28	23	5
90	2023-03-14	83	6	3
91	2023-07-03	59	3	7
92	2023-02-16	28	44	10
93	2023-12-22	40	9	1
94	2023-01-06	8	40	6
95	2023-03-05	90	48	10
96	2023-09-11	47	26	7
97	2023-10-22	26	22	5
98	2023-07-28	6	27	6
99	2023-04-13	73	44	1
100	2023-08-17	12	47	10
101	2023-03-21	91	12	6
102	2023-05-30	80	43	9
103	2023-09-10	77	22	1
104	2023-08-08	27	28	2
105	2023-01-21	6	29	2
106	2023-04-30	85	18	7
107	2023-09-21	29	17	10
108	2023-05-02	12	43	9
109	2023-03-22	84	36	4
110	2023-03-04	53	29	3
111	2023-07-20	40	16	5
112	2023-10-23	89	31	4
113	2023-10-29	55	30	9
114	2023-06-29	20	44	3
115	2023-08-30	81	48	9
116	2023-03-03	85	31	10
117	2023-03-19	38	15	2
118	2023-06-09	71	40	6
119	2023-05-23	31	49	3
120	2023-04-24	69	14	10
121	2023-05-19	35	10	5
122	2023-06-28	1	2	9
123	2023-07-04	19	25	4
124	2023-08-25	93	43	5
125	2023-05-12	64	39	3
126	2023-12-07	32	2	4
127	2023-10-27	2	32	9
128	2023-12-19	3	49	2
129	2023-12-17	7	33	8
130	2023-06-21	45	19	8
131	2023-11-16	66	20	6
132	2023-03-13	64	20	4
133	2023-12-03	54	2	7
134	2023-11-18	13	25	4
135	2023-09-25	18	16	1
136	2023-06-17	66	10	1
137	2023-08-10	72	39	10
138	2023-01-13	29	45	9
139	2023-04-21	9	8	1
140	2023-05-05	98	41	8
141	2023-02-24	74	6	6
142	2023-08-23	36	21	8
143	2023-07-28	86	4	3
144	2023-01-04	85	30	5
145	2023-02-22	58	30	1
146	2023-11-07	8	41	2
147	2023-08-04	8	10	2
148	2023-05-17	21	2	5
149	2023-02-17	6	2	5
150	2023-02-03	79	27	9
151	2023-11-16	57	44	7
152	2023-11-28	30	49	4
153	2023-11-23	63	41	9
154	2023-01-05	45	42	7
155	2023-05-13	44	16	3
156	2023-03-28	91	2	5
157	2023-06-10	10	38	6
158	2023-07-08	7	4	8
159	2023-11-08	72	18	9
160	2023-02-05	70	4	2
161	2023-06-23	85	5	2
162	2023-08-29	21	48	5
163	2023-05-22	72	27	2
164	2023-11-27	40	37	10
165	2023-04-28	16	21	1
166	2023-02-20	36	50	6
167	2023-12-19	11	48	7
168	2023-05-13	32	36	7
169	2023-11-20	5	1	5
170	2023-10-30	41	13	9
171	2023-02-19	99	5	6
172	2023-09-25	41	22	7
173	2023-04-27	61	41	6
174	2023-11-03	29	18	2
175	2023-01-11	77	14	10
176	2023-12-02	1	27	6
177	2023-05-16	8	30	1
178	2023-08-08	60	11	7
179	2023-08-29	53	47	10
180	2023-03-14	61	33	4
181	2023-05-12	94	39	2
182	2023-02-24	61	32	1
183	2023-06-10	50	43	2
184	2023-11-09	49	40	7
185	2023-02-18	8	34	1
186	2023-03-29	42	43	8
187	2023-11-19	58	23	10
188	2023-02-11	39	43	1
189	2023-09-15	63	3	5
190	2023-05-14	38	22	10
191	2023-06-20	11	29	1
192	2023-06-08	20	1	8
193	2023-12-27	58	34	4
194	2023-04-04	31	22	10
195	2023-05-03	44	5	4
196	2023-01-13	80	46	7
197	2023-04-24	68	10	9
198	2023-11-18	23	44	7
199	2023-07-20	21	26	4
200	2023-12-15	5	36	1
201	2023-03-08	53	12	5
202	2023-10-25	75	27	7
203	2023-02-07	76	39	2
204	2023-11-12	26	37	2
205	2023-05-16	22	33	4
206	2023-12-31	86	2	5
207	2023-01-05	8	23	10
208	2023-01-02	49	47	8
209	2023-02-21	4	15	7
210	2023-03-26	92	22	7
211	2023-04-07	22	15	10
212	2023-12-06	100	17	9
213	2023-03-06	25	11	10
214	2023-06-27	85	35	9
215	2023-07-16	58	17	8
216	2023-11-21	93	24	6
217	2023-07-24	52	30	5
218	2023-08-18	4	20	10
219	2023-12-13	46	34	8
220	2023-03-28	49	29	6
221	2023-04-26	19	35	7
222	2023-03-06	15	37	3
223	2023-03-06	38	25	4
224	2023-07-26	42	40	8
225	2023-11-16	85	35	7
226	2023-03-31	1	20	9
227	2023-09-18	28	12	3
228	2023-11-08	66	14	4
229	2023-05-30	19	44	7
230	2023-03-13	77	33	6
231	2023-11-05	31	9	10
232	2023-04-09	4	25	3
233	2023-10-28	95	13	9
234	2023-04-01	9	22	6
235	2023-12-02	42	44	7
236	2023-07-23	20	33	5
237	2023-04-15	29	46	5
238	2023-07-24	86	49	10
239	2023-12-13	12	28	3
240	2023-07-11	56	50	3
241	2023-02-25	13	38	1
242	2023-03-01	36	31	5
243	2023-07-09	82	9	7
244	2023-07-28	31	22	2
245	2023-09-14	38	43	5
246	2023-07-06	90	45	10
247	2023-06-26	57	17	1
248	2023-05-31	87	34	4
249	2023-12-21	6	25	5
250	2023-11-09	65	5	9
251	2023-01-11	61	9	2
252	2023-03-13	88	45	10
253	2023-03-10	66	42	9
254	2023-08-12	50	7	9
255	2023-06-10	93	13	1
256	2023-03-05	48	45	2
257	2023-06-01	31	36	9
258	2023-11-01	23	34	5
259	2023-04-02	15	24	2
260	2023-08-05	96	22	10
261	2023-09-28	62	21	2
262	2023-10-25	3	5	9
263	2023-03-05	25	39	3
264	2023-06-21	38	31	6
265	2023-08-29	43	48	4
266	2023-06-02	69	8	8
267	2023-11-05	41	22	4
268	2023-07-22	42	50	6
269	2023-01-30	48	43	6
270	2023-12-24	94	50	4
271	2023-10-22	64	27	5
272	2023-12-11	36	28	9
273	2023-03-01	42	1	1
274	2023-08-22	21	36	4
275	2023-06-03	54	10	8
276	2023-05-24	84	21	6
277	2023-10-16	49	38	9
278	2023-09-08	94	14	2
279	2023-05-16	80	22	5
280	2023-12-14	15	20	7
281	2023-06-01	22	34	2
282	2023-03-19	74	45	9
283	2023-10-04	51	13	2
284	2023-08-20	98	20	8
285	2023-12-28	2	50	1
286	2023-08-08	53	35	6
287	2023-02-13	26	26	10
288	2023-07-18	83	21	1
289	2023-07-26	99	36	5
290	2023-02-11	12	38	5
291	2023-12-24	60	23	7
292	2023-05-02	32	23	5
293	2023-06-22	11	32	3
294	2023-02-24	31	29	7
295	2023-07-20	2	12	5
296	2023-12-14	46	15	1
297	2023-10-16	76	22	7
298	2023-10-31	56	31	2
299	2023-05-23	64	44	3
300	2023-07-28	84	4	1
301	2023-07-16	90	47	5
302	2023-12-09	30	29	3
303	2023-12-16	88	40	4
304	2023-09-09	30	50	1
305	2023-12-13	89	10	6
306	2023-11-17	6	2	9
307	2023-10-21	27	34	1
308	2023-04-14	81	34	4
309	2023-11-04	9	15	2
310	2023-05-09	50	23	4
311	2023-08-19	98	41	6
312	2023-03-09	37	3	4
313	2023-01-31	26	30	9
314	2023-05-11	17	12	9
315	2023-02-11	42	4	2
316	2023-02-11	79	9	1
317	2023-03-13	14	8	8
318	2023-06-01	46	14	5
319	2023-05-04	73	2	6
320	2023-12-01	75	36	10
321	2023-12-18	52	22	2
322	2023-02-10	30	6	10
323	2023-09-25	7	23	3
324	2023-10-12	94	9	3
325	2023-10-07	70	16	3
326	2023-07-25	94	8	3
327	2023-12-15	27	43	4
328	2023-02-11	87	11	10
329	2023-09-08	12	42	4
330	2023-10-27	95	14	1
331	2023-03-31	20	37	4
332	2023-12-14	53	7	3
333	2023-06-27	28	2	4
334	2023-10-04	50	50	9
335	2023-01-13	37	37	2
336	2023-02-11	59	5	10
337	2023-04-20	61	16	7
338	2023-05-07	59	46	1
339	2023-05-13	3	27	6
340	2023-07-16	19	2	4
341	2023-10-15	36	45	3
342	2023-10-20	23	20	2
343	2023-05-07	46	27	7
344	2023-08-01	87	19	9
345	2023-11-26	54	41	3
346	2023-03-07	92	16	10
347	2023-05-16	85	19	8
348	2023-11-29	81	41	4
349	2023-03-30	28	47	7
350	2023-01-23	60	39	10
351	2023-04-23	57	31	7
352	2023-02-19	25	14	6
353	2023-11-05	53	17	5
354	2023-09-09	13	32	8
355	2023-11-18	7	21	6
356	2023-09-22	27	7	3
357	2023-11-19	54	47	6
358	2023-04-03	3	39	10
359	2023-10-15	77	3	9
360	2023-06-21	70	41	8
361	2023-07-23	10	13	4
362	2023-03-30	26	43	8
363	2023-09-26	29	26	4
364	2023-09-12	81	1	10
365	2023-07-18	1	21	2
366	2023-05-21	27	20	10
367	2023-12-28	84	45	9
368	2023-04-09	82	18	5
369	2023-10-04	61	17	9
370	2023-09-16	59	8	5
371	2023-05-25	61	49	10
372	2023-02-28	55	36	6
373	2023-01-15	36	17	1
374	2023-01-06	98	19	7
375	2023-03-04	52	24	5
376	2023-11-27	43	42	2
377	2023-03-12	39	37	10
378	2023-01-01	21	40	2
379	2023-03-28	1	21	7
380	2023-01-17	79	1	6
381	2023-12-19	58	44	1
382	2023-09-09	84	31	2
383	2023-10-31	80	48	7
384	2023-10-06	37	9	2
385	2023-03-31	75	19	1
386	2023-05-25	86	42	6
387	2023-01-21	65	44	10
388	2023-08-26	41	12	4
389	2023-08-24	60	17	8
390	2023-06-25	82	47	10
391	2023-01-16	90	8	3
392	2023-03-02	63	2	3
393	2023-09-01	26	29	8
394	2023-03-13	4	3	10
395	2023-01-18	18	3	7
396	2023-02-08	69	31	3
397	2023-04-07	6	4	8
398	2023-04-12	12	34	9
399	2023-05-06	65	45	1
400	2023-02-17	59	36	5
401	2023-08-03	66	50	5
402	2023-05-11	99	13	9
403	2023-02-07	2	27	10
404	2023-11-20	70	39	9
405	2023-11-19	91	3	1
406	2023-04-17	98	47	10
407	2023-02-25	9	21	2
408	2023-07-04	20	13	5
409	2023-07-05	10	34	2
410	2023-04-14	25	38	2
411	2023-11-10	79	9	5
412	2023-06-24	55	14	4
413	2023-02-27	55	38	1
414	2023-12-11	13	42	2
415	2023-07-06	73	45	8
416	2023-09-23	65	39	10
417	2023-11-02	77	30	10
418	2023-08-20	10	3	7
419	2023-05-18	100	10	9
420	2023-10-14	95	47	9
421	2023-10-13	72	3	1
422	2023-06-02	38	1	1
423	2023-04-26	84	34	2
424	2023-07-10	95	23	5
425	2023-09-13	84	29	8
426	2023-05-05	39	37	3
427	2023-09-06	67	16	10
428	2023-11-13	42	20	3
429	2023-11-10	1	45	9
430	2023-12-05	8	31	6
431	2023-04-03	59	28	7
432	2023-05-06	87	27	8
433	2023-01-14	9	43	7
434	2023-07-03	27	8	1
435	2023-02-13	11	33	9
436	2023-06-26	47	23	9
437	2023-11-26	94	10	2
438	2023-05-05	15	25	9
439	2023-07-26	41	13	5
440	2023-03-06	18	6	1
441	2023-06-19	87	8	3
442	2023-10-06	98	7	1
443	2023-02-07	97	30	3
444	2023-09-23	22	49	2
445	2023-01-19	1	38	2
446	2023-05-26	17	3	3
447	2023-08-03	64	25	10
448	2023-07-16	13	9	5
449	2023-09-24	27	27	10
450	2023-05-12	50	43	3
451	2023-12-25	71	31	5
452	2023-07-19	70	48	2
453	2023-03-17	84	28	9
454	2023-08-28	81	12	1
455	2023-03-24	55	23	4
456	2023-06-26	91	47	4
457	2023-10-04	70	45	5
458	2023-10-07	44	48	8
459	2023-07-07	1	33	10
460	2023-09-04	83	43	7
461	2023-10-15	91	24	3
462	2023-06-26	39	44	8
463	2023-08-31	75	22	3
464	2023-09-29	45	23	6
465	2023-10-02	16	20	7
466	2023-03-21	54	37	3
467	2023-12-01	98	39	6
468	2023-03-10	80	20	2
469	2023-08-05	93	36	3
470	2023-12-05	3	28	10
471	2023-02-25	96	46	1
472	2023-10-18	25	27	4
473	2023-02-22	55	3	1
474	2023-03-05	49	46	5
475	2023-05-22	95	16	9
476	2023-06-17	9	48	6
477	2023-03-05	79	27	5
478	2023-07-06	72	18	9
479	2023-06-28	42	1	10
480	2023-10-15	71	9	1
481	2023-11-20	27	9	7
482	2023-09-21	2	30	4
483	2023-01-23	6	21	2
484	2023-01-17	35	29	5
485	2023-07-22	3	3	1
486	2023-03-13	17	31	4
487	2023-03-05	46	5	6
488	2023-06-30	80	27	2
489	2023-01-12	66	10	10
490	2023-04-09	15	37	9
491	2023-08-26	19	46	3
492	2023-02-18	20	44	7
493	2023-03-01	30	18	7
494	2023-06-02	80	16	10
495	2023-07-26	4	9	1
496	2023-08-24	38	22	8
497	2023-08-31	16	26	2
498	2023-03-17	38	19	9
499	2023-08-16	17	5	5
500	2023-02-28	92	49	8
501	2023-10-09	59	26	6
502	2023-11-13	74	33	2
503	2023-12-01	74	31	2
504	2023-03-09	48	35	10
505	2023-07-04	36	22	8
506	2023-03-17	41	7	4
507	2023-12-14	71	15	10
508	2023-05-06	33	10	3
509	2023-04-18	53	44	6
510	2023-08-28	79	37	5
511	2023-05-25	24	37	1
512	2023-10-17	74	21	4
513	2023-03-26	85	12	8
514	2023-11-23	65	13	5
515	2023-06-16	23	23	2
516	2023-01-06	2	50	4
517	2023-08-11	74	35	2
518	2023-09-15	89	16	5
519	2023-01-25	92	14	6
520	2023-11-24	100	6	2
521	2023-04-12	95	32	5
522	2023-06-22	39	11	2
523	2023-07-13	66	31	5
524	2023-01-14	61	21	1
525	2023-01-29	80	30	2
526	2023-12-06	59	10	8
527	2023-09-10	20	29	8
528	2023-06-13	72	37	10
529	2023-01-25	13	30	9
530	2023-02-24	15	19	4
531	2023-03-01	75	15	2
532	2023-06-13	21	7	2
533	2023-12-19	52	46	2
534	2023-03-09	61	13	4
535	2023-06-27	33	42	5
536	2023-09-14	72	21	10
537	2023-10-13	48	33	2
538	2023-01-16	93	10	4
539	2023-06-19	71	28	6
540	2023-11-29	21	39	8
541	2023-09-16	19	1	4
542	2023-11-13	59	21	6
543	2023-03-19	83	7	8
544	2023-07-10	57	14	5
545	2023-11-08	77	30	5
546	2023-04-06	88	46	2
547	2023-08-21	92	18	3
548	2023-10-10	94	42	7
549	2023-12-24	27	36	4
550	2023-02-08	23	37	4
551	2023-10-23	20	24	3
552	2023-10-26	77	31	2
553	2023-12-07	9	43	1
554	2023-08-26	12	12	3
555	2023-02-04	59	18	1
556	2023-03-28	20	50	9
557	2023-02-08	95	28	6
558	2023-02-09	31	32	6
559	2023-09-19	76	47	1
560	2023-01-21	38	10	10
561	2023-01-11	96	19	1
562	2023-01-10	83	1	1
563	2023-04-01	83	2	10
564	2023-01-17	82	46	8
565	2023-02-27	44	8	3
566	2023-04-09	15	33	9
567	2023-05-09	69	4	5
568	2023-03-24	45	2	7
569	2023-01-04	69	41	7
570	2023-09-18	35	21	2
571	2023-06-04	74	50	10
572	2023-03-30	27	10	4
573	2023-08-29	65	27	1
574	2023-03-09	21	31	3
575	2023-08-09	80	6	10
576	2023-09-20	7	25	6
577	2023-11-04	63	1	6
578	2023-04-29	99	26	8
579	2023-05-21	29	29	6
580	2023-04-16	35	10	3
581	2023-12-17	18	6	3
582	2023-02-18	17	7	3
583	2023-12-26	32	49	1
584	2023-07-10	60	25	6
585	2023-03-10	97	39	1
586	2023-09-12	47	46	3
587	2023-08-25	57	40	6
588	2023-02-24	23	36	9
589	2023-03-24	59	22	1
590	2023-04-28	90	41	4
591	2023-10-21	15	21	1
592	2023-05-04	29	27	6
593	2023-09-26	32	22	2
594	2023-01-17	26	33	7
595	2023-05-03	52	44	3
596	2023-12-25	73	14	2
597	2023-03-12	53	47	8
598	2023-10-01	83	1	5
599	2023-07-08	26	37	2
600	2023-10-14	98	34	1
601	2023-11-04	93	5	3
602	2023-08-21	60	31	6
603	2023-05-31	49	21	9
604	2023-04-18	22	28	8
605	2023-10-13	66	33	9
606	2023-10-11	54	32	5
607	2023-02-16	98	33	10
608	2023-02-27	42	14	9
609	2023-12-30	39	31	3
610	2023-03-04	91	37	7
611	2023-11-15	36	39	2
612	2023-07-02	57	47	4
613	2023-04-19	80	25	10
614	2023-09-05	97	21	1
615	2023-12-09	5	19	7
616	2023-02-07	65	42	8
617	2023-01-13	95	13	10
618	2023-12-28	47	39	8
619	2023-09-04	15	18	6
620	2023-04-19	35	23	6
621	2023-10-05	49	49	8
622	2023-10-29	29	34	3
623	2023-06-12	94	28	9
624	2023-09-06	32	8	10
625	2023-10-30	77	39	4
626	2023-07-27	97	2	8
627	2023-06-26	20	35	2
628	2023-12-08	83	22	5
629	2023-10-21	80	44	3
630	2023-10-03	89	13	4
631	2023-05-21	58	29	9
632	2023-02-15	43	33	2
633	2023-09-29	59	21	10
634	2023-02-26	87	35	6
635	2023-02-23	36	46	10
636	2023-04-23	69	3	4
637	2023-08-24	10	15	8
638	2023-02-11	47	4	1
639	2023-11-12	81	19	8
640	2023-10-15	78	37	1
641	2023-02-12	74	25	8
642	2023-11-10	94	30	7
643	2023-08-11	46	17	7
644	2023-09-14	52	34	5
645	2023-10-26	87	10	4
646	2023-05-17	93	25	9
647	2023-12-12	100	24	8
648	2023-06-25	6	21	7
649	2023-02-23	48	31	2
650	2023-06-05	92	48	9
651	2023-04-12	71	20	4
652	2023-01-23	11	24	9
653	2023-08-07	46	4	7
654	2023-09-24	21	37	3
655	2023-06-10	72	17	5
656	2023-01-03	19	48	5
657	2023-06-15	88	37	10
658	2023-06-23	19	19	4
659	2023-03-22	56	9	7
660	2023-04-15	57	50	9
661	2023-01-09	18	20	2
662	2023-09-07	82	32	2
663	2023-11-20	78	17	4
664	2023-07-15	32	7	4
665	2023-03-27	76	3	9
666	2023-10-15	69	21	4
667	2023-05-06	88	34	2
668	2023-12-01	29	47	3
669	2023-07-26	16	15	5
670	2023-06-12	42	46	6
671	2023-01-09	24	20	7
672	2023-08-05	53	21	6
673	2023-01-31	59	40	3
674	2023-01-20	24	19	7
675	2023-05-29	55	44	7
676	2023-11-05	77	49	10
677	2023-11-01	20	27	8
678	2023-06-26	55	18	9
679	2023-04-03	89	17	6
680	2023-05-06	76	15	7
681	2023-11-06	44	26	9
682	2023-09-26	27	50	5
683	2023-08-13	90	5	9
684	2023-03-09	46	12	10
685	2023-06-05	12	26	9
686	2023-08-08	79	1	2
687	2023-04-30	18	44	4
688	2023-11-27	70	40	7
689	2023-11-13	28	20	9
690	2023-01-30	63	33	6
691	2023-12-03	92	31	5
692	2023-12-19	83	40	9
693	2023-03-16	90	32	1
694	2023-05-17	77	22	10
695	2023-07-04	83	29	5
696	2023-08-01	98	49	10
697	2023-02-13	88	40	1
698	2023-09-25	45	2	5
699	2023-04-06	32	37	4
700	2023-04-10	6	28	10
701	2023-11-15	76	18	6
702	2023-10-12	62	2	10
703	2023-10-04	54	18	8
704	2023-06-29	92	37	9
705	2023-04-27	9	36	7
706	2023-03-24	94	31	3
707	2023-05-09	35	38	8
708	2023-02-06	12	46	4
709	2023-07-02	92	9	6
710	2023-08-08	59	26	9
711	2023-07-13	58	19	6
712	2023-02-11	90	6	2
713	2023-09-16	32	5	6
714	2023-07-18	22	13	7
715	2023-01-07	99	28	8
716	2023-01-03	47	32	10
717	2023-04-21	22	7	8
718	2023-09-24	38	25	1
719	2023-02-01	40	44	3
720	2023-04-20	62	24	10
721	2023-09-02	30	31	2
722	2023-01-12	60	49	4
723	2023-09-02	97	3	5
724	2023-09-08	88	49	5
725	2023-07-08	21	27	5
726	2023-06-02	1	17	1
727	2023-12-13	59	4	7
728	2023-05-29	14	7	3
729	2023-02-12	15	4	2
730	2023-12-06	70	36	7
731	2023-09-02	64	2	3
732	2023-05-07	90	47	9
733	2023-07-24	48	3	9
734	2023-09-05	35	13	7
735	2023-08-16	77	3	1
736	2023-12-20	99	6	10
737	2023-02-20	80	35	4
738	2023-05-11	41	20	5
739	2023-05-10	32	6	6
740	2023-08-02	39	20	6
741	2023-02-28	31	17	3
742	2023-07-09	25	48	4
743	2023-09-23	41	49	8
744	2023-10-31	35	18	8
745	2023-08-20	25	10	8
746	2023-01-24	26	50	4
747	2023-08-04	8	50	9
748	2023-06-10	22	42	10
749	2023-01-15	95	39	4
750	2023-10-29	88	38	1
751	2023-08-27	9	5	9
752	2023-08-07	48	46	7
753	2023-03-19	62	8	8
754	2023-04-03	47	43	3
755	2023-01-14	71	43	7
756	2023-10-29	81	13	1
757	2023-10-24	40	43	8
758	2023-07-16	42	38	6
759	2023-04-07	94	7	6
760	2023-08-03	48	21	10
761	2023-03-19	85	26	10
762	2023-06-17	34	36	10
763	2023-12-29	34	10	8
764	2023-11-09	54	10	10
765	2023-03-25	92	25	9
766	2023-06-08	94	6	4
767	2023-05-11	10	30	2
768	2023-06-24	8	32	1
769	2023-12-18	81	35	2
770	2023-11-17	4	49	8
771	2023-03-15	13	16	8
772	2023-07-28	47	38	5
773	2023-05-07	85	37	8
774	2023-09-22	96	3	2
775	2023-07-14	12	35	3
776	2023-09-24	74	3	5
777	2023-12-27	74	8	8
778	2023-05-24	4	3	3
779	2023-09-20	92	20	10
780	2023-05-08	51	20	4
781	2023-05-03	15	22	10
782	2023-10-18	79	42	2
783	2023-06-29	50	23	6
784	2023-06-20	92	10	7
785	2023-07-19	10	19	8
786	2023-09-28	41	31	2
787	2023-05-11	69	45	9
788	2023-05-13	94	16	10
789	2023-04-30	88	27	2
790	2023-05-23	50	8	1
791	2023-04-20	57	32	1
792	2023-12-03	60	28	9
793	2023-07-06	24	45	8
794	2023-04-17	12	13	9
795	2023-04-06	48	22	1
796	2023-04-11	14	37	5
797	2023-05-29	89	6	2
798	2023-09-03	26	3	5
799	2023-04-19	8	10	4
800	2023-10-03	34	6	2
801	2023-11-30	94	15	3
802	2023-03-29	56	42	2
803	2023-08-01	81	20	4
804	2023-10-22	89	24	5
805	2023-08-27	74	14	8
806	2023-05-26	2	35	5
807	2023-08-31	23	30	2
808	2023-08-23	46	24	3
809	2023-03-27	19	46	5
810	2023-09-14	81	42	10
811	2023-01-01	83	31	1
812	2023-01-27	24	24	10
813	2023-06-12	5	36	8
814	2023-01-21	30	38	9
815	2023-07-30	27	27	2
816	2023-12-19	21	1	4
817	2023-04-02	19	11	6
818	2023-12-18	90	5	9
819	2023-04-01	85	34	1
820	2023-07-26	39	49	10
821	2023-05-16	55	18	5
822	2023-10-29	32	8	10
823	2023-06-08	18	33	7
824	2023-11-15	21	43	6
825	2023-12-03	86	44	2
826	2023-12-04	48	38	2
827	2023-04-21	94	33	6
828	2023-09-25	74	3	10
829	2023-12-01	56	23	8
830	2023-05-29	11	14	3
831	2023-06-22	95	41	8
832	2023-01-26	25	46	5
833	2023-01-05	5	8	9
834	2023-12-04	43	2	9
835	2023-10-04	74	17	10
836	2023-06-09	42	47	9
837	2023-04-29	39	14	5
838	2023-11-12	51	23	3
839	2023-08-08	88	16	9
840	2023-04-02	84	18	7
841	2023-03-20	75	22	8
842	2023-09-22	99	18	9
843	2023-08-01	54	46	3
844	2023-03-22	9	21	7
845	2023-12-11	92	2	1
846	2023-04-14	93	5	9
847	2023-07-29	52	25	2
848	2023-04-13	20	17	4
849	2023-06-08	77	9	4
850	2023-02-22	34	50	6
851	2023-08-06	66	35	6
852	2023-05-29	15	48	6
853	2023-08-03	95	38	7
854	2023-11-06	40	17	4
855	2023-12-15	54	29	3
856	2023-08-28	57	12	2
857	2023-08-22	53	18	5
858	2023-07-27	59	41	4
859	2023-07-07	57	35	10
860	2023-11-22	32	5	1
861	2023-10-09	25	34	1
862	2023-11-22	26	14	3
863	2023-06-10	17	8	3
864	2023-12-11	72	26	6
865	2023-11-14	24	25	5
866	2023-11-11	93	8	1
867	2023-07-20	98	3	8
868	2023-05-03	5	41	6
869	2023-03-15	87	47	5
870	2023-02-10	4	5	1
871	2023-02-08	50	23	7
872	2023-12-10	38	49	1
873	2023-07-16	38	28	3
874	2023-01-27	34	35	3
875	2023-04-27	33	48	5
876	2023-04-08	30	30	7
877	2023-04-14	58	38	8
878	2023-02-10	1	17	8
879	2023-03-22	65	35	3
880	2023-09-19	7	32	6
881	2023-09-12	98	18	7
882	2023-09-29	75	2	4
883	2023-08-20	23	42	6
884	2023-03-04	26	25	7
885	2023-01-13	32	11	4
886	2023-09-15	47	7	7
887	2023-06-17	14	6	3
888	2023-02-26	32	32	5
889	2023-02-26	91	37	10
890	2023-10-08	4	32	1
891	2023-10-22	1	24	6
892	2023-03-29	4	24	5
893	2023-07-27	8	25	1
894	2023-03-17	57	22	4
895	2023-06-07	2	2	4
896	2023-09-27	63	39	9
897	2023-08-30	99	27	5
898	2023-06-22	86	50	7
899	2023-02-23	38	8	6
900	2023-09-27	57	50	6
901	2023-06-20	83	7	6
902	2023-12-22	6	5	2
903	2023-02-13	17	21	1
904	2023-11-25	18	3	10
905	2023-01-14	74	7	3
906	2023-05-24	87	42	4
907	2023-11-06	64	2	5
908	2023-01-13	69	13	9
909	2023-05-24	63	46	9
910	2023-09-19	73	31	10
911	2023-08-07	51	30	10
912	2023-03-24	29	28	5
913	2023-05-19	38	38	6
914	2023-08-12	52	8	7
915	2023-07-06	29	43	3
916	2023-05-25	58	33	3
917	2023-11-06	6	13	1
918	2023-06-03	16	40	4
919	2023-12-25	37	40	4
920	2023-04-30	1	35	1
921	2023-01-06	44	37	5
922	2023-09-17	98	24	3
923	2023-09-09	22	24	1
924	2023-12-22	55	4	1
925	2023-11-06	21	33	10
926	2023-04-17	13	19	1
927	2023-06-17	90	32	4
928	2023-06-07	81	6	2
929	2023-07-18	19	39	10
930	2023-07-29	53	17	2
931	2023-03-03	6	49	2
932	2023-08-13	23	37	7
933	2023-12-21	81	22	2
934	2023-05-01	5	46	7
935	2023-07-26	53	25	10
936	2023-04-11	44	48	9
937	2023-07-03	39	20	1
938	2023-02-26	76	49	8
939	2023-12-29	70	5	7
940	2023-08-24	58	18	2
941	2023-08-12	77	17	3
942	2023-09-29	59	19	10
943	2023-12-20	95	45	7
944	2023-10-17	17	36	4
945	2023-08-04	89	5	7
946	2023-03-12	25	6	2
947	2023-05-26	98	41	4
948	2023-06-03	40	32	10
949	2023-02-25	32	1	8
950	2023-07-22	6	36	9
951	2023-08-11	100	3	10
952	2023-12-24	19	42	1
953	2023-02-01	34	28	1
954	2023-05-27	51	47	10
955	2023-01-22	30	21	5
956	2023-06-02	23	34	1
957	2023-04-04	44	18	6
958	2023-07-26	65	4	4
959	2023-02-01	100	11	10
960	2023-04-01	26	1	4
961	2023-02-28	17	19	5
962	2023-10-14	58	50	7
963	2023-11-19	44	37	5
964	2023-08-10	47	23	3
965	2023-12-04	49	6	9
966	2023-05-29	9	14	9
967	2023-11-26	12	6	7
968	2023-02-17	52	44	2
969	2023-01-10	76	34	10
970	2023-05-05	49	18	8
971	2023-03-23	60	38	7
972	2023-07-29	54	23	5
973	2023-04-25	20	45	1
974	2023-02-24	21	41	3
975	2023-05-22	88	7	2
976	2023-08-25	31	44	7
977	2023-02-14	12	37	2
978	2023-08-07	40	15	8
979	2023-01-31	51	49	8
980	2023-11-06	22	7	2
981	2023-05-04	39	46	3
982	2023-07-02	24	2	2
983	2023-03-24	69	3	1
984	2023-07-06	20	37	9
985	2023-10-23	1	40	4
986	2023-02-16	78	20	2
987	2023-08-13	15	20	3
988	2023-09-03	64	36	9
989	2023-01-11	11	48	2
990	2023-08-22	67	29	7
991	2023-11-09	74	34	4
992	2023-10-05	49	46	5
993	2023-06-11	13	49	4
994	2023-01-24	56	4	9
995	2023-06-21	48	20	8
996	2023-07-03	23	47	4
997	2023-04-07	87	34	1
998	2023-11-06	49	21	3
999	2023-06-22	99	50	4
1000	2023-04-12	70	39	6
\.


--
-- TOC entry 4528 (class 0 OID 58471)
-- Dependencies: 267
-- Data for Name: prod_categorias; Type: TABLE DATA; Schema: innova; Owner: g3wsuite
--

COPY innova.prod_categorias (id, nombre) FROM stdin;
1	Ropa
2	Hogar
3	Juguete
4	Electrónica
\.


--
-- TOC entry 4526 (class 0 OID 58463)
-- Dependencies: 265
-- Data for Name: products; Type: TABLE DATA; Schema: innova; Owner: g3wsuite
--

COPY innova.products (id, nombre, precio, categoria) FROM stdin;
1	Prod_HWCBYIXTYM	17.7224636	3
2	Prod_NZRFVMLYWH	369.635406	2
3	Prod_OMPHLJZNSU	26.2439442	3
4	Prod_UQQFIRAGRU	441.161041	2
5	Prod_YYIDGYPEHD	145.422211	3
6	Prod_UOZYIWFAYY	92.9930038	4
7	Prod_UEAEXMZDAI	281.674316	1
8	Prod_XOVJGEFIJC	402.268433	3
9	Prod_CZQYGEQIMV	472.158905	4
10	Prod_YQVGCPUEWG	395.768616	3
11	Prod_IYWEMHLEMR	409.319122	3
12	Prod_QMGPITLWBX	12.4791851	1
13	Prod_BFPFMJBSFE	67.0981445	2
14	Prod_OPCLTJCDYB	215.062393	2
15	Prod_XYDCSXVHJG	474.852936	1
16	Prod_DOFKDYCMVQ	12.2877913	1
17	Prod_YFTDKIZRRM	243.695267	4
18	Prod_ZVIEXMGKYB	29.1256676	1
19	Prod_FOXCKYLOST	176.855865	2
20	Prod_WOWMPKEDCC	122.214684	1
21	Prod_BPGAGWCVIE	97.1801758	4
22	Prod_EFTOMXJZSK	76.9411697	4
23	Prod_XCWPENGDVY	417.874817	3
24	Prod_XPYBZUYJHV	440.864624	2
25	Prod_XYOAZZQZPJ	449.410126	1
26	Prod_VBZAVXXQSW	273.783844	2
27	Prod_OMFAITWTMF	175.281998	4
28	Prod_AGLFJTILKD	161.938766	2
29	Prod_KPAJQTTKYX	493.673218	4
30	Prod_LHJGILAURC	427.617157	3
31	Prod_DNMZDUBAZU	31.2243137	1
32	Prod_IFIPPFQPDQ	215.028625	1
33	Prod_THSVBECEFN	177.253113	2
34	Prod_VOLCAVCKJI	401.339508	4
35	Prod_TJGBHEOQQJ	47.0767059	3
36	Prod_KBPAKAERJL	191.671768	1
37	Prod_TVBPMNCHAG	116.454681	3
38	Prod_UJHVHXSPQU	387.307495	2
39	Prod_CJFSAQJSZG	47.1823387	4
40	Prod_SBTCZEVNCJ	270.348358	3
41	Prod_JVTCZYDHCR	454.413605	1
42	Prod_DCGOXRQOVX	231.707336	4
43	Prod_IOBZOJAXRK	362.435547	3
44	Prod_VKWGTFQGKW	82.7749634	2
45	Prod_NIEJWDETMP	117.106941	3
46	Prod_TJXCYIJUAL	448.854645	3
47	Prod_HXWTYSFQYD	408.631256	4
48	Prod_QXZAIYFZUT	308.293488	1
49	Prod_ARHXBTGOMR	366.029938	3
50	Prod_EQFOYWAPPZ	32.7600136	1
\.


--
-- TOC entry 4540 (class 0 OID 60620)
-- Dependencies: 279
-- Data for Name: dm_compras_mensuales_clientes_top10; Type: TABLE DATA; Schema: innova_dm; Owner: g3wsuite
--

COPY innova_dm.dm_compras_mensuales_clientes_top10 (id, customer, anio, mes, cantidad_productos, cantidad_compras, facturado) FROM stdin;
1	Fernando García	2023	2	11	3	3964.86523
2	Fernando García	2023	4	18	2	4215.93896
3	Fernando García	2023	5	9	1	3261.91992
4	Fernando García	2023	6	9	1	2464.05469
5	Fernando García	2023	7	3	1	141.230118
6	Fernando García	2023	8	13	2	4123.75
7	Fernando García	2023	9	4	1	926.829346
8	Fernando García	2023	10	4	1	709.012451
9	Fernando García	2023	11	7	1	650.95105
10	Fernando García	2023	12	3	1	485.816284
11	Fernando López	2023	1	14	2	859.710815
12	Fernando López	2023	2	6	1	971.632568
13	Fernando López	2023	4	5	1	1075.14307
14	Fernando López	2023	5	9	1	110.590118
15	Fernando López	2023	6	8	1	3635.30884
16	Fernando López	2023	7	5	1	2089.37402
17	Fernando López	2023	8	7	1	2711.15234
18	Fernando López	2023	10	19	3	4496.62695
19	Fernando López	2023	12	7	1	819.748596
20	Fernando Martínez	2023	1	3	1	811.045044
21	Fernando Martínez	2023	2	16	3	2441.70654
22	Fernando Martínez	2023	3	1	1	76.9411697
23	Fernando Martínez	2023	4	7	1	1133.57141
24	Fernando Martínez	2023	5	1	1	448.854645
25	Fernando Martínez	2023	7	11	2	2001.36206
26	Fernando Martínez	2023	8	9	1	2464.05469
27	Fernando Martínez	2023	9	25	3	4751.70264
28	Fernando Martínez	2023	10	6	1	1642.70312
29	Fernando Martínez	2023	11	6	1	583.081055
30	Fernando Martínez	2023	12	15	2	6254.27637
31	Jorge Cruz	2023	1	7	1	1237.99109
32	Jorge Cruz	2023	2	10	1	1772.53113
33	Jorge Cruz	2023	4	10	1	4086.3125
34	Jorge Cruz	2023	5	12	2	5452.96338
35	Jorge Cruz	2023	7	8	1	209.951553
36	Jorge Cruz	2023	8	24	3	7364.49854
37	Jorge Cruz	2023	9	10	2	1526.47351
38	Jorge Cruz	2023	10	8	3	2373.05957
39	Jorge Cruz	2023	12	6	1	283.094025
40	Jorge García	2023	1	7	1	3086.05225
41	Jorge García	2023	3	16	3	4812.46582
42	Jorge García	2023	4	6	1	496.64978
43	Jorge García	2023	7	13	3	5422.35645
44	Jorge García	2023	8	27	4	5097.48242
45	Jorge García	2023	11	5	1	1218.47632
46	Jorge García	2023	12	10	2	2085.79468
47	Juan González	2023	1	8	1	3269.05005
48	Juan González	2023	3	11	2	5206.3125
49	Juan González	2023	5	17	2	1107.62695
50	Juan González	2023	8	9	1	262.131012
51	Juan González	2023	10	22	3	8658.28027
52	Juan González	2023	11	10	2	2183.979
53	Juan González	2023	12	9	1	836.937012
54	Manuel Cruz	2023	1	4	1	1710.46863
55	Manuel Cruz	2023	2	11	2	2817.88354
56	Manuel Cruz	2023	3	9	2	2917.20679
57	Manuel Cruz	2023	6	25	3	6548.03418
58	Manuel Cruz	2023	7	20	3	4683.19189
59	Manuel Cruz	2023	11	3	1	366.644043
60	Manuel Cruz	2023	12	7	1	579.424744
61	Manuel Hernández	2023	1	3	1	845.022949
62	Manuel Hernández	2023	2	14	2	4153.23926
63	Manuel Hernández	2023	3	9	1	1053.96252
64	Manuel Hernández	2023	6	10	1	327.600128
65	Manuel Hernández	2023	8	10	2	1814.65259
66	Manuel Hernández	2023	9	15	2	393.65918
67	Manuel Hernández	2023	10	14	2	2825.67334
68	Manuel Hernández	2023	11	6	2	1959.86426
69	Manuel Hernández	2023	12	10	2	3280.59619
70	Manuel Rodríguez	2023	1	6	1	1290.37439
71	Manuel Rodríguez	2023	2	8	1	2928.2395
72	Manuel Rodríguez	2023	3	26	3	4706.15723
73	Manuel Rodríguez	2023	6	25	3	6593.11426
74	Manuel Rodríguez	2023	7	6	1	2832.95337
75	Manuel Rodríguez	2023	8	3	1	87.3769989
76	Manuel Rodríguez	2023	9	10	1	1222.14685
77	Manuel Rodríguez	2023	12	6	2	525.756958
78	Miguel Rodríguez	2023	2	10	1	312.243134
79	Miguel Rodríguez	2023	3	1	1	273.783844
80	Miguel Rodríguez	2023	5	2	1	350.563995
81	Miguel Rodríguez	2023	6	15	2	2383.02319
82	Miguel Rodríguez	2023	7	9	1	262.131012
83	Miguel Rodríguez	2023	8	10	1	471.823395
84	Miguel Rodríguez	2023	9	18	2	1070.10413
85	Miguel Rodríguez	2023	10	1	1	26.2439442
86	Miguel Rodríguez	2023	11	9	1	262.131012
87	Miguel Rodríguez	2023	12	6	1	1642.70312
\.


--
-- TOC entry 4542 (class 0 OID 60634)
-- Dependencies: 281
-- Data for Name: dm_evolucion_mensual_ventas_region; Type: TABLE DATA; Schema: innova_dm; Owner: g3wsuite
--

COPY innova_dm.dm_evolucion_mensual_ventas_region (id, cantidad_ventas, cantidad_productos_vendidos, productos_por_venta, total_facturado, ubicacion, anio, mes) FROM stdin;
1	14	83	5.92857122	27639.2715	Morelia	2023	1
2	10	50	5	8943.07227	Puebla	2023	1
3	10	64	6.4000001	18889.209	Tijuana	2023	1
4	8	43	5.375	10134.4668	Cancún	2023	1
5	7	47	6.71428585	13811.876	Mérida	2023	1
6	7	45	6.42857122	14925.6113	Ciudad de México	2023	1
7	6	38	6.33333349	14314.8672	León	2023	1
8	6	33	5.5	5760.68164	Guadalajara	2023	1
9	5	17	3.4000001	4109.2793	Monterrey	2023	1
10	3	16	5.33333349	2899.9375	Querétaro	2023	1
11	13	42	3.23076916	11504.1416	León	2023	2
12	12	71	5.91666651	13587.0879	Mérida	2023	2
13	10	65	6.5	11963.2363	Puebla	2023	2
14	9	48	5.33333349	12261.7041	Cancún	2023	2
15	9	41	4.55555534	10151.5801	Morelia	2023	2
16	7	22	3.14285707	2527.46777	Ciudad de México	2023	2
17	6	37	6.16666651	10846.7656	Querétaro	2023	2
18	6	29	4.83333349	7921.49219	Guadalajara	2023	2
19	5	19	3.79999995	3769.14795	Tijuana	2023	2
20	1	8	8	2928.2395	Monterrey	2023	2
21	15	74	4.9333334	20578.8359	Tijuana	2023	3
22	12	72	6	14779.2598	Morelia	2023	3
23	11	64	5.81818199	13377.8984	Puebla	2023	3
24	11	64	5.81818199	11071.3125	León	2023	3
25	10	57	5.69999981	9824.95605	Guadalajara	2023	3
26	8	46	5.75	7460.85938	Cancún	2023	3
27	8	49	6.125	8777.96875	Monterrey	2023	3
28	7	36	5.14285707	9830.29785	Ciudad de México	2023	3
29	6	27	4.5	6073.30566	Mérida	2023	3
30	2	10	5	3209.78271	Querétaro	2023	3
31	16	104	6.5	24232.0684	Morelia	2023	4
32	13	73	5.61538458	19237.6406	Puebla	2023	4
33	11	60	5.4545455	13035.958	León	2023	4
34	8	42	5.25	10973.4229	Guadalajara	2023	4
35	8	40	5	11887.2021	Mérida	2023	4
36	6	29	4.83333349	5459.31641	Ciudad de México	2023	4
37	6	29	4.83333349	6618.26318	Tijuana	2023	4
38	6	32	5.33333349	7028.91211	Cancún	2023	4
39	5	31	6.19999981	4913.65234	Monterrey	2023	4
40	2	20	10	1241.23511	Querétaro	2023	4
41	16	79	4.9375	16382.7217	Mérida	2023	5
42	15	93	6.19999981	25450.4297	León	2023	5
43	13	80	6.15384626	21384.5117	Morelia	2023	5
44	12	65	5.41666651	12914.9619	Guadalajara	2023	5
45	11	68	6.18181801	12432.2822	Tijuana	2023	5
46	9	39	4.33333349	8016.36963	Puebla	2023	5
47	4	22	5.5	8590.73242	Cancún	2023	5
48	4	25	6.25	8797.75195	Querétaro	2023	5
49	3	23	7.66666651	6937.44873	Ciudad de México	2023	5
50	1	5	5	611.073425	Monterrey	2023	5
51	15	104	6.9333334	22335.6211	Morelia	2023	6
52	12	64	5.33333349	14183.0986	Mérida	2023	6
53	11	62	5.63636351	7859.53564	León	2023	6
54	9	56	6.22222233	12816.3936	Monterrey	2023	6
55	9	39	4.33333349	8822.38672	Cancún	2023	6
56	7	34	4.85714293	9432.34277	Puebla	2023	6
57	6	22	3.66666675	2961.83545	Tijuana	2023	6
58	5	33	6.5999999	10477.0605	Ciudad de México	2023	6
59	4	26	6.5	6525.85791	Querétaro	2023	6
60	4	22	5.5	5335.2998	Guadalajara	2023	6
61	15	79	5.26666689	20568.3555	Tijuana	2023	7
62	14	78	5.57142878	20719.3379	Mérida	2023	7
63	12	61	5.08333349	9750.50195	Morelia	2023	7
64	11	62	5.63636351	15370.2754	León	2023	7
65	10	57	5.69999981	11859.7422	Puebla	2023	7
66	8	48	6	14416.2012	Ciudad de México	2023	7
67	7	36	5.14285707	8914.59375	Monterrey	2023	7
68	4	9	2.25	2697.11743	Querétaro	2023	7
69	4	11	2.75	2889.44873	Guadalajara	2023	7
70	4	8	2	3172.68115	Cancún	2023	7
71	17	98	5.76470566	26906.3535	Puebla	2023	8
72	13	84	6.46153831	19019.7559	Tijuana	2023	8
73	11	58	5.27272749	9676.00684	Cancún	2023	8
74	10	69	6.9000001	17935.3457	Morelia	2023	8
75	9	42	4.66666651	9075.37012	Guadalajara	2023	8
76	8	52	6.5	9763.39844	León	2023	8
77	7	49	7	12099.0156	Mérida	2023	8
78	6	36	6	7763.45703	Ciudad de México	2023	8
79	4	15	3.75	1784.34216	Monterrey	2023	8
80	4	30	7.5	2957.83984	Querétaro	2023	8
81	18	93	5.16666651	16919.3184	Mérida	2023	9
82	14	85	6.07142878	15774.9082	Puebla	2023	9
83	12	63	5.25	16365.8633	León	2023	9
84	7	34	4.85714293	7781.77881	Morelia	2023	9
85	6	35	5.83333349	8008.0625	Tijuana	2023	9
86	6	34	5.66666651	5140.55713	Guadalajara	2023	9
87	6	40	6.66666651	7485.03223	Monterrey	2023	9
88	5	30	6	961.807739	Cancún	2023	9
89	3	12	4	770.186707	Querétaro	2023	9
90	1	2	2	430.057251	Ciudad de México	2023	9
91	16	71	4.4375	17099.0098	Puebla	2023	10
92	11	60	5.4545455	14036.2979	Mérida	2023	10
93	9	46	5.11111116	16161.6201	Tijuana	2023	10
94	9	44	4.88888884	10480.7393	Guadalajara	2023	10
95	9	34	3.77777767	7776.3418	Cancún	2023	10
96	8	39	4.875	3610.0874	Ciudad de México	2023	10
97	7	37	5.28571415	8447.9082	Morelia	2023	10
98	7	32	4.57142878	5969.12158	León	2023	10
99	4	17	4.25	2108.97241	Monterrey	2023	10
100	3	22	7.33333349	2616.94824	Querétaro	2023	10
101	16	86	5.375	21365.0547	Cancún	2023	11
102	12	56	4.66666651	8288.14844	Morelia	2023	11
103	10	53	5.30000019	10684.8867	Tijuana	2023	11
104	9	69	7.66666651	19647.8242	Guadalajara	2023	11
105	9	49	5.44444466	11665.4736	Mérida	2023	11
106	9	51	5.66666651	13936.4531	Puebla	2023	11
107	8	46	5.75	13938.1367	Querétaro	2023	11
108	4	16	4	3031.73315	Ciudad de México	2023	11
109	4	22	5.5	6653.83447	León	2023	11
110	2	11	5.5	887.189453	Monterrey	2023	11
111	14	59	4.21428585	11980.8809	Mérida	2023	12
112	12	63	5.25	16104.3369	Puebla	2023	12
113	10	38	3.79999995	7558.00244	León	2023	12
114	9	51	5.66666651	12176.793	Tijuana	2023	12
115	8	49	6.125	14290.9014	Querétaro	2023	12
116	7	30	4.28571415	5246.21582	Morelia	2023	12
117	7	39	5.57142878	9329.64258	Monterrey	2023	12
118	6	33	5.5	6106.57861	Cancún	2023	12
119	5	38	7.5999999	10752.7676	Ciudad de México	2023	12
120	5	21	4.19999981	6983.3916	Guadalajara	2023	12
\.


--
-- TOC entry 4536 (class 0 OID 58585)
-- Dependencies: 275
-- Data for Name: dm_productos_mas_vendidos_trimestre; Type: TABLE DATA; Schema: innova_dm; Owner: g3wsuite
--

COPY innova_dm.dm_productos_mas_vendidos_trimestre (id, producto, anio, trimestre, total_vendido) FROM stdin;
1	Prod_TVBPMNCHAG	2023	1	50
2	Prod_TVBPMNCHAG	2023	2	63
3	Prod_OMPHLJZNSU	2023	3	83
4	Prod_NZRFVMLYWH	2023	4	56
\.


--
-- TOC entry 4538 (class 0 OID 58744)
-- Dependencies: 277
-- Data for Name: dm_top3_productos_por_top10_cliente; Type: TABLE DATA; Schema: innova_dm; Owner: g3wsuite
--

COPY innova_dm.dm_top3_productos_por_top10_cliente (id, top3productos, customer) FROM stdin;
21	{Prod_KPAJQTTKYX,Prod_SBTCZEVNCJ,Prod_HXWTYSFQYD}	Juan González
22	{Prod_OPCLTJCDYB,Prod_CJFSAQJSZG,Prod_XCWPENGDVY}	Fernando López
23	{Prod_VOLCAVCKJI,Prod_XPYBZUYJHV,Prod_CJFSAQJSZG}	Jorge Cruz
24	{Prod_TVBPMNCHAG,Prod_AGLFJTILKD,Prod_QMGPITLWBX}	Fernando García
25	{Prod_UQQFIRAGRU,Prod_WOWMPKEDCC,Prod_LHJGILAURC}	Manuel Cruz
26	{Prod_UEAEXMZDAI,Prod_KPAJQTTKYX,Prod_QMGPITLWBX}	Jorge García
27	{Prod_OMPHLJZNSU,Prod_OMFAITWTMF,Prod_YFTDKIZRRM}	Miguel Rodríguez
28	{Prod_EFTOMXJZSK,Prod_ZVIEXMGKYB,Prod_TJXCYIJUAL}	Fernando Martínez
29	{Prod_DNMZDUBAZU,Prod_THSVBECEFN,Prod_TJGBHEOQQJ}	Manuel Hernández
30	{Prod_NZRFVMLYWH,Prod_ZVIEXMGKYB,Prod_DNMZDUBAZU}	Manuel Rodríguez
\.


--
-- TOC entry 4530 (class 0 OID 58507)
-- Dependencies: 269
-- Data for Name: dim_customers; Type: TABLE DATA; Schema: innova_dw; Owner: g3wsuite
--

COPY innova_dw.dim_customers (id_customer, nombre, segmento, ubicacion) FROM stdin;
1	José Cruz	Pequeño	Puebla
2	Juan García	Pequeño	Mérida
3	Manuel García	Grande	Querétaro
4	Pedro González	Mediano	Cancún
5	Jorge Ramírez	Mediano	Morelia
6	Carlos González	Pequeño	Puebla
7	Alejandro Rodríguez	Grande	León
8	Juan Rodríguez	Mediano	Cancún
9	Juan Hernández	Mediano	Morelia
10	Luis López	Mediano	Morelia
11	Carlos Hernández	Mediano	Mérida
12	Fernando García	Pequeño	Morelia
13	Alejandro Cruz	Mediano	León
14	Fernando Cruz	Mediano	Puebla
15	José López	Mediano	León
16	José García	Grande	Puebla
17	José Hernández	Mediano	Tijuana
18	Luis González	Mediano	Cancún
21	Miguel Martínez	Grande	Tijuana
49	Juan González	Pequeño	Tijuana
50	Carlos García	Pequeño	Mérida
51	Manuel Martínez	Grande	Tijuana
52	Pedro Sánchez	Mediano	Mérida
53	Jorge García	Pequeño	Tijuana
54	Fernando Ramírez	Grande	Querétaro
55	Jorge Sánchez	Mediano	León
56	Alejandro García	Pequeño	Tijuana
57	Jorge González	Pequeño	Monterrey
58	Manuel González	Pequeño	León
59	Fernando Martínez	Grande	Puebla
60	Carlos Ramírez	Mediano	Tijuana
61	Pedro García	Pequeño	Guadalajara
62	Luis Hernández	Pequeño	Mérida
63	Juan Pérez	Mediano	Cancún
64	Luis Ramírez	Mediano	Puebla
65	Alejandro Hernández	Pequeño	Guadalajara
66	Juan Ramírez	Mediano	Ciudad de México
67	Pedro Rodríguez	Grande	Morelia
68	Manuel Pérez	Mediano	Guadalajara
69	Fernando Hernández	Mediano	Ciudad de México
70	José González	Grande	Cancún
71	Pedro Ramírez	Grande	Monterrey
72	Miguel Rodríguez	Mediano	Mérida
73	José Sánchez	Mediano	Mérida
74	Manuel Hernández	Grande	Cancún
75	Pedro Hernández	Mediano	Morelia
76	Jorge Hernández	Grande	Mérida
77	José Pérez	Pequeño	Guadalajara
78	Jorge López	Mediano	Ciudad de México
79	Jorge Rodríguez	Grande	Puebla
80	Luis Cruz	Pequeño	Morelia
81	Miguel Sánchez	Mediano	Puebla
82	Juan López	Mediano	Ciudad de México
83	Carlos Pérez	Mediano	Monterrey
84	Luis Rodríguez	Grande	Puebla
85	Luis García	Grande	Morelia
86	Alejandro López	Pequeño	Mérida
87	Alejandro Sánchez	Mediano	Guadalajara
88	Luis Martínez	Grande	Guadalajara
89	Carlos Cruz	Grande	Puebla
90	Alejandro Pérez	Mediano	Ciudad de México
91	Jorge Martínez	Pequeño	Cancún
92	Manuel Rodríguez	Grande	Monterrey
93	Manuel López	Pequeño	Cancún
94	Carlos Martínez	Pequeño	Mérida
95	Fernando López	Mediano	Puebla
96	Fernando Pérez	Mediano	Querétaro
97	Carlos Sánchez	Mediano	Mérida
98	Jorge Cruz	Pequeño	Puebla
99	Pedro López	Pequeño	Mérida
100	Manuel Sánchez	Mediano	Querétaro
19	Miguel Hernández	Mediano	Tijuana
20	Miguel Ramírez	Pequeño	Tijuana
22	José Ramírez	Mediano	Morelia
23	Miguel González	Pequeño	Cancún
24	Manuel Ramírez	Pequeño	Morelia
25	Fernando Sánchez	Pequeño	Ciudad de México
26	José Martínez	Grande	Morelia
27	Miguel Cruz	Grande	Guadalajara
28	Miguel García	Mediano	Querétaro
29	Pedro Pérez	Pequeño	Tijuana
30	Juan Sánchez	Pequeño	Puebla
31	Luis Pérez	Pequeño	Querétaro
32	Pedro Martínez	Pequeño	Mérida
33	Carlos Rodríguez	Mediano	Morelia
34	Fernando González	Grande	Ciudad de México
35	Miguel Pérez	Mediano	León
36	Miguel López	Pequeño	León
37	Juan Martínez	Pequeño	Monterrey
38	José Rodríguez	Pequeño	León
39	Jorge Pérez	Mediano	León
40	Luis Sánchez	Grande	Morelia
41	Alejandro Ramírez	Grande	Monterrey
42	Manuel Cruz	Pequeño	Morelia
43	Juan Cruz	Pequeño	Ciudad de México
44	Pedro Cruz	Mediano	Guadalajara
45	Carlos López	Pequeño	León
46	Fernando Rodríguez	Pequeño	Guadalajara
47	Alejandro González	Pequeño	Mérida
48	Alejandro Martínez	Grande	León
\.


--
-- TOC entry 4531 (class 0 OID 58512)
-- Dependencies: 270
-- Data for Name: dim_products; Type: TABLE DATA; Schema: innova_dw; Owner: g3wsuite
--

COPY innova_dw.dim_products (id_product, nombre, precio, categoria) FROM stdin;
1	Prod_HWCBYIXTYM	17.7224636	Juguete
2	Prod_NZRFVMLYWH	369.635406	Hogar
3	Prod_OMPHLJZNSU	26.2439442	Juguete
4	Prod_UQQFIRAGRU	441.161041	Hogar
5	Prod_YYIDGYPEHD	145.422211	Juguete
6	Prod_UOZYIWFAYY	92.9930038	Electrónica
7	Prod_UEAEXMZDAI	281.674316	Ropa
8	Prod_XOVJGEFIJC	402.268433	Juguete
9	Prod_CZQYGEQIMV	472.158905	Electrónica
10	Prod_YQVGCPUEWG	395.768616	Juguete
11	Prod_IYWEMHLEMR	409.319122	Juguete
12	Prod_QMGPITLWBX	12.4791851	Ropa
13	Prod_BFPFMJBSFE	67.0981445	Hogar
14	Prod_OPCLTJCDYB	215.062393	Hogar
15	Prod_XYDCSXVHJG	474.852936	Ropa
16	Prod_DOFKDYCMVQ	12.2877913	Ropa
17	Prod_YFTDKIZRRM	243.695267	Electrónica
18	Prod_ZVIEXMGKYB	29.1256676	Ropa
19	Prod_FOXCKYLOST	176.855865	Hogar
20	Prod_WOWMPKEDCC	122.214684	Ropa
21	Prod_BPGAGWCVIE	97.1801758	Electrónica
22	Prod_EFTOMXJZSK	76.9411697	Electrónica
23	Prod_XCWPENGDVY	417.874817	Juguete
24	Prod_XPYBZUYJHV	440.864624	Hogar
25	Prod_XYOAZZQZPJ	449.410126	Ropa
26	Prod_VBZAVXXQSW	273.783844	Hogar
27	Prod_OMFAITWTMF	175.281998	Electrónica
28	Prod_AGLFJTILKD	161.938766	Hogar
29	Prod_KPAJQTTKYX	493.673218	Electrónica
30	Prod_LHJGILAURC	427.617157	Juguete
31	Prod_DNMZDUBAZU	31.2243137	Ropa
32	Prod_IFIPPFQPDQ	215.028625	Ropa
33	Prod_THSVBECEFN	177.253113	Hogar
34	Prod_VOLCAVCKJI	401.339508	Electrónica
35	Prod_TJGBHEOQQJ	47.0767059	Juguete
36	Prod_KBPAKAERJL	191.671768	Ropa
37	Prod_TVBPMNCHAG	116.454681	Juguete
38	Prod_UJHVHXSPQU	387.307495	Hogar
39	Prod_CJFSAQJSZG	47.1823387	Electrónica
40	Prod_SBTCZEVNCJ	270.348358	Juguete
41	Prod_JVTCZYDHCR	454.413605	Ropa
42	Prod_DCGOXRQOVX	231.707336	Electrónica
43	Prod_IOBZOJAXRK	362.435547	Juguete
44	Prod_VKWGTFQGKW	82.7749634	Hogar
45	Prod_NIEJWDETMP	117.106941	Juguete
46	Prod_TJXCYIJUAL	448.854645	Juguete
47	Prod_HXWTYSFQYD	408.631256	Electrónica
48	Prod_QXZAIYFZUT	308.293488	Ropa
49	Prod_ARHXBTGOMR	366.029938	Juguete
50	Prod_EQFOYWAPPZ	32.7600136	Ropa
\.


--
-- TOC entry 4533 (class 0 OID 58522)
-- Dependencies: 272
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: innova_dw; Owner: g3wsuite
--

COPY innova_dw.dim_tiempo (fecha_dia, dia, mes, anio, trimestre, cuatrimestre, dia_semana, id_tiempo) FROM stdin;
2023-01-01	1	1	2023	1	1	0	1
2023-01-02	2	1	2023	1	1	1	2
2023-01-03	3	1	2023	1	1	2	3
2023-01-04	4	1	2023	1	1	3	4
2023-01-05	5	1	2023	1	1	4	5
2023-01-06	6	1	2023	1	1	5	6
2023-01-07	7	1	2023	1	1	6	7
2023-01-09	9	1	2023	1	1	1	8
2023-01-10	10	1	2023	1	1	2	9
2023-01-11	11	1	2023	1	1	3	10
2023-01-12	12	1	2023	1	1	4	11
2023-01-13	13	1	2023	1	1	5	12
2023-01-14	14	1	2023	1	1	6	13
2023-01-15	15	1	2023	1	1	0	14
2023-01-16	16	1	2023	1	1	1	15
2023-01-17	17	1	2023	1	1	2	16
2023-01-18	18	1	2023	1	1	3	17
2023-01-19	19	1	2023	1	1	4	18
2023-01-20	20	1	2023	1	1	5	19
2023-01-21	21	1	2023	1	1	6	20
2023-01-22	22	1	2023	1	1	0	21
2023-01-23	23	1	2023	1	1	1	22
2023-01-24	24	1	2023	1	1	2	23
2023-01-25	25	1	2023	1	1	3	24
2023-01-26	26	1	2023	1	1	4	25
2023-01-27	27	1	2023	1	1	5	26
2023-01-28	28	1	2023	1	1	6	27
2023-01-29	29	1	2023	1	1	0	28
2023-01-30	30	1	2023	1	1	1	29
2023-01-31	31	1	2023	1	1	2	30
2023-02-01	1	2	2023	1	1	3	31
2023-02-03	3	2	2023	1	1	5	32
2023-02-04	4	2	2023	1	1	6	33
2023-02-05	5	2	2023	1	1	0	34
2023-02-06	6	2	2023	1	1	1	35
2023-02-07	7	2	2023	1	1	2	36
2023-02-08	8	2	2023	1	1	3	37
2023-02-09	9	2	2023	1	1	4	38
2023-02-10	10	2	2023	1	1	5	39
2023-02-11	11	2	2023	1	1	6	40
2023-02-12	12	2	2023	1	1	0	41
2023-02-13	13	2	2023	1	1	1	42
2023-02-14	14	2	2023	1	1	2	43
2023-02-15	15	2	2023	1	1	3	44
2023-02-16	16	2	2023	1	1	4	45
2023-02-17	17	2	2023	1	1	5	46
2023-02-18	18	2	2023	1	1	6	47
2023-02-19	19	2	2023	1	1	0	48
2023-02-20	20	2	2023	1	1	1	49
2023-02-21	21	2	2023	1	1	2	50
2023-02-22	22	2	2023	1	1	3	51
2023-02-23	23	2	2023	1	1	4	52
2023-02-24	24	2	2023	1	1	5	53
2023-02-25	25	2	2023	1	1	6	54
2023-02-26	26	2	2023	1	1	0	55
2023-02-27	27	2	2023	1	1	1	56
2023-02-28	28	2	2023	1	1	2	57
2023-03-01	1	3	2023	1	1	3	58
2023-03-02	2	3	2023	1	1	4	59
2023-03-03	3	3	2023	1	1	5	60
2023-03-04	4	3	2023	1	1	6	61
2023-03-05	5	3	2023	1	1	0	62
2023-03-06	6	3	2023	1	1	1	63
2023-03-07	7	3	2023	1	1	2	64
2023-03-08	8	3	2023	1	1	3	65
2023-03-09	9	3	2023	1	1	4	66
2023-03-10	10	3	2023	1	1	5	67
2023-03-12	12	3	2023	1	1	0	68
2023-03-13	13	3	2023	1	1	1	69
2023-03-14	14	3	2023	1	1	2	70
2023-03-15	15	3	2023	1	1	3	71
2023-03-16	16	3	2023	1	1	4	72
2023-03-17	17	3	2023	1	1	5	73
2023-03-19	19	3	2023	1	1	0	74
2023-03-20	20	3	2023	1	1	1	75
2023-03-21	21	3	2023	1	1	2	76
2023-03-22	22	3	2023	1	1	3	77
2023-03-23	23	3	2023	1	1	4	78
2023-03-24	24	3	2023	1	1	5	79
2023-03-25	25	3	2023	1	1	6	80
2023-03-26	26	3	2023	1	1	0	81
2023-03-27	27	3	2023	1	1	1	82
2023-03-28	28	3	2023	1	1	2	83
2023-03-29	29	3	2023	1	1	3	84
2023-03-30	30	3	2023	1	1	4	85
2023-03-31	31	3	2023	1	1	5	86
2023-04-01	1	4	2023	2	1	6	87
2023-04-02	2	4	2023	2	1	0	88
2023-04-03	3	4	2023	2	1	1	89
2023-04-04	4	4	2023	2	1	2	90
2023-04-05	5	4	2023	2	1	3	91
2023-04-06	6	4	2023	2	1	4	92
2023-04-07	7	4	2023	2	1	5	93
2023-04-08	8	4	2023	2	1	6	94
2023-04-09	9	4	2023	2	1	0	95
2023-04-10	10	4	2023	2	1	1	96
2023-04-11	11	4	2023	2	1	2	97
2023-04-12	12	4	2023	2	1	3	98
2023-04-13	13	4	2023	2	1	4	99
2023-04-14	14	4	2023	2	1	5	100
2023-04-15	15	4	2023	2	1	6	101
2023-04-16	16	4	2023	2	1	0	102
2023-04-17	17	4	2023	2	1	1	103
2023-04-18	18	4	2023	2	1	2	104
2023-04-19	19	4	2023	2	1	3	105
2023-04-20	20	4	2023	2	1	4	106
2023-04-21	21	4	2023	2	1	5	107
2023-04-23	23	4	2023	2	1	0	108
2023-04-24	24	4	2023	2	1	1	109
2023-04-25	25	4	2023	2	1	2	110
2023-04-26	26	4	2023	2	1	3	111
2023-04-27	27	4	2023	2	1	4	112
2023-04-28	28	4	2023	2	1	5	113
2023-04-29	29	4	2023	2	1	6	114
2023-04-30	30	4	2023	2	1	0	115
2023-05-01	1	5	2023	2	2	1	116
2023-05-02	2	5	2023	2	2	2	117
2023-05-03	3	5	2023	2	2	3	118
2023-05-04	4	5	2023	2	2	4	119
2023-05-05	5	5	2023	2	2	5	120
2023-05-06	6	5	2023	2	2	6	121
2023-05-07	7	5	2023	2	2	0	122
2023-05-08	8	5	2023	2	2	1	123
2023-05-09	9	5	2023	2	2	2	124
2023-05-10	10	5	2023	2	2	3	125
2023-05-11	11	5	2023	2	2	4	126
2023-05-12	12	5	2023	2	2	5	127
2023-05-13	13	5	2023	2	2	6	128
2023-05-14	14	5	2023	2	2	0	129
2023-05-16	16	5	2023	2	2	2	130
2023-05-17	17	5	2023	2	2	3	131
2023-05-18	18	5	2023	2	2	4	132
2023-05-19	19	5	2023	2	2	5	133
2023-05-21	21	5	2023	2	2	0	134
2023-05-22	22	5	2023	2	2	1	135
2023-05-23	23	5	2023	2	2	2	136
2023-05-24	24	5	2023	2	2	3	137
2023-05-25	25	5	2023	2	2	4	138
2023-05-26	26	5	2023	2	2	5	139
2023-05-27	27	5	2023	2	2	6	140
2023-05-29	29	5	2023	2	2	1	141
2023-05-30	30	5	2023	2	2	2	142
2023-05-31	31	5	2023	2	2	3	143
2023-06-01	1	6	2023	2	2	4	144
2023-06-02	2	6	2023	2	2	5	145
2023-06-03	3	6	2023	2	2	6	146
2023-06-04	4	6	2023	2	2	0	147
2023-06-05	5	6	2023	2	2	1	148
2023-06-07	7	6	2023	2	2	3	149
2023-06-08	8	6	2023	2	2	4	150
2023-06-09	9	6	2023	2	2	5	151
2023-06-10	10	6	2023	2	2	6	152
2023-06-11	11	6	2023	2	2	0	153
2023-06-12	12	6	2023	2	2	1	154
2023-06-13	13	6	2023	2	2	2	155
2023-06-15	15	6	2023	2	2	4	156
2023-06-16	16	6	2023	2	2	5	157
2023-06-17	17	6	2023	2	2	6	158
2023-06-19	19	6	2023	2	2	1	159
2023-06-20	20	6	2023	2	2	2	160
2023-06-21	21	6	2023	2	2	3	161
2023-06-22	22	6	2023	2	2	4	162
2023-06-23	23	6	2023	2	2	5	163
2023-06-24	24	6	2023	2	2	6	164
2023-06-25	25	6	2023	2	2	0	165
2023-06-26	26	6	2023	2	2	1	166
2023-06-27	27	6	2023	2	2	2	167
2023-06-28	28	6	2023	2	2	3	168
2023-06-29	29	6	2023	2	2	4	169
2023-06-30	30	6	2023	2	2	5	170
2023-07-02	2	7	2023	3	2	0	171
2023-07-03	3	7	2023	3	2	1	172
2023-07-04	4	7	2023	3	2	2	173
2023-07-05	5	7	2023	3	2	3	174
2023-07-06	6	7	2023	3	2	4	175
2023-07-07	7	7	2023	3	2	5	176
2023-07-08	8	7	2023	3	2	6	177
2023-07-09	9	7	2023	3	2	0	178
2023-07-10	10	7	2023	3	2	1	179
2023-07-11	11	7	2023	3	2	2	180
2023-07-13	13	7	2023	3	2	4	181
2023-07-14	14	7	2023	3	2	5	182
2023-07-15	15	7	2023	3	2	6	183
2023-07-16	16	7	2023	3	2	0	184
2023-07-17	17	7	2023	3	2	1	185
2023-07-18	18	7	2023	3	2	2	186
2023-07-19	19	7	2023	3	2	3	187
2023-07-20	20	7	2023	3	2	4	188
2023-07-22	22	7	2023	3	2	6	189
2023-07-23	23	7	2023	3	2	0	190
2023-07-24	24	7	2023	3	2	1	191
2023-07-25	25	7	2023	3	2	2	192
2023-07-26	26	7	2023	3	2	3	193
2023-07-27	27	7	2023	3	2	4	194
2023-07-28	28	7	2023	3	2	5	195
2023-07-29	29	7	2023	3	2	6	196
2023-07-30	30	7	2023	3	2	0	197
2023-08-01	1	8	2023	3	2	2	198
2023-08-02	2	8	2023	3	2	3	199
2023-08-03	3	8	2023	3	2	4	200
2023-08-04	4	8	2023	3	2	5	201
2023-08-05	5	8	2023	3	2	6	202
2023-08-06	6	8	2023	3	2	0	203
2023-08-07	7	8	2023	3	2	1	204
2023-08-08	8	8	2023	3	2	2	205
2023-08-09	9	8	2023	3	2	3	206
2023-08-10	10	8	2023	3	2	4	207
2023-08-11	11	8	2023	3	2	5	208
2023-08-12	12	8	2023	3	2	6	209
2023-08-13	13	8	2023	3	2	0	210
2023-08-15	15	8	2023	3	2	2	211
2023-08-16	16	8	2023	3	2	3	212
2023-08-17	17	8	2023	3	2	4	213
2023-08-18	18	8	2023	3	2	5	214
2023-08-19	19	8	2023	3	2	6	215
2023-08-20	20	8	2023	3	2	0	216
2023-08-21	21	8	2023	3	2	1	217
2023-08-22	22	8	2023	3	2	2	218
2023-08-23	23	8	2023	3	2	3	219
2023-08-24	24	8	2023	3	2	4	220
2023-08-25	25	8	2023	3	2	5	221
2023-08-26	26	8	2023	3	2	6	222
2023-08-27	27	8	2023	3	2	0	223
2023-08-28	28	8	2023	3	2	1	224
2023-08-29	29	8	2023	3	2	2	225
2023-08-30	30	8	2023	3	2	3	226
2023-08-31	31	8	2023	3	2	4	227
2023-09-01	1	9	2023	3	3	5	228
2023-09-02	2	9	2023	3	3	6	229
2023-09-03	3	9	2023	3	3	0	230
2023-09-04	4	9	2023	3	3	1	231
2023-09-05	5	9	2023	3	3	2	232
2023-09-06	6	9	2023	3	3	3	233
2023-09-07	7	9	2023	3	3	4	234
2023-09-08	8	9	2023	3	3	5	235
2023-09-09	9	9	2023	3	3	6	236
2023-09-10	10	9	2023	3	3	0	237
2023-09-11	11	9	2023	3	3	1	238
2023-09-12	12	9	2023	3	3	2	239
2023-09-13	13	9	2023	3	3	3	240
2023-09-14	14	9	2023	3	3	4	241
2023-09-15	15	9	2023	3	3	5	242
2023-09-16	16	9	2023	3	3	6	243
2023-09-17	17	9	2023	3	3	0	244
2023-09-18	18	9	2023	3	3	1	245
2023-09-19	19	9	2023	3	3	2	246
2023-09-20	20	9	2023	3	3	3	247
2023-09-21	21	9	2023	3	3	4	248
2023-09-22	22	9	2023	3	3	5	249
2023-09-23	23	9	2023	3	3	6	250
2023-09-24	24	9	2023	3	3	0	251
2023-09-25	25	9	2023	3	3	1	252
2023-09-26	26	9	2023	3	3	2	253
2023-09-27	27	9	2023	3	3	3	254
2023-09-28	28	9	2023	3	3	4	255
2023-09-29	29	9	2023	3	3	5	256
2023-10-01	1	10	2023	4	3	0	257
2023-10-02	2	10	2023	4	3	1	258
2023-10-03	3	10	2023	4	3	2	259
2023-10-04	4	10	2023	4	3	3	260
2023-10-05	5	10	2023	4	3	4	261
2023-10-06	6	10	2023	4	3	5	262
2023-10-07	7	10	2023	4	3	6	263
2023-10-08	8	10	2023	4	3	0	264
2023-10-09	9	10	2023	4	3	1	265
2023-10-10	10	10	2023	4	3	2	266
2023-10-11	11	10	2023	4	3	3	267
2023-10-12	12	10	2023	4	3	4	268
2023-10-13	13	10	2023	4	3	5	269
2023-10-14	14	10	2023	4	3	6	270
2023-10-15	15	10	2023	4	3	0	271
2023-10-16	16	10	2023	4	3	1	272
2023-10-17	17	10	2023	4	3	2	273
2023-10-18	18	10	2023	4	3	3	274
2023-10-20	20	10	2023	4	3	5	275
2023-10-21	21	10	2023	4	3	6	276
2023-10-22	22	10	2023	4	3	0	277
2023-10-23	23	10	2023	4	3	1	278
2023-10-24	24	10	2023	4	3	2	279
2023-10-25	25	10	2023	4	3	3	280
2023-10-26	26	10	2023	4	3	4	281
2023-10-27	27	10	2023	4	3	5	282
2023-10-28	28	10	2023	4	3	6	283
2023-10-29	29	10	2023	4	3	0	284
2023-10-30	30	10	2023	4	3	1	285
2023-10-31	31	10	2023	4	3	2	286
2023-11-01	1	11	2023	4	3	3	287
2023-11-02	2	11	2023	4	3	4	288
2023-11-03	3	11	2023	4	3	5	289
2023-11-04	4	11	2023	4	3	6	290
2023-11-05	5	11	2023	4	3	0	291
2023-11-06	6	11	2023	4	3	1	292
2023-11-07	7	11	2023	4	3	2	293
2023-11-08	8	11	2023	4	3	3	294
2023-11-09	9	11	2023	4	3	4	295
2023-11-10	10	11	2023	4	3	5	296
2023-11-11	11	11	2023	4	3	6	297
2023-11-12	12	11	2023	4	3	0	298
2023-11-13	13	11	2023	4	3	1	299
2023-11-14	14	11	2023	4	3	2	300
2023-11-15	15	11	2023	4	3	3	301
2023-11-16	16	11	2023	4	3	4	302
2023-11-17	17	11	2023	4	3	5	303
2023-11-18	18	11	2023	4	3	6	304
2023-11-19	19	11	2023	4	3	0	305
2023-11-20	20	11	2023	4	3	1	306
2023-11-21	21	11	2023	4	3	2	307
2023-11-22	22	11	2023	4	3	3	308
2023-11-23	23	11	2023	4	3	4	309
2023-11-24	24	11	2023	4	3	5	310
2023-11-25	25	11	2023	4	3	6	311
2023-11-26	26	11	2023	4	3	0	312
2023-11-27	27	11	2023	4	3	1	313
2023-11-28	28	11	2023	4	3	2	314
2023-11-29	29	11	2023	4	3	3	315
2023-11-30	30	11	2023	4	3	4	316
2023-12-01	1	12	2023	4	3	5	317
2023-12-02	2	12	2023	4	3	6	318
2023-12-03	3	12	2023	4	3	0	319
2023-12-04	4	12	2023	4	3	1	320
2023-12-05	5	12	2023	4	3	2	321
2023-12-06	6	12	2023	4	3	3	322
2023-12-07	7	12	2023	4	3	4	323
2023-12-08	8	12	2023	4	3	5	324
2023-12-09	9	12	2023	4	3	6	325
2023-12-10	10	12	2023	4	3	0	326
2023-12-11	11	12	2023	4	3	1	327
2023-12-12	12	12	2023	4	3	2	328
2023-12-13	13	12	2023	4	3	3	329
2023-12-14	14	12	2023	4	3	4	330
2023-12-15	15	12	2023	4	3	5	331
2023-12-16	16	12	2023	4	3	6	332
2023-12-17	17	12	2023	4	3	0	333
2023-12-18	18	12	2023	4	3	1	334
2023-12-19	19	12	2023	4	3	2	335
2023-12-20	20	12	2023	4	3	3	336
2023-12-21	21	12	2023	4	3	4	337
2023-12-22	22	12	2023	4	3	5	338
2023-12-24	24	12	2023	4	3	0	339
2023-12-25	25	12	2023	4	3	1	340
2023-12-26	26	12	2023	4	3	2	341
2023-12-27	27	12	2023	4	3	3	342
2023-12-28	28	12	2023	4	3	4	343
2023-12-29	29	12	2023	4	3	5	344
2023-12-30	30	12	2023	4	3	6	345
2023-12-31	31	12	2023	4	3	0	346
\.


--
-- TOC entry 4532 (class 0 OID 58517)
-- Dependencies: 271
-- Data for Name: fct_invoices; Type: TABLE DATA; Schema: innova_dw; Owner: g3wsuite
--

COPY innova_dw.fct_invoices (id_invoice, fecha, customer, product, cantidad, total) FROM stdin;
1	296	62	24	6	2645.18774
2	91	10	32	10	2150.28613
3	208	14	48	1	308.293488
4	30	100	7	8	2253.39453
5	345	66	20	6	733.288086
6	179	27	6	4	371.972015
7	51	13	16	1	12.2877913
8	277	87	29	6	2962.03931
9	43	72	31	10	312.243134
10	199	49	18	9	262.131012
11	282	29	34	10	4013.39502
12	186	99	1	4	70.8898544
13	94	67	3	8	209.951553
14	190	34	1	3	53.1673889
15	129	54	24	7	3086.05225
16	286	75	26	3	821.351562
17	250	58	17	8	1949.56213
18	108	33	4	1	441.161041
19	271	47	16	1	12.2877913
20	264	69	16	9	110.590118
21	102	39	19	6	1061.13525
22	284	38	30	2	855.234314
23	145	48	31	10	312.243134
24	99	23	43	6	2174.61328
25	285	4	23	2	835.749634
26	168	3	31	5	156.121567
27	286	99	33	2	354.506226
28	230	50	16	1	12.2877913
29	17	9	49	4	1464.11975
30	4	42	30	4	1710.46863
31	81	21	39	1	47.1823387
32	206	93	3	4	104.975777
33	211	26	3	4	104.975777
34	183	34	8	5	2011.34216
35	10	100	13	7	469.687012
36	130	13	24	6	2645.18774
37	210	30	15	2	949.705872
38	286	91	30	4	1710.46863
39	23	91	44	5	413.874817
40	330	86	26	5	1368.91919
41	245	100	21	7	680.26123
42	266	12	33	4	709.012451
43	307	96	18	5	145.628342
44	316	62	18	5	145.628342
45	344	53	33	7	1240.77173
46	285	97	45	1	117.106941
47	117	22	28	9	1457.44885
48	225	55	38	8	3098.45996
49	320	82	2	6	2217.8125
50	101	2	25	2	898.820251
51	314	52	48	10	3082.93481
52	10	53	24	7	3086.05225
53	316	80	12	6	74.8751068
54	73	72	26	1	273.783844
55	176	66	29	9	4443.05908
56	320	100	16	5	61.4389572
57	287	70	25	6	2696.46069
58	185	54	30	1	427.617157
59	197	55	5	1	145.422211
60	183	51	11	8	3274.55298
61	150	91	6	5	464.965027
62	27	85	25	1	449.410126
63	68	16	9	8	3777.27124
64	203	64	36	8	1533.37415
65	145	39	4	2	882.322083
66	146	71	40	6	1622.09009
67	86	68	2	5	1848.177
68	184	94	41	7	3180.89526
69	169	57	16	6	73.7267456
70	302	17	17	1	243.695267
71	288	31	16	1	12.2877913
72	206	86	26	10	2737.83838
73	215	90	8	4	1609.07373
74	99	69	37	4	465.818726
75	15	88	42	5	1158.53662
76	4	56	7	2	563.348633
77	131	58	36	3	575.01532
78	219	62	7	5	1408.37158
79	98	7	50	10	327.600128
80	246	51	1	6	106.334778
81	286	25	16	9	110.590118
82	178	53	24	1	440.864624
83	119	20	45	1	117.106941
84	235	72	16	8	98.30233
85	276	98	7	6	1690.0459
86	185	36	34	3	1204.01855
87	222	6	42	7	1621.95142
88	316	65	27	9	1577.53796
89	322	28	23	5	2089.37402
90	70	83	6	3	278.979004
91	172	59	3	7	183.707611
92	45	28	44	10	827.749634
93	338	40	9	1	472.158905
94	6	8	40	6	1622.09009
95	62	90	48	10	3082.93481
96	238	47	26	7	1916.48694
97	277	26	22	5	384.705841
98	195	6	27	6	1051.69202
99	99	73	44	1	82.7749634
100	213	12	47	10	4086.3125
101	76	91	12	6	74.8751068
102	142	80	43	9	3261.91992
103	237	77	22	1	76.9411697
104	205	27	28	2	323.877533
105	20	6	29	2	987.346436
106	115	85	18	7	203.879669
107	248	29	17	10	2436.95264
108	117	12	43	9	3261.91992
109	77	84	36	4	766.687073
110	61	53	29	3	1481.01965
111	188	40	16	5	61.4389572
112	278	89	31	4	124.897255
113	284	55	30	9	3848.55444
114	169	20	44	3	248.32489
115	226	81	48	9	2774.64136
116	60	85	31	10	312.243134
117	74	38	15	2	949.705872
118	151	71	40	6	1622.09009
119	136	31	49	3	1098.08984
120	109	69	14	10	2150.62402
121	133	35	10	5	1978.84302
122	168	1	2	9	3326.71875
123	173	19	25	4	1797.6405
124	221	93	43	5	1812.17773
125	127	64	39	3	141.547012
126	323	32	2	4	1478.54163
127	282	2	32	9	1935.25757
128	335	3	49	2	732.059875
129	333	7	33	8	1418.0249
130	161	45	19	8	1414.84692
131	302	66	20	6	733.288086
132	69	64	20	4	488.858734
133	319	54	2	7	2587.44775
134	304	13	25	4	1797.6405
135	252	18	16	1	12.2877913
136	158	66	10	1	395.768616
137	207	72	39	10	471.823395
138	12	29	45	9	1053.96252
139	107	9	8	1	402.268433
140	120	98	41	8	3635.30884
141	53	74	6	6	557.958008
142	219	36	21	8	777.441406
143	195	86	4	3	1323.48315
144	4	85	30	5	2138.08569
145	51	58	30	1	427.617157
146	293	8	41	2	908.827209
147	201	8	10	2	791.537231
148	131	21	2	5	1848.177
149	46	6	2	5	1848.177
150	32	79	27	9	1577.53796
151	302	57	44	7	579.424744
152	314	30	49	4	1464.11975
153	309	63	41	9	4089.72241
154	5	45	42	7	1621.95142
155	128	44	16	3	36.8633728
156	83	91	2	5	1848.177
157	152	10	38	6	2323.84497
158	177	7	4	8	3529.28833
159	294	72	18	9	262.131012
160	34	70	4	2	882.322083
161	163	85	5	2	290.844421
162	225	21	48	5	1541.46741
163	135	72	27	2	350.563995
164	313	40	37	10	1164.54688
165	113	16	21	1	97.1801758
166	49	36	50	6	196.560089
167	335	11	48	7	2158.05444
168	128	32	36	7	1341.70239
169	306	5	1	5	88.6123199
170	285	41	13	9	603.883301
171	48	99	5	6	872.533264
172	252	41	22	7	538.588196
173	112	61	41	6	2726.48169
174	289	29	18	2	58.2513351
175	10	77	14	10	2150.62402
176	318	1	27	6	1051.69202
177	130	8	30	1	427.617157
178	205	60	11	7	2865.23389
179	225	53	47	10	4086.3125
180	70	61	33	4	709.012451
181	127	94	39	2	94.3646774
182	53	61	32	1	215.028625
183	152	50	43	2	724.871094
184	295	49	40	7	1892.43848
185	47	8	34	1	401.339508
186	84	42	43	8	2899.48438
187	305	58	23	10	4178.74805
188	40	39	43	1	362.435547
189	242	63	3	5	131.219727
190	129	38	22	10	769.411682
191	160	11	29	1	493.673218
192	150	20	1	8	141.779709
193	342	58	34	4	1605.35803
194	90	31	22	10	769.411682
195	118	44	5	4	581.688843
196	12	80	46	7	3141.98242
197	109	68	10	9	3561.91748
198	304	23	44	7	579.424744
199	188	21	26	4	1095.13538
200	331	5	36	1	191.671768
201	65	53	12	5	62.3959274
202	280	75	27	7	1226.974
203	36	76	39	2	94.3646774
204	298	26	37	2	232.909363
205	130	22	33	4	709.012451
206	346	86	2	5	1848.177
207	5	8	23	10	4178.74805
208	2	49	47	8	3269.05005
209	50	4	15	7	3323.97046
210	81	92	22	7	538.588196
211	93	22	15	10	4748.5293
212	322	100	17	9	2193.25732
213	63	25	11	10	4093.19116
214	167	85	35	9	423.690369
215	184	58	17	8	1949.56213
216	307	93	24	6	2645.18774
217	191	52	30	5	2138.08569
218	214	4	20	10	1222.14685
219	329	46	34	8	3210.71606
220	83	49	29	6	2962.03931
221	111	19	35	7	329.536926
222	63	15	37	3	349.364044
223	63	38	25	4	1797.6405
224	193	42	40	8	2162.78687
225	302	85	35	7	329.536926
226	86	1	20	9	1099.93213
227	245	28	12	3	37.4375534
228	294	66	14	4	860.249573
229	142	19	44	7	579.424744
230	69	77	33	6	1063.51868
231	291	31	9	10	4721.58887
232	95	4	25	3	1348.23035
233	283	95	13	9	603.883301
234	87	9	22	6	461.647034
235	318	42	44	7	579.424744
236	190	20	33	5	886.265564
237	101	29	46	5	2244.27319
238	191	86	49	10	3660.29932
239	329	12	28	3	485.816284
240	180	56	50	3	98.2800446
241	54	13	38	1	387.307495
242	58	36	31	5	156.121567
243	178	82	9	7	3305.1123
244	195	31	22	2	153.882339
245	241	38	43	5	1812.17773
246	175	90	45	10	1171.06946
247	166	57	17	1	243.695267
248	143	87	34	4	1605.35803
249	337	6	25	5	2247.05054
250	295	65	5	9	1308.79993
251	10	61	9	2	944.31781
252	69	88	45	10	1171.06946
253	67	66	42	9	2085.36597
254	209	50	7	9	2535.06885
255	152	93	13	1	67.0981445
256	62	48	45	2	234.213882
257	144	31	36	9	1725.0459
258	287	23	34	5	2006.69751
259	88	15	24	2	881.729248
260	202	96	22	10	769.411682
261	255	62	21	2	194.360352
262	280	3	5	9	1308.79993
263	62	25	39	3	141.547012
264	161	38	31	6	187.345886
265	225	43	48	4	1233.17395
266	145	69	8	8	3218.14746
267	291	41	22	4	307.764679
268	189	42	50	6	196.560089
269	29	48	43	6	2174.61328
270	339	94	50	4	131.040054
271	277	64	27	5	876.409973
272	327	36	28	9	1457.44885
273	58	42	1	1	17.7224636
274	218	21	36	4	766.687073
275	146	54	10	8	3166.14893
276	137	84	21	6	583.081055
277	272	49	38	9	3485.76758
278	235	94	14	2	430.124786
279	130	80	22	5	384.705841
280	330	15	20	7	855.502808
281	144	22	34	2	802.679016
282	74	74	45	9	1053.96252
283	260	51	13	2	134.196289
284	216	98	20	8	977.717468
285	343	2	50	1	32.7600136
286	205	53	35	6	282.460236
287	42	26	26	10	2737.83838
288	186	83	21	1	97.1801758
289	193	99	36	5	958.358826
290	40	12	38	5	1936.53748
291	339	60	23	7	2925.12378
292	117	32	23	5	2089.37402
293	162	11	32	3	645.085876
294	53	31	29	7	3455.7124
295	188	2	12	5	62.3959274
296	330	46	15	1	474.852936
297	272	76	22	7	538.588196
298	286	56	31	2	62.4486275
299	136	64	44	3	248.32489
300	195	84	4	1	441.161041
301	184	90	47	5	2043.15625
302	325	30	29	3	1481.01965
303	332	88	40	4	1081.39343
304	236	30	50	1	32.7600136
305	329	89	10	6	2374.61182
306	303	6	2	9	3326.71875
307	276	27	34	1	401.339508
308	100	81	34	4	1605.35803
309	290	9	15	2	949.705872
310	124	50	23	4	1671.49927
311	215	98	41	6	2726.48169
312	66	37	3	4	104.975777
313	30	26	30	9	3848.55444
314	126	17	12	9	112.312668
315	40	42	4	2	882.322083
316	40	79	9	1	472.158905
317	69	14	8	8	3218.14746
318	144	46	14	5	1075.31201
319	119	73	2	6	2217.8125
320	317	75	36	10	1916.71765
321	334	52	22	2	153.882339
322	39	30	6	10	929.930054
323	252	7	23	3	1253.62451
324	268	94	9	3	1416.47668
325	263	70	16	3	36.8633728
326	192	94	8	3	1206.8053
327	331	27	43	4	1449.74219
328	40	87	11	10	4093.19116
329	235	12	42	4	926.829346
330	282	95	14	1	215.062393
331	86	20	37	4	465.818726
332	330	53	7	3	845.022949
333	167	28	2	4	1478.54163
334	260	50	50	9	294.840118
335	12	37	37	2	232.909363
336	40	59	5	10	1454.22217
337	106	61	16	7	86.0145416
338	122	59	46	1	448.854645
339	128	3	27	6	1051.69202
340	184	19	2	4	1478.54163
341	271	36	45	3	351.320831
342	275	23	20	2	244.429367
343	122	46	27	7	1226.974
344	198	87	19	9	1591.70276
345	312	54	41	3	1363.24084
346	64	92	16	10	122.877914
347	130	85	19	8	1414.84692
348	315	81	41	4	1817.65442
349	85	28	47	7	2860.4187
350	22	60	39	10	471.823395
351	108	57	31	7	218.57019
352	48	25	14	6	1290.37439
353	291	53	17	5	1218.47632
354	236	13	32	8	1720.229
355	304	7	21	6	583.081055
356	249	27	7	3	845.022949
357	305	54	47	6	2451.7876
358	89	3	39	10	471.823395
359	271	77	3	9	236.195496
360	161	70	41	8	3635.30884
361	190	10	13	4	268.392578
362	85	26	43	8	2899.48438
363	253	29	26	4	1095.13538
364	239	81	1	10	177.22464
365	186	1	21	2	194.360352
366	134	27	20	10	1222.14685
367	343	84	45	9	1053.96252
368	95	82	18	5	145.628342
369	260	61	17	9	2193.25732
370	243	59	8	5	2011.34216
371	138	61	49	10	3660.29932
372	57	55	36	6	1150.03064
373	14	36	17	1	243.695267
374	6	98	19	7	1237.99109
375	61	52	24	5	2204.32324
376	313	43	42	2	463.414673
377	68	39	37	10	1164.54688
378	1	21	40	2	540.696716
379	83	1	21	7	680.26123
380	16	79	1	6	106.334778
381	335	58	44	1	82.7749634
382	236	84	31	2	62.4486275
383	286	80	48	7	2158.05444
384	262	37	9	2	944.31781
385	86	75	19	1	176.855865
386	138	86	42	6	1390.24402
387	20	65	44	10	827.749634
388	222	41	12	4	49.9167404
389	220	60	17	8	1949.56213
390	165	82	47	10	4086.3125
391	15	90	8	3	1206.8053
392	59	63	2	3	1108.90625
393	228	26	29	8	3949.38574
394	69	4	3	10	262.439453
395	17	18	3	7	183.707611
396	37	69	31	3	93.6729431
397	93	6	4	8	3529.28833
398	98	12	34	9	3612.05566
399	121	65	45	1	117.106941
400	46	59	36	5	958.358826
401	200	66	50	5	163.800064
402	126	99	13	9	603.883301
403	36	2	27	10	1752.81995
404	306	70	39	9	424.641052
405	305	91	3	1	26.2439442
406	103	98	47	10	4086.3125
407	54	9	21	2	194.360352
408	173	20	13	5	335.490723
409	174	10	34	2	802.679016
410	100	25	38	2	774.61499
411	296	79	9	5	2360.79443
412	164	55	14	4	860.249573
413	56	55	38	1	387.307495
414	327	13	42	2	463.414673
415	175	73	45	8	936.85553
416	250	65	39	10	471.823395
417	288	77	30	10	4276.17139
418	216	10	3	7	183.707611
419	132	100	10	9	3561.91748
420	270	95	47	9	3677.6814
421	269	72	3	1	26.2439442
422	145	38	1	1	17.7224636
423	111	84	34	2	802.679016
424	179	95	23	5	2089.37402
425	240	84	29	8	3949.38574
426	120	39	37	3	349.364044
427	233	67	16	10	122.877914
428	299	42	20	3	366.644043
429	296	1	45	9	1053.96252
430	321	8	31	6	187.345886
431	89	59	28	7	1133.57141
432	121	87	27	8	1402.25598
433	13	9	43	7	2537.04883
434	172	27	8	1	402.268433
435	42	11	33	9	1595.27808
436	166	47	23	9	3760.87329
437	312	94	10	2	791.537231
438	120	15	25	9	4044.69116
439	193	41	13	5	335.490723
440	63	18	6	1	92.9930038
441	159	87	8	3	1206.8053
442	262	98	7	1	281.674316
443	36	97	30	3	1282.85144
444	250	22	49	2	732.059875
445	18	1	38	2	774.61499
446	139	17	3	3	78.7318344
447	200	64	25	10	4494.10107
448	184	13	9	5	2360.79443
449	251	27	27	10	1752.81995
450	127	50	43	3	1087.30664
451	340	71	31	5	156.121567
452	187	70	48	2	616.586975
453	73	84	28	9	1457.44885
454	224	81	12	1	12.4791851
455	79	55	23	4	1671.49927
456	166	91	47	4	1634.52502
457	260	70	45	5	585.534729
458	263	44	48	8	2466.3479
459	176	1	33	10	1772.53113
460	231	83	43	7	2537.04883
461	271	91	24	3	1322.59387
462	166	39	44	8	662.199707
463	227	75	22	3	230.823517
464	256	45	23	6	2507.24902
465	258	16	20	7	855.502808
466	76	54	37	3	349.364044
467	317	98	39	6	283.094025
468	67	80	20	2	244.429367
469	202	93	36	3	575.01532
470	321	3	28	10	1619.3877
471	54	96	46	1	448.854645
472	274	25	27	4	701.127991
473	51	55	3	1	26.2439442
474	62	49	46	5	2244.27319
475	135	95	16	9	110.590118
476	158	9	48	6	1849.76099
477	62	79	27	5	876.409973
478	175	72	18	9	262.131012
479	168	42	1	10	177.22464
480	271	71	9	1	472.158905
481	306	27	9	7	3305.1123
482	248	2	30	4	1710.46863
483	22	6	21	2	194.360352
484	16	35	29	5	2468.36621
485	189	3	3	1	26.2439442
486	69	17	31	4	124.897255
487	62	46	5	6	872.533264
488	170	80	27	2	350.563995
489	11	66	10	10	3957.68604
490	95	15	37	9	1048.09216
491	222	19	46	3	1346.56396
492	47	20	44	7	579.424744
493	58	30	18	7	203.879669
494	145	80	16	10	122.877914
495	193	4	9	1	472.158905
496	220	38	22	8	615.529358
497	227	16	26	2	547.567688
498	73	38	19	9	1591.70276
499	212	17	5	5	727.111084
500	57	92	49	8	2928.2395
501	265	59	26	6	1642.70312
502	299	74	33	2	354.506226
503	317	74	31	2	62.4486275
504	66	48	35	10	470.767059
505	173	36	22	8	615.529358
506	73	41	7	4	1126.69727
507	330	71	15	10	4748.5293
508	121	33	10	3	1187.30591
509	104	53	44	6	496.64978
510	224	79	37	5	582.273438
511	138	24	37	1	116.454681
512	273	74	21	4	388.720703
513	81	85	12	8	99.8334808
514	309	65	13	5	335.490723
515	157	23	23	2	835.749634
516	6	2	50	4	131.040054
517	208	74	35	2	94.1534119
518	242	89	16	5	61.4389572
519	24	92	14	6	1290.37439
520	310	100	6	2	185.986008
521	98	95	32	5	1075.14307
522	162	39	11	2	818.638245
523	181	66	31	5	156.121567
524	13	61	21	1	97.1801758
525	28	80	30	2	855.234314
526	322	59	10	8	3166.14893
527	237	20	29	8	3949.38574
528	155	72	37	10	1164.54688
529	24	13	30	9	3848.55444
530	53	15	19	4	707.423462
531	58	75	15	2	949.705872
532	155	21	7	2	563.348633
533	335	52	46	2	897.70929
534	66	61	13	4	268.392578
535	167	33	42	5	1158.53662
536	241	72	21	10	971.801758
537	269	48	33	2	354.506226
538	15	93	10	4	1583.07446
539	159	71	28	6	971.632568
540	315	21	39	8	377.45871
541	243	19	1	4	70.8898544
542	299	59	21	6	583.081055
543	74	83	7	8	2253.39453
544	179	57	14	5	1075.31201
545	294	77	30	5	2138.08569
546	92	88	46	2	897.70929
547	217	92	18	3	87.3769989
548	266	94	42	7	1621.95142
549	339	27	36	4	766.687073
550	37	23	37	4	465.818726
551	278	20	24	3	1322.59387
552	281	77	31	2	62.4486275
553	323	9	43	1	362.435547
554	222	12	12	3	37.4375534
555	33	59	18	1	29.1256676
556	83	20	50	9	294.840118
557	37	95	28	6	971.632568
558	38	31	32	6	1290.17175
559	246	76	47	1	408.631256
560	20	38	10	10	3957.68604
561	10	96	19	1	176.855865
562	9	83	1	1	17.7224636
563	87	83	2	10	3696.354
564	16	82	46	8	3590.83716
565	56	44	8	3	1206.8053
566	95	15	33	9	1595.27808
567	124	69	4	5	2205.80518
568	79	45	2	7	2587.44775
569	4	69	41	7	3180.89526
570	245	35	21	2	194.360352
571	147	74	50	10	327.600128
572	85	27	10	4	1583.07446
573	225	65	27	1	175.281998
574	66	21	31	3	93.6729431
575	206	80	6	10	929.930054
576	247	7	25	6	2696.46069
577	290	63	1	6	106.334778
578	114	99	26	8	2190.27075
579	134	29	29	6	2962.03931
580	102	35	10	3	1187.30591
581	333	18	6	3	278.979004
582	47	17	7	3	845.022949
583	341	32	49	1	366.029938
584	179	60	25	6	2696.46069
585	67	97	39	1	47.1823387
586	239	47	46	3	1346.56396
587	221	57	40	6	1622.09009
588	53	23	36	9	1725.0459
589	79	59	22	1	76.9411697
590	113	90	41	4	1817.65442
591	276	15	21	1	97.1801758
592	119	29	27	6	1051.69202
593	253	32	22	2	153.882339
594	16	26	33	7	1240.77173
595	118	52	44	3	248.32489
596	340	73	14	2	430.124786
597	68	53	47	8	3269.05005
598	257	83	1	5	88.6123199
599	177	26	37	2	232.909363
600	270	98	34	1	401.339508
601	290	93	5	3	436.266632
602	217	60	31	6	187.345886
603	143	49	21	9	874.621582
604	104	22	28	8	1295.51013
605	269	66	33	9	1595.27808
606	267	54	32	5	1075.14307
607	45	98	33	10	1772.53113
608	56	42	14	9	1935.56152
609	345	39	31	3	93.6729431
610	61	91	37	7	815.182739
611	301	36	39	2	94.3646774
612	171	57	47	4	1634.52502
613	105	80	25	10	4494.10107
614	232	97	21	1	97.1801758
615	325	5	19	7	1237.99109
616	36	65	42	8	1853.65869
617	12	95	13	10	670.981445
618	343	47	39	8	377.45871
619	231	15	18	6	174.753998
620	105	35	23	6	2507.24902
621	261	49	49	8	2928.2395
622	284	29	34	3	1204.01855
623	154	94	28	9	1457.44885
624	233	32	8	10	4022.68433
625	285	77	39	4	188.729355
626	194	97	2	8	2957.08325
627	166	20	35	2	94.1534119
628	324	83	22	5	384.705841
629	276	80	44	3	248.32489
630	259	89	13	4	268.392578
631	134	58	29	9	4443.05908
632	44	43	33	2	354.506226
633	256	59	21	10	971.801758
634	55	87	35	6	282.460236
635	52	36	46	10	4488.54639
636	108	69	3	4	104.975777
637	220	10	15	8	3798.82349
638	40	47	4	1	441.161041
639	298	81	19	8	1414.84692
640	271	78	37	1	116.454681
641	41	74	25	8	3595.28101
642	296	94	30	7	2993.32007
643	208	46	17	7	1705.86682
644	241	52	34	5	2006.69751
645	281	87	10	4	1583.07446
646	131	93	25	9	4044.69116
647	328	100	24	8	3526.91699
648	165	6	21	7	680.26123
649	52	48	31	2	62.4486275
650	148	92	48	9	2774.64136
651	98	71	20	4	488.858734
652	22	11	24	9	3967.78174
653	204	46	4	7	3088.1272
654	251	21	37	3	349.364044
655	152	72	17	5	1218.47632
656	3	19	48	5	1541.46741
657	156	88	37	10	1164.54688
658	163	19	19	4	707.423462
659	77	56	9	7	3305.1123
660	101	57	50	9	294.840118
661	8	18	20	2	244.429367
662	234	82	32	2	430.057251
663	306	78	17	4	974.781067
664	183	32	7	4	1126.69727
665	82	76	3	9	236.195496
666	271	69	21	4	388.720703
667	121	88	34	2	802.679016
668	317	29	47	3	1225.8938
669	193	16	15	5	2374.26465
670	154	42	46	6	2693.12793
671	8	24	20	7	855.502808
672	202	53	21	6	583.081055
673	30	59	40	3	811.045044
674	19	24	19	7	1237.99109
675	141	55	44	7	579.424744
676	291	77	49	10	3660.29932
677	287	20	27	8	1402.25598
678	166	55	18	9	262.131012
679	89	89	17	6	1462.17163
680	121	76	15	7	3323.97046
681	292	44	26	9	2464.05469
682	253	27	50	5	163.800064
683	210	90	5	9	1308.79993
684	66	46	12	10	124.791855
685	148	12	26	9	2464.05469
686	205	79	1	2	35.4449272
687	115	18	44	4	331.099854
688	313	70	40	7	1892.43848
689	299	28	20	9	1099.93213
690	29	63	33	6	1063.51868
691	319	92	31	5	156.121567
692	335	83	40	9	2433.13525
693	72	90	32	1	215.028625
694	131	77	22	10	769.411682
695	173	83	29	5	2468.36621
696	198	98	49	10	3660.29932
697	42	88	40	1	270.348358
698	252	45	2	5	1848.177
699	92	32	37	4	465.818726
700	96	6	28	10	1619.3877
701	301	76	18	6	174.753998
702	268	62	2	10	3696.354
703	260	54	18	8	233.005341
704	169	92	37	9	1048.09216
705	112	9	36	7	1341.70239
706	79	94	31	3	93.6729431
707	124	35	38	8	3098.45996
708	35	12	46	4	1795.41858
709	171	92	9	6	2832.95337
710	205	59	26	9	2464.05469
711	181	58	19	6	1061.13525
712	40	90	6	2	185.986008
713	243	32	5	6	872.533264
714	186	22	13	7	469.687012
715	7	99	28	8	1295.51013
716	3	47	32	10	2150.28613
717	107	22	7	8	2253.39453
718	251	38	25	1	449.410126
719	31	40	44	3	248.32489
720	106	62	24	10	4408.64648
721	229	30	31	2	62.4486275
722	11	60	49	4	1464.11975
723	229	97	3	5	131.219727
724	235	88	49	5	1830.14966
725	177	21	27	5	876.409973
726	145	1	17	1	243.695267
727	329	59	4	7	3088.1272
728	141	14	7	3	845.022949
729	41	15	4	2	882.322083
730	322	70	36	7	1341.70239
731	229	64	2	3	1108.90625
732	122	90	47	9	3677.6814
733	191	48	3	9	236.195496
734	232	35	13	7	469.687012
735	212	77	3	1	26.2439442
736	336	99	6	10	929.930054
737	49	80	35	4	188.306824
738	126	41	20	5	611.073425
739	125	32	6	6	557.958008
740	199	39	20	6	733.288086
741	57	31	17	3	731.085815
742	178	25	48	4	1233.17395
743	250	41	49	8	2928.2395
744	286	35	18	8	233.005341
745	216	25	10	8	3166.14893
746	23	26	50	4	131.040054
747	201	8	50	9	294.840118
748	152	22	42	10	2317.07324
749	14	95	39	4	188.729355
750	284	88	38	1	387.307495
751	223	9	5	9	1308.79993
752	204	48	46	7	3141.98242
753	74	62	8	8	3218.14746
754	89	47	43	3	1087.30664
755	13	71	43	7	2537.04883
756	284	81	13	1	67.0981445
757	279	40	43	8	2899.48438
758	184	42	38	6	2323.84497
759	93	94	7	6	1690.0459
760	200	48	21	10	971.801758
761	74	85	26	10	2737.83838
762	158	34	36	10	1916.71765
763	344	34	10	8	3166.14893
764	295	54	10	10	3957.68604
765	80	92	25	9	4044.69116
766	150	94	6	4	371.972015
767	126	10	30	2	855.234314
768	164	8	32	1	215.028625
769	334	81	35	2	94.1534119
770	303	4	49	8	2928.2395
771	71	13	16	8	98.30233
772	195	47	38	5	1936.53748
773	122	85	37	8	931.637451
774	249	96	3	2	52.4878883
775	182	12	35	3	141.230118
776	251	74	3	5	131.219727
777	342	74	8	8	3218.14746
778	137	4	3	3	78.7318344
779	247	92	20	10	1222.14685
780	123	51	20	4	488.858734
781	118	15	22	10	769.411682
782	274	79	42	2	463.414673
783	169	50	23	6	2507.24902
784	160	92	10	7	2770.38037
785	187	10	19	8	1414.84692
786	255	41	31	2	62.4486275
787	126	69	45	9	1053.96252
788	128	94	16	10	122.877914
789	115	88	27	2	350.563995
790	136	50	8	1	402.268433
791	106	57	32	1	215.028625
792	319	60	28	9	1457.44885
793	175	24	45	8	936.85553
794	103	12	13	9	603.883301
795	92	48	22	1	76.9411697
796	97	14	37	5	582.273438
797	141	89	6	2	185.986008
798	230	26	3	5	131.219727
799	105	8	10	4	1583.07446
800	259	34	6	2	185.986008
801	316	94	15	3	1424.55884
802	84	56	42	2	463.414673
803	198	81	20	4	488.858734
804	277	89	24	5	2204.32324
805	223	74	14	8	1720.49915
806	139	2	35	5	235.38353
807	227	23	30	2	855.234314
808	219	46	24	3	1322.59387
809	82	19	46	5	2244.27319
810	241	81	42	10	2317.07324
811	1	83	31	1	31.2243137
812	26	24	24	10	4408.64648
813	154	5	36	8	1533.37415
814	20	30	38	9	3485.76758
815	197	27	27	2	350.563995
816	335	21	1	4	70.8898544
817	88	19	11	6	2455.91479
818	334	90	5	9	1308.79993
819	87	85	34	1	401.339508
820	193	39	49	10	3660.29932
821	130	55	18	5	145.628342
822	284	32	8	10	4022.68433
823	150	18	33	7	1240.77173
824	301	21	43	6	2174.61328
825	319	86	44	2	165.549927
826	320	48	38	2	774.61499
827	107	94	33	6	1063.51868
828	252	74	3	10	262.439453
829	317	56	23	8	3342.99854
830	141	11	14	3	645.187195
831	162	95	41	8	3635.30884
832	25	25	46	5	2244.27319
833	5	5	8	9	3620.41602
834	320	43	2	9	3326.71875
835	260	74	17	10	2436.95264
836	151	42	47	9	3677.6814
837	114	39	14	5	1075.31201
838	298	51	23	3	1253.62451
839	205	88	16	9	110.590118
840	88	84	18	7	203.879669
841	75	75	22	8	615.529358
842	249	99	18	9	262.131012
843	198	54	46	3	1346.56396
844	77	9	21	7	680.26123
845	327	92	2	1	369.635406
846	100	93	5	9	1308.79993
847	196	52	25	2	898.820251
848	99	20	17	4	974.781067
849	150	77	9	4	1888.63562
850	51	34	50	6	196.560089
851	203	66	35	6	282.460236
852	141	15	48	6	1849.76099
853	200	95	38	7	2711.15234
854	292	40	17	4	974.781067
855	331	54	29	3	1481.01965
856	224	57	12	2	24.9583702
857	218	53	18	5	145.628342
858	194	59	41	4	1817.65442
859	176	57	35	10	470.767059
860	308	32	5	1	145.422211
861	265	25	34	1	401.339508
862	308	26	14	3	645.187195
863	152	17	8	3	1206.8053
864	327	72	26	6	1642.70312
865	300	24	25	5	2247.05054
866	297	93	8	1	402.268433
867	188	98	3	8	209.951553
868	118	5	41	6	2726.48169
869	71	87	47	5	2043.15625
870	39	4	5	1	145.422211
871	37	50	23	7	2925.12378
872	326	38	49	1	366.029938
873	184	38	28	3	485.816284
874	26	34	35	3	141.230118
875	112	33	48	5	1541.46741
876	94	30	30	7	2993.32007
877	100	58	38	8	3098.45996
878	39	1	17	8	1949.56213
879	77	65	35	3	141.230118
880	246	7	32	6	1290.17175
881	239	98	18	7	203.879669
882	256	75	2	4	1478.54163
883	216	23	42	6	1390.24402
884	61	26	25	7	3145.87085
885	12	32	11	4	1637.27649
886	242	47	7	7	1971.72021
887	158	14	6	3	278.979004
888	55	32	32	5	1075.14307
889	55	91	37	10	1164.54688
890	264	4	32	1	215.028625
891	277	1	24	6	2645.18774
892	84	4	24	5	2204.32324
893	194	8	25	1	449.410126
894	73	57	22	4	307.764679
895	149	2	2	4	1478.54163
896	254	63	39	9	424.641052
897	226	99	27	5	876.409973
898	162	86	50	7	229.320099
899	52	38	8	6	2413.6106
900	254	57	50	6	196.560089
901	160	83	7	6	1690.0459
902	338	6	5	2	290.844421
903	42	17	21	1	97.1801758
904	311	18	3	10	262.439453
905	13	74	7	3	845.022949
906	137	87	42	4	926.829346
907	292	64	2	5	1848.177
908	12	69	13	9	603.883301
909	137	63	46	9	4039.69189
910	246	73	31	10	312.243134
911	204	51	30	10	4276.17139
912	79	29	28	5	809.693848
913	133	38	38	6	2323.84497
914	209	52	8	7	2815.87891
915	175	29	43	3	1087.30664
916	138	58	33	3	531.759338
917	292	6	13	1	67.0981445
918	146	16	40	4	1081.39343
919	340	37	40	4	1081.39343
920	115	1	35	1	47.0767059
921	6	44	37	5	582.273438
922	244	98	24	3	1322.59387
923	236	22	24	1	440.864624
924	338	55	4	1	441.161041
925	292	21	33	10	1772.53113
926	103	13	19	1	176.855865
927	158	90	32	4	860.114502
928	149	81	6	2	185.986008
929	186	19	39	10	471.823395
930	196	53	17	2	487.390533
931	60	6	49	2	732.059875
932	210	23	37	7	815.182739
933	337	81	22	2	153.882339
934	116	5	46	7	3141.98242
935	193	53	25	10	4494.10107
936	97	44	48	9	2774.64136
937	172	39	20	1	122.214684
938	55	76	49	8	2928.2395
939	344	70	5	7	1017.95544
940	220	58	18	2	58.2513351
941	209	77	17	3	731.085815
942	256	59	19	10	1768.55859
943	336	95	45	7	819.748596
944	273	17	36	4	766.687073
945	201	89	5	7	1017.95544
946	68	25	6	2	185.986008
947	139	98	41	4	1817.65442
948	146	40	32	10	2150.28613
949	54	32	1	8	141.779709
950	189	6	36	9	1725.0459
951	208	100	3	10	262.439453
952	339	19	42	1	231.707336
953	31	34	28	1	161.938766
954	140	51	47	10	4086.3125
955	21	30	21	5	485.900879
956	145	23	34	1	401.339508
957	90	44	18	6	174.753998
958	193	65	4	4	1764.64417
959	31	100	11	10	4093.19116
960	87	26	1	4	70.8898544
961	57	17	19	5	884.279297
962	270	58	50	7	229.320099
963	305	44	37	5	582.273438
964	207	47	23	3	1253.62451
965	320	49	6	9	836.937012
966	141	9	14	9	1935.56152
967	312	12	6	7	650.95105
968	46	52	44	2	165.549927
969	9	76	34	10	4013.39502
970	120	49	18	8	233.005341
971	78	60	38	7	2711.15234
972	196	54	23	5	2089.37402
973	110	20	45	1	117.106941
974	53	21	41	3	1363.24084
975	135	88	7	2	563.348633
976	221	31	44	7	579.424744
977	43	12	37	2	232.909363
978	204	40	15	8	3798.82349
979	30	51	49	8	2928.2395
980	292	22	7	2	563.348633
981	119	39	46	3	1346.56396
982	171	24	2	2	739.270813
983	79	69	3	1	26.2439442
984	175	20	37	9	1048.09216
985	278	1	40	4	1081.39343
986	45	78	20	2	244.429367
987	210	15	20	3	366.644043
988	230	64	36	9	1725.0459
989	10	11	48	2	616.586975
990	218	67	29	7	3455.7124
991	295	74	34	4	1605.35803
992	261	49	46	5	2244.27319
993	153	13	49	4	1464.11975
994	23	56	4	9	3970.44946
995	161	48	20	8	977.717468
996	172	23	47	4	1634.52502
997	93	87	34	1	401.339508
998	292	49	21	3	291.540527
999	162	99	50	4	131.040054
1000	98	70	39	6	283.094025
\.


--
-- TOC entry 4556 (class 0 OID 0)
-- Dependencies: 266
-- Name: prod_categorias_id_seq; Type: SEQUENCE SET; Schema: innova; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova.prod_categorias_id_seq', 4, true);


--
-- TOC entry 4557 (class 0 OID 0)
-- Dependencies: 263
-- Name: segmentos_id_seq; Type: SEQUENCE SET; Schema: innova; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova.segmentos_id_seq', 3, true);


--
-- TOC entry 4558 (class 0 OID 0)
-- Dependencies: 262
-- Name: ubicaciones_id_seq; Type: SEQUENCE SET; Schema: innova; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova.ubicaciones_id_seq', 10, true);


--
-- TOC entry 4559 (class 0 OID 0)
-- Dependencies: 278
-- Name: dm_compras_mensuales_clientes_top10_id_seq; Type: SEQUENCE SET; Schema: innova_dm; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova_dm.dm_compras_mensuales_clientes_top10_id_seq', 87, true);


--
-- TOC entry 4560 (class 0 OID 0)
-- Dependencies: 280
-- Name: dm_evolucion_mensual_ventas_region_id_seq; Type: SEQUENCE SET; Schema: innova_dm; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova_dm.dm_evolucion_mensual_ventas_region_id_seq', 120, true);


--
-- TOC entry 4561 (class 0 OID 0)
-- Dependencies: 274
-- Name: dm_productos_mas_vendidos_trimestre_id_seq; Type: SEQUENCE SET; Schema: innova_dm; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova_dm.dm_productos_mas_vendidos_trimestre_id_seq', 4, true);


--
-- TOC entry 4562 (class 0 OID 0)
-- Dependencies: 276
-- Name: dm_top3_productos_por top10_cliente_id_seq; Type: SEQUENCE SET; Schema: innova_dm; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova_dm."dm_top3_productos_por top10_cliente_id_seq"', 30, true);


--
-- TOC entry 4563 (class 0 OID 0)
-- Dependencies: 273
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE SET; Schema: innova_dw; Owner: g3wsuite
--

SELECT pg_catalog.setval('innova_dw.dim_tiempo_id_tiempo_seq', 346, true);


--
-- TOC entry 4356 (class 2606 OID 58431)
-- Name: customers customers_pk; Type: CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.customers
    ADD CONSTRAINT customers_pk PRIMARY KEY (id);


--
-- TOC entry 4366 (class 2606 OID 58486)
-- Name: invoices invoices_pk; Type: CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.invoices
    ADD CONSTRAINT invoices_pk PRIMARY KEY (id);


--
-- TOC entry 4364 (class 2606 OID 58476)
-- Name: prod_categorias prod_categorias_pk; Type: CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.prod_categorias
    ADD CONSTRAINT prod_categorias_pk PRIMARY KEY (id);


--
-- TOC entry 4362 (class 2606 OID 58493)
-- Name: products products_pk; Type: CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);


--
-- TOC entry 4360 (class 2606 OID 58452)
-- Name: cust_segmentos segmentos_pk; Type: CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.cust_segmentos
    ADD CONSTRAINT segmentos_pk PRIMARY KEY (id);


--
-- TOC entry 4358 (class 2606 OID 58444)
-- Name: cust_ubicaciones ubicaciones_pk; Type: CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.cust_ubicaciones
    ADD CONSTRAINT ubicaciones_pk PRIMARY KEY (id);


--
-- TOC entry 4380 (class 2606 OID 60625)
-- Name: dm_compras_mensuales_clientes_top10 dm_compras_mensuales_clientes_top10_pk; Type: CONSTRAINT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_compras_mensuales_clientes_top10
    ADD CONSTRAINT dm_compras_mensuales_clientes_top10_pk PRIMARY KEY (id);


--
-- TOC entry 4382 (class 2606 OID 60639)
-- Name: dm_evolucion_mensual_ventas_region dm_evolucion_mensual_ventas_region_pk; Type: CONSTRAINT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_evolucion_mensual_ventas_region
    ADD CONSTRAINT dm_evolucion_mensual_ventas_region_pk PRIMARY KEY (id);


--
-- TOC entry 4378 (class 2606 OID 58752)
-- Name: dm_top3_productos_por_top10_cliente dm_top3_productos_por_top10_cliente_pk; Type: CONSTRAINT; Schema: innova_dm; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dm.dm_top3_productos_por_top10_cliente
    ADD CONSTRAINT dm_top3_productos_por_top10_cliente_pk PRIMARY KEY (id);


--
-- TOC entry 4368 (class 2606 OID 58511)
-- Name: dim_customers dim_customers_pk; Type: CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.dim_customers
    ADD CONSTRAINT dim_customers_pk PRIMARY KEY (id_customer);


--
-- TOC entry 4370 (class 2606 OID 58516)
-- Name: dim_products dim_products_pk; Type: CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.dim_products
    ADD CONSTRAINT dim_products_pk PRIMARY KEY (id_product);


--
-- TOC entry 4374 (class 2606 OID 58537)
-- Name: dim_tiempo dim_tiempo_pk; Type: CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pk PRIMARY KEY (id_tiempo);


--
-- TOC entry 4376 (class 2606 OID 58528)
-- Name: dim_tiempo dim_tiempo_unique; Type: CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.dim_tiempo
    ADD CONSTRAINT dim_tiempo_unique UNIQUE (fecha_dia);


--
-- TOC entry 4372 (class 2606 OID 58521)
-- Name: fct_invoices fct_invoices_pk; Type: CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.fct_invoices
    ADD CONSTRAINT fct_invoices_pk PRIMARY KEY (id_invoice);


--
-- TOC entry 4383 (class 2606 OID 58458)
-- Name: customers customers_segmentos_fk; Type: FK CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.customers
    ADD CONSTRAINT customers_segmentos_fk FOREIGN KEY (segmento) REFERENCES innova.cust_segmentos(id);


--
-- TOC entry 4384 (class 2606 OID 58453)
-- Name: customers customers_ubicaciones_fk; Type: FK CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.customers
    ADD CONSTRAINT customers_ubicaciones_fk FOREIGN KEY (ubicacion) REFERENCES innova.cust_ubicaciones(id);


--
-- TOC entry 4386 (class 2606 OID 58487)
-- Name: invoices invoices_customers_fk; Type: FK CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.invoices
    ADD CONSTRAINT invoices_customers_fk FOREIGN KEY (id_customer) REFERENCES innova.customers(id);


--
-- TOC entry 4387 (class 2606 OID 58494)
-- Name: invoices invoices_products_fk; Type: FK CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.invoices
    ADD CONSTRAINT invoices_products_fk FOREIGN KEY (id_product) REFERENCES innova.products(id);


--
-- TOC entry 4385 (class 2606 OID 58477)
-- Name: products products_prod_categorias_fk; Type: FK CONSTRAINT; Schema: innova; Owner: g3wsuite
--

ALTER TABLE ONLY innova.products
    ADD CONSTRAINT products_prod_categorias_fk FOREIGN KEY (categoria) REFERENCES innova.prod_categorias(id);


--
-- TOC entry 4388 (class 2606 OID 58567)
-- Name: fct_invoices fct_invoices_dim_customers_fk; Type: FK CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.fct_invoices
    ADD CONSTRAINT fct_invoices_dim_customers_fk FOREIGN KEY (customer) REFERENCES innova_dw.dim_customers(id_customer);


--
-- TOC entry 4389 (class 2606 OID 58572)
-- Name: fct_invoices fct_invoices_dim_products_fk; Type: FK CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.fct_invoices
    ADD CONSTRAINT fct_invoices_dim_products_fk FOREIGN KEY (product) REFERENCES innova_dw.dim_products(id_product);


--
-- TOC entry 4390 (class 2606 OID 58577)
-- Name: fct_invoices fct_invoices_dim_tiempo_fk; Type: FK CONSTRAINT; Schema: innova_dw; Owner: g3wsuite
--

ALTER TABLE ONLY innova_dw.fct_invoices
    ADD CONSTRAINT fct_invoices_dim_tiempo_fk FOREIGN KEY (fecha) REFERENCES innova_dw.dim_tiempo(id_tiempo);


-- Completed on 2024-02-16 14:10:34

--
-- PostgreSQL database dump complete
--

