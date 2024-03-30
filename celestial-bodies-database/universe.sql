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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_spherical boolean,
    description text,
    age_in_billion_of_years numeric(4,2)
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
    name character varying(40) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    diameter_in_kilometer integer
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
    name character varying(40) NOT NULL,
    has_life boolean,
    description text,
    distance_from_earth numeric(8,3),
    diameter_in_km integer,
    star_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Hale-Bopp', 'Hale-Bopp is a solar system-wide collision comet that is named after the Hale-Bopp asteroid belt.', 1);
INSERT INTO public.comet VALUES (2, 'Protoplanetary', 'Protoplanetary is a solar system-wide collision comet that is named after the Protoplanetary belt.', 1);
INSERT INTO public.comet VALUES (3, 'Proterozoic', 'Proterozoic is a solar system-wide collision comet that is named after the Proterozoic belt.', 1);
INSERT INTO public.comet VALUES (4, 'Churyumov-Gerasimenko', 'Churyumov-Gerasimenko is a solar system-wide collision comet that is named after the Churyumov-Gerasimenko belt.', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way (MW)', false, 'The Milky Way is the galaxy that contains our Solar System. It is a barred spiral galaxy with a diameter of approximately 100,000 light-years and contains about 100-400 billion stars.', 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', false, 'Andromeda is a spiral galaxy located about 2.5 million light-years away from Earth in the constellation Andromeda. It is our closest major galactic neighbor and the most distant object visible to the naked eye from Earth.', 11.50);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy (M33)', false, 'The Triangulum Galaxy, also known as the Pinwheel Galaxy, is a spiral galaxy located about 2.7 million light-years away in the constellation Triangulum. It is a satellite galaxy of the Milky Way and is part of the Local Group of galaxies.', 4.50);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy (M51)', false, 'Pinwheel Galaxy is a spiral galaxy located about 29 million light-years away in the constellation Ursa Major. It is a member of the Sagittarius dwarf spheroidal galaxy (SdG) galaxy group.', 4.20);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy (M57)', false, 'The Whirlpool Galaxy, also known as Messier 57, is a spiral galaxy located about 27 million light-years away in the constellation Canes Venatici. It is the largest member of the Whirlpool Galaxy Supercluster.', 3.40);
INSERT INTO public.galaxy VALUES (6, 'NGC 5194 (Caleidoscope)', false, 'NGC 5194 is a spiral galaxy located about 24 million light-years away in the constellation Canes Venatici. It is known for its intricate arm structure and is often referred to as the Caleidoscope Galaxy.', 2.10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The moon is the only natural satellite of the Earth.', 3, 3476);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos is the innermost and smallest moon of Mars.', 4, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos is the outermost and smallest moon of Mars.', 4, 12);
INSERT INTO public.moon VALUES (4, 'Io', 'Io is the innermost and third largest moon of Jupiter.', 5, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 'Europa is the second largest moon of Jupiter.', 5, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Ganymede is the largest moon of Jupiter.', 5, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Callisto is the second largest moon of Jupiter.', 5, 4820);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Mimas is the smallest moon of Saturn.', 6, 396);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Enceladus is the second smallest moon of Saturn.', 6, 504);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Tethys is the third smallest moon of Saturn.', 6, 1062);
INSERT INTO public.moon VALUES (11, 'Dione', 'Dione is the fourth smallest moon of Saturn.', 6, 1123);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Rhea is the fifth smallest moon of Saturn.', 6, 1528);
INSERT INTO public.moon VALUES (13, 'Titan', 'Titan is the largest moon of Saturn.', 6, 5149);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Iapetus is the sixth smallest moon of Saturn.', 6, 1471);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Miranda is the first moon of Uranus.', 7, 471);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Ariel is the fourth largest moon of Uranus.', 7, 1158);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Umbriel is the fifth largest moon of Uranus.', 7, 1169);
INSERT INTO public.moon VALUES (18, 'Titania', 'Titania is the seventh largest moon of Uranus.', 7, 1578);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Oberon is the eighth largest moon of Uranus.', 7, 1526);
INSERT INTO public.moon VALUES (20, 'Triton', 'Triton is the largest moon of Neptune.', 8, 2707);
INSERT INTO public.moon VALUES (21, 'Nereid', 'Nereid is the second largest moon of Neptune.', 8, 340);
INSERT INTO public.moon VALUES (22, 'Proteus', 'Proteus is the third largest moon of Neptune.', 8, 420);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Mercury is the smallest planet in the Solar System.', 0.400, 4879, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Venus is the second planet in the Solar System.', 0.700, 12104, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Earth is the third planet from the Sun.', 1.000, 12756, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Mars is the fourth planet from the Sun.', 1.500, 6792, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Jupiter is the fifth planet from the Sun.', 5.200, 142796, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Saturn is the sixth planet from the Sun.', 9.600, 120536, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Uranus is the seventh planet from the Sun.', 19.200, 51118, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Neptune is the eighth planet from the Sun.', 30.100, 49528, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Pluto is the ninth planet from the Sun.', 39.500, 2370, 1);
INSERT INTO public.planet VALUES (10, 'Sun', true, 'The Sun is the star of the Solar System.', 0.000, 139000, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', false, 'Ceres is a dwarf planet located in the asteroid belt.', 4.600, 939, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', false, 'Haumea is a dwarf planet located in the asteroid belt.', 43.000, 1150, 1);
INSERT INTO public.planet VALUES (13, 'Eris', false, 'Eris is a dwarf planet located in the asteroid belt.', 67.000, 1169, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 11, 'Alpha Centauri A is the brightest star in the Alpha Centauri star system, located about 4.37 light-years away from Earth in the constellation Centaurus.', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 11, 'Alpha Centauri B is the second brightest star in the Alpha Centauri star system, located about 4.37 light-years away from Earth in the constellation Centaurus.', 1);
INSERT INTO public.star VALUES (3, 'Procyon A', 11, 'Procyon A is the primary star of the Procyon star system, located about 7.2 light-years away from Earth in the constellation Canis Minor.', 2);
INSERT INTO public.star VALUES (4, 'Procyon B', 2, 'Procyon B is a hot star located about 7.2 light-years away from Earth in the constellation Canis Minor.', 2);
INSERT INTO public.star VALUES (5, 'Rigel A', 12, 'Rigel A is the primary star of the Rigel star system, located about 869 light-years away from Earth in the constellation Taurus.', 3);
INSERT INTO public.star VALUES (6, 'Rigel B', 2, 'Rigel B is a hot star located about 869 light-years away from Earth in the constellation Taurus.', 3);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

