--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE game;




--
-- Drop roles
--

DROP ROLE game;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE game;
ALTER ROLE game WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5b587deac2ae34c126e6222afedb790ea';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE game WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect game

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: USER; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE "USER" (
    id integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(100),
    is_enabled boolean DEFAULT true NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE "USER" OWNER TO game;

--
-- Name: COLUMN "USER".login; Type: COMMENT; Schema: public; Owner: game
--

COMMENT ON COLUMN "USER".login IS 'The login used to login';


--
-- Name: USER_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE "USER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "USER_id_seq" OWNER TO game;

--
-- Name: USER_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE "USER_id_seq" OWNED BY "USER".id;


--
-- Name: category_type; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE category_type (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    cat_id integer,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE category_type OWNER TO game;

--
-- Name: category_type_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE category_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_type_id_seq OWNER TO game;

--
-- Name: category_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE category_type_id_seq OWNED BY category_type.id;


--
-- Name: character; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE "character" (
    id integer NOT NULL,
    username character varying(200) NOT NULL,
    race_id integer NOT NULL,
    charc_id integer NOT NULL,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE "character" OWNER TO game;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE character_id_seq OWNER TO game;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE character_id_seq OWNED BY "character".id;


--
-- Name: character_skill; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE character_skill (
    char_id integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE character_skill OWNER TO game;

--
-- Name: characteristic; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE characteristic (
    id integer NOT NULL,
    strength integer NOT NULL,
    agility integer NOT NULL,
    endurance integer NOT NULL,
    intelligence integer NOT NULL,
    charisma integer NOT NULL,
    perception integer NOT NULL,
    luck integer NOT NULL,
    points_available integer DEFAULT 0 NOT NULL,
    skill_available integer DEFAULT 0 NOT NULL,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE characteristic OWNER TO game;

--
-- Name: characteristic_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE characteristic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characteristic_id_seq OWNER TO game;

--
-- Name: characteristic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE characteristic_id_seq OWNED BY characteristic.id;


--
-- Name: gender; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE gender (
    id integer NOT NULL,
    name character varying(200),
    strengthmin integer,
    strengthmax integer,
    agilitymin integer,
    agilitymax integer,
    endurancemin integer,
    endurancemax integer,
    intelligencemin integer,
    intelligencemax integer,
    charismamin integer,
    charismamax integer,
    perceptionmin integer,
    perceptionmax integer,
    luckmin integer,
    luckmax integer,
    heightmin integer,
    heightmax integer,
    weightmin integer,
    weightmax integer,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE gender OWNER TO game;

--
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gender_id_seq OWNER TO game;

--
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE gender_id_seq OWNED BY gender.id;


--
-- Name: gender_model; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE gender_model (
    gender_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE gender_model OWNER TO game;

--
-- Name: model; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE model (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    file_name character varying(300) NOT NULL,
    cat_id integer NOT NULL,
    color character varying(50),
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE model OWNER TO game;

--
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE model_id_seq OWNER TO game;

--
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE model_id_seq OWNED BY model.id;


--
-- Name: race; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE race (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    img_file character varying(300) NOT NULL,
    charc_id integer NOT NULL,
    race_opt_id integer NOT NULL,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE race OWNER TO game;

--
-- Name: race_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE race_id_seq OWNER TO game;

--
-- Name: race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE race_id_seq OWNED BY race.id;


--
-- Name: race_option; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE race_option (
    id integer NOT NULL,
    strengthmin integer NOT NULL,
    strengthmax integer NOT NULL,
    agilitymin integer NOT NULL,
    agilitymax integer NOT NULL,
    endurancemin integer NOT NULL,
    endurancemax integer NOT NULL,
    intelligencemin integer NOT NULL,
    intelligencemax integer NOT NULL,
    charismamin integer NOT NULL,
    charismamax integer NOT NULL,
    perceptionmin integer NOT NULL,
    perceptionmax integer NOT NULL,
    luckmin integer NOT NULL,
    luckmax integer NOT NULL,
    heightmin integer NOT NULL,
    heightmax integer NOT NULL,
    weightmin integer NOT NULL,
    weightmax integer NOT NULL,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE race_option OWNER TO game;

--
-- Name: race_option_gender; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE race_option_gender (
    race_opt_id integer NOT NULL,
    gender_id integer NOT NULL
);


ALTER TABLE race_option_gender OWNER TO game;

--
-- Name: race_option_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE race_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE race_option_id_seq OWNER TO game;

--
-- Name: race_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE race_option_id_seq OWNED BY race_option.id;


--
-- Name: script; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE script (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    file_name character varying(300) NOT NULL,
    arguments character varying(500),
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE script OWNER TO game;

--
-- Name: script_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE script_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE script_id_seq OWNER TO game;

--
-- Name: script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE script_id_seq OWNED BY script.id;


--
-- Name: skill; Type: TABLE; Schema: public; Owner: game
--

CREATE TABLE skill (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    skill_id integer,
    "position" boolean DEFAULT false NOT NULL,
    script_id integer NOT NULL,
    on_init boolean DEFAULT false NOT NULL,
    creation_date timestamp without time zone DEFAULT now(),
    creation_author character varying(200),
    last_modification_date timestamp without time zone DEFAULT now(),
    last_modification_author character varying(200),
    version integer DEFAULT 0
);


ALTER TABLE skill OWNER TO game;

--
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: game
--

CREATE SEQUENCE skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skill_id_seq OWNER TO game;

--
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: game
--

ALTER SEQUENCE skill_id_seq OWNED BY skill.id;


--
-- Name: USER id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY "USER" ALTER COLUMN id SET DEFAULT nextval('"USER_id_seq"'::regclass);


--
-- Name: category_type id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY category_type ALTER COLUMN id SET DEFAULT nextval('category_type_id_seq'::regclass);


--
-- Name: character id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY "character" ALTER COLUMN id SET DEFAULT nextval('character_id_seq'::regclass);


--
-- Name: characteristic id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY characteristic ALTER COLUMN id SET DEFAULT nextval('characteristic_id_seq'::regclass);


--
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY gender ALTER COLUMN id SET DEFAULT nextval('gender_id_seq'::regclass);


--
-- Name: model id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY model ALTER COLUMN id SET DEFAULT nextval('model_id_seq'::regclass);


--
-- Name: race id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY race ALTER COLUMN id SET DEFAULT nextval('race_id_seq'::regclass);


--
-- Name: race_option id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY race_option ALTER COLUMN id SET DEFAULT nextval('race_option_id_seq'::regclass);


--
-- Name: script id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY script ALTER COLUMN id SET DEFAULT nextval('script_id_seq'::regclass);


--
-- Name: skill id; Type: DEFAULT; Schema: public; Owner: game
--

ALTER TABLE ONLY skill ALTER COLUMN id SET DEFAULT nextval('skill_id_seq'::regclass);


--
-- Data for Name: USER; Type: TABLE DATA; Schema: public; Owner: game
--

COPY "USER" (id, login, password, email, is_enabled, first_name, last_name, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
-1	admin	admin	admin@example.com	t	\N	\N	2018-01-03 23:52:34.220924	\N	2018-01-03 23:52:34.220924	\N	1
\.


--
-- Name: USER_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('"USER_id_seq"', 1, false);


--
-- Data for Name: category_type; Type: TABLE DATA; Schema: public; Owner: game
--

COPY category_type (id, name, description, cat_id, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
-1	TEST	THIS IS A TEST CATEGORY	\N	2018-01-03 23:52:34.23192	\N	2018-01-03 23:52:34.23192	\N	0
1	asdfasd	asdf	\N	2018-01-03 21:10:01.27	admin	2018-01-03 21:10:19.557	admin	1
2	aasdfasaasdfas	\N	\N	2018-01-04 09:04:15.173	admin	\N	\N	0
3	qwerqwr	\N	\N	2018-01-04 10:39:20.135	admin	\N	\N	0
4	qwerqew	\N	\N	2018-01-04 12:22:02.485	admin	\N	\N	0
5	rewq	\N	\N	2018-01-04 12:34:20.094	admin	\N	\N	0
\.


--
-- Name: category_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('category_type_id_seq', 5, true);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: game
--

COPY "character" (id, username, race_id, charc_id, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
\.


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('character_id_seq', 1, true);


--
-- Data for Name: character_skill; Type: TABLE DATA; Schema: public; Owner: game
--

COPY character_skill (char_id, skill_id) FROM stdin;
\.


--
-- Data for Name: characteristic; Type: TABLE DATA; Schema: public; Owner: game
--

COPY characteristic (id, strength, agility, endurance, intelligence, charisma, perception, luck, points_available, skill_available, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
1	5	4	4	4	4	4	5	0	0	2018-01-03 23:52:34.225573	\N	2018-01-03 23:52:34.225573	\N	1
\.


--
-- Name: characteristic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('characteristic_id_seq', 1, true);


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: game
--

COPY gender (id, name, strengthmin, strengthmax, agilitymin, agilitymax, endurancemin, endurancemax, intelligencemin, intelligencemax, charismamin, charismamax, perceptionmin, perceptionmax, luckmin, luckmax, heightmin, heightmax, weightmin, weightmax, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
1	MALE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-01-03 23:52:34.244166	\N	2018-01-03 23:52:34.244166	\N	0
2	FEMALE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2018-01-03 23:52:34.246561	\N	2018-01-03 23:52:34.246561	\N	0
\.


--
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('gender_id_seq', 2, true);


--
-- Data for Name: gender_model; Type: TABLE DATA; Schema: public; Owner: game
--

COPY gender_model (gender_id, model_id) FROM stdin;
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: game
--

COPY model (id, name, file_name, cat_id, color, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
-1	TEST_MODEL	TEST_MODEL.FDX	-1	#FFFFFF	2018-01-03 23:52:34.234366	\N	2018-01-03 23:52:34.234366	\N	0
\.


--
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('model_id_seq', 1, false);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: game
--

COPY race (id, name, description, img_file, charc_id, race_opt_id, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
\.


--
-- Name: race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('race_id_seq', 1, false);


--
-- Data for Name: race_option; Type: TABLE DATA; Schema: public; Owner: game
--

COPY race_option (id, strengthmin, strengthmax, agilitymin, agilitymax, endurancemin, endurancemax, intelligencemin, intelligencemax, charismamin, charismamax, perceptionmin, perceptionmax, luckmin, luckmax, heightmin, heightmax, weightmin, weightmax, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
1	5	30	5	30	5	30	5	30	5	30	5	30	5	30	110	220	35	150	2018-01-03 23:52:34.229509	\N	2018-01-03 23:52:34.229509	\N	0
\.


--
-- Data for Name: race_option_gender; Type: TABLE DATA; Schema: public; Owner: game
--

COPY race_option_gender (race_opt_id, gender_id) FROM stdin;
\.


--
-- Name: race_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('race_option_id_seq', 1, true);


--
-- Data for Name: script; Type: TABLE DATA; Schema: public; Owner: game
--

COPY script (id, name, file_name, arguments, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
-1	TEST_NAME	TEST_SCRIPT.JAR	\N	2018-01-03 23:52:34.24847	\N	2018-01-03 23:52:34.24847	\N	0
\.


--
-- Name: script_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('script_id_seq', 1, false);


--
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: game
--

COPY skill (id, name, skill_id, "position", script_id, on_init, creation_date, creation_author, last_modification_date, last_modification_author, version) FROM stdin;
-1	TEST_SKILL	\N	f	-1	f	2018-01-03 23:52:34.250819	\N	2018-01-03 23:52:34.250819	\N	0
\.


--
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: game
--

SELECT pg_catalog.setval('skill_id_seq', 1, false);


--
-- Name: USER USER_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "USER"
    ADD CONSTRAINT "USER_pkey" PRIMARY KEY (id);


--
-- Name: category_type category_type_name_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY category_type
    ADD CONSTRAINT category_type_name_uq UNIQUE (name);


--
-- Name: category_type category_type_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY category_type
    ADD CONSTRAINT category_type_pkey PRIMARY KEY (id);


--
-- Name: character character_chars_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_chars_uq UNIQUE (charc_id);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: character_skill character_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY character_skill
    ADD CONSTRAINT character_skill_pkey PRIMARY KEY (char_id, skill_id);


--
-- Name: character character_username_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_username_uq UNIQUE (username);


--
-- Name: characteristic characteristic_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY characteristic
    ADD CONSTRAINT characteristic_pkey PRIMARY KEY (id);


--
-- Name: gender_model gender_model_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY gender_model
    ADD CONSTRAINT gender_model_pkey PRIMARY KEY (gender_id, model_id);


--
-- Name: gender gender_name_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY gender
    ADD CONSTRAINT gender_name_uq UNIQUE (name);


--
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- Name: model model_name_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY model
    ADD CONSTRAINT model_name_uq UNIQUE (name);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- Name: race_option_gender race_option_gender_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race_option_gender
    ADD CONSTRAINT race_option_gender_pkey PRIMARY KEY (race_opt_id, gender_id);


--
-- Name: race_option race_option_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race_option
    ADD CONSTRAINT race_option_pkey PRIMARY KEY (id);


--
-- Name: race race_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_pkey PRIMARY KEY (id);


--
-- Name: script script_name_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY script
    ADD CONSTRAINT script_name_uq UNIQUE (name);


--
-- Name: script script_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY script
    ADD CONSTRAINT script_pkey PRIMARY KEY (id);


--
-- Name: skill skill_name_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_name_uq UNIQUE (name);


--
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- Name: USER user_login_uq; Type: CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "USER"
    ADD CONSTRAINT user_login_uq UNIQUE (login);


--
-- Name: category_type category_type_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY category_type
    ADD CONSTRAINT category_type_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES category_type(id);


--
-- Name: character character_charc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_charc_id_fkey FOREIGN KEY (charc_id) REFERENCES characteristic(id);


--
-- Name: character character_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_race_id_fkey FOREIGN KEY (race_id) REFERENCES race(id);


--
-- Name: character_skill character_skill_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY character_skill
    ADD CONSTRAINT character_skill_char_id_fkey FOREIGN KEY (char_id) REFERENCES "character"(id);


--
-- Name: character_skill character_skill_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY character_skill
    ADD CONSTRAINT character_skill_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES skill(id);


--
-- Name: gender_model gender_model_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY gender_model
    ADD CONSTRAINT gender_model_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES race_option(id);


--
-- Name: gender_model gender_model_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY gender_model
    ADD CONSTRAINT gender_model_model_id_fkey FOREIGN KEY (model_id) REFERENCES model(id);


--
-- Name: model model_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY model
    ADD CONSTRAINT model_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES category_type(id);


--
-- Name: race race_charc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_charc_id_fkey FOREIGN KEY (charc_id) REFERENCES characteristic(id);


--
-- Name: race_option_gender race_option_gender_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race_option_gender
    ADD CONSTRAINT race_option_gender_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES gender(id);


--
-- Name: race_option_gender race_option_gender_race_opt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race_option_gender
    ADD CONSTRAINT race_option_gender_race_opt_id_fkey FOREIGN KEY (race_opt_id) REFERENCES race_option(id);


--
-- Name: race race_race_opt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY race
    ADD CONSTRAINT race_race_opt_id_fkey FOREIGN KEY (race_opt_id) REFERENCES race_option(id);


--
-- Name: skill skill_script_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_script_id_fkey FOREIGN KEY (script_id) REFERENCES script(id);


--
-- Name: skill skill_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: game
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES skill(id);


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

