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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22),
    game_id integer NOT NULL,
    game_played integer DEFAULT 1,
    guest_count integer DEFAULT 0,
    secret_number integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_game_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_game_id_seq OWNED BY public.number_guess.game_id;


--
-- Name: number_guess game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN game_id SET DEFAULT nextval('public.number_guess_game_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('ali', 493, 1, 12, 19);
INSERT INTO public.number_guess VALUES ('user_1705075664604', 494, 1, 268, 267);
INSERT INTO public.number_guess VALUES ('user_1705075664604', 495, 1, 458, 457);
INSERT INTO public.number_guess VALUES ('user_1705075664603', 496, 1, 1001, 1000);
INSERT INTO public.number_guess VALUES ('user_1705075664603', 497, 1, 478, 477);
INSERT INTO public.number_guess VALUES ('user_1705075664604', 498, 1, 641, 638);
INSERT INTO public.number_guess VALUES ('user_1705075664604', 499, 1, 493, 492);
INSERT INTO public.number_guess VALUES ('user_1705075664604', 500, 1, 588, 587);
INSERT INTO public.number_guess VALUES ('user_1705075698032', 501, 1, 876, 875);
INSERT INTO public.number_guess VALUES ('user_1705075698032', 502, 1, 472, 471);
INSERT INTO public.number_guess VALUES ('user_1705075698031', 503, 1, 12, 11);
INSERT INTO public.number_guess VALUES ('user_1705075698031', 504, 1, 784, 783);
INSERT INTO public.number_guess VALUES ('user_1705075698032', 505, 1, 479, 476);
INSERT INTO public.number_guess VALUES ('user_1705075698032', 506, 1, 493, 492);
INSERT INTO public.number_guess VALUES ('user_1705075698032', 507, 1, 177, 176);
INSERT INTO public.number_guess VALUES ('user_1705075704915', 508, 1, 29, 28);
INSERT INTO public.number_guess VALUES ('user_1705075704915', 509, 1, 151, 150);
INSERT INTO public.number_guess VALUES ('user_1705075704914', 510, 1, 280, 279);
INSERT INTO public.number_guess VALUES ('user_1705075704914', 511, 1, 300, 299);
INSERT INTO public.number_guess VALUES ('user_1705075704915', 512, 1, 982, 979);
INSERT INTO public.number_guess VALUES ('user_1705075704915', 513, 1, 841, 840);
INSERT INTO public.number_guess VALUES ('user_1705075704915', 514, 1, 544, 543);
INSERT INTO public.number_guess VALUES ('user_1705075968268', 515, 1, 402, 401);
INSERT INTO public.number_guess VALUES ('user_1705075968268', 516, 1, 37, 36);
INSERT INTO public.number_guess VALUES ('user_1705075968267', 517, 1, 488, 487);
INSERT INTO public.number_guess VALUES ('user_1705075968267', 518, 1, 79, 78);
INSERT INTO public.number_guess VALUES ('user_1705075968268', 519, 1, 161, 158);
INSERT INTO public.number_guess VALUES ('user_1705075968268', 520, 1, 504, 503);
INSERT INTO public.number_guess VALUES ('user_1705075968268', 521, 1, 25, 24);
INSERT INTO public.number_guess VALUES ('user_1705076140977', 522, 1, 135, 134);
INSERT INTO public.number_guess VALUES ('user_1705076140977', 523, 1, 828, 827);
INSERT INTO public.number_guess VALUES ('user_1705076140976', 524, 1, 865, 864);
INSERT INTO public.number_guess VALUES ('user_1705076140976', 525, 1, 430, 429);
INSERT INTO public.number_guess VALUES ('user_1705076140977', 526, 1, 407, 404);
INSERT INTO public.number_guess VALUES ('user_1705076140977', 527, 1, 947, 946);
INSERT INTO public.number_guess VALUES ('user_1705076140977', 528, 1, 972, 971);
INSERT INTO public.number_guess VALUES ('user_1705076175006', 529, 1, 212, 211);
INSERT INTO public.number_guess VALUES ('user_1705076175006', 530, 1, 421, 420);
INSERT INTO public.number_guess VALUES ('user_1705076175005', 531, 1, 568, 567);
INSERT INTO public.number_guess VALUES ('user_1705076175005', 532, 1, 814, 813);
INSERT INTO public.number_guess VALUES ('user_1705076175006', 533, 1, 568, 565);
INSERT INTO public.number_guess VALUES ('user_1705076175006', 534, 1, 966, 965);
INSERT INTO public.number_guess VALUES ('user_1705076175006', 535, 1, 282, 281);
INSERT INTO public.number_guess VALUES ('user_1705076281640', 536, 1, 457, 456);
INSERT INTO public.number_guess VALUES ('user_1705076281640', 537, 1, 222, 221);
INSERT INTO public.number_guess VALUES ('user_1705076281639', 538, 1, 63, 62);
INSERT INTO public.number_guess VALUES ('user_1705076281639', 539, 1, 976, 975);
INSERT INTO public.number_guess VALUES ('user_1705076281640', 540, 1, 739, 736);
INSERT INTO public.number_guess VALUES ('user_1705076281640', 541, 1, 125, 124);
INSERT INTO public.number_guess VALUES ('user_1705076281640', 542, 1, 552, 551);
INSERT INTO public.number_guess VALUES ('ela', 543, 1, 9, 30);
INSERT INTO public.number_guess VALUES ('ela', 544, 1, 19, 656);


--
-- Name: number_guess_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_game_id_seq', 544, true);


--
-- PostgreSQL database dump complete
--

