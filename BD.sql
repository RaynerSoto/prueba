toc.dat                                                                                             0000600 0004000 0002000 00000037773 14547636475 0014505 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       $    :        
         |            medicos    12.15    12.15 4    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         @           1262    177959    medicos    DATABASE     �   CREATE DATABASE medicos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE medicos;
                postgres    false         �            1255    177980    consultorios_delete(bigint)    FUNCTION     �   CREATE FUNCTION public.consultorios_delete(pid bigint) RETURNS void
    LANGUAGE sql
    AS $$DELETE FROM public.consultorios
	WHERE id = pid;$$;
 6   DROP FUNCTION public.consultorios_delete(pid bigint);
       public          postgres    false         �            1255    177976 .   consultorios_insert(character varying, bigint)    FUNCTION     �   CREATE FUNCTION public.consultorios_insert(pnumero character varying, ppiso bigint) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO public.consultorios(
	numero, piso)
	VALUES ($1, $2);$_$;
 S   DROP FUNCTION public.consultorios_insert(pnumero character varying, ppiso bigint);
       public          postgres    false         �            1255    177979 6   consultorios_update(bigint, character varying, bigint)    FUNCTION     �   CREATE FUNCTION public.consultorios_update(pid bigint, pnumero character varying, ppiso bigint) RETURNS void
    LANGUAGE sql
    AS $$UPDATE public.consultorios
	SET numero=pnumero, piso=ppiso
	WHERE id = pid$$;
 _   DROP FUNCTION public.consultorios_update(pid bigint, pnumero character varying, ppiso bigint);
       public          postgres    false         �            1255    178030    doctores_delete(bigint)    FUNCTION     �   CREATE FUNCTION public.doctores_delete(pid bigint) RETURNS void
    LANGUAGE sql
    AS $$DELETE FROM public.doctores
	WHERE id = pid;$$;
 2   DROP FUNCTION public.doctores_delete(pid bigint);
       public          postgres    false         �            1255    178028 P   doctores_insert(character varying, character varying, character varying, bigint)    FUNCTION     >  CREATE FUNCTION public.doctores_insert(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO public.doctores(
	nombre, apellido_parterno, apellido_materno, especialidad)
	VALUES ($1,$2,$3,$4)$_$;
 �   DROP FUNCTION public.doctores_insert(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint);
       public          postgres    false         �            1255    178029 X   doctores_update(character varying, character varying, character varying, bigint, bigint)    FUNCTION     N  CREATE FUNCTION public.doctores_update(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint, pid bigint) RETURNS void
    LANGUAGE sql
    AS $_$UPDATE public.doctores
	SET nombre=$1, apellido_parterno=$2, apellido_materno=$3, especialidad=$4
	WHERE id = pid;$_$;
 �   DROP FUNCTION public.doctores_update(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint, pid bigint);
       public          postgres    false         �            1255    178006    especialidad_delete(bigint)    FUNCTION     �   CREATE FUNCTION public.especialidad_delete(pid bigint) RETURNS void
    LANGUAGE sql
    AS $$DELETE FROM public.especialidades
	WHERE id = pid;$$;
 6   DROP FUNCTION public.especialidad_delete(pid bigint);
       public          postgres    false         �            1255    178004 &   especialidad_insert(character varying)    FUNCTION     �   CREATE FUNCTION public.especialidad_insert(pnombre character varying) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO public.especialidades(nombre)
	VALUES ($1)$_$;
 E   DROP FUNCTION public.especialidad_insert(pnombre character varying);
       public          postgres    false         �            1255    178005 .   especialidad_update(bigint, character varying)    FUNCTION     �   CREATE FUNCTION public.especialidad_update(pid bigint, pnombre character varying) RETURNS void
    LANGUAGE sql
    AS $$UPDATE public.especialidades
	SET nombre=pnombre
	WHERE id = pid;$$;
 Q   DROP FUNCTION public.especialidad_update(pid bigint, pnombre character varying);
       public          postgres    false         �            1255    177973    isEmpty(character varying)    FUNCTION     �   CREATE FUNCTION public."isEmpty"(pword character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$Declare
retorno boolean = False;
Begin
if (length(replace(pword,' ','')) = 0) then
retorno = True;
end if;
return retorno;
End;$$;
 9   DROP FUNCTION public."isEmpty"(pword character varying);
       public          postgres    false         �            1255    177974    isNotSpace(character varying)    FUNCTION     �   CREATE FUNCTION public."isNotSpace"(pword character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$Begin
return replace(trim(pword::text),' ','');
End;$$;
 <   DROP FUNCTION public."isNotSpace"(pword character varying);
       public          postgres    false         �            1255    177975 &   isNotSpaceMayuscula(character varying)    FUNCTION     �   CREATE FUNCTION public."isNotSpaceMayuscula"(pword character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$Begin 
return Upper(public."isNotSpace"(pword));
end;$$;
 E   DROP FUNCTION public."isNotSpaceMayuscula"(pword character varying);
       public          postgres    false         �            1259    178016    citas    TABLE     �   CREATE TABLE public.citas (
    id bigint NOT NULL,
    id_doctor bigint NOT NULL,
    horario timestamp with time zone NOT NULL,
    paciente character varying(250) NOT NULL
);
    DROP TABLE public.citas;
       public         heap    postgres    false         �            1259    178014    citas_id_doctor_seq    SEQUENCE     |   CREATE SEQUENCE public.citas_id_doctor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.citas_id_doctor_seq;
       public          postgres    false    210         A           0    0    citas_id_doctor_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.citas_id_doctor_seq OWNED BY public.citas.id_doctor;
          public          postgres    false    209         �            1259    178012    citas_id_seq    SEQUENCE     u   CREATE SEQUENCE public.citas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.citas_id_seq;
       public          postgres    false    210         B           0    0    citas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;
          public          postgres    false    208         �            1259    177962    consultorios    TABLE     ~   CREATE TABLE public.consultorios (
    id bigint NOT NULL,
    numero character varying NOT NULL,
    piso bigint NOT NULL
);
     DROP TABLE public.consultorios;
       public         heap    postgres    false         �            1259    177960    consultorios_pid_seq    SEQUENCE     }   CREATE SEQUENCE public.consultorios_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.consultorios_pid_seq;
       public          postgres    false    203         C           0    0    consultorios_pid_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.consultorios_pid_seq OWNED BY public.consultorios.id;
          public          postgres    false    202         �            1259    177983    doctores    TABLE     �   CREATE TABLE public.doctores (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    apellido_parterno character varying(60) NOT NULL,
    apellido_materno character varying(60) NOT NULL,
    especialidad bigint NOT NULL
);
    DROP TABLE public.doctores;
       public         heap    postgres    false         �            1259    177981    doctor_id_seq    SEQUENCE     v   CREATE SEQUENCE public.doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.doctor_id_seq;
       public          postgres    false    205         D           0    0    doctor_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctores.id;
          public          postgres    false    204         �            1259    177991    especialidades    TABLE     f   CREATE TABLE public.especialidades (
    id bigint NOT NULL,
    nombre character varying NOT NULL
);
 "   DROP TABLE public.especialidades;
       public         heap    postgres    false         �            1259    177989    especialidad_id_seq    SEQUENCE     |   CREATE SEQUENCE public.especialidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.especialidad_id_seq;
       public          postgres    false    207         E           0    0    especialidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.especialidad_id_seq OWNED BY public.especialidades.id;
          public          postgres    false    206         �
           2604    178019    citas id    DEFAULT     d   ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);
 7   ALTER TABLE public.citas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    208    210         �
           2604    178020    citas id_doctor    DEFAULT     r   ALTER TABLE ONLY public.citas ALTER COLUMN id_doctor SET DEFAULT nextval('public.citas_id_doctor_seq'::regclass);
 >   ALTER TABLE public.citas ALTER COLUMN id_doctor DROP DEFAULT;
       public          postgres    false    210    209    210         �
           2604    177965    consultorios id    DEFAULT     s   ALTER TABLE ONLY public.consultorios ALTER COLUMN id SET DEFAULT nextval('public.consultorios_pid_seq'::regclass);
 >   ALTER TABLE public.consultorios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203         �
           2604    177986    doctores id    DEFAULT     h   ALTER TABLE ONLY public.doctores ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);
 :   ALTER TABLE public.doctores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205         �
           2604    177994    especialidades id    DEFAULT     t   ALTER TABLE ONLY public.especialidades ALTER COLUMN id SET DEFAULT nextval('public.especialidad_id_seq'::regclass);
 @   ALTER TABLE public.especialidades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207         :          0    178016    citas 
   TABLE DATA           A   COPY public.citas (id, id_doctor, horario, paciente) FROM stdin;
    public          postgres    false    210       2874.dat 3          0    177962    consultorios 
   TABLE DATA           8   COPY public.consultorios (id, numero, piso) FROM stdin;
    public          postgres    false    203       2867.dat 5          0    177983    doctores 
   TABLE DATA           a   COPY public.doctores (id, nombre, apellido_parterno, apellido_materno, especialidad) FROM stdin;
    public          postgres    false    205       2869.dat 7          0    177991    especialidades 
   TABLE DATA           4   COPY public.especialidades (id, nombre) FROM stdin;
    public          postgres    false    207       2871.dat F           0    0    citas_id_doctor_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.citas_id_doctor_seq', 1, false);
          public          postgres    false    209         G           0    0    citas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.citas_id_seq', 1, false);
          public          postgres    false    208         H           0    0    consultorios_pid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.consultorios_pid_seq', 1, false);
          public          postgres    false    202         I           0    0    doctor_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.doctor_id_seq', 1, false);
          public          postgres    false    204         J           0    0    especialidad_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.especialidad_id_seq', 1, false);
          public          postgres    false    206         �
           2606    178022    citas citas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_doctor);
 :   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_pkey;
       public            postgres    false    210         �
           2606    177970    consultorios consultorios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.consultorios
    ADD CONSTRAINT consultorios_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.consultorios DROP CONSTRAINT consultorios_pkey;
       public            postgres    false    203         �
           2606    177988    doctores doctor_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.doctores DROP CONSTRAINT doctor_pkey;
       public            postgres    false    205         �
           2606    177999     especialidades especialidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT especialidad_pkey;
       public            postgres    false    207         �
           2606    178001    especialidades uk_nombre 
   CONSTRAINT     U   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT uk_nombre UNIQUE (nombre);
 B   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT uk_nombre;
       public            postgres    false    207         �
           2606    177972 "   consultorios uk_numero_consultorio 
   CONSTRAINT     _   ALTER TABLE ONLY public.consultorios
    ADD CONSTRAINT uk_numero_consultorio UNIQUE (numero);
 L   ALTER TABLE ONLY public.consultorios DROP CONSTRAINT uk_numero_consultorio;
       public            postgres    false    203         �
           2606    178007    doctores fk_especialidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT fk_especialidad FOREIGN KEY (id) REFERENCES public.especialidades(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 B   ALTER TABLE ONLY public.doctores DROP CONSTRAINT fk_especialidad;
       public          postgres    false    2733    205    207         �
           2606    178023    citas fk_id_doctor    FK CONSTRAINT     �   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_id_doctor FOREIGN KEY (id_doctor) REFERENCES public.doctores(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 <   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_id_doctor;
       public          postgres    false    205    210    2731             2874.dat                                                                                            0000600 0004000 0002000 00000000005 14547636475 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2867.dat                                                                                            0000600 0004000 0002000 00000000005 14547636475 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2869.dat                                                                                            0000600 0004000 0002000 00000000005 14547636475 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2871.dat                                                                                            0000600 0004000 0002000 00000000005 14547636475 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000033143 14547636475 0015415 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15
-- Dumped by pg_dump version 12.15

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

DROP DATABASE medicos;
--
-- Name: medicos; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE medicos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE medicos OWNER TO postgres;

\connect medicos

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
-- Name: consultorios_delete(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.consultorios_delete(pid bigint) RETURNS void
    LANGUAGE sql
    AS $$DELETE FROM public.consultorios
	WHERE id = pid;$$;


ALTER FUNCTION public.consultorios_delete(pid bigint) OWNER TO postgres;

--
-- Name: consultorios_insert(character varying, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.consultorios_insert(pnumero character varying, ppiso bigint) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO public.consultorios(
	numero, piso)
	VALUES ($1, $2);$_$;


ALTER FUNCTION public.consultorios_insert(pnumero character varying, ppiso bigint) OWNER TO postgres;

--
-- Name: consultorios_update(bigint, character varying, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.consultorios_update(pid bigint, pnumero character varying, ppiso bigint) RETURNS void
    LANGUAGE sql
    AS $$UPDATE public.consultorios
	SET numero=pnumero, piso=ppiso
	WHERE id = pid$$;


ALTER FUNCTION public.consultorios_update(pid bigint, pnumero character varying, ppiso bigint) OWNER TO postgres;

--
-- Name: doctores_delete(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doctores_delete(pid bigint) RETURNS void
    LANGUAGE sql
    AS $$DELETE FROM public.doctores
	WHERE id = pid;$$;


ALTER FUNCTION public.doctores_delete(pid bigint) OWNER TO postgres;

--
-- Name: doctores_insert(character varying, character varying, character varying, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doctores_insert(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO public.doctores(
	nombre, apellido_parterno, apellido_materno, especialidad)
	VALUES ($1,$2,$3,$4)$_$;


ALTER FUNCTION public.doctores_insert(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint) OWNER TO postgres;

--
-- Name: doctores_update(character varying, character varying, character varying, bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doctores_update(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint, pid bigint) RETURNS void
    LANGUAGE sql
    AS $_$UPDATE public.doctores
	SET nombre=$1, apellido_parterno=$2, apellido_materno=$3, especialidad=$4
	WHERE id = pid;$_$;


ALTER FUNCTION public.doctores_update(pnombre character varying, papellido_parterno character varying, papellido_materno character varying, pespecialidad bigint, pid bigint) OWNER TO postgres;

--
-- Name: especialidad_delete(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.especialidad_delete(pid bigint) RETURNS void
    LANGUAGE sql
    AS $$DELETE FROM public.especialidades
	WHERE id = pid;$$;


ALTER FUNCTION public.especialidad_delete(pid bigint) OWNER TO postgres;

--
-- Name: especialidad_insert(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.especialidad_insert(pnombre character varying) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO public.especialidades(nombre)
	VALUES ($1)$_$;


ALTER FUNCTION public.especialidad_insert(pnombre character varying) OWNER TO postgres;

--
-- Name: especialidad_update(bigint, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.especialidad_update(pid bigint, pnombre character varying) RETURNS void
    LANGUAGE sql
    AS $$UPDATE public.especialidades
	SET nombre=pnombre
	WHERE id = pid;$$;


ALTER FUNCTION public.especialidad_update(pid bigint, pnombre character varying) OWNER TO postgres;

--
-- Name: isEmpty(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."isEmpty"(pword character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$Declare
retorno boolean = False;
Begin
if (length(replace(pword,' ','')) = 0) then
retorno = True;
end if;
return retorno;
End;$$;


ALTER FUNCTION public."isEmpty"(pword character varying) OWNER TO postgres;

--
-- Name: isNotSpace(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."isNotSpace"(pword character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$Begin
return replace(trim(pword::text),' ','');
End;$$;


ALTER FUNCTION public."isNotSpace"(pword character varying) OWNER TO postgres;

--
-- Name: isNotSpaceMayuscula(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."isNotSpaceMayuscula"(pword character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$Begin 
return Upper(public."isNotSpace"(pword));
end;$$;


ALTER FUNCTION public."isNotSpaceMayuscula"(pword character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    id bigint NOT NULL,
    id_doctor bigint NOT NULL,
    horario timestamp with time zone NOT NULL,
    paciente character varying(250) NOT NULL
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- Name: citas_id_doctor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_doctor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citas_id_doctor_seq OWNER TO postgres;

--
-- Name: citas_id_doctor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_doctor_seq OWNED BY public.citas.id_doctor;


--
-- Name: citas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citas_id_seq OWNER TO postgres;

--
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;


--
-- Name: consultorios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultorios (
    id bigint NOT NULL,
    numero character varying NOT NULL,
    piso bigint NOT NULL
);


ALTER TABLE public.consultorios OWNER TO postgres;

--
-- Name: consultorios_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultorios_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consultorios_pid_seq OWNER TO postgres;

--
-- Name: consultorios_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultorios_pid_seq OWNED BY public.consultorios.id;


--
-- Name: doctores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctores (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    apellido_parterno character varying(60) NOT NULL,
    apellido_materno character varying(60) NOT NULL,
    especialidad bigint NOT NULL
);


ALTER TABLE public.doctores OWNER TO postgres;

--
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_id_seq OWNER TO postgres;

--
-- Name: doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctores.id;


--
-- Name: especialidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidades (
    id bigint NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.especialidades OWNER TO postgres;

--
-- Name: especialidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especialidad_id_seq OWNER TO postgres;

--
-- Name: especialidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidad_id_seq OWNED BY public.especialidades.id;


--
-- Name: citas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);


--
-- Name: citas id_doctor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id_doctor SET DEFAULT nextval('public.citas_id_doctor_seq'::regclass);


--
-- Name: consultorios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultorios ALTER COLUMN id SET DEFAULT nextval('public.consultorios_pid_seq'::regclass);


--
-- Name: doctores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctores ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);


--
-- Name: especialidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades ALTER COLUMN id SET DEFAULT nextval('public.especialidad_id_seq'::regclass);


--
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (id, id_doctor, horario, paciente) FROM stdin;
\.
COPY public.citas (id, id_doctor, horario, paciente) FROM '$$PATH$$/2874.dat';

--
-- Data for Name: consultorios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultorios (id, numero, piso) FROM stdin;
\.
COPY public.consultorios (id, numero, piso) FROM '$$PATH$$/2867.dat';

--
-- Data for Name: doctores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctores (id, nombre, apellido_parterno, apellido_materno, especialidad) FROM stdin;
\.
COPY public.doctores (id, nombre, apellido_parterno, apellido_materno, especialidad) FROM '$$PATH$$/2869.dat';

--
-- Data for Name: especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidades (id, nombre) FROM stdin;
\.
COPY public.especialidades (id, nombre) FROM '$$PATH$$/2871.dat';

--
-- Name: citas_id_doctor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_doctor_seq', 1, false);


--
-- Name: citas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_seq', 1, false);


--
-- Name: consultorios_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultorios_pid_seq', 1, false);


--
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_id_seq', 1, false);


--
-- Name: especialidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidad_id_seq', 1, false);


--
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_doctor);


--
-- Name: consultorios consultorios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultorios
    ADD CONSTRAINT consultorios_pkey PRIMARY KEY (id);


--
-- Name: doctores doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- Name: especialidades especialidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id);


--
-- Name: especialidades uk_nombre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT uk_nombre UNIQUE (nombre);


--
-- Name: consultorios uk_numero_consultorio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultorios
    ADD CONSTRAINT uk_numero_consultorio UNIQUE (numero);


--
-- Name: doctores fk_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT fk_especialidad FOREIGN KEY (id) REFERENCES public.especialidades(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: citas fk_id_doctor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_id_doctor FOREIGN KEY (id_doctor) REFERENCES public.doctores(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             