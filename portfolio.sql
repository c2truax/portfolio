--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying,
    description text,
    project_url character varying,
    image_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    github_url character varying,
    stack character varying,
    bio character varying
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: teches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.teches (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind character varying,
    image_url character varying
);


--
-- Name: teches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teches_id_seq OWNED BY public.teches.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: utilizes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.utilizes (
    id integer NOT NULL,
    project_id integer,
    tech_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: utilizes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.utilizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: utilizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.utilizes_id_seq OWNED BY public.utilizes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teches ALTER COLUMN id SET DEFAULT nextval('public.teches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utilizes ALTER COLUMN id SET DEFAULT nextval('public.utilizes_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects (id, title, description, project_url, image_url, created_at, updated_at, github_url, stack, bio) FROM stdin;
1	Portfolio	The portfolio you are viewing was created with Ruby on Rails utilizing a PostgreSQL database.	http://www.christruax.org/	portfolio.png	2018-12-17 16:03:05.514764	2018-12-19 20:06:46.651735	https://github.com/c2truax	Ruby on Rails	The portfolio was built to display my current projects, but also allow me to edit and add projects easily.
3	Coffee Tasters Wheel	Coffee Tasters Wheel is a website where a coffee taster can record the flavor profile of a particular coffee bean.	\N	coffeeflavorwheel.png	2018-12-17 16:14:08.20607	2018-12-19 20:19:06.126969	\N	MEAN	Certified coffee tasters can record the flavor profile of new beans.
2	Hearts and Hands			heartshandssite.png	2018-12-17 16:11:14.771073	2018-12-20 20:52:50.434249	https://github.com/c2truax	Python	An ecommmerce site I am building for a friend to sell handicrafts made by deaf and disabled craftsmen in China.
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 15, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20181216230107
20181216230146
20181216230217
20181217162450
20181217162847
20181217163158
20181218183940
20181219041417
20181219041636
20181219195535
20181219195601
\.


--
-- Data for Name: teches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teches (id, name, created_at, updated_at, kind, image_url) FROM stdin;
4	Ruby	2018-12-17 16:20:54.741331	2018-12-19 04:20:42.55951	language	icons8-ruby-programming-language-50.png
2	Python	2018-12-17 16:20:38.417543	2018-12-19 04:21:36.536297	language	icons8-python-48.png
5	HTML	2018-12-17 16:21:02.466687	2018-12-19 04:22:36.697251	language	icons8-html-5-48.png
8	Angular	2018-12-17 16:35:42.107351	2018-12-19 04:23:21.261976	framework	icons8-angularjs-48.png
17	PostgreSQL	2018-12-17 16:37:25.298756	2018-12-19 04:24:17.457831	database	icons8-postgresql-48.png
1	JavaScript	2018-12-17 16:20:30.250222	2018-12-19 22:01:15.830965	language	js.png
6	CSS	2018-12-17 16:21:08.585905	2018-12-19 22:03:40.274885	language	icons8-css3-48.png
7	Bootstrap	2018-12-17 16:21:33.860054	2018-12-19 22:04:37.806054	framework	icons8-bootstrap-48.png
9	Express.js	2018-12-17 16:35:57.491444	2018-12-19 22:05:19.638836	framework	expressjs.png
10	Socket.io	2018-12-17 16:36:08.890634	2018-12-19 22:06:00.900903	other	Socket-io.png
11	Django	2018-12-17 16:36:18.018119	2018-12-19 22:06:24.819768	framework	django.png
12	Flask	2018-12-17 16:36:26.114757	2018-12-19 22:08:29.332832	framework	flask.png
13	Rails	2018-12-17 16:36:33.939348	2018-12-19 22:10:06.496364	framework	rails.png
15	MySQL	2018-12-17 16:37:01.130963	2018-12-19 22:10:48.269835	database	mysql.png
19	MongoDB	2018-12-17 16:37:49.674688	2018-12-19 22:12:29.226575	database	icons8-mongodb-48.png
20	Mongoose	2018-12-17 16:37:56.778418	2018-12-19 22:12:57.916235	database	mongoose.png
23	jQuery	2018-12-17 16:38:53.097071	2018-12-19 22:26:15.626227	other	jquery.jpg
24	Node.js	2018-12-17 16:39:06.573306	2018-12-19 22:26:49.163805	other	icons8-nodejs-48.png
25	NPM	2018-12-17 16:39:23.461466	2018-12-19 22:28:25.211714	other	icons8-npm-48.png
29	D3.js	2018-12-17 16:40:08.422381	2018-12-19 22:30:11.181902	other	d3.png
27	Capybara	2018-12-17 16:39:44.013517	2018-12-19 22:30:34.947786	other	capybara.png
28	RSpec	2018-12-17 16:39:57.240126	2018-12-19 22:30:46.537308	other	rspec.png
33	AJAX	2018-12-17 16:41:20.287416	2018-12-19 22:31:40.801049	other	ajax.jpg
35	Postman	2018-12-17 16:41:39.708648	2018-12-19 22:32:31.521027	other	postman.jpg
36	AWS	2018-12-17 16:41:46.677353	2018-12-19 22:32:51.755141	other	aws.png
37	Balsamiq	2018-12-17 16:42:06.954656	2018-12-19 22:35:18.191095	other	balsamiq.png
38	Shopify	2018-12-17 16:54:53.304396	2018-12-19 22:35:55.937448	other	shopify.png
3	SQL	2018-12-17 16:20:46.489638	2018-12-19 22:49:53.438343	language	sql.png
14	MVC	2018-12-17 16:36:44.722949	2018-12-19 22:50:15.183102	framework	mvc.png
16	SQLite	2018-12-17 16:37:11.432935	2018-12-19 22:50:42.609827	database	sqlite.png
18	NoSQL	2018-12-17 16:37:33.529365	2018-12-19 22:51:09.526713	database	nosql.png
21	ERD	2018-12-17 16:38:16.857743	2018-12-19 22:52:18.055885	database	erd.png
26	TDD	2018-12-17 16:39:34.766482	2018-12-19 22:53:00.044307	other	tdd.png
30	BCrypt	2018-12-17 16:40:18.77495	2018-12-19 22:53:40.676191	other	bcrypt.png
31	RESTful	2018-12-17 16:40:28.252247	2018-12-19 22:54:04.707408	other	restful.png
32	Virtual Machines	2018-12-17 16:40:38.86021	2018-12-19 22:54:28.264555	other	virtualmachines.png
34	API	2018-12-17 16:41:26.504178	2018-12-19 22:54:53.753572	other	api.png
22	GitHub	2018-12-17 16:38:42.422939	2018-12-20 22:45:01.988269	other	GitHub-Mark-32px.png
\.


--
-- Name: teches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teches_id_seq', 39, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, password_digest, created_at, updated_at) FROM stdin;
1	c2truax@gmail.com	$2a$10$KVGemPVPiMF9bpFqiupV2e1ksRR92/58hr9C5ESmjc06kpCrW6p6a	2018-12-18 18:43:34.446853	2018-12-18 18:43:34.446853
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Data for Name: utilizes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.utilizes (id, project_id, tech_id, created_at, updated_at) FROM stdin;
1	1	4	2018-12-17 16:47:30.728192	2018-12-17 16:47:30.728192
2	1	13	2018-12-17 16:48:50.736061	2018-12-17 16:48:50.736061
3	1	17	2018-12-17 16:49:20.698126	2018-12-17 16:49:20.698126
9	3	1	2018-12-17 16:55:45.402154	2018-12-17 16:55:45.402154
10	3	8	2018-12-17 16:56:11.411989	2018-12-17 16:56:11.411989
11	3	9	2018-12-17 16:56:16.769273	2018-12-17 16:56:16.769273
12	3	19	2018-12-17 16:57:44.804092	2018-12-17 16:57:44.804092
13	3	20	2018-12-17 16:57:49.996066	2018-12-17 16:57:49.996066
14	3	24	2018-12-17 16:57:53.937588	2018-12-17 16:57:53.937588
15	3	29	2018-12-17 16:58:29.302943	2018-12-17 16:58:29.302943
30	2	\N	2018-12-20 20:59:01.302244	2018-12-20 20:59:01.302244
31	2	2	2018-12-20 20:59:01.307048	2018-12-20 20:59:01.307048
32	2	7	2018-12-20 20:59:01.310706	2018-12-20 20:59:01.310706
33	2	11	2018-12-20 20:59:01.314129	2018-12-20 20:59:01.314129
34	2	37	2018-12-20 20:59:01.317419	2018-12-20 20:59:01.317419
35	2	38	2018-12-20 20:59:01.322426	2018-12-20 20:59:01.322426
\.


--
-- Name: utilizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.utilizes_id_seq', 35, true);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: teches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.teches
    ADD CONSTRAINT teches_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: utilizes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.utilizes
    ADD CONSTRAINT utilizes_pkey PRIMARY KEY (id);


--
-- Name: index_utilizes_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_utilizes_on_project_id ON public.utilizes USING btree (project_id);


--
-- Name: index_utilizes_on_tech_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_utilizes_on_tech_id ON public.utilizes USING btree (tech_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: fk_rails_9e5406c69a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utilizes
    ADD CONSTRAINT fk_rails_9e5406c69a FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: fk_rails_df3aa09370; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utilizes
    ADD CONSTRAINT fk_rails_df3aa09370 FOREIGN KEY (tech_id) REFERENCES public.teches(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

