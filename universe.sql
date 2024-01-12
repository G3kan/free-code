--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    description text,
    has_life boolean,
    galaxy_id integer NOT NULL,
    size numeric,
    age_of_year integer
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
    name character varying NOT NULL,
    description text,
    has_life boolean,
    moon_id integer NOT NULL,
    planet_id integer,
    size numeric,
    age_of_year integer
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
    name character varying NOT NULL,
    has_life boolean,
    description text,
    planet_id integer NOT NULL,
    star_id integer,
    size numeric,
    age_of_year integer
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
-- Name: shape; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.shape (
    shape_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id character varying(60)
);


ALTER TABLE public.shape OWNER TO freecodecamp;

--
-- Name: shape_shape_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.shape_shape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shape_shape_id_seq OWNER TO freecodecamp;

--
-- Name: shape_shape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.shape_shape_id_seq OWNED BY public.shape.shape_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying NOT NULL,
    description text,
    has_life boolean,
    star_id integer NOT NULL,
    galaxy_id integer,
    size numeric,
    age_of_year integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


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
-- Name: shape shape_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.shape ALTER COLUMN shape_id SET DEFAULT nextval('public.shape_shape_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Barred spiral galaxy containing our solar system.', true, 1, 120000, 136);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spiral galaxy closest to the Milky Way.', false, 2, 150000, 15000);
INSERT INTO public.galaxy VALUES ('Triangulum', 'Small galaxy in the Local Group.', false, 3, 4000, 20000);
INSERT INTO public.galaxy VALUES ('Messier 87', 'Elliptical galaxy with a supermassive black hole.', false, 4, 90000, 13000);
INSERT INTO public.galaxy VALUES ('Whirlpool', 'Classic spiral galaxy with a prominent spiral arm.', false, 5, 30000, 12000);
INSERT INTO public.galaxy VALUES ('Sombrero', 'Spiral galaxy with a bright nucleus resembling a sombrero.', false, 6, 50000, 11000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'Earth natural satellite.', NULL, 1, 3, 3474, 4);
INSERT INTO public.moon VALUES ('Phobos', 'Larger moon of Mars.', NULL, 2, 4, 22, 4);
INSERT INTO public.moon VALUES ('Deimos', 'Smaller moon of Mars.', NULL, 3, 4, 12, 4);
INSERT INTO public.moon VALUES ('Io', 'Moon of Jupiter known for volcanic activity.', NULL, 4, 5, 3660, 4);
INSERT INTO public.moon VALUES ('Europa', 'Moon of Jupiter with a subsurface ocean.', NULL, 5, 5, 3121, 4);
INSERT INTO public.moon VALUES ('Ganymede', 'Largest moon in the solar system, a moon of Jupiter.', NULL, 6, 5, 5268, 4);
INSERT INTO public.moon VALUES ('Titan', 'Largest moon of Saturn with a thick atmosphere.', NULL, 7, 6, 5150, 4);
INSERT INTO public.moon VALUES ('Enceladus', 'Moon of Saturn with geysers of water vapor.', NULL, 8, 6, 504, 4);
INSERT INTO public.moon VALUES ('Miranda', 'Moon of Uranus with a varied and unusual surface.', NULL, 9, 7, 471, 4);
INSERT INTO public.moon VALUES ('Triton', 'Moon of Neptune with geysers and a retrograde orbit.', NULL, 10, 8, 2707, 4);
INSERT INTO public.moon VALUES ('Charon', 'Largest moon of Pluto in a binary system with Pluto.', NULL, 11, 9, 1208, 4);
INSERT INTO public.moon VALUES ('Hiʻiaka', 'Moon of Haumea in the Kuiper Belt.', NULL, 12, 12, 160, 4);
INSERT INTO public.moon VALUES ('Luna', 'Moon of Earth.', NULL, 13, 3, 1737, 4);
INSERT INTO public.moon VALUES ('Callisto', 'Moon of Jupiter with a heavily cratered surface.', NULL, 14, 5, 4821, 4);
INSERT INTO public.moon VALUES ('Dione', 'Moon of Saturn with linear features on its surface.', NULL, 15, 6, 1123, 4);
INSERT INTO public.moon VALUES ('Ariel', 'Moon of Uranus with a bright and smooth surface.', NULL, 16, 7, 578, 4);
INSERT INTO public.moon VALUES ('Proteus', 'Moon of Neptune, one of the largest irregularly shaped moons.', NULL, 17, 8, 420, 4);
INSERT INTO public.moon VALUES ('Nix', 'Moon of Pluto in the Kuiper Belt.', NULL, 18, 9, 49, 4);
INSERT INTO public.moon VALUES ('Kerberos', 'Small moon of Pluto in the Kuiper Belt.', NULL, 19, 9, 12, 4);
INSERT INTO public.moon VALUES ('Namaka', 'Moon of Haumea in the Kuiper Belt.', NULL, 20, 12, 85, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', false, 'Smallest planet in our solar system.', 1, 1, 4879, 5);
INSERT INTO public.planet VALUES ('Venus', false, 'Known for its thick atmosphere and extreme temperatures.', 2, 1, 12104, 5);
INSERT INTO public.planet VALUES ('Earth', true, 'Our home planet.', 3, 1, 12742, 5);
INSERT INTO public.planet VALUES ('Mars', false, 'Often called the Red Planet.', 4, 1, 6779, 5);
INSERT INTO public.planet VALUES ('Jupiter', false, 'Largest planet with a strong magnetic field.', 5, 1, 139820, 5);
INSERT INTO public.planet VALUES ('Saturn', false, 'Known for its stunning ring system.', 6, 1, 116460, 5);
INSERT INTO public.planet VALUES ('Uranus', false, 'Gas giant with a unique rotation axis.', 7, 1, 50724, 5);
INSERT INTO public.planet VALUES ('Neptune', false, 'Blue giant with powerful storms.', 8, 1, 49244, 5);
INSERT INTO public.planet VALUES ('Pluto', false, 'Dwarf planet in the Kuiper Belt.', 9, 1, 2374, 5);
INSERT INTO public.planet VALUES ('Ceres', false, 'Dwarf planet and the largest object in the asteroid belt.', 10, 1, 590, 5);
INSERT INTO public.planet VALUES ('Eris', false, 'Dwarf planet in the scattered disc.', 11, 1, 2326, 5);
INSERT INTO public.planet VALUES ('Haumea', false, 'Dwarf planet in the Kuiper Belt with an elongated shape.', 12, 1, 2322, 5);


--
-- Data for Name: shape; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.shape VALUES (1, 'triangle', NULL);
INSERT INTO public.shape VALUES (2, 'sphere', NULL);
INSERT INTO public.shape VALUES (3, 'oval', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'Our solar system star.', false, 1, 1, 1, 460);
INSERT INTO public.star VALUES ('Proxima Centauri', 'Red dwarf star in the Alpha Centauri system.', false, 2, 1, 0.14, 561);
INSERT INTO public.star VALUES ('Betelgeuse', 'Red supergiant in the constellation Orion.', false, 3, 1, 764, 870);
INSERT INTO public.star VALUES ('Sirius', 'Binary star system, the brightest star in Earth night sky.', false, 4, 1, 20, 230);
INSERT INTO public.star VALUES ('Alpha Centauri A', 'Primary star in the Alpha Centauri binary system.', false, 5, 1, 12, 600);
INSERT INTO public.star VALUES ('Alpha Centauri B', 'Secondary star in the Alpha Centauri binary system.', false, 6, 1, 91, 600);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: shape_shape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.shape_shape_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: shape shape_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.shape
    ADD CONSTRAINT shape_name_key UNIQUE (name);


--
-- Name: shape shape_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.shape
    ADD CONSTRAINT shape_pkey PRIMARY KEY (shape_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

