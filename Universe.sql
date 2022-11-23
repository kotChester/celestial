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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(40) NOT NULL,
    systems integer,
    galaxy_id integer
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_kpc numeric(4,2),
    constellation character varying(30) NOT NULL,
    type text
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
    planet_id integer,
    name character varying(30) NOT NULL,
    orbital_distance_km numeric(12,2),
    orbital_period_earth_years numeric(6,2),
    radius numeric(8,2),
    atmosphere boolean,
    atm_pressure numeric(5,2),
    surface_temp numeric(6,2),
    surface_gravity numeric(8,4)
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
    star_id integer,
    name character varying(30) NOT NULL,
    number_from_star integer NOT NULL,
    orbital_distance_au numeric(10,4),
    orbital_period_earth_years numeric(6,2),
    keplerian_ratio numeric(7,3),
    radius_km numeric(8,2),
    atmosphere boolean,
    atm_pressure numeric(6,4),
    surface_temp_cdeg integer,
    surface_gravity_g numeric(6,4),
    colony_with_moons boolean
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
    cluster_id integer NOT NULL,
    stellar_mass numeric(10,4),
    stellar_class text,
    luminosity numeric(8,2),
    planets integer,
    moons integer,
    asteroid_belts integer,
    galaxy_id integer
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Argos Rho', 3, 1);
INSERT INTO public.cluster VALUES (2, 'Armstrong Nebula', 5, 1);
INSERT INTO public.cluster VALUES (3, 'Artemis Tau', 4, 1);
INSERT INTO public.cluster VALUES (4, 'Attican Beta', 2, 1);
INSERT INTO public.cluster VALUES (5, 'Exodus Cluster', 2, 1);
INSERT INTO public.cluster VALUES (6, 'Gemini Sigma', 2, 1);
INSERT INTO public.cluster VALUES (7, 'Hades Gamma', 5, 1);
INSERT INTO public.cluster VALUES (8, 'Hawking Eta', 5, 1);
INSERT INTO public.cluster VALUES (9, 'Horse Head Nebula', 4, 1);
INSERT INTO public.cluster VALUES (10, 'Kepler Verge', 2, 1);
INSERT INTO public.cluster VALUES (11, 'Local Cluster', 1, 1);
INSERT INTO public.cluster VALUES (12, 'Maroon Sea', 3, 1);
INSERT INTO public.cluster VALUES (13, 'Pangaea Expanse', 1, 1);
INSERT INTO public.cluster VALUES (14, 'Sentry Omega', 1, 1);
INSERT INTO public.cluster VALUES (15, 'Serpent Nebula', 2, 1);
INSERT INTO public.cluster VALUES (16, 'Styx Theta', 2, 1);
INSERT INTO public.cluster VALUES (17, 'Voyager Cluster', 3, 1);
INSERT INTO public.cluster VALUES (18, 'Heleus Cluster', 38, 2);
INSERT INTO public.cluster VALUES (19, 'Caleston Rift', 5, 1);
INSERT INTO public.cluster VALUES (20, 'Hades Nexus', 4, 1);
INSERT INTO public.cluster VALUES (21, 'Sigurd''s Cradle', 5, 1);
INSERT INTO public.cluster VALUES (22, 'Apien Crest', 3, 1);
INSERT INTO public.cluster VALUES (23, 'Silean Nebula', 5, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26.80, 'Sagittarius', 'Sb; Sbc; SB(rs)bc');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 46.56, 'Andromeda', 'SA(s)b');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 18.74, 'Triangulum', 'SA(s)cd');
INSERT INTO public.galaxy VALUES (4, 'Phoenix Dwarf', NULL, 'Phoenix', 'IAm');
INSERT INTO public.galaxy VALUES (5, 'Barnards Galaxy', NULL, 'Sagittarius', 'IB(s)m');
INSERT INTO public.galaxy VALUES (6, 'SagDIG', NULL, 'Sagittarius', 'IB(s)mV');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 23, 'Solcrum', 10367883.00, 0.60, 4534.00, true, 0.00, 351.00, 0.8000);
INSERT INTO public.moon VALUES (2, 117, 'Lethe', 2323500.00, 16.40, 5663.00, true, 0.58, 31.00, 0.5900);
INSERT INTO public.moon VALUES (3, 144, 'Luna', 384403.00, 27.30, 1737.00, false, NULL, -53.00, 0.1654);
INSERT INTO public.moon VALUES (4, 199, 'Avruna', NULL, 4.00, 6448.00, true, 1.45, 1.00, 1.1000);
INSERT INTO public.moon VALUES (5, 200, 'Caleston', NULL, 0.00, 6600.00, true, 0.90, 30.00, 1.2000);
INSERT INTO public.moon VALUES (6, 201, 'Sinmara', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 202, 'Kopis', 0.55, NULL, 1733.00, false, NULL, 51.00, 0.1000);
INSERT INTO public.moon VALUES (8, 108, 'Presrop', 168500.00, 0.03, 4113.00, true, 0.10, -73.00, 0.8800);
INSERT INTO public.moon VALUES (9, 203, 'Franklin', 2.10, NULL, 2405.00, false, NULL, -116.00, 0.1000);
INSERT INTO public.moon VALUES (10, 204, 'Menae', NULL, 0.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 205, 'Oltan', 625369.00, 0.12, 2822.00, false, NULL, -40.00, NULL);
INSERT INTO public.moon VALUES (12, 145, 'Phobos', NULL, NULL, 11.27, false, NULL, -40.00, NULL);
INSERT INTO public.moon VALUES (13, 145, 'Deimos', NULL, NULL, 6.20, false, NULL, -40.00, NULL);
INSERT INTO public.moon VALUES (14, 146, 'Ganymede', NULL, NULL, 2634.10, true, NULL, -163.00, NULL);
INSERT INTO public.moon VALUES (15, 146, 'Callisto', NULL, NULL, 2410.30, true, NULL, -139.00, NULL);
INSERT INTO public.moon VALUES (16, 146, 'Io', NULL, NULL, 182.60, true, NULL, -163.00, NULL);
INSERT INTO public.moon VALUES (17, 146, 'Europa', NULL, NULL, 1560.80, true, NULL, -171.00, NULL);
INSERT INTO public.moon VALUES (18, 147, 'Titan', NULL, NULL, 2574.73, true, 1.45, -179.50, NULL);
INSERT INTO public.moon VALUES (19, 147, 'Rhea', NULL, NULL, 763.80, false, NULL, -197.00, NULL);
INSERT INTO public.moon VALUES (20, 147, 'Iapetus', NULL, NULL, 734.20, false, NULL, -163.00, NULL);
INSERT INTO public.moon VALUES (21, 147, 'Dione', NULL, NULL, 561.40, false, NULL, -186.00, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Wuo', 1, 76.4000, 158.00, 17.863, 6959.00, true, 0.4400, 1157, 0.6600, false);
INSERT INTO public.planet VALUES (2, 1, 'Vectra', 2, 99.4500, 234.70, 17.856, 69833.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (3, 1, 'Camaron', 3, 199.0000, 664.80, 17.831, 5196.00, true, 0.2300, 747, 0.5500, false);
INSERT INTO public.planet VALUES (4, 1, 'Sharblu', 4, 373.6300, 1711.00, 17.817, 43342.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (5, 1, 'Slekon', 5, 709.9000, 4483.10, 17.801, 77115.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (6, 2, 'Varmalus', 1, 0.5000, 0.40, 0.781, 9593.00, true, 1.3000, 503, 1.2000, false);
INSERT INTO public.planet VALUES (7, 2, 'Metgos', 2, 2.0000, 2.80, 1.020, 7301.00, true, 1.0000, 169, 1.1000, false);
INSERT INTO public.planet VALUES (8, 2, 'Theyar', 3, 5.4500, 12.80, 0.988, 60774.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (9, 2, 'Canrum', 4, 16.5200, 67.30, 0.995, 5220.00, true, 0.0700, -132, 0.5500, false);
INSERT INTO public.planet VALUES (10, 2, 'Syba', 5, 29.6600, 162.10, 0.993, 45145.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (11, 3, 'Patashi', 1, 0.5000, 0.30, 1.389, 7082.00, true, 0.0000, 546, 0.7500, false);
INSERT INTO public.planet VALUES (12, 3, 'Sylsalto', 2, 13.0000, 36.00, 1.695, 56621.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (13, 3, 'Intai''sei', 3, 15.6800, 47.80, 1.687, 5897.00, true, 0.9500, 46, 0.8000, true);
INSERT INTO public.planet VALUES (14, 3, 'Tuntao', 4, 19.0100, 63.80, 1.688, 11867.00, true, 3.1200, 21, 1.1000, false);
INSERT INTO public.planet VALUES (15, 3, 'Vebinok', 5, 24.7000, 94.50, 1.687, 3379.00, true, 0.2700, -154, 0.2800, false);
INSERT INTO public.planet VALUES (16, 4, 'Junthor', 1, NULL, 0.20, NULL, 10480.00, true, 0.9600, -49, 0.9800, false);
INSERT INTO public.planet VALUES (17, 4, 'Pressna', 2, NULL, 0.70, NULL, 39482.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (18, 4, 'Rayingri', 3, NULL, NULL, NULL, 5171.00, true, 0.8400, 46, 0.8700, false);
INSERT INTO public.planet VALUES (19, 4, 'Sogelrus', 4, NULL, 1.80, NULL, 4327.00, true, 0.5200, -136, 0.4600, false);
INSERT INTO public.planet VALUES (20, 4, 'Antirumgon', 5, NULL, 4.00, NULL, 9508.00, true, 0.0000, -178, 0.9000, false);
INSERT INTO public.planet VALUES (21, 5, 'Benda', 1, NULL, 812.30, NULL, 6788.00, true, 26.3500, 3151, NULL, false);
INSERT INTO public.planet VALUES (22, 5, 'Zaherux', 2, NULL, 266.80, NULL, 6729.00, true, 0.3200, 959, 0.6100, false);
INSERT INTO public.planet VALUES (23, 5, 'Notanban', 3, NULL, 990.50, NULL, 73314.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (24, 6, 'Pomal', 1, NULL, 0.50, NULL, 9616.00, true, 31.5900, 492, 1.2000, false);
INSERT INTO public.planet VALUES (25, 6, 'Casbin', 2, NULL, 1.10, NULL, 7819.00, true, 1.1000, 99, 1.1000, false);
INSERT INTO public.planet VALUES (26, 6, 'Matar', 3, NULL, 29.80, NULL, 4599.00, true, 3.7200, -64, 0.5700, false);
INSERT INTO public.planet VALUES (27, 6, 'Theshaca', 4, NULL, 84.40, NULL, 65946.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (28, 6, 'Treagir', 5, NULL, 238.80, NULL, 1402.00, true, 0.0400, -211, 0.1000, false);
INSERT INTO public.planet VALUES (29, 7, 'Antibaar', 1, NULL, 3.20, NULL, 6501.00, true, 0.7900, -34, 1.1000, false);
INSERT INTO public.planet VALUES (30, 7, 'Patamalrus', 2, NULL, 15.30, NULL, 5831.00, true, 90.4700, 451, 0.7800, false);
INSERT INTO public.planet VALUES (31, 7, 'Hunsalra', 3, NULL, 46.20, NULL, 11496.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (32, 7, 'Thegeuse', 4, NULL, 25.30, NULL, 5130.00, true, 0.4900, -141, 0.4700, false);
INSERT INTO public.planet VALUES (33, 7, 'Solmarlon', 5, NULL, 399.70, NULL, 69862.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (34, 7, 'Mawinor', 6, NULL, 662.70, NULL, 1170.00, true, 0.0000, -228, 0.0800, false);
INSERT INTO public.planet VALUES (35, 8, 'Maji', 1, NULL, 5.90, NULL, 57227.00, true, 0.4200, -121, 0.8500, false);
INSERT INTO public.planet VALUES (36, 8, 'Pregel', 2, NULL, 17.80, NULL, 10510.00, true, 1.0000, -131, 1.1000, false);
INSERT INTO public.planet VALUES (37, 8, 'Almos', 3, NULL, 46.70, NULL, 60948.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (38, 9, 'Salamis', 1, NULL, 0.40, NULL, 6894.00, true, 1.4000, 520, 1.3000, false);
INSERT INTO public.planet VALUES (39, 9, 'Proteus', 2, NULL, 4.90, NULL, 10210.00, true, 1.2100, 34, 1.3000, false);
INSERT INTO public.planet VALUES (40, 9, 'Nausicaa', 3, NULL, 57.60, NULL, 59729.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (41, 9, 'Circe', 4, NULL, 141.90, NULL, 22479.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (42, 9, 'Pharos', 5, NULL, 275.40, NULL, 7623.00, true, 0.0400, -176, 0.9000, false);
INSERT INTO public.planet VALUES (43, 10, 'Phaistos', 1, NULL, 0.30, NULL, 4238.00, true, 0.2700, 551, 0.6300, false);
INSERT INTO public.planet VALUES (44, 10, 'Therum', 2, NULL, 6.40, NULL, 6724.00, true, 0.6800, 59, 1.1200, true);
INSERT INTO public.planet VALUES (45, 10, 'Zakros', 3, NULL, 33.90, NULL, 4572.00, true, 0.4000, -71, 0.4000, false);
INSERT INTO public.planet VALUES (46, 10, 'Armeni', 4, NULL, 151.30, NULL, 6077.00, true, 0.1800, -168, 0.8000, false);
INSERT INTO public.planet VALUES (47, 10, 'Archanes', 5, NULL, 470.20, NULL, 14549.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (48, 11, 'Sharjila', 1, 0.6670, 1.00, 0.297, 5693.00, true, 39.1600, 25, 0.9000, false);
INSERT INTO public.planet VALUES (49, 11, 'Porolan', 2, 5.0750, 21.00, 0.296, 9749.00, true, 1.4000, -197, 1.5000, false);
INSERT INTO public.planet VALUES (50, 11, 'Patavig', 3, 11.3000, 69.80, 0.296, 10529.00, true, 22.4000, -130, 1.6000, false);
INSERT INTO public.planet VALUES (51, 11, 'Fargeluse', 4, 15.4600, 111.70, 0.296, 40394.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (52, 12, 'Tremanre', 1, NULL, 1.00, NULL, 1528.00, true, 0.0000, 22, 0.1000, false);
INSERT INTO public.planet VALUES (53, 12, 'Edolus', 2, NULL, 2.70, NULL, 5792.00, true, 0.8000, -1, 0.8700, false);
INSERT INTO public.planet VALUES (54, 12, 'Altaaya', 3, NULL, 18.10, NULL, 11190.00, true, 0.2000, -136, 1.7000, false);
INSERT INTO public.planet VALUES (55, 12, 'Ontamalca', 4, NULL, 39.10, NULL, 72492.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (56, 12, 'Alsages', 5, NULL, 73.80, NULL, 4926.00, true, 0.0000, -193, 0.7000, false);
INSERT INTO public.planet VALUES (57, 13, 'Xathorron', 1, 5.3500, 9.50, 1.697, 3537.00, true, 0.3700, 388, 0.3900, false);
INSERT INTO public.planet VALUES (58, 13, 'Syided', 2, 0.6000, 0.40, 1.350, 7702.00, true, 1.1800, 523, 1.3000, false);
INSERT INTO public.planet VALUES (59, 13, 'Eletania', 3, 12.6000, 34.40, 1.690, 8864.00, true, 2.1000, 13, 1.2000, false);
INSERT INTO public.planet VALUES (60, 13, 'Zatorus', 4, 27.8500, 113.10, 1.689, 52290.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (61, 14, 'Sytau', 1, 1.0500, 1.10, 0.957, 9547.00, true, 94.5100, 343, 1.7000, false);
INSERT INTO public.planet VALUES (62, 14, 'Feros', 2, 2.1500, 3.20, 0.971, 8366.00, true, 5.4400, 10, 1.1000, true);
INSERT INTO public.planet VALUES (63, 14, 'Sharring', 3, 12.9300, 46.60, 0.995, 55721.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (64, 14, 'Quana', 4, 4.3300, 9.00, 1.002, 7271.00, true, 0.9100, -141, 1.2000, false);
INSERT INTO public.planet VALUES (65, 14, 'Logan', 5, 23.2700, 112.60, 0.994, 66341.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (66, 15, 'Arcadia', 1, 0.7000, 0.60, 0.953, 10893.00, true, 16.1700, 358, 5.0000, false);
INSERT INTO public.planet VALUES (67, 15, 'Eden Prime', 2, 1.8500, 2.50, 1.013, 7026.00, true, 1.4500, 23, 1.0400, true);
INSERT INTO public.planet VALUES (68, 15, 'Zion', 3, 14.0500, 52.80, 0.995, 74333.00, false, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (69, 15, 'Nirvana', 4, 25.6000, 129.90, 0.994, 3212.00, true, 0.0200, -203, 0.2000, false);
INSERT INTO public.planet VALUES (70, 15, 'Xanadu', 5, 101.7000, 1029.90, 0.992, 3730.00, true, 0.1900, -216, 0.3000, false);
INSERT INTO public.planet VALUES (71, 16, 'Terra Nova', 1, 1.3000, 1.50, 0.976, 5261.00, true, 0.9100, 56, 0.9500, true);
INSERT INTO public.planet VALUES (72, 16, 'Borr', 2, 2.2000, 3.30, 0.978, 74612.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (73, 16, 'Tyr', 3, 4.0000, 8.05, 0.988, 6332.00, true, 0.8000, -73, 0.9500, true);
INSERT INTO public.planet VALUES (74, 16, 'Loki', 4, 6.8000, 17.80, 0.992, 3630.00, true, 0.2000, -135, 0.2200, false);
INSERT INTO public.planet VALUES (75, 17, 'Paravin', 1, 0.6500, 0.50, 1.099, 4839.00, true, 0.0000, 414, 0.5000, false);
INSERT INTO public.planet VALUES (76, 17, 'Huningto', 2, 10.0250, 31.80, 0.996, 73733.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (77, 17, 'Mavigon', 3, 12.1250, 42.30, 0.996, 4906.00, true, 0.8200, -124, 0.8000, false);
INSERT INTO public.planet VALUES (78, 17, 'Farcrothu', 4, 23.2000, 112.10, 0.994, 66014.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (79, 17, 'Patatanlis', 5, 44.4500, 297.40, 0.993, 8927.00, true, 0.0600, -174, 2.8000, false);
INSERT INTO public.planet VALUES (80, 18, 'Antiroprus', 1, 168.7000, 284.20, 59.443, 57948.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (81, 18, 'Parag', 2, 604.7200, 1930.30, 59.349, 7979.00, true, 1.5800, 1117, 2.0000, false);
INSERT INTO public.planet VALUES (82, 18, 'Altanorch', 3, 983.6000, 4005.70, 59.306, 32605.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (83, 19, 'Ageko', 1, 0.2500, 0.10, 1563.000, 2147.00, true, 0.2700, 346, 0.2500, false);
INSERT INTO public.planet VALUES (84, 19, 'Edmos', 2, 3.6500, 7.80, 0.799, 36826.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (85, 19, 'Ploba', 3, 6.9300, 20.40, 0.800, 74221.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (86, 19, 'Trebin', 4, 1.0000, 1.10, 0.826, 5489.00, true, 0.8400, 8, 0.8600, false);
INSERT INTO public.planet VALUES (87, 19, 'Vemal', 5, 10.3800, 37.50, 0.795, 10314.00, true, 1.0000, -61, 1.1000, false);
INSERT INTO public.planet VALUES (88, 19, 'Hunidor', 6, 18.6800, 90.50, 0.796, 3686.00, true, 0.2000, -202, 0.2200, false);
INSERT INTO public.planet VALUES (89, 20, 'Zayarter', 1, 2.0000, 2.10, 1.814, 5535.00, true, 0.5000, 166, 0.7000, false);
INSERT INTO public.planet VALUES (90, 20, 'Chohe', 2, 3.7000, 5.40, 1.737, 8000.00, true, 0.0000, 11, 1.0000, false);
INSERT INTO public.planet VALUES (91, 20, 'Xamarri', 3, 13.0300, 36.10, 1.698, 2236.00, true, 0.0000, -117, 0.1900, false);
INSERT INTO public.planet VALUES (92, 20, 'Faringor', 4, 20.2000, 69.80, 1.692, 11129.00, true, 0.0000, -144, NULL, false);
INSERT INTO public.planet VALUES (93, 20, 'Treyarmus', 5, 51.7500, 286.70, 1.686, 42211.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (94, 21, 'Jartar', 1, 1.8500, 2.80, 0.808, 1410.00, true, 0.0000, 82, 0.1700, false);
INSERT INTO public.planet VALUES (95, 21, 'Nearrum', 2, 3.1500, 6.30, 0.788, 6779.00, true, 0.6700, 58, 0.8200, false);
INSERT INTO public.planet VALUES (96, 21, 'Klensal', 3, 7.1500, 21.40, 0.798, 5447.00, true, 0.5800, -35, 0.8600, false);
INSERT INTO public.planet VALUES (97, 21, 'Gremar', 4, 10.0000, 35.40, 0.798, 3691.00, true, 0.2700, -84, 0.2800, false);
INSERT INTO public.planet VALUES (98, 21, 'Raysha', 5, 17.9800, 85.50, 0.795, 34914.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (99, 22, 'Tunshagon', 1, 5.6500, 3.20, 17.613, 42418.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (100, 22, 'Juntauma', 2, 57.0500, 102.00, 17.847, 4227.00, true, 0.3600, 1176, 0.3800, false);
INSERT INTO public.planet VALUES (101, 22, 'Nepneu', 3, 117.7000, 302.00, 17.878, 3742.00, true, 0.2300, 848, 0.2700, false);
INSERT INTO public.planet VALUES (102, 23, 'Mingito', 1, 1.8000, 1.40, 2.976, 4384.00, true, 0.2000, 675, 0.4400, false);
INSERT INTO public.planet VALUES (103, 23, 'Maidla', 2, 3.2000, 3.30, 3.009, 6914.00, true, 0.4800, 497, 0.8800, false);
INSERT INTO public.planet VALUES (104, 23, 'Clocrolis', 3, 12.5000, 25.20, 3.076, 3675.00, true, 0.3700, 161, 0.3900, false);
INSERT INTO public.planet VALUES (105, 23, 'Nonuel', 4, 30.0800, 94.00, 3.080, 4439.00, true, 0.8800, 127, 0.8500, false);
INSERT INTO public.planet VALUES (106, 23, 'Veyaria', 5, 56.0500, 239.20, 3.078, 78204.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (107, 24, 'Tamahera', 1, 1.1600, 1.40, 0.796, 6302.00, true, 0.3400, -30, 0.6600, false);
INSERT INTO public.planet VALUES (108, 24, 'Klendagon', 2, 1.6150, 2.30, 0.796, 7377.00, true, 0.6400, -53, 0.8800, false);
INSERT INTO public.planet VALUES (109, 24, 'Canctra', 3, 14.3000, 60.60, 0.796, 5471.00, true, 0.8300, -175, 0.8300, false);
INSERT INTO public.planet VALUES (110, 24, 'Tharopto', 4, 29.4000, 128.20, 1.546, 68714.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (111, 25, 'Teshub', 1, 0.9000, 1.60, 0.285, 635968.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (112, 25, 'Hebat', 2, 1.3500, 2.90, 0.293, 36257.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (113, 26, 'Atahil', 1, 0.9000, 1.00, 0.729, 5230.00, true, 62.0000, 348, 0.7900, false);
INSERT INTO public.planet VALUES (114, 26, 'Etamis', 2, 1.3500, 1.60, 0.961, 9577.00, true, 0.2000, -50, 3.4000, false);
INSERT INTO public.planet VALUES (115, 26, 'Linossa', 3, 3.3400, 6.80, 0.806, 55806.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (116, 26, 'Rihali', 4, 6.3400, 17.90, 0.765, 70778.00, true, 1.8100, NULL, NULL, false);
INSERT INTO public.planet VALUES (117, 27, 'Mnemosyne', 1, 0.8100, 0.80, 0.830, 72541.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (118, 28, 'Corang', 1, 0.7000, 0.90, 0.423, 4911.00, true, 0.7300, 58, NULL, false);
INSERT INTO public.planet VALUES (119, 28, 'Allusah', 2, 1.1900, 2.40, 0.293, 25652.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (120, 28, 'Serao', 3, 2.1400, 5.70, 0.302, 70881.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (121, 30, 'Maganlis', 1, 1.3200, 2.40, 0.399, 7708.00, true, 1.0300, -150, 1.1000, false);
INSERT INTO public.planet VALUES (122, 30, 'Therumlon', 2, 7.3300, 31.40, 0.399, 5492.00, true, 17.1100, -134, 0.7000, false);
INSERT INTO public.planet VALUES (123, 30, 'Amaranthine', 3, 3.8600, 12.00, 0.399, 6694.00, true, 1.1900, -178, 1.1600, false);
INSERT INTO public.planet VALUES (124, 30, 'Wentania', 4, 13.9300, 82.20, 0.400, 3198.00, true, 0.0300, -237, 0.2000, false);
INSERT INTO public.planet VALUES (125, 31, 'Svarog', 1, NULL, 0.20, NULL, 32285.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (126, 31, 'Noveria', 2, 0.9000, 0.90, 0.900, 5656.00, true, 0.8700, -1, 0.8100, true);
INSERT INTO public.planet VALUES (127, 31, 'Morana', 3, 6.3000, 17.70, 0.798, 1089.00, true, 0.0000, -158, 0.1000, false);
INSERT INTO public.planet VALUES (128, 31, 'Veles', 4, 24.5000, 136.30, 0.792, 7547.00, true, 0.0700, -220, 1.7000, false);
INSERT INTO public.planet VALUES (129, 32, 'Yunthorl', 1, NULL, 5.80, NULL, 5905.00, true, 2.1000, 68, 0.8000, false);
INSERT INTO public.planet VALUES (130, 32, 'Antitarra', 2, NULL, 52.00, NULL, 35417.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (131, 32, 'Trelyn', 3, NULL, 74.90, NULL, 1163.00, true, 0.0000, -147, 0.1000, false);
INSERT INTO public.planet VALUES (132, 32, 'Xawin', 4, NULL, 97.30, NULL, 5756.00, true, 0.7900, -131, 0.0800, false);
INSERT INTO public.planet VALUES (133, 32, 'Thesalgon', 5, NULL, 173.40, NULL, 53520.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (134, 33, 'Tungel', 1, NULL, 85.80, NULL, 11539.00, true, 2.0000, 242, 1.9000, false);
INSERT INTO public.planet VALUES (135, 33, 'Matol', 2, NULL, 207.30, NULL, 4077.00, true, 0.4900, 33, 0.5000, false);
INSERT INTO public.planet VALUES (136, 33, 'Clugon', 3, NULL, 1013.71, NULL, 17988.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (137, 33, 'Clobaca', 4, NULL, 2052.30, NULL, 8198.00, true, 0.8100, 7, 0.8800, false);
INSERT INTO public.planet VALUES (138, 34, 'Ontaron', 1, 1.1000, 1.20, 0.924, 6443.00, true, 0.7900, 58, 0.8200, true);
INSERT INTO public.planet VALUES (139, 34, 'Klencory', 2, 7.5000, 20.60, 0.994, 7677.00, true, 1.1000, -109, 0.8200, false);
INSERT INTO public.planet VALUES (140, 34, 'Juncro', 3, 15.3000, 60.00, 0.995, 66642.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (141, 34, 'Sesmose', 4, 41.9000, 272.20, 0.993, 3111.00, true, 0.0000, -188, 0.0900, false);
INSERT INTO public.planet VALUES (142, 35, 'Mercury', 1, 0.3900, 0.24, NULL, 2440.00, false, NULL, 430, 0.3800, true);
INSERT INTO public.planet VALUES (143, 35, 'Venus', 2, 0.7200, 0.61, NULL, 6052.00, true, 90.0000, 465, 0.8800, true);
INSERT INTO public.planet VALUES (144, 35, 'Earth', 3, 1.0000, 1.00, 1.000, 6378.00, true, 1.0000, 23, 1.0000, true);
INSERT INTO public.planet VALUES (145, 35, 'Mars', 4, 1.5200, 1.88, 0.994, 3402.00, false, NULL, -138, 0.3800, true);
INSERT INTO public.planet VALUES (146, 35, 'Jupiter', 5, 5.2000, 11.70, 1.027, 71492.00, false, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (147, 35, 'Saturn', 6, 9.5000, 29.50, 0.985, 60268.00, false, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (148, 35, 'Uranus', 7, 19.2000, 84.30, 0.996, 25559.00, false, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (149, 35, 'Neptune', 8, 29.1000, 164.80, 0.907, 24764.00, false, NULL, NULL, NULL, true);
INSERT INTO public.planet VALUES (150, 35, 'Pluto', 9, 39.5000, 247.70, 1.004, 1151.00, false, NULL, -229, 0.0600, true);
INSERT INTO public.planet VALUES (151, 36, 'Clotanca', 1, NULL, 124.70, NULL, 7810.00, true, 0.7300, 92, 0.7800, false);
INSERT INTO public.planet VALUES (152, 36, 'Farnuri', 2, NULL, 352.70, NULL, 8968.00, true, 0.0000, -98, 1.2000, false);
INSERT INTO public.planet VALUES (153, 36, 'Almarcrux', 3, NULL, 584.10, NULL, 4715.00, true, 0.7600, 31, 0.7800, false);
INSERT INTO public.planet VALUES (154, 36, 'Antida', 4, NULL, 1296.10, NULL, 29657.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (155, 37, 'Inti', 1, NULL, 0.60, NULL, 9032.00, true, 0.5600, 157, 0.9900, false);
INSERT INTO public.planet VALUES (156, 37, 'Chasca', 2, NULL, 1.30, NULL, 8059.00, true, 0.8600, 67, 0.8800, true);
INSERT INTO public.planet VALUES (157, 37, 'Apo', 3, NULL, 29.70, NULL, 6843.00, true, 1.2000, -116, 1.1000, false);
INSERT INTO public.planet VALUES (158, 37, 'Illapa', 4, NULL, 74.10, NULL, 72820.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (159, 37, 'Supay', 5, NULL, 275.50, NULL, 4317.00, true, 0.0000, -216, 0.2500, false);
INSERT INTO public.planet VALUES (160, 38, 'Clomarthu', 1, NULL, 1.00, NULL, 6028.00, true, 0.9000, 95, 0.9000, false);
INSERT INTO public.planet VALUES (161, 38, 'Nodacrux', 2, NULL, 3.60, NULL, 5988.00, true, 2.6300, 23, 0.9000, false);
INSERT INTO public.planet VALUES (162, 38, 'Alko', 3, NULL, 28.70, NULL, 4949.00, true, 0.0000, -167, 0.5000, false);
INSERT INTO public.planet VALUES (163, 38, 'Pataiton', 4, NULL, 110.20, NULL, 16622.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (164, 39, 'Agetoton', 1, NULL, 0.40, NULL, 6172.00, true, 84.3000, 510, 1.0000, false);
INSERT INTO public.planet VALUES (165, 39, 'Ilos', 2, NULL, 0.72, NULL, 8607.00, true, 11.2600, 32, 1.1700, false);
INSERT INTO public.planet VALUES (166, 39, 'Zafe', 3, NULL, 33.80, NULL, 30488.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (167, 40, 'Jarfor', 1, NULL, 1.30, NULL, 63169.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (168, 40, 'Nemata', 2, NULL, 3.50, NULL, 73118.00, true, 1.6000, 168, 1.4000, false);
INSERT INTO public.planet VALUES (169, 40, 'Virmire', 3, NULL, 9.20, NULL, 6440.00, true, 0.9000, 32, 0.8600, false);
INSERT INTO public.planet VALUES (170, 40, 'Cloroplon', 4, NULL, 47.80, NULL, 32191.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (171, 40, 'Prescyla', 5, NULL, 108.70, NULL, 2075.00, true, 0.0000, -158, 0.1000, false);
INSERT INTO public.planet VALUES (172, 41, 'Wheeler', 1, 0.8500, 0.80, 0.960, 7894.00, true, 2.3500, 165, 1.9000, false);
INSERT INTO public.planet VALUES (173, 41, 'Bekenstein', 2, 1.8000, 2.40, 1.013, 6050.00, true, 1.1700, 43, 0.9000, true);
INSERT INTO public.planet VALUES (174, 41, 'Thooft', 3, 3.6000, 6.80, 1.009, 3247.00, true, 1.8800, -5, 0.2000, false);
INSERT INTO public.planet VALUES (175, 41, 'Veltman', 4, 7.1000, 19.00, 0.991, 61755.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (176, 41, 'Feynman', 5, 15.2000, 59.40, 0.995, 40196.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (177, 43, 'Farthorl', 1, 0.3175, 0.20, 0.800, 6506.00, true, 0.6900, 239, 0.8000, false);
INSERT INTO public.planet VALUES (178, 43, 'Altahe', 2, 0.8000, 0.80, 0.800, 4404.00, true, 0.9800, 36, 1.1000, false);
INSERT INTO public.planet VALUES (179, 43, 'Grosalgen', 3, 11.1300, 41.50, 0.801, 41.50, true, 0.5300, -175, 0.6000, false);
INSERT INTO public.planet VALUES (180, 43, 'Imaneya', 4, 22.2000, 117.70, 0.790, 11621.00, true, 0.8800, -185, 0.9000, false);
INSERT INTO public.planet VALUES (181, 44, 'Nepmos', 1, NULL, 0.70, NULL, 7593.00, true, 1.1200, 68, 1.2000, false);
INSERT INTO public.planet VALUES (182, 44, 'Quaji', 2, NULL, 2.90, NULL, 5160.00, true, 0.8300, -7, 0.8000, false);
INSERT INTO public.planet VALUES (183, 44, 'Wermani', 3, NULL, 9.90, NULL, 71541.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (184, 44, 'Chofen', 4, NULL, 56.90, NULL, 21481.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (185, 45, 'Agebinium', 1, NULL, 1.80, NULL, 4910.00, true, 0.1700, -72, 0.7900, false);
INSERT INTO public.planet VALUES (186, 45, 'Derneuca', 2, NULL, 3.10, NULL, 11728.00, true, 1.9300, -60, 1.8000, false);
INSERT INTO public.planet VALUES (187, 45, 'Sonedma', 3, NULL, 6.20, NULL, 9647.00, true, 1.1600, -108, 1.2000, false);
INSERT INTO public.planet VALUES (188, 45, 'Sybin', 4, NULL, 15.10, NULL, 4645.00, true, 0.1800, -169, 0.5000, false);
INSERT INTO public.planet VALUES (189, 45, 'Tremar', 5, NULL, 33.40, NULL, 61266.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (190, 46, 'Clojiia', 1, NULL, 0.30, NULL, 7074.00, true, 18.3300, 312, 1.1000, false);
INSERT INTO public.planet VALUES (191, 46, 'Nepheron', 2, NULL, 0.80, NULL, 6865.00, true, 0.7300, 37, 0.8800, false);
INSERT INTO public.planet VALUES (192, 46, 'Ontaheter', 3, NULL, 5.20, NULL, 3718.00, true, 0.0600, -124, NULL, false);
INSERT INTO public.planet VALUES (193, 46, 'Gromar', 4, NULL, 115.60, NULL, 44650.00, true, 0.1300, -218, 0.2800, false);
INSERT INTO public.planet VALUES (194, 47, 'Renshato', 1, NULL, 0.50, NULL, 25957.00, false, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (195, 47, 'Binthu', 2, NULL, 5.00, NULL, 5935.00, true, 0.9100, 94, 0.9400, false);
INSERT INTO public.planet VALUES (196, 47, 'Dregir', 3, NULL, 23.70, NULL, 2843.00, true, 0.0000, -96, 0.2800, false);
INSERT INTO public.planet VALUES (197, 47, 'Arumter', 4, NULL, 35.20, NULL, 3718.00, true, 0.0000, -96, 0.3900, false);
INSERT INTO public.planet VALUES (198, 47, 'Patajiri', 5, NULL, 123.60, NULL, 7304.00, true, 0.4200, -118, 0.9900, false);
INSERT INTO public.planet VALUES (199, 86, 'Dranen', 3, 2.5000, 4.00, 0.977, 72021.00, true, 1.9400, NULL, NULL, false);
INSERT INTO public.planet VALUES (200, 87, 'Cernunnos', 1, 0.0700, 0.08, NULL, 49231.00, true, 0.8600, NULL, NULL, false);
INSERT INTO public.planet VALUES (201, 88, 'Surtur', 1, 0.7000, 0.60, 0.953, 4433.00, false, NULL, 126, 0.8000, false);
INSERT INTO public.planet VALUES (202, 89, 'Makhaira', 2, 0.5000, 0.35, NULL, 4733.00, false, NULL, 206, 0.5000, false);
INSERT INTO public.planet VALUES (203, 90, 'Watson', 3, 2.1000, 3.00, 1.029, 6733.00, true, 0.6000, -18, 1.2000, true);
INSERT INTO public.planet VALUES (204, 91, 'Palaven', 3, 1.1500, 1.20, 1.056, 8990.00, true, 1.1000, 31, 1.1400, true);
INSERT INTO public.planet VALUES (205, 92, 'Dekuuna', 2, 1.1000, 1.10, 1.100, 10387.00, true, 1.0200, 29, 4.0000, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Gorgon', 1, 170.8340, 'B0', 20000.00, 5, 0, 0, 1);
INSERT INTO public.star VALUES (2, 'Hydra', 1, 0.9570, 'G', NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (3, 'Phoenix', 1, 44752.0000, 'F0', 6.00, 5, 0, 2, 1);
INSERT INTO public.star VALUES (4, 'Gagarin', 2, NULL, NULL, NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (5, 'Grissom', 2, 20.0000, '0', NULL, 3, 1, 2, 1);
INSERT INTO public.star VALUES (6, 'Hong', 2, NULL, NULL, NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (7, 'Tereshkova', 2, NULL, 'M V, M V', NULL, 6, 0, 1, 1);
INSERT INTO public.star VALUES (8, 'Vamshi', 2, NULL, 'A4 V 1, M5 III 1', NULL, 3, 0, 0, 1);
INSERT INTO public.star VALUES (9, 'Athens', 3, NULL, NULL, NULL, 5, 0, 1, 1);
INSERT INTO public.star VALUES (10, 'Knossos', 3, NULL, NULL, NULL, 5, 0, 2, 1);
INSERT INTO public.star VALUES (11, 'Macedon', 3, 0.2960, 'M3', 0.01, 4, 0, 1, 1);
INSERT INTO public.star VALUES (12, 'Sparta', 3, NULL, NULL, NULL, 5, 0, 2, 1);
INSERT INTO public.star VALUES (13, 'Hercules', 4, 44752.0000, 'F0', 6.00, 4, 0, 0, 1);
INSERT INTO public.star VALUES (14, 'Theseus', 4, NULL, NULL, NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (15, 'Utopia', 5, NULL, NULL, NULL, 5, 1, 0, 1);
INSERT INTO public.star VALUES (16, 'Asgard', 5, 1.0000, 'G2V', NULL, 4, 90, 0, 1);
INSERT INTO public.star VALUES (17, 'Han', 6, 10.0160, 'G', NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (18, 'Ming', 6, 590.3660, 'O', -100000.00, 3, 0, 1, 1);
INSERT INTO public.star VALUES (19, 'Antaeus', 7, NULL, NULL, NULL, 6, 0, 0, 1);
INSERT INTO public.star VALUES (20, 'Cacus', 7, 10.6920, 'F0', 6.00, 5, 0, 1, 1);
INSERT INTO public.star VALUES (21, 'Dis', 7, NULL, NULL, NULL, 5, 0, 1, 1);
INSERT INTO public.star VALUES (22, 'Farinata', 7, 170.7790, 'B', NULL, 3, 0, 2, 1);
INSERT INTO public.star VALUES (23, 'Plutus', 7, NULL, NULL, NULL, 5, 0, 1, 1);
INSERT INTO public.star VALUES (24, 'Century', 8, 0.7690, 'K0', 0.40, 4, 1, 1, 1);
INSERT INTO public.star VALUES (25, 'Chandrasekhar', 8, 0.3000, 'M', NULL, 2, 0, 0, 1);
INSERT INTO public.star VALUES (26, 'Schwarzschild', 8, 0.8200, 'G', NULL, 4, 0, 0, 1);
INSERT INTO public.star VALUES (27, 'Thorne', 8, 0.8300, 'G', NULL, 1, 1, 1, 1);
INSERT INTO public.star VALUES (28, 'Verr', 8, 0.3500, 'M', NULL, 3, 0, 0, 1);
INSERT INTO public.star VALUES (29, 'Anadius', 9, 20.0000, 'M la', NULL, 0, 0, 1, 1);
INSERT INTO public.star VALUES (30, 'Fortuna', 9, 0.4000, 'M V', 0.04, 4, 0, 0, 1);
INSERT INTO public.star VALUES (31, 'Pax', 9, 0.7880, 'K0', 0.40, 4, 0, 0, 1);
INSERT INTO public.star VALUES (32, 'Strenuus', 9, NULL, NULL, NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (33, 'Herschel', 10, 40.0000, 'O', 40000.00, 4, 0, 1, 1);
INSERT INTO public.star VALUES (34, 'Newton', 10, NULL, NULL, NULL, 4, 0, 0, 1);
INSERT INTO public.star VALUES (35, 'Sol', 11, 1.0000, 'G2V', 1.00, 9, 170, 1, 1);
INSERT INTO public.star VALUES (36, 'Caspian', 12, 40.0000, 'O', 40000.00, 4, 0, 1, 1);
INSERT INTO public.star VALUES (37, 'Matano', 12, NULL, NULL, NULL, 5, 0, 2, 1);
INSERT INTO public.star VALUES (38, 'Vostok', 12, NULL, NULL, NULL, 4, 0, 1, 1);
INSERT INTO public.star VALUES (39, 'Refuge', 13, NULL, NULL, NULL, 3, 0, 0, 1);
INSERT INTO public.star VALUES (40, 'Hoc', 14, NULL, NULL, NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (41, 'Boltzmann', 15, 1.0000, 'G', NULL, 4, 0, 1, 1);
INSERT INTO public.star VALUES (42, 'Widow', 15, NULL, NULL, NULL, 0, 0, 0, 1);
INSERT INTO public.star VALUES (43, 'Acheron', 16, 0.8000, 'K0', 0.40, 4, 0, 1, 1);
INSERT INTO public.star VALUES (44, 'Erebus', 16, NULL, NULL, NULL, 4, 0, 1, 1);
INSERT INTO public.star VALUES (45, 'Amazon', 17, NULL, 'M III', NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (46, 'Columbia', 17, NULL, NULL, NULL, 4, 0, 0, 1);
INSERT INTO public.star VALUES (47, 'Yangtze', 17, NULL, NULL, NULL, 5, 0, 0, 1);
INSERT INTO public.star VALUES (48, 'Anasa', 18, NULL, NULL, NULL, 5, 0, 2, 2);
INSERT INTO public.star VALUES (49, 'Bosavay', 18, NULL, NULL, NULL, 4, 0, 0, 2);
INSERT INTO public.star VALUES (50, 'Civki', 18, NULL, NULL, NULL, 4, 1, 0, 2);
INSERT INTO public.star VALUES (51, 'Dar''hegan', 18, NULL, NULL, NULL, 4, 0, 1, 2);
INSERT INTO public.star VALUES (52, 'Eriksson', 18, NULL, NULL, NULL, 4, 0, 0, 2);
INSERT INTO public.star VALUES (53, 'Faroang', 18, NULL, NULL, NULL, 4, 0, 0, 2);
INSERT INTO public.star VALUES (54, 'Faross', 18, NULL, NULL, NULL, 4, 0, 1, 2);
INSERT INTO public.star VALUES (55, 'Govorkam', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (56, 'Hefena', 18, NULL, NULL, NULL, 3, 0, 0, 2);
INSERT INTO public.star VALUES (57, 'Inalaara', 18, NULL, NULL, NULL, 5, 0, 1, 2);
INSERT INTO public.star VALUES (58, 'Jirayder', 18, NULL, NULL, NULL, 4, 1, 0, 2);
INSERT INTO public.star VALUES (59, 'Joba', 18, NULL, NULL, NULL, 4, 0, 0, 2);
INSERT INTO public.star VALUES (60, 'Kindrax', 18, NULL, NULL, NULL, 4, 1, 0, 2);
INSERT INTO public.star VALUES (61, 'Layan', 18, NULL, NULL, NULL, 4, 1, 1, 2);
INSERT INTO public.star VALUES (62, 'Meos', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (63, 'Nalesh', 18, NULL, NULL, NULL, 4, 0, 2, 2);
INSERT INTO public.star VALUES (64, 'Nol', 18, NULL, NULL, NULL, 3, 0, 1, 2);
INSERT INTO public.star VALUES (65, 'Onaon', 18, NULL, NULL, NULL, 5, 0, 1, 2);
INSERT INTO public.star VALUES (66, 'Pfeiffer', 18, NULL, NULL, NULL, 5, 0, 1, 2);
INSERT INTO public.star VALUES (67, 'Pytheas', 18, NULL, NULL, NULL, 6, 0, 1, 2);
INSERT INTO public.star VALUES (68, 'Ratul', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (69, 'Remav', 18, NULL, NULL, NULL, 3, 1, 0, 2);
INSERT INTO public.star VALUES (70, 'Rohvir', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (71, 'Saajor', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (72, 'Sabeng', 18, NULL, NULL, NULL, 4, 1, 0, 2);
INSERT INTO public.star VALUES (73, 'Sephesa', 18, NULL, NULL, NULL, 5, 1, 0, 2);
INSERT INTO public.star VALUES (74, 'Shojaon', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (75, 'Skeldah', 18, NULL, NULL, NULL, 5, 1, 0, 2);
INSERT INTO public.star VALUES (76, 'Solminae', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (77, 'Tafeno', 18, NULL, NULL, NULL, 4, 1, 0, 2);
INSERT INTO public.star VALUES (78, 'Tecunis', 18, NULL, NULL, NULL, 6, 0, 0, 2);
INSERT INTO public.star VALUES (79, 'Togessan', 18, NULL, NULL, NULL, 4, 0, 2, 2);
INSERT INTO public.star VALUES (80, 'Vaalon', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (81, 'Vaar', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (82, 'Valay', 18, NULL, NULL, NULL, 4, 0, 0, 2);
INSERT INTO public.star VALUES (83, 'Vaotessa', 18, NULL, NULL, NULL, 4, 1, 1, 2);
INSERT INTO public.star VALUES (84, 'Zaubray', 18, NULL, NULL, NULL, 4, 1, 1, 2);
INSERT INTO public.star VALUES (85, 'Zheng He', 18, NULL, NULL, NULL, 5, 0, 0, 2);
INSERT INTO public.star VALUES (86, 'Aysur', 19, 0.9800, 'G', NULL, 6, 1, 1, 1);
INSERT INTO public.star VALUES (87, 'Balor', 19, 0.4000, 'M V', NULL, 4, 1, 1, 1);
INSERT INTO public.star VALUES (88, 'Solveig', 19, 0.9980, 'G', NULL, 2, 10, 0, 1);
INSERT INTO public.star VALUES (89, 'Hoplos', 20, 1.0000, 'G', NULL, 4, 1, 0, 1);
INSERT INTO public.star VALUES (90, 'Skepsis', 21, NULL, 'G', NULL, 6, 1, 0, 1);
INSERT INTO public.star VALUES (91, 'Trebia', 22, NULL, NULL, NULL, 6, 1, 0, 1);
INSERT INTO public.star VALUES (92, 'Phontes', 23, 0.9310, 'G', NULL, 4, 1, 1, 1);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 23, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 205, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 92, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


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
-- Name: galaxy set; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT set UNIQUE (name);


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
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: cluster cluster_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

