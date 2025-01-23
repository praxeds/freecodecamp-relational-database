--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (23, 'user_1737616516279', 2, 2);
INSERT INTO public.users VALUES (3, 'user_1737615981666', 2, 47);
INSERT INTO public.users VALUES (22, 'user_1737616516280', 5, 301);
INSERT INTO public.users VALUES (1, 'juju', 8, 8);
INSERT INTO public.users VALUES (2, 'user_1737615981667', 5, 176);
INSERT INTO public.users VALUES (5, 'user_1737616013320', 2, 620);
INSERT INTO public.users VALUES (4, 'user_1737616013321', 5, 555);
INSERT INTO public.users VALUES (25, 'user_1737616615102', 2, 206);
INSERT INTO public.users VALUES (7, 'user_1737616073612', 2, 7);
INSERT INTO public.users VALUES (6, 'user_1737616073613', 5, 355);
INSERT INTO public.users VALUES (24, 'user_1737616615103', 5, 179);
INSERT INTO public.users VALUES (9, 'user_1737616131800', 2, 50);
INSERT INTO public.users VALUES (8, 'user_1737616131801', 5, 572);
INSERT INTO public.users VALUES (11, 'user_1737616177492', 2, 65);
INSERT INTO public.users VALUES (27, 'user_1737616639759', 2, 200);
INSERT INTO public.users VALUES (10, 'user_1737616177493', 5, 138);
INSERT INTO public.users VALUES (13, 'user_1737616215184', 2, 387);
INSERT INTO public.users VALUES (26, 'user_1737616639760', 5, 19);
INSERT INTO public.users VALUES (12, 'user_1737616215185', 5, 360);
INSERT INTO public.users VALUES (15, 'user_1737616273900', 2, 874);
INSERT INTO public.users VALUES (14, 'user_1737616273901', 5, 82);
INSERT INTO public.users VALUES (17, 'user_1737616314614', 2, 797);
INSERT INTO public.users VALUES (16, 'user_1737616314615', 5, 91);
INSERT INTO public.users VALUES (19, 'user_1737616394344', 2, 299);
INSERT INTO public.users VALUES (18, 'user_1737616394345', 5, 207);
INSERT INTO public.users VALUES (21, 'user_1737616440792', 2, 544);
INSERT INTO public.users VALUES (20, 'user_1737616440793', 5, 178);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 27, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

