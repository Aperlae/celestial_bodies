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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    planet_id integer,
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    year_discovered integer,
    meaning text,
    star_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_new_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_new_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_new_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_new_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_new_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text,
    is_visible_to_naked_eye boolean,
    number_of_stars bigint,
    age_in_billions_of_years numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    year_discovered integer,
    diameter_in_km numeric,
    planet_id integer,
    composition character varying(50),
    orbit_period numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_km numeric,
    orbital_period_in_years numeric,
    confirmed_moons integer,
    has_life boolean,
    has_water boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_light_years numeric,
    brightness_of_star numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_new_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 1, 'Orion', 4000, 'The hunter Orion', 2);
INSERT INTO public.constellation VALUES (2, 2, 'Scorpius', 1500, 'The god of war', 4);
INSERT INTO public.constellation VALUES (3, 3, 'Centaurus', 2020, 'Closest star to the Sun', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 100000000000, 13.51);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', false, 1000000000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Distant galaxy in the local group', false, 40000000000, 12.2);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A majestic spiral galaxy', false, 300000000000, 13.0);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A galaxy with a bright halo of stars and dust', false, 800000000000, 12.8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', -4000, 3474, 1, 'rocky', 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 22.4, 2, 'rocky', 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 12.4, 2, 'rocky', 1.3);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 3642, 4, 'volcanic', 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 3121, 4, 'icy', 3.5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 5262, 4, 'rocky', 7.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 4821, 4, 'icy', 16.7);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, 5149, 5, 'icy', 15.9);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1789, 504, 5, 'icy', 1.4);
INSERT INTO public.moon VALUES (10, 'Rhea', 1672, 1528, 5, 'rocky', 4.5);
INSERT INTO public.moon VALUES (11, 'Iapetus', 1671, 1469, 5, 'icy', 79.3);
INSERT INTO public.moon VALUES (12, 'Miranda', 1948, 471, 6, 'icy', 1.4);
INSERT INTO public.moon VALUES (13, 'Ariel', 1851, 1158, 6, 'rocky', 2.5);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1851, 1169, 6, 'rocky', 4.1);
INSERT INTO public.moon VALUES (15, 'Triton', 1846, 2707, 7, 'icy', 5.9);
INSERT INTO public.moon VALUES (16, 'Proteus', 1989, 420, 7, 'rocky', 1.1);
INSERT INTO public.moon VALUES (17, 'Kepler Moon 1', 2022, 1000, 8, 'rocky', 340.0);
INSERT INTO public.moon VALUES (18, 'Gliese Moon 1', 2022, 1100, 9, 'rocky', 400.0);
INSERT INTO public.moon VALUES (20, 'Tau Ceti Moon 1', 2023, 850, 10, 'rocky', 150.0);
INSERT INTO public.moon VALUES (19, 'Luyten Moon 1', 2023, 900, 12, 'rocky', 200.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 149600000, 1.0, 1, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 227940000, 1.88, 2, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 750000000, 0.11, 0, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', 778500000, 11.86, 79, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 1433500000, 29.46, 83, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 2872500000, 84.01, 27, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 4495100000, 164.79, 14, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 620000000000, 290.0, 0, NULL, true, 4);
INSERT INTO public.planet VALUES (9, 'Gliese 581d', 20000000000, 67.0, 1, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Tau Ceti f', 11900000000, 100.0, 0, NULL, NULL, 6);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 150000000, 0.17, 0, false, false, 4);
INSERT INTO public.planet VALUES (12, 'Luyten b', 12000000, 0.2, 0, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 1.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 8.6, 25.4, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 4.37, 1.5, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 642, 10000, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 860, 120000, 4);
INSERT INTO public.star VALUES (6, 'Canopus', 310, 15000, 5);
INSERT INTO public.star VALUES (7, 'Vega', 25, 40, 6);


--
-- Name: constellation_new_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_new_constellation_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

