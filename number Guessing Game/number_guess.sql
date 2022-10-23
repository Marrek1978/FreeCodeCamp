--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    game_number integer NOT NULL,
    num_guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 1, 11);
INSERT INTO public.games VALUES (2, 1, 2, 8);
INSERT INTO public.games VALUES (3, 6, 1, 1);
INSERT INTO public.games VALUES (4, 6, 1, 3);
INSERT INTO public.games VALUES (5, 6, 1, 1);
INSERT INTO public.games VALUES (6, 11, 1, 2);
INSERT INTO public.games VALUES (7, 6, 1, 1);
INSERT INTO public.games VALUES (8, 6, 5, 1);
INSERT INTO public.games VALUES (9, 6, 6, 1);
INSERT INTO public.games VALUES (10, 12, 1, 14);
INSERT INTO public.games VALUES (11, 12, 2, 14);
INSERT INTO public.games VALUES (12, 13, 1, 14);
INSERT INTO public.games VALUES (13, 13, 2, 14);
INSERT INTO public.games VALUES (14, 12, 3, 15);
INSERT INTO public.games VALUES (15, 12, 4, 14);
INSERT INTO public.games VALUES (16, 12, 5, 14);
INSERT INTO public.games VALUES (17, 6, 7, 1);
INSERT INTO public.games VALUES (18, 14, 1, 14);
INSERT INTO public.games VALUES (19, 14, 2, 14);
INSERT INTO public.games VALUES (20, 15, 1, 14);
INSERT INTO public.games VALUES (21, 15, 2, 14);
INSERT INTO public.games VALUES (22, 14, 3, 15);
INSERT INTO public.games VALUES (23, 14, 4, 14);
INSERT INTO public.games VALUES (24, 14, 5, 14);
INSERT INTO public.games VALUES (25, 16, 1, 14);
INSERT INTO public.games VALUES (26, 16, 2, 14);
INSERT INTO public.games VALUES (27, 17, 1, 14);
INSERT INTO public.games VALUES (28, 17, 2, 14);
INSERT INTO public.games VALUES (29, 16, 3, 15);
INSERT INTO public.games VALUES (30, 16, 4, 14);
INSERT INTO public.games VALUES (31, 16, 5, 14);
INSERT INTO public.games VALUES (32, 18, 1, 14);
INSERT INTO public.games VALUES (33, 18, 2, 14);
INSERT INTO public.games VALUES (34, 19, 1, 14);
INSERT INTO public.games VALUES (35, 19, 2, 14);
INSERT INTO public.games VALUES (36, 18, 3, 15);
INSERT INTO public.games VALUES (37, 18, 4, 14);
INSERT INTO public.games VALUES (38, 18, 5, 14);
INSERT INTO public.games VALUES (39, 20, 1, 14);
INSERT INTO public.games VALUES (40, 20, 2, 14);
INSERT INTO public.games VALUES (41, 21, 1, 14);
INSERT INTO public.games VALUES (42, 21, 2, 14);
INSERT INTO public.games VALUES (43, 20, 3, 15);
INSERT INTO public.games VALUES (44, 20, 4, 14);
INSERT INTO public.games VALUES (45, 20, 5, 14);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('marrek', 1);
INSERT INTO public.users VALUES ('marco', 2);
INSERT INTO public.users VALUES ('user_1666533675421', 3);
INSERT INTO public.users VALUES ('user_1666533675420', 4);
INSERT INTO public.users VALUES ('m', 5);
INSERT INTO public.users VALUES ('mm', 6);
INSERT INTO public.users VALUES ('user_1666536588978', 7);
INSERT INTO public.users VALUES ('user_1666536588977', 8);
INSERT INTO public.users VALUES ('user_1666536929604', 9);
INSERT INTO public.users VALUES ('user_1666536929603', 10);
INSERT INTO public.users VALUES ('MM', 11);
INSERT INTO public.users VALUES ('user_1666539374993', 12);
INSERT INTO public.users VALUES ('user_1666539374992', 13);
INSERT INTO public.users VALUES ('user_1666539768657', 14);
INSERT INTO public.users VALUES ('user_1666539768656', 15);
INSERT INTO public.users VALUES ('user_1666539908200', 16);
INSERT INTO public.users VALUES ('user_1666539908199', 17);
INSERT INTO public.users VALUES ('user_1666540063089', 18);
INSERT INTO public.users VALUES ('user_1666540063088', 19);
INSERT INTO public.users VALUES ('user_1666540165446', 20);
INSERT INTO public.users VALUES ('user_1666540165445', 21);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

