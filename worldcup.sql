commit--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
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

COPY public.games (game_id, year, round, winner_goals, opponent_goals, winner_id, opponent_id) FROM stdin;
1	2018	Final	4	2	49	50
2	2018	Third Place	2	0	51	52
3	2018	Semi-Final	2	1	50	52
4	2018	Semi-Final	1	0	49	51
5	2018	Quarter-Final	3	2	50	53
6	2018	Quarter-Final	2	0	52	54
7	2018	Quarter-Final	2	1	51	55
8	2018	Quarter-Final	2	0	49	56
9	2018	Eighth-Final	2	1	52	57
10	2018	Eighth-Final	1	0	54	58
11	2018	Eighth-Final	3	2	51	59
12	2018	Eighth-Final	2	0	55	60
13	2018	Eighth-Final	2	1	50	61
14	2018	Eighth-Final	2	1	53	62
15	2018	Eighth-Final	2	1	56	63
16	2018	Eighth-Final	4	3	49	64
17	2014	Final	1	0	65	64
18	2014	Third Place	3	0	66	55
19	2014	Semi-Final	1	0	64	66
20	2014	Semi-Final	7	1	65	55
21	2014	Quarter-Final	1	0	66	67
22	2014	Quarter-Final	1	0	64	51
23	2014	Quarter-Final	2	1	55	57
24	2014	Quarter-Final	1	0	65	49
25	2014	Eighth-Final	2	1	55	68
26	2014	Eighth-Final	2	0	57	56
27	2014	Eighth-Final	2	0	49	69
28	2014	Eighth-Final	2	1	65	70
29	2014	Eighth-Final	2	1	66	60
30	2014	Eighth-Final	2	1	67	71
31	2014	Eighth-Final	1	0	64	58
32	2014	Eighth-Final	2	1	51	72
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.teams (team_id, name) FROM stdin;
49	France
50	Croatia
51	Belgium
52	England
53	Russia
54	Sweden
55	Brazil
56	Uruguay
57	Colombia
58	Switzerland
59	Japan
60	Mexico
61	Denmark
62	Spain
63	Portugal
64	Argentina
65	Germany
66	Netherlands
67	Costa Rica
68	Chile
69	Nigeria
70	Algeria
71	Greece
72	United States
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 72, true);


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

