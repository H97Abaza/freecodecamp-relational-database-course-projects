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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(40) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (353, 2018, 'Final', 343, 344, 4, 2);
INSERT INTO public.games VALUES (354, 2018, 'Third Place', 345, 346, 2, 0);
INSERT INTO public.games VALUES (355, 2018, 'Semi-Final', 344, 346, 2, 1);
INSERT INTO public.games VALUES (356, 2018, 'Semi-Final', 343, 345, 1, 0);
INSERT INTO public.games VALUES (357, 2018, 'Quarter-Final', 344, 347, 3, 2);
INSERT INTO public.games VALUES (358, 2018, 'Quarter-Final', 346, 348, 2, 0);
INSERT INTO public.games VALUES (359, 2018, 'Quarter-Final', 345, 349, 2, 1);
INSERT INTO public.games VALUES (360, 2018, 'Quarter-Final', 343, 350, 2, 0);
INSERT INTO public.games VALUES (361, 2018, 'Eighth-Final', 346, 351, 2, 1);
INSERT INTO public.games VALUES (362, 2018, 'Eighth-Final', 348, 352, 1, 0);
INSERT INTO public.games VALUES (363, 2018, 'Eighth-Final', 345, 353, 3, 2);
INSERT INTO public.games VALUES (364, 2018, 'Eighth-Final', 349, 354, 2, 0);
INSERT INTO public.games VALUES (365, 2018, 'Eighth-Final', 344, 355, 2, 1);
INSERT INTO public.games VALUES (366, 2018, 'Eighth-Final', 347, 356, 2, 1);
INSERT INTO public.games VALUES (367, 2018, 'Eighth-Final', 350, 357, 2, 1);
INSERT INTO public.games VALUES (368, 2018, 'Eighth-Final', 343, 358, 4, 3);
INSERT INTO public.games VALUES (369, 2014, 'Final', 359, 358, 1, 0);
INSERT INTO public.games VALUES (370, 2014, 'Third Place', 360, 349, 3, 0);
INSERT INTO public.games VALUES (371, 2014, 'Semi-Final', 358, 360, 1, 0);
INSERT INTO public.games VALUES (372, 2014, 'Semi-Final', 359, 349, 7, 1);
INSERT INTO public.games VALUES (373, 2014, 'Quarter-Final', 360, 361, 1, 0);
INSERT INTO public.games VALUES (374, 2014, 'Quarter-Final', 358, 345, 1, 0);
INSERT INTO public.games VALUES (375, 2014, 'Quarter-Final', 349, 351, 2, 1);
INSERT INTO public.games VALUES (376, 2014, 'Quarter-Final', 359, 343, 1, 0);
INSERT INTO public.games VALUES (377, 2014, 'Eighth-Final', 349, 362, 2, 1);
INSERT INTO public.games VALUES (378, 2014, 'Eighth-Final', 351, 350, 2, 0);
INSERT INTO public.games VALUES (379, 2014, 'Eighth-Final', 343, 363, 2, 0);
INSERT INTO public.games VALUES (380, 2014, 'Eighth-Final', 359, 364, 2, 1);
INSERT INTO public.games VALUES (381, 2014, 'Eighth-Final', 360, 354, 2, 1);
INSERT INTO public.games VALUES (382, 2014, 'Eighth-Final', 361, 365, 2, 1);
INSERT INTO public.games VALUES (383, 2014, 'Eighth-Final', 358, 352, 1, 0);
INSERT INTO public.games VALUES (384, 2014, 'Eighth-Final', 345, 366, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (343, 'France');
INSERT INTO public.teams VALUES (344, 'Croatia');
INSERT INTO public.teams VALUES (345, 'Belgium');
INSERT INTO public.teams VALUES (346, 'England');
INSERT INTO public.teams VALUES (347, 'Russia');
INSERT INTO public.teams VALUES (348, 'Sweden');
INSERT INTO public.teams VALUES (349, 'Brazil');
INSERT INTO public.teams VALUES (350, 'Uruguay');
INSERT INTO public.teams VALUES (351, 'Colombia');
INSERT INTO public.teams VALUES (352, 'Switzerland');
INSERT INTO public.teams VALUES (353, 'Japan');
INSERT INTO public.teams VALUES (354, 'Mexico');
INSERT INTO public.teams VALUES (355, 'Denmark');
INSERT INTO public.teams VALUES (356, 'Spain');
INSERT INTO public.teams VALUES (357, 'Portugal');
INSERT INTO public.teams VALUES (358, 'Argentina');
INSERT INTO public.teams VALUES (359, 'Germany');
INSERT INTO public.teams VALUES (360, 'Netherlands');
INSERT INTO public.teams VALUES (361, 'Costa Rica');
INSERT INTO public.teams VALUES (362, 'Chile');
INSERT INTO public.teams VALUES (363, 'Nigeria');
INSERT INTO public.teams VALUES (364, 'Algeria');
INSERT INTO public.teams VALUES (365, 'Greece');
INSERT INTO public.teams VALUES (366, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 384, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 366, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

