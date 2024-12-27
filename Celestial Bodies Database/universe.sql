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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: star_color; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.star_color AS ENUM (
    'blue',
    'bluish-white',
    'white',
    'yellowish-white',
    'yellow',
    'orange',
    'red'
);


ALTER TYPE public.star_color OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    image_url text,
    name_origin text,
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    mass_kg numeric NOT NULL,
    rotation_period_hours integer,
    orbital_period_days integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    mass_kg numeric NOT NULL,
    habitable boolean,
    has_planetary_ring boolean,
    image_url text,
    rotation_period_hours integer,
    orbital_period_days integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying NOT NULL,
    launch_date date
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    age_billion_years double precision,
    color public.star_color
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Via_l%C3%A1ctea_sobre_el_Sajama.jpg', 'The appearance from Earth of the galaxy—a band of light', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'https://upload.wikimedia.org/wikipedia/commons/c/c2/M31_09-01-2011_%28cropped%29.jpg', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', true);
INSERT INTO public.galaxy VALUES (3, 'Eye of God', 'https://upload.wikimedia.org/wikipedia/commons/b/b3/NGC_1232.jpg', 'Named after its structural appearance', true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'https://upload.wikimedia.org/wikipedia/commons/5/5e/M104_ngc4594_sombrero_galaxy_hi-res.jpg', 'Similar in appearance to a sombrero.', false);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Cartwheel_Galaxy_JWST_NIRCam%2BMIRI_Full_Res.png', 'Its visual appearance is similar to that of a spoked cartwheel.', false);
INSERT INTO public.galaxy VALUES (6, 'Bear Paw', 'https://upload.wikimedia.org/wikipedia/commons/5/5b/NGC2537_-_SDSS_DR14.jpg', 'It resembles the appearance of a bear claw.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 73500000000000000000000, 656, 27);
INSERT INTO public.moon VALUES (2, 'Io', 5, 89300000000000000000000, 43, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 48000000000000000000000, 85, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 148000000000000000000000, 172, 7);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 108000000000000000000000, 17, 17);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 135000000000000000000000, 16, 16);
INSERT INTO public.moon VALUES (7, 'Rhea', 6, 23100000000000000000000, 5, 5);
INSERT INTO public.moon VALUES (8, 'Triton', 8, 21400000000000000000000, -6, 6);
INSERT INTO public.moon VALUES (9, 'Phobos', 4, 10800000000000000, 8, 0);
INSERT INTO public.moon VALUES (10, 'Deimos', 4, 2000000000000000, 30, 1);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 108000000000000000000, 1, 1);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 37500000000000000000, 1, 1);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 434000000000000000000, 79, 79);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 110000000000000000000, 3, 3);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 65900000000000000000, 1, 1);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 457000000000000000000, 3, 3);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 310000000000000000000, 4, 4);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 3490000000000000000000, 9, 9);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 3040000000000000000000, 14, 14);
INSERT INTO public.moon VALUES (20, 'Leda', 5, 540000000000000000, 1, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 3, false, false, 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mercury_in_true_color.jpg', 1408, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4, false, false, 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Venus_2_Approach_Image.jpg', 5833, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 5, true, false, 'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg', 24, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6, false, false, 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png', 25, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1, false, true, 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg', 10, 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 5, false, true, 'https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg', 11, 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 8, false, true, 'https://upload.wikimedia.org/wikipedia/commons/6/69/Uranus_Voyager2_color_calibrated.png', 17, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1, false, true, 'https://en.wikipedia.org/wiki/Neptune#/media/File:Neptune_Voyager2_color_calibrated.png', 16, 60190);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 7, 4.22, true, false, NULL, 45, 290);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 8, 1.17, true, false, NULL, 11, 11);
INSERT INTO public.planet VALUES (11, 'Kepler-16b', 9, 2.4, false, false, NULL, 20, 229);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 10, 7.5, true, false, NULL, 25, 6);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 11, 1.89, false, false, NULL, 1, 4);
INSERT INTO public.planet VALUES (14, '55 Cancri e', 12, 8.0, false, false, NULL, 1, 1);
INSERT INTO public.planet VALUES (15, 'LHS 1140 b', 13, 4.25, true, false, NULL, 24, 25);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 1, 1, NULL, 'Mariner 10', '1973-11-03');
INSERT INTO public.space_mission VALUES (2, 1, 5, 5, 'Galileo', '1989-10-18');
INSERT INTO public.space_mission VALUES (3, 1, 6, 7, 'Cassini-Huygens', '1997-10-15');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.6, 'white');
INSERT INTO public.star VALUES (2, 'Polaris', 1, 0.055, 'yellowish-white');
INSERT INTO public.star VALUES (3, 'Wolf 359', 1, 0.1, 'red');
INSERT INTO public.star VALUES (4, 'Sirius', 1, 0.0242, 'white');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 0.014, 'red');
INSERT INTO public.star VALUES (6, 'Antares', 1, 0.015, 'red');
INSERT INTO public.star VALUES (7, 'Kepler-22', 1, 8, 'yellow');
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 4.85, 'red');
INSERT INTO public.star VALUES (9, 'Kepler-16', 1, 7, 'yellow');
INSERT INTO public.star VALUES (10, 'TRAPPIST-1', 1, 7.6, 'red');
INSERT INTO public.star VALUES (11, 'HD 209458', 1, 1.5, 'yellow');
INSERT INTO public.star VALUES (12, '55 Cancri', 1, 8, 'yellow');
INSERT INTO public.star VALUES (13, 'LHS 1140', 1, 5, 'red');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 13, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_mission space_mission_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: space_mission space_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: space_mission space_mission_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

