--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-05-15 18:48:32

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
-- TOC entry 227 (class 1259 OID 29246)
-- Name: sys_failed_job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_failed_job (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 226 (class 1259 OID 29245)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.sys_failed_job.id;


--
-- TOC entry 224 (class 1259 OID 29229)
-- Name: sys_job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_job (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 223 (class 1259 OID 29228)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.sys_job.id;


--
-- TOC entry 339 (class 1259 OID 32542)
-- Name: lost_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lost_event (
    id_lost_event bigint NOT NULL,
    nama_kejadian character varying(1000),
    identifikasi_kejadian character varying(1000),
    id_lost_event_kategori integer NOT NULL,
    id_lost_event_sumber_penyebab_kejadian integer,
    penanganan_saat_kejadian character varying(1000),
    deskripsi_kejadian character varying(1000),
    id_jenis_risiko integer,
    id_taksonomi integer,
    penjelasan_kerugian character varying(1000),
    nilai_kerugian numeric(15,2),
    is_kejadian_berulang integer,
    id_lost_event_frakuensi_kejadian integer,
    mitigasi_yang_direncanakan character varying(1000),
    realisasi_mitigasi character varying(1000),
    perbaikan_mendatang character varying(1000),
    pihak_terkait character varying(1000),
    id_lost_event_status_asuransi integer,
    nilai_premi numeric(15,2),
    nilai_klaim numeric(15,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    penyebab_kejadian character varying(1000),
    status character varying(20),
    tgl_loss_event date,
    id_register integer
);


--
-- TOC entry 338 (class 1259 OID 32541)
-- Name: lost_event_id_lost_event_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lost_event_id_lost_event_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 338
-- Name: lost_event_id_lost_event_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lost_event_id_lost_event_seq OWNED BY public.lost_event.id_lost_event;


--
-- TOC entry 216 (class 1259 OID 29181)
-- Name: sys_migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_migration (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 215 (class 1259 OID 29180)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.sys_migration.id;


--
-- TOC entry 335 (class 1259 OID 32524)
-- Name: mt_lost_event_frakuensi_kejadian; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_lost_event_frakuensi_kejadian (
    id_lost_event_frakuensi_kejadian integer NOT NULL,
    nama character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 331 (class 1259 OID 32506)
-- Name: mt_lost_event_kategori; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_lost_event_kategori (
    id_lost_event_kategori integer NOT NULL,
    nama character varying(1000) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 330 (class 1259 OID 32505)
-- Name: mt_lost_event_kategori_id_lost_event_kategori_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 330
-- Name: mt_lost_event_kategori_id_lost_event_kategori_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq OWNED BY public.mt_lost_event_kategori.id_lost_event_kategori;


--
-- TOC entry 334 (class 1259 OID 32523)
-- Name: mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 334
-- Name: mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq OWNED BY public.mt_lost_event_frakuensi_kejadian.id_lost_event_frakuensi_kejadian;


--
-- TOC entry 333 (class 1259 OID 32515)
-- Name: mt_lost_event_sumber_penyebab_kejadian; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_lost_event_sumber_penyebab_kejadian (
    id_lost_event_sumber_penyebab_kejadian integer NOT NULL,
    nama character varying(1000) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 332 (class 1259 OID 32514)
-- Name: mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 332
-- Name: mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq OWNED BY public.mt_lost_event_sumber_penyebab_kejadian.id_lost_event_sumber_penyebab_kejadian;


--
-- TOC entry 337 (class 1259 OID 32533)
-- Name: mt_lost_event_status_asuransi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_lost_event_status_asuransi (
    id_lost_event_status_asuransi integer NOT NULL,
    nama character varying(1000) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 336 (class 1259 OID 32532)
-- Name: mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 336
-- Name: mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq OWNED BY public.mt_lost_event_status_asuransi.id_lost_event_status_asuransi;


--
-- TOC entry 243 (class 1259 OID 31184)
-- Name: mt_risk_dampak; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_dampak (
    id_dampak integer NOT NULL,
    nama character varying(300) NOT NULL,
    keterangan character varying(4000) DEFAULT NULL::character varying,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    kode character varying(20) NOT NULL,
    rating double precision,
    mulai double precision,
    sampai double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 242 (class 1259 OID 31183)
-- Name: mt_risk_dampak_id_dampak_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_dampak_id_dampak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 242
-- Name: mt_risk_dampak_id_dampak_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_dampak_id_dampak_seq OWNED BY public.mt_risk_dampak.id_dampak;


--
-- TOC entry 299 (class 1259 OID 32186)
-- Name: mt_risk_efektifitas_control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_efektifitas_control (
    id_efektifitas_control integer NOT NULL,
    nama character varying(500) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 298 (class 1259 OID 32185)
-- Name: mt_risk_efektifitas_control_id_efektifitas_control_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 298
-- Name: mt_risk_efektifitas_control_id_efektifitas_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq OWNED BY public.mt_risk_efektifitas_control.id_efektifitas_control;


--
-- TOC entry 295 (class 1259 OID 32170)
-- Name: mt_risk_jenis_control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_jenis_control (
    id_jenis_control integer NOT NULL,
    nama character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 294 (class 1259 OID 32169)
-- Name: mt_risk_jenis_control_id_jenis_control_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 294
-- Name: mt_risk_jenis_control_id_jenis_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq OWNED BY public.mt_risk_jenis_control.id_jenis_control;


--
-- TOC entry 305 (class 1259 OID 32227)
-- Name: mt_risk_jenis_perlakuan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_jenis_perlakuan (
    id_jenis_perlakuan integer NOT NULL,
    nama character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 304 (class 1259 OID 32226)
-- Name: mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 304
-- Name: mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq OWNED BY public.mt_risk_jenis_perlakuan.id_jenis_perlakuan;


--
-- TOC entry 307 (class 1259 OID 32236)
-- Name: mt_risk_jenis_program_rkap; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_jenis_program_rkap (
    id_jenis_program_rkap integer NOT NULL,
    nama character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 306 (class 1259 OID 32235)
-- Name: mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 306
-- Name: mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq OWNED BY public.mt_risk_jenis_program_rkap.id_jenis_program_rkap;


--
-- TOC entry 329 (class 1259 OID 32407)
-- Name: mt_risk_jenis_risiko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_jenis_risiko (
    id_jenis_risiko integer NOT NULL,
    id_kategori_risiko integer,
    kode character varying(20),
    nama character varying(2000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 328 (class 1259 OID 32406)
-- Name: mt_risk_jenis_risiko_id_jenis_risiko_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 328
-- Name: mt_risk_jenis_risiko_id_jenis_risiko_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq OWNED BY public.mt_risk_jenis_risiko.id_jenis_risiko;


--
-- TOC entry 327 (class 1259 OID 32400)
-- Name: mt_risk_kategori_risiko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_kategori_risiko (
    id_kategori_risiko integer NOT NULL,
    kode character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 326 (class 1259 OID 32399)
-- Name: mt_risk_kategori_risiko_id_kategori_risiko_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 326
-- Name: mt_risk_kategori_risiko_id_kategori_risiko_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq OWNED BY public.mt_risk_kategori_risiko.id_kategori_risiko;


--
-- TOC entry 245 (class 1259 OID 31196)
-- Name: mt_risk_kemungkinan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_kemungkinan (
    id_kemungkinan integer NOT NULL,
    nama character varying(300) NOT NULL,
    kemungkinan_terjadi character varying(4000) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    frekuensi_kejadian character varying(4000) DEFAULT NULL::character varying,
    kode character varying(20) NOT NULL,
    rating double precision,
    persentase character varying(4000),
    kemungkinan_terjadi_tahunan numeric(10,2),
    frekuensi_kejadian_transaksi numeric(10,2),
    persentase_mulai numeric(10,2),
    persentase_sampai numeric(10,2),
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 244 (class 1259 OID 31195)
-- Name: mt_risk_kemungkinan_id_kemungkinan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 244
-- Name: mt_risk_kemungkinan_id_kemungkinan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_risk_kemungkinan.id_kemungkinan;


--
-- TOC entry 251 (class 1259 OID 31252)
-- Name: mt_risk_kriteria_dampak; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_kriteria_dampak (
    id_kriteria_dampak integer NOT NULL,
    nama character varying(200) DEFAULT NULL::character varying,
    id_induk bigint,
    kode character varying(20) DEFAULT NULL::character varying,
    jenis integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 252 (class 1259 OID 31266)
-- Name: mt_risk_kriteria_dampak_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_kriteria_dampak_detail (
    id_kriteria_dampak bigint NOT NULL,
    id_dampak bigint NOT NULL,
    keterangan character varying(400) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 250 (class 1259 OID 31251)
-- Name: mt_risk_kriteria_dampak_id_kriteria_dampak_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 250
-- Name: mt_risk_kriteria_dampak_id_kriteria_dampak_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_risk_kriteria_dampak.id_kriteria_dampak;


--
-- TOC entry 253 (class 1259 OID 31282)
-- Name: mt_risk_matrix; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_matrix (
    id_dampak bigint NOT NULL,
    id_kemungkinan bigint NOT NULL,
    id_tingkat bigint,
    css character varying(200) DEFAULT NULL::character varying,
    jenis integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200),
    skala integer
);


--
-- TOC entry 255 (class 1259 OID 31754)
-- Name: mt_risk_perlakuan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_perlakuan (
    id_perlakuan integer NOT NULL,
    nama character varying(200),
    keterangan character varying(4000),
    jenis integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 254 (class 1259 OID 31753)
-- Name: mt_risk_perlakuan_id_perluakuan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 254
-- Name: mt_risk_perlakuan_id_perluakuan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq OWNED BY public.mt_risk_perlakuan.id_perlakuan;


--
-- TOC entry 281 (class 1259 OID 32010)
-- Name: mt_risk_sasaran; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_sasaran (
    id_sasaran bigint NOT NULL,
    nama character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 266 (class 1259 OID 31866)
-- Name: mt_risk_sikap_terhadap_risiko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_sikap_terhadap_risiko (
    id_sikap_terhadap_risiko integer NOT NULL,
    nama character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 265 (class 1259 OID 31865)
-- Name: mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 265
-- Name: mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq OWNED BY public.mt_risk_sikap_terhadap_risiko.id_sikap_terhadap_risiko;


--
-- TOC entry 264 (class 1259 OID 31850)
-- Name: mt_risk_taksonomi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_taksonomi (
    id_taksonomi bigint NOT NULL,
    kode character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    id_taksonomi_area bigint,
    is_regulasi smallint,
    penjelasan character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 262 (class 1259 OID 31836)
-- Name: mt_risk_taksonomi_area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_taksonomi_area (
    id_taksonomi_area bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(200) NOT NULL,
    id_taksonomi_objective bigint,
    keterangan text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 261 (class 1259 OID 31835)
-- Name: mt_risk_taksonomi_area_id_taksonomi_area_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 261
-- Name: mt_risk_taksonomi_area_id_taksonomi_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq OWNED BY public.mt_risk_taksonomi_area.id_taksonomi_area;


--
-- TOC entry 263 (class 1259 OID 31849)
-- Name: mt_risk_taksonomi_id_taksonomi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 263
-- Name: mt_risk_taksonomi_id_taksonomi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq OWNED BY public.mt_risk_taksonomi.id_taksonomi;


--
-- TOC entry 260 (class 1259 OID 31829)
-- Name: mt_risk_taksonomi_objective; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_taksonomi_objective (
    id_taksonomi_objective bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 259 (class 1259 OID 31828)
-- Name: mt_risk_taksonomi_objective_id_taksonomi_objective_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 259
-- Name: mt_risk_taksonomi_objective_id_taksonomi_objective_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq OWNED BY public.mt_risk_taksonomi_objective.id_taksonomi_objective;


--
-- TOC entry 247 (class 1259 OID 31219)
-- Name: mt_risk_tingkat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_tingkat (
    id_tingkat integer NOT NULL,
    nama character varying(20) DEFAULT NULL::character varying,
    warna character varying(20) DEFAULT NULL::character varying,
    penanganan character varying(4000) DEFAULT NULL::character varying,
    jenis integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 279 (class 1259 OID 31998)
-- Name: mt_risk_tingkat_agregasi_risiko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_tingkat_agregasi_risiko (
    id_tingkat_agregasi_risiko integer NOT NULL,
    nama character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by_desc character varying(50),
    updated_by_desc character varying(50),
    deleted_by_desc character varying(50),
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    id_tingkat_agregasi_risiko_parent integer
);


--
-- TOC entry 278 (class 1259 OID 31997)
-- Name: mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 278
-- Name: mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq OWNED BY public.mt_risk_tingkat_agregasi_risiko.id_tingkat_agregasi_risiko;


--
-- TOC entry 246 (class 1259 OID 31218)
-- Name: mt_risk_tingkat_id_tingkat_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_risk_tingkat_id_tingkat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 246
-- Name: mt_risk_tingkat_id_tingkat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_risk_tingkat_id_tingkat_seq OWNED BY public.mt_risk_tingkat.id_tingkat;


--
-- TOC entry 256 (class 1259 OID 31762)
-- Name: mt_risk_tingkat_perlakuan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_risk_tingkat_perlakuan (
    id_tingkat bigint NOT NULL,
    id_perlakuan bigint NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 280 (class 1259 OID 32009)
-- Name: mt_sasaran_id_sasaran_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 280
-- Name: mt_sasaran_id_sasaran_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_sasaran_id_sasaran_seq OWNED BY public.mt_risk_sasaran.id_sasaran;


--
-- TOC entry 258 (class 1259 OID 31787)
-- Name: mt_sdm_jabatan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_sdm_jabatan (
    id_jabatan integer NOT NULL,
    nama character varying(200) NOT NULL,
    id_unit character varying(18),
    position_id character varying(20),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    tgl_mulai_efektif date,
    tgl_akhir_efektif date,
    id_jabatan_parent bigint,
    superior_id character varying(20),
    urutan double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 257 (class 1259 OID 31786)
-- Name: mt_sdm_jabatan_id_jabatan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 257
-- Name: mt_sdm_jabatan_id_jabatan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq OWNED BY public.mt_sdm_jabatan.id_jabatan;


--
-- TOC entry 344 (class 1259 OID 32631)
-- Name: mt_sdm_kelompok_bisnis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_sdm_kelompok_bisnis (
    id_kelompok_bisnis integer NOT NULL,
    nama character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 343 (class 1259 OID 32630)
-- Name: mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 343
-- Name: mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq OWNED BY public.mt_sdm_kelompok_bisnis.id_kelompok_bisnis;


--
-- TOC entry 248 (class 1259 OID 31233)
-- Name: mt_sdm_pegawai; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_sdm_pegawai (
    nid character varying(10) NOT NULL,
    email character varying(500) DEFAULT NULL::character varying,
    position_id character varying(10) DEFAULT NULL::character varying,
    nama_lengkap character varying(500) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 249 (class 1259 OID 31243)
-- Name: mt_sdm_unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_sdm_unit (
    id_unit character varying(18) NOT NULL,
    nama character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200),
    id_kelompok_bisnis integer
);


--
-- TOC entry 275 (class 1259 OID 31945)
-- Name: mt_status_pengajuan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_status_pengajuan (
    id_status_pengajuan bigint NOT NULL,
    nama character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    created_by_desc character varying(50),
    updated_by_desc character varying(50),
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 274 (class 1259 OID 31944)
-- Name: mt_status_pengajuan_id_status_pengajuan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 274
-- Name: mt_status_pengajuan_id_status_pengajuan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq OWNED BY public.mt_status_pengajuan.id_status_pengajuan;


--
-- TOC entry 320 (class 1259 OID 32342)
-- Name: mt_status_rencana_perlakuan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_status_rencana_perlakuan (
    id_status_rencana_perlakuan integer NOT NULL,
    nama character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 319 (class 1259 OID 32341)
-- Name: mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 319
-- Name: mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq OWNED BY public.mt_status_rencana_perlakuan.id_status_rencana_perlakuan;


--
-- TOC entry 342 (class 1259 OID 32612)
-- Name: mt_template_laporan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mt_template_laporan (
    id_template_laporan bigint NOT NULL,
    halaman character varying(500),
    judul character varying(2000),
    kolom text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 341 (class 1259 OID 32611)
-- Name: mt_tamplate_laporan_id_tamplate_laporan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 341
-- Name: mt_tamplate_laporan_id_tamplate_laporan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq OWNED BY public.mt_template_laporan.id_template_laporan;


--
-- TOC entry 273 (class 1259 OID 31923)
-- Name: risk_capacity_limit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_capacity_limit (
    id_capacity_limit bigint NOT NULL,
    tahun integer NOT NULL,
    kapasitas_risiko numeric(15,2) NOT NULL,
    persentase_toleran numeric(5,2) NOT NULL,
    risk_limit numeric(15,2) NOT NULL,
    modified_by bigint,
    modified_by_desc character varying(200),
    total_realisasi_eksposur_risiko_residual numeric(15,2),
    id_register bigint,
    status character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 272 (class 1259 OID 31922)
-- Name: risk_capacity_limit_id_capacity_limit_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 272
-- Name: risk_capacity_limit_id_capacity_limit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq OWNED BY public.risk_capacity_limit.id_capacity_limit;


--
-- TOC entry 287 (class 1259 OID 32053)
-- Name: risk_dampak; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_dampak (
    id_dampak bigint NOT NULL,
    id_risiko bigint,
    nama character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    catatan text,
    status character varying(50),
    id_unit character varying(18)
);


--
-- TOC entry 286 (class 1259 OID 32052)
-- Name: risk_dampak_id_dampak_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_dampak_id_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 286
-- Name: risk_dampak_id_dampak_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_dampak_id_dampak_seq OWNED BY public.risk_dampak.id_dampak;


--
-- TOC entry 268 (class 1259 OID 31874)
-- Name: risk_metrik_strategi_risiko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_metrik_strategi_risiko (
    id_metrik_strategi_risiko bigint NOT NULL,
    id_jenis_risiko integer NOT NULL,
    id_taksonomi bigint NOT NULL,
    risk_appetite_statement character varying(1000) NOT NULL,
    id_sikap_terhadap_risiko integer NOT NULL,
    paramater character varying(1000) NOT NULL,
    satuan_ukuran character varying(100) NOT NULL,
    nilai_batasan numeric(15,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    id_register bigint,
    deleted_by bigint,
    deleted_by_desc character varying(200),
    tahun integer
);


--
-- TOC entry 267 (class 1259 OID 31873)
-- Name: risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 267
-- Name: risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq OWNED BY public.risk_metrik_strategi_risiko.id_metrik_strategi_risiko;


--
-- TOC entry 324 (class 1259 OID 32363)
-- Name: risk_msg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_msg (
    id_msg bigint NOT NULL,
    msg character varying(4000),
    url character varying(4000)
);


--
-- TOC entry 323 (class 1259 OID 32362)
-- Name: risk_msg_id_msg_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_msg_id_msg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 323
-- Name: risk_msg_id_msg_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_msg_id_msg_seq OWNED BY public.risk_msg.id_msg;


--
-- TOC entry 325 (class 1259 OID 32371)
-- Name: risk_msg_penerima; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_msg_penerima (
    id_msg bigint NOT NULL,
    is_read character varying(1) DEFAULT '0'::character varying,
    id_user bigint NOT NULL
);


--
-- TOC entry 285 (class 1259 OID 32044)
-- Name: risk_penyebab; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_penyebab (
    id_penyebab bigint NOT NULL,
    id_risiko bigint,
    nama character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    catatan text,
    status character varying(50),
    id_unit character varying(18)
);


--
-- TOC entry 284 (class 1259 OID 32043)
-- Name: risk_penyebab_id_penyebab_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_penyebab_id_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 284
-- Name: risk_penyebab_id_penyebab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_penyebab_id_penyebab_seq OWNED BY public.risk_penyebab.id_penyebab;


--
-- TOC entry 289 (class 1259 OID 32082)
-- Name: risk_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile (
    id_risk_profile bigint NOT NULL,
    sasaran character varying(1000),
    id_sasaran bigint,
    id_jenis_risiko integer,
    id_taksonomi bigint,
    id_risiko bigint,
    nama character varying(1000),
    deskripsi character varying,
    id_register bigint,
    is_kuantitatif integer,
    penjelasan_dampak character varying(2000),
    nilai_dampak_inheren numeric(15,2),
    id_dampak_inheren integer,
    nilai_kemungkinan numeric(5,2),
    id_kemungkinan_inheren integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    tgl_risiko date,
    no_risiko character varying(200),
    id_kriteria_dampak integer,
    tanggapan character varying(2000),
    id_risk_profile_sebelum bigint,
    status character varying(20)
);


--
-- TOC entry 297 (class 1259 OID 32177)
-- Name: risk_profile_control; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_control (
    id_control bigint NOT NULL,
    id_risk_profile bigint,
    id_jenis_control integer,
    nama character varying(2000),
    id_efektifitas_control integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 296 (class 1259 OID 32176)
-- Name: risk_profile_control_id_control_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_control_id_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 296
-- Name: risk_profile_control_id_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_control_id_control_seq OWNED BY public.risk_profile_control.id_control;


--
-- TOC entry 291 (class 1259 OID 32138)
-- Name: risk_profile_dampak; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_dampak (
    id_risk_profile bigint NOT NULL,
    id_dampak bigint NOT NULL,
    nama character varying(1000) NOT NULL,
    no character varying(10),
    perkiraan_terpapar character varying(200),
    id_profile_dampak bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 303 (class 1259 OID 32216)
-- Name: risk_profile_dampak_id_profile_dampak_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 303
-- Name: risk_profile_dampak_id_profile_dampak_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq OWNED BY public.risk_profile_dampak.id_profile_dampak;


--
-- TOC entry 288 (class 1259 OID 32081)
-- Name: risk_profile_id_risk_profile_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_id_risk_profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 288
-- Name: risk_profile_id_risk_profile_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_id_risk_profile_seq OWNED BY public.risk_profile.id_risk_profile;


--
-- TOC entry 293 (class 1259 OID 32156)
-- Name: risk_profile_kri; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_kri (
    id_kri bigint NOT NULL,
    nama character varying(500) NOT NULL,
    id_risk_profile bigint NOT NULL,
    satuan character varying(50),
    target_mulai double precision,
    target_sampai double precision,
    keterangan character varying(4000),
    polaritas character varying(1),
    batas_bawah double precision,
    batas_atas double precision,
    is_kuantitatif integer,
    aman character varying(1000),
    hati_hati character varying(1000),
    bahaya character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 316 (class 1259 OID 32313)
-- Name: risk_profile_kri_hasil; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_kri_hasil (
    id_kri_hasil bigint NOT NULL,
    periode character varying(20),
    nilai double precision,
    id_kri bigint,
    target_mulai double precision,
    target_sampai double precision,
    batas_atas double precision,
    batas_bawah double precision,
    aman character varying(1000),
    hati_hati character varying(1000),
    bahaya character varying(1000),
    status character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    nilai_kualitatif character varying(200)
);


--
-- TOC entry 315 (class 1259 OID 32312)
-- Name: risk_profile_kri_hasil_id_kri_hasil_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 315
-- Name: risk_profile_kri_hasil_id_kri_hasil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq OWNED BY public.risk_profile_kri_hasil.id_kri_hasil;


--
-- TOC entry 292 (class 1259 OID 32155)
-- Name: risk_profile_kri_id_kri_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_kri_id_kri_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 292
-- Name: risk_profile_kri_id_kri_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_kri_id_kri_seq OWNED BY public.risk_profile_kri.id_kri;


--
-- TOC entry 309 (class 1259 OID 32244)
-- Name: risk_profile_mitigasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_mitigasi (
    id_mitigasi bigint NOT NULL,
    id_risk_profile bigint,
    id_profile_penyebab bigint,
    id_perlakuan integer,
    nama character varying(2000),
    output_perlakuan character varying(2000),
    biaya numeric(15,2),
    id_jenis_program_rkap integer,
    id_pic integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 308 (class 1259 OID 32243)
-- Name: risk_profile_mitigasi_id_mitigasi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 308
-- Name: risk_profile_mitigasi_id_mitigasi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq OWNED BY public.risk_profile_mitigasi.id_mitigasi;


--
-- TOC entry 310 (class 1259 OID 32277)
-- Name: risk_profile_mitigasi_jenis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_mitigasi_jenis (
    id_mitigasi bigint,
    id_jenis_perlakuan integer,
    id_mitigasi_jenis integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 345 (class 1259 OID 32701)
-- Name: risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 345
-- Name: risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq OWNED BY public.risk_profile_mitigasi_jenis.id_mitigasi_jenis;


--
-- TOC entry 322 (class 1259 OID 32349)
-- Name: risk_profile_mitigasi_realisasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_mitigasi_realisasi (
    id_mitigasi_realisasi bigint NOT NULL,
    id_mitigasi bigint,
    periode character varying(20),
    id_status_rencana_perlakuan integer,
    penjelasan_status_rencana_perlakuan character varying(3000),
    progress numeric(5,2),
    nama character varying(2000),
    output_perlakuan character varying(2000),
    biaya numeric(15,2),
    id_pic integer,
    is_ada_progress integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 321 (class 1259 OID 32348)
-- Name: risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 321
-- Name: risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq OWNED BY public.risk_profile_mitigasi_realisasi.id_mitigasi_realisasi;


--
-- TOC entry 318 (class 1259 OID 32330)
-- Name: risk_profile_mitigasi_timeline_realisasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_mitigasi_timeline_realisasi (
    id_mitigasi_timeline_realisasi bigint NOT NULL,
    periode character varying(20) NOT NULL,
    is_proses integer NOT NULL,
    id_mitigasi bigint
);


--
-- TOC entry 317 (class 1259 OID 32329)
-- Name: risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 317
-- Name: risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq OWNED BY public.risk_profile_mitigasi_timeline_realisasi.id_mitigasi_timeline_realisasi;


--
-- TOC entry 312 (class 1259 OID 32291)
-- Name: risk_profile_mitigasi_timeline; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_mitigasi_timeline (
    id_mitigasi_timeline bigint NOT NULL,
    periode character varying(20) NOT NULL,
    is_proses integer NOT NULL,
    id_mitigasi bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 311 (class 1259 OID 32290)
-- Name: risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 311
-- Name: risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq OWNED BY public.risk_profile_mitigasi_timeline.id_mitigasi_timeline;


--
-- TOC entry 290 (class 1259 OID 32121)
-- Name: risk_profile_penyebab; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_penyebab (
    id_risk_profile bigint NOT NULL,
    id_penyebab bigint NOT NULL,
    nama character varying(1000) NOT NULL,
    no character varying(10),
    id_profile_penyebab bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 302 (class 1259 OID 32206)
-- Name: risk_profile_penyebab_id_profile_penyebab_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 302
-- Name: risk_profile_penyebab_id_profile_penyebab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq OWNED BY public.risk_profile_penyebab.id_profile_penyebab;


--
-- TOC entry 314 (class 1259 OID 32304)
-- Name: risk_profile_realisasi_residual; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_realisasi_residual (
    id_realisasi_residual bigint NOT NULL,
    id_risk_profile bigint NOT NULL,
    periode character varying(20),
    penjelasan_dampak character varying(2000),
    nilai_dampak numeric,
    id_dampak integer,
    nilai_kemungkinan numeric(5,2),
    id_kemungkinan integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 313 (class 1259 OID 32303)
-- Name: risk_profile_realisasi_residual_id_realisasi_residual_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 313
-- Name: risk_profile_realisasi_residual_id_realisasi_residual_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq OWNED BY public.risk_profile_realisasi_residual.id_realisasi_residual;


--
-- TOC entry 301 (class 1259 OID 32198)
-- Name: risk_profile_target_residual; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_profile_target_residual (
    id_target_residual bigint NOT NULL,
    id_risk_profile bigint NOT NULL,
    periode character varying(20),
    nilai_dampak numeric,
    id_dampak integer,
    nilai_kemungkinan numeric(5,2),
    id_kemungkinan integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 300 (class 1259 OID 32197)
-- Name: risk_profile_target_residual_id_target_residual_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_profile_target_residual_id_target_residual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 300
-- Name: risk_profile_target_residual_id_target_residual_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_profile_target_residual_id_target_residual_seq OWNED BY public.risk_profile_target_residual.id_target_residual;


--
-- TOC entry 277 (class 1259 OID 31952)
-- Name: risk_register; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_register (
    id_register bigint NOT NULL,
    nama character varying(300) NOT NULL,
    scope character varying(4000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by_desc character varying(50),
    updated_by_desc character varying(50),
    created_by bigint,
    updated_by bigint,
    id_kajian_risiko bigint,
    id_unit character varying(18),
    id_parent_register bigint,
    navigasi character varying(1) DEFAULT '0'::character varying,
    id_tingkat_agregasi_risiko bigint,
    is_kegiatan character varying(1) DEFAULT '0'::character varying,
    kode character varying(20),
    id_status_pengajuan bigint,
    id_owner bigint,
    nama_owner character varying(100),
    deleted_by bigint,
    deleted_by_desc character varying(50),
    periode_mulai date,
    periode_selesai date
);


--
-- TOC entry 276 (class 1259 OID 31951)
-- Name: risk_register_id_register_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_register_id_register_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 276
-- Name: risk_register_id_register_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_register_id_register_seq OWNED BY public.risk_register.id_register;


--
-- TOC entry 283 (class 1259 OID 32017)
-- Name: risk_risiko; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_risiko (
    id_risiko bigint NOT NULL,
    id_taksonomi bigint,
    id_jenis_risiko integer,
    nama character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    catatan text,
    status character varying(50),
    id_unit character varying(18)
);


--
-- TOC entry 282 (class 1259 OID 32016)
-- Name: risk_risiko_id_risiko_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_risiko_id_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 282
-- Name: risk_risiko_id_risiko_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_risiko_id_risiko_seq OWNED BY public.risk_risiko.id_risiko;


--
-- TOC entry 270 (class 1259 OID 31898)
-- Name: risk_sasaran; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_sasaran (
    id_sasaran bigint NOT NULL,
    nama character varying(1000) NOT NULL,
    hasil_yang_diharapkan character varying(1000) NOT NULL,
    nilai_risiko character varying(1000) NOT NULL,
    nilai_limit character varying(1000),
    is_accept integer DEFAULT 0,
    id_register bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    tahun integer
);


--
-- TOC entry 269 (class 1259 OID 31897)
-- Name: risk_sasaran_id_sasaran_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 269
-- Name: risk_sasaran_id_sasaran_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_sasaran_id_sasaran_seq OWNED BY public.risk_sasaran.id_sasaran;


--
-- TOC entry 271 (class 1259 OID 31907)
-- Name: risk_sasaran_strategi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.risk_sasaran_strategi (
    id_sasaran bigint NOT NULL,
    strategi character varying(1000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    id_sasaran_strategi bigint NOT NULL
);


--
-- TOC entry 340 (class 1259 OID 32582)
-- Name: risk_sasaran_strategi_id_sasaran_strategi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 340
-- Name: risk_sasaran_strategi_id_sasaran_strategi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq OWNED BY public.risk_sasaran_strategi.id_sasaran_strategi;


--
-- TOC entry 231 (class 1259 OID 30886)
-- Name: sys_action; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_action (
    id_action integer NOT NULL,
    nama character varying(200),
    id_menu integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 230 (class 1259 OID 30885)
-- Name: sys_action_id_action_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sys_action_id_action_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 230
-- Name: sys_action_id_action_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sys_action_id_action_seq OWNED BY public.sys_action.id_action;


--
-- TOC entry 221 (class 1259 OID 29214)
-- Name: sys_cache; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 222 (class 1259 OID 29221)
-- Name: sys_cache_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_cache_lock (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 233 (class 1259 OID 30898)
-- Name: sys_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_group (
    id_group integer NOT NULL,
    nama character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 240 (class 1259 OID 30937)
-- Name: sys_group_action; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_group_action (
    id_group_menu integer,
    id_action integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200)
);


--
-- TOC entry 232 (class 1259 OID 30897)
-- Name: sys_group_id_group_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sys_group_id_group_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 232
-- Name: sys_group_id_group_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sys_group_id_group_seq OWNED BY public.sys_group.id_group;


--
-- TOC entry 239 (class 1259 OID 30921)
-- Name: sys_group_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_group_menu (
    id_group_menu integer NOT NULL,
    id_group integer,
    id_menu integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 238 (class 1259 OID 30920)
-- Name: sys_group_menu_id_group_menu_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sys_group_menu_id_group_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 238
-- Name: sys_group_menu_id_group_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sys_group_menu_id_group_menu_seq OWNED BY public.sys_group_menu.id_group_menu;


--
-- TOC entry 225 (class 1259 OID 29238)
-- Name: sys_job_batch; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_job_batch (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 237 (class 1259 OID 30914)
-- Name: sys_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_log (
    page character varying(500),
    activity text,
    ip character varying(50),
    activity_time timestamp without time zone,
    user_desc character varying(200),
    action character varying(50),
    table_name character varying(100),
    id_log bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 236 (class 1259 OID 30913)
-- Name: sys_log_id_log_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sys_log_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 236
-- Name: sys_log_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sys_log_id_log_seq OWNED BY public.sys_log.id_log;


--
-- TOC entry 229 (class 1259 OID 30879)
-- Name: sys_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_menu (
    id_menu integer NOT NULL,
    id_parent_menu integer,
    nama character varying(100),
    url character varying(300),
    sort integer,
    icon character varying(20),
    is_show smallint DEFAULT 1,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 228 (class 1259 OID 30878)
-- Name: sys_menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sys_menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 228
-- Name: sys_menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sys_menu_id_menu_seq OWNED BY public.sys_menu.id_menu;


--
-- TOC entry 219 (class 1259 OID 29198)
-- Name: sys_password_reset_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_password_reset_token (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 220 (class 1259 OID 29205)
-- Name: sys_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_session (
    id character varying(255) NOT NULL,
    id_user bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 235 (class 1259 OID 30905)
-- Name: sys_setting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_setting (
    id_setting integer NOT NULL,
    nama character varying(100),
    isi character varying(500),
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 234 (class 1259 OID 30904)
-- Name: sys_setting_id_setting_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sys_setting_id_setting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 234
-- Name: sys_setting_id_setting_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sys_setting_id_setting_seq OWNED BY public.sys_setting.id_setting;


--
-- TOC entry 218 (class 1259 OID 29188)
-- Name: sys_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_user (
    id_user bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    last_ip character varying(30),
    last_login time without time zone,
    created_by integer,
    updated_by integer,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    salt character varying(20),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 241 (class 1259 OID 30951)
-- Name: sys_user_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_user_group (
    id_user bigint,
    id_group bigint,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);


--
-- TOC entry 217 (class 1259 OID 29187)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.sys_user.id_user;


--
-- TOC entry 5051 (class 2604 OID 32545)
-- Name: lost_event id_lost_event; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event ALTER COLUMN id_lost_event SET DEFAULT nextval('public.lost_event_id_lost_event_seq'::regclass);


--
-- TOC entry 5049 (class 2604 OID 32527)
-- Name: mt_lost_event_frakuensi_kejadian id_lost_event_frakuensi_kejadian; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian ALTER COLUMN id_lost_event_frakuensi_kejadian SET DEFAULT nextval('public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq'::regclass);


--
-- TOC entry 5047 (class 2604 OID 32509)
-- Name: mt_lost_event_kategori id_lost_event_kategori; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_kategori ALTER COLUMN id_lost_event_kategori SET DEFAULT nextval('public.mt_lost_event_kategori_id_lost_event_kategori_seq'::regclass);


--
-- TOC entry 5050 (class 2604 OID 32536)
-- Name: mt_lost_event_status_asuransi id_lost_event_status_asuransi; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_status_asuransi ALTER COLUMN id_lost_event_status_asuransi SET DEFAULT nextval('public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq'::regclass);


--
-- TOC entry 5048 (class 2604 OID 32518)
-- Name: mt_lost_event_sumber_penyebab_kejadian id_lost_event_sumber_penyebab_kejadian; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian ALTER COLUMN id_lost_event_sumber_penyebab_kejadian SET DEFAULT nextval('public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 31187)
-- Name: mt_risk_dampak id_dampak; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_risk_dampak_id_dampak_seq'::regclass);


--
-- TOC entry 5031 (class 2604 OID 32189)
-- Name: mt_risk_efektifitas_control id_efektifitas_control; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_efektifitas_control ALTER COLUMN id_efektifitas_control SET DEFAULT nextval('public.mt_risk_efektifitas_control_id_efektifitas_control_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 32173)
-- Name: mt_risk_jenis_control id_jenis_control; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_control ALTER COLUMN id_jenis_control SET DEFAULT nextval('public.mt_risk_jenis_control_id_jenis_control_seq'::regclass);


--
-- TOC entry 5033 (class 2604 OID 32230)
-- Name: mt_risk_jenis_perlakuan id_jenis_perlakuan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_perlakuan ALTER COLUMN id_jenis_perlakuan SET DEFAULT nextval('public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq'::regclass);


--
-- TOC entry 5034 (class 2604 OID 32239)
-- Name: mt_risk_jenis_program_rkap id_jenis_program_rkap; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_program_rkap ALTER COLUMN id_jenis_program_rkap SET DEFAULT nextval('public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq'::regclass);


--
-- TOC entry 5046 (class 2604 OID 32410)
-- Name: mt_risk_jenis_risiko id_jenis_risiko; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_risiko ALTER COLUMN id_jenis_risiko SET DEFAULT nextval('public.mt_risk_jenis_risiko_id_jenis_risiko_seq'::regclass);


--
-- TOC entry 5045 (class 2604 OID 32403)
-- Name: mt_risk_kategori_risiko id_kategori_risiko; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kategori_risiko ALTER COLUMN id_kategori_risiko SET DEFAULT nextval('public.mt_risk_kategori_risiko_id_kategori_risiko_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 31199)
-- Name: mt_risk_kemungkinan id_kemungkinan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_risk_kemungkinan_id_kemungkinan_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 31255)
-- Name: mt_risk_kriteria_dampak id_kriteria_dampak; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq'::regclass);


--
-- TOC entry 5005 (class 2604 OID 31757)
-- Name: mt_risk_perlakuan id_perlakuan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_perlakuan ALTER COLUMN id_perlakuan SET DEFAULT nextval('public.mt_risk_perlakuan_id_perluakuan_seq'::regclass);


--
-- TOC entry 5021 (class 2604 OID 32013)
-- Name: mt_risk_sasaran id_sasaran; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.mt_sasaran_id_sasaran_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 31869)
-- Name: mt_risk_sikap_terhadap_risiko id_sikap_terhadap_risiko; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko SET DEFAULT nextval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq'::regclass);


--
-- TOC entry 5009 (class 2604 OID 31853)
-- Name: mt_risk_taksonomi id_taksonomi; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi ALTER COLUMN id_taksonomi SET DEFAULT nextval('public.mt_risk_taksonomi_id_taksonomi_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 31839)
-- Name: mt_risk_taksonomi_area id_taksonomi_area; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area SET DEFAULT nextval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 31832)
-- Name: mt_risk_taksonomi_objective id_taksonomi_objective; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective SET DEFAULT nextval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 31222)
-- Name: mt_risk_tingkat id_tingkat; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_risk_tingkat_id_tingkat_seq'::regclass);


--
-- TOC entry 5020 (class 2604 OID 32001)
-- Name: mt_risk_tingkat_agregasi_risiko id_tingkat_agregasi_risiko; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko SET DEFAULT nextval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq'::regclass);


--
-- TOC entry 5006 (class 2604 OID 31790)
-- Name: mt_sdm_jabatan id_jabatan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.mt_sdm_jabatan_id_jabatan_seq'::regclass);


--
-- TOC entry 5053 (class 2604 OID 32634)
-- Name: mt_sdm_kelompok_bisnis id_kelompok_bisnis; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_kelompok_bisnis ALTER COLUMN id_kelompok_bisnis SET DEFAULT nextval('public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq'::regclass);


--
-- TOC entry 5016 (class 2604 OID 31948)
-- Name: mt_status_pengajuan id_status_pengajuan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan SET DEFAULT nextval('public.mt_status_pengajuan_id_status_pengajuan_seq'::regclass);


--
-- TOC entry 5041 (class 2604 OID 32345)
-- Name: mt_status_rencana_perlakuan id_status_rencana_perlakuan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_status_rencana_perlakuan ALTER COLUMN id_status_rencana_perlakuan SET DEFAULT nextval('public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq'::regclass);


--
-- TOC entry 5052 (class 2604 OID 32615)
-- Name: mt_template_laporan id_template_laporan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_template_laporan ALTER COLUMN id_template_laporan SET DEFAULT nextval('public.mt_tamplate_laporan_id_tamplate_laporan_seq'::regclass);


--
-- TOC entry 5015 (class 2604 OID 31926)
-- Name: risk_capacity_limit id_capacity_limit; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_capacity_limit ALTER COLUMN id_capacity_limit SET DEFAULT nextval('public.risk_capacity_limit_id_capacity_limit_seq'::regclass);


--
-- TOC entry 5024 (class 2604 OID 32056)
-- Name: risk_dampak id_dampak; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.risk_dampak_id_dampak_seq'::regclass);


--
-- TOC entry 5011 (class 2604 OID 31877)
-- Name: risk_metrik_strategi_risiko id_metrik_strategi_risiko; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko SET DEFAULT nextval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq'::regclass);


--
-- TOC entry 5043 (class 2604 OID 32366)
-- Name: risk_msg id_msg; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_msg ALTER COLUMN id_msg SET DEFAULT nextval('public.risk_msg_id_msg_seq'::regclass);


--
-- TOC entry 5023 (class 2604 OID 32047)
-- Name: risk_penyebab id_penyebab; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_penyebab ALTER COLUMN id_penyebab SET DEFAULT nextval('public.risk_penyebab_id_penyebab_seq'::regclass);


--
-- TOC entry 5025 (class 2604 OID 32085)
-- Name: risk_profile id_risk_profile; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile ALTER COLUMN id_risk_profile SET DEFAULT nextval('public.risk_profile_id_risk_profile_seq'::regclass);


--
-- TOC entry 5030 (class 2604 OID 32180)
-- Name: risk_profile_control id_control; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_control ALTER COLUMN id_control SET DEFAULT nextval('public.risk_profile_control_id_control_seq'::regclass);


--
-- TOC entry 5027 (class 2604 OID 32217)
-- Name: risk_profile_dampak id_profile_dampak; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_dampak ALTER COLUMN id_profile_dampak SET DEFAULT nextval('public.risk_profile_dampak_id_profile_dampak_seq'::regclass);


--
-- TOC entry 5028 (class 2604 OID 32159)
-- Name: risk_profile_kri id_kri; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_kri ALTER COLUMN id_kri SET DEFAULT nextval('public.risk_profile_kri_id_kri_seq'::regclass);


--
-- TOC entry 5039 (class 2604 OID 32316)
-- Name: risk_profile_kri_hasil id_kri_hasil; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_kri_hasil ALTER COLUMN id_kri_hasil SET DEFAULT nextval('public.risk_profile_kri_hasil_id_kri_hasil_seq'::regclass);


--
-- TOC entry 5035 (class 2604 OID 32247)
-- Name: risk_profile_mitigasi id_mitigasi; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi ALTER COLUMN id_mitigasi SET DEFAULT nextval('public.risk_profile_mitigasi_id_mitigasi_seq'::regclass);


--
-- TOC entry 5036 (class 2604 OID 32702)
-- Name: risk_profile_mitigasi_jenis id_mitigasi_jenis; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_jenis ALTER COLUMN id_mitigasi_jenis SET DEFAULT nextval('public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq'::regclass);


--
-- TOC entry 5042 (class 2604 OID 32352)
-- Name: risk_profile_mitigasi_realisasi id_mitigasi_realisasi; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi ALTER COLUMN id_mitigasi_realisasi SET DEFAULT nextval('public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq'::regclass);


--
-- TOC entry 5037 (class 2604 OID 32294)
-- Name: risk_profile_mitigasi_timeline id_mitigasi_timeline; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_timeline ALTER COLUMN id_mitigasi_timeline SET DEFAULT nextval('public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq'::regclass);


--
-- TOC entry 5040 (class 2604 OID 32333)
-- Name: risk_profile_mitigasi_timeline_realisasi id_mitigasi_timeline_realisasi; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi ALTER COLUMN id_mitigasi_timeline_realisasi SET DEFAULT nextval('public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 32207)
-- Name: risk_profile_penyebab id_profile_penyebab; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_penyebab ALTER COLUMN id_profile_penyebab SET DEFAULT nextval('public.risk_profile_penyebab_id_profile_penyebab_seq'::regclass);


--
-- TOC entry 5038 (class 2604 OID 32307)
-- Name: risk_profile_realisasi_residual id_realisasi_residual; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_realisasi_residual ALTER COLUMN id_realisasi_residual SET DEFAULT nextval('public.risk_profile_realisasi_residual_id_realisasi_residual_seq'::regclass);


--
-- TOC entry 5032 (class 2604 OID 32201)
-- Name: risk_profile_target_residual id_target_residual; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_target_residual ALTER COLUMN id_target_residual SET DEFAULT nextval('public.risk_profile_target_residual_id_target_residual_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 31955)
-- Name: risk_register id_register; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register ALTER COLUMN id_register SET DEFAULT nextval('public.risk_register_id_register_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 32020)
-- Name: risk_risiko id_risiko; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_risiko ALTER COLUMN id_risiko SET DEFAULT nextval('public.risk_risiko_id_risiko_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 31901)
-- Name: risk_sasaran id_sasaran; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.risk_sasaran_id_sasaran_seq'::regclass);


--
-- TOC entry 5014 (class 2604 OID 32583)
-- Name: risk_sasaran_strategi id_sasaran_strategi; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_sasaran_strategi ALTER COLUMN id_sasaran_strategi SET DEFAULT nextval('public.risk_sasaran_strategi_id_sasaran_strategi_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 30889)
-- Name: sys_action id_action; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_action ALTER COLUMN id_action SET DEFAULT nextval('public.sys_action_id_action_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 29249)
-- Name: sys_failed_job id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_failed_job ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 30901)
-- Name: sys_group id_group; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group ALTER COLUMN id_group SET DEFAULT nextval('public.sys_group_id_group_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 30924)
-- Name: sys_group_menu id_group_menu; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group_menu ALTER COLUMN id_group_menu SET DEFAULT nextval('public.sys_group_menu_id_group_menu_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 29232)
-- Name: sys_job id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_job ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4986 (class 2604 OID 30917)
-- Name: sys_log id_log; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_log ALTER COLUMN id_log SET DEFAULT nextval('public.sys_log_id_log_seq'::regclass);


--
-- TOC entry 4981 (class 2604 OID 30882)
-- Name: sys_menu id_menu; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.sys_menu_id_menu_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 29184)
-- Name: sys_migration id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_migration ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4985 (class 2604 OID 30908)
-- Name: sys_setting id_setting; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_setting ALTER COLUMN id_setting SET DEFAULT nextval('public.sys_setting_id_setting_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 29191)
-- Name: sys_user id_user; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5542 (class 0 OID 32542)
-- Dependencies: 339
-- Data for Name: lost_event; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5538 (class 0 OID 32524)
-- Dependencies: 335
-- Data for Name: mt_lost_event_frakuensi_kejadian; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5534 (class 0 OID 32506)
-- Dependencies: 331
-- Data for Name: mt_lost_event_kategori; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5540 (class 0 OID 32533)
-- Dependencies: 337
-- Data for Name: mt_lost_event_status_asuransi; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5536 (class 0 OID 32515)
-- Dependencies: 333
-- Data for Name: mt_lost_event_sumber_penyebab_kejadian; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5446 (class 0 OID 31184)
-- Dependencies: 243
-- Data for Name: mt_risk_dampak; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Rendah', 'Dampak rendah yang dapat mengakibatkan 
kerusakan/kerugian/penurunan 20%-40% dari nilai Batasan 
Risiko', NULL, NULL, '2', NULL, 20, 40, '2024-04-25 08:06:06', '2024-04-25 08:06:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'Moderat', 'Dampak kritis yang dapat mengakibatkan 
kerusakan/kerugian/penurunan 40%-60% dari nilai Batasan 
Risiko', NULL, NULL, '3', NULL, 40, 60, '2024-04-25 08:07:10', '2024-04-25 08:07:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'Tinggi', 'Dampak disruptif yang dapat mengakibatkan kerusakan/ 
kerugian/ penurunan 60%-80% dari nilai Batasan Risiko', NULL, NULL, '4', NULL, 60, 80, '2024-04-25 08:07:57', '2024-04-25 08:07:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Sangat Rendah', 'Dampak sangat rendah yang dapat mengakibatkan kerusakan/ 
kerugian/ penurunan kurang dari 20% dari nilai Batasan 
Risiko', NULL, NULL, '1', NULL, 0, 20, '2024-04-25 07:38:16', '2024-04-25 07:38:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'Sangat Tinggi', 'Dampak katastrofe yang dapat mengakibatkan kerusakan/ 
kerugian/ penurunan > 80% dari nilai Batasan Risiko', NULL, NULL, '5', NULL, 80, 100, '2024-04-25 08:09:23', '2024-04-25 08:09:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5502 (class 0 OID 32186)
-- Dependencies: 299
-- Data for Name: mt_risk_efektifitas_control; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'Cukup dan Efektif', '2024-04-25 04:02:53', '2024-04-25 04:02:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'Cukup dan Efektif Sebagian', '2024-04-25 04:03:13', '2024-04-25 04:03:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 'Cukup dan Tidak Efektif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 'Tidak Cukup dan Efektif Sebagian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 'Tidak Cukup dan Tidak Efektif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5498 (class 0 OID 32170)
-- Dependencies: 295
-- Data for Name: mt_risk_jenis_control; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'Kontrol operasi - pada level entitas/kantor pusat', '2024-04-25 04:02:07', '2024-04-25 04:02:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'Kontrol operasi - pada level operasi', '2024-04-25 04:03:50', '2024-04-25 04:03:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 'Kontrol kepatuhan (compliance) - pada level entitas/kantor pusat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 'Kontrol kepatuhan (compliance) - pada level operasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 'Kontrol pelaporan - pada level entitas/kantor pusat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (6, 'Kontrol pelaporan - pada level operasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5508 (class 0 OID 32227)
-- Dependencies: 305
-- Data for Name: mt_risk_jenis_perlakuan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_jenis_perlakuan (id_jenis_perlakuan, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'Jenis Perlakuan Risiko1', '2024-05-08 06:34:59', '2024-05-08 06:34:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_perlakuan (id_jenis_perlakuan, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'Jenis Perlakuan Risiko2', '2024-05-08 06:35:05', '2024-05-08 06:35:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5510 (class 0 OID 32236)
-- Dependencies: 307
-- Data for Name: mt_risk_jenis_program_rkap; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_jenis_program_rkap (id_jenis_program_rkap, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'jenis programp rkap1', '2024-05-08 06:34:24', '2024-05-08 06:34:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_program_rkap (id_jenis_program_rkap, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'jenisprogramrkap2', '2024-05-08 06:34:37', '2024-05-08 06:34:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5532 (class 0 OID 32407)
-- Dependencies: 329
-- Data for Name: mt_risk_jenis_risiko; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 1, 'R.01', 'Risiko Strategis (Strategic)', '2024-04-22 09:43:13', '2024-04-22 09:43:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 1, 'R.02', 'Risiko Pihak Ketiga (Third Party)', '2024-04-22 09:43:39', '2024-04-22 09:43:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 1, 'R.03', 'Risiko Pemasaran (Marketing)', '2024-04-22 09:43:57', '2024-04-22 09:43:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 2, 'R.04', 'Risiko Kinerja (Performance)', '2024-04-22 09:44:19', '2024-04-22 09:44:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 2, 'R.05', 'Risiko Operasional (Operational)', '2024-04-22 09:44:37', '2024-04-22 09:44:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (6, 2, 'R.06', 'Risiko K3', '2024-04-22 09:44:59', '2024-04-22 09:44:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 2, 'R.07', 'Risiko SDM (Human Resource)', '2024-04-22 09:45:30', '2024-04-22 09:45:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 2, 'R.08', 'Risiko Sosial (Social)', '2024-04-22 09:46:17', '2024-04-22 09:46:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 2, 'R.09', 'Risiko Hukum & Kepatuhan (Law & Compliance)', '2024-04-22 09:46:39', '2024-04-22 09:46:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (10, 3, 'R.10', 'Risiko Finansial (Financial)', '2024-04-22 09:46:57', '2024-04-22 09:46:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (11, 3, 'R.11', 'Risiko Pendapatan (Revenue)', '2024-04-22 09:47:15', '2024-04-22 09:47:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5530 (class 0 OID 32400)
-- Dependencies: 327
-- Data for Name: mt_risk_kategori_risiko; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_kategori_risiko (id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, '1', 'Risiko Korporat & Portofolio 
Bisnis', '2024-04-22 09:35:13', '2024-04-22 09:35:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kategori_risiko (id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, '2', 'Risiko Operasional', '2024-04-22 09:35:24', '2024-04-22 09:35:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kategori_risiko (id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, '3', 'Risiko Finansial', '2024-04-22 09:35:43', '2024-04-22 09:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5448 (class 0 OID 31196)
-- Dependencies: 245
-- Data for Name: mt_risk_kemungkinan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Sangat Jarang Terjadi', 'ya1', '2024-04-17 08:24:37', '2024-04-25 04:43:13', NULL, NULL, 'ok', '1', 1, 'sip', 1.00, 0.00, 0.00, 20.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'Bisa Terjadi', '3', '2024-04-17 08:28:08', '2024-04-25 04:53:23', NULL, NULL, '3', '3', 3, '3', 3.00, 5.00, 40.00, 60.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'Sangat Mungkin Terjadi', '4', '2024-04-17 08:28:25', '2024-04-25 04:57:06', NULL, NULL, '4', '4', 4, '4', 6.00, 10.00, 60.00, 80.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'Hampir Pasti Terjadi', '5', '2024-04-17 08:28:43', '2024-04-25 05:00:19', NULL, NULL, '5', '5', 5, '5', 12.00, 100.00, 80.00, 100.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, '6', '6', '2024-04-17 08:29:06', '2024-04-25 08:27:09', NULL, NULL, '6', '6', 6, '6', 6.00, 6.00, 6.00, 6.00, NULL, NULL, '2024-04-25 08:27:09', NULL, NULL);
INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, 'Bagus', 'Baik', '2024-04-22 08:31:26', '2024-04-25 08:27:15', NULL, NULL, 'Ok', 't687578', 1.56, 'Bagus', 1.20, 2.30, 1.10, 1.80, NULL, NULL, '2024-04-25 08:27:15', NULL, NULL);
INSERT INTO public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Jarang Terjadi', '2', '2024-04-17 08:27:52', '2024-05-13 07:56:58', NULL, NULL, '2', '2', 2, '2', 2.00, 1.00, 20.00, 40.00, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5454 (class 0 OID 31252)
-- Dependencies: 251
-- Data for Name: mt_risk_kriteria_dampak; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'risiko strategis', 1, '1', -1, '2024-04-26 06:51:12', '2024-04-26 06:51:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'test 2', 2, '2', -1, '2024-04-26 07:54:34', '2024-04-26 07:54:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'test3', 3, '3', -1, '2024-04-26 08:01:05', '2024-04-26 08:40:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'test 4', 4, '4', -1, '2024-04-26 08:14:37', '2024-04-26 08:40:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, 'test 6', 6, '6', -1, '2024-04-26 08:21:53', '2024-04-26 08:42:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'test 5', 5, '5', -1, '2024-04-26 08:20:53', '2024-04-26 08:42:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (8, 'test3', 3, '3', 1, '2024-04-27 03:57:08', '2024-04-27 03:57:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (9, 'test 2', 2, '2', 1, '2024-04-27 04:11:33', '2024-04-27 04:11:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (10, 'test', 1, '1', 1, '2024-04-27 04:18:51', '2024-04-27 04:18:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (11, 'test5', 5, '5', 1, '2024-04-27 04:23:35', '2024-04-27 04:23:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (12, 'test 6', 6, '6', 1, '2024-04-27 04:26:16', '2024-04-27 04:26:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 'Dampak keterlambatan pencapaian program strategis', NULL, '1', -1, '2024-05-01 04:39:28', '2024-05-01 04:39:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, 'Kebijakan atau Kegiatan Operasional Perusahaan Berdampak Pada HUKUM', 1, '1', 1, '2024-04-27 03:50:42', '2024-05-01 08:40:11', NULL, NULL, NULL, NULL, '2024-05-01 08:40:11', NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 'Kebijakan atau Kegiatan Operasional Perusahaan Berdampak Pada HUKUM', NULL, '1', 1, '2024-05-01 08:43:12', '2024-05-01 08:43:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5455 (class 0 OID 31266)
-- Dependencies: 252
-- Data for Name: mt_risk_kriteria_dampak_detail; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 3, 'Minimal 1 parameter 
tujuan strategis yang 
harus selesai pada 
tahun ini tertunda 
antara 3 - 6 bulan', '2024-05-01 04:39:30', '2024-05-01 04:39:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 1, 'Minimal 1 parameter target strategis yang harus selesai pada tahun ini tertunda kurang dari 1 bulan', '2024-05-01 04:39:30', '2024-05-01 04:39:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 4, 'Minimal 1 parameter 
tujuan strategis yang 
harus selesai pada tahun 
ini tertunda antara 6 - 9 
bulan', '2024-05-01 04:39:30', '2024-05-01 04:39:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 2, 'Minimal 1 parameter 
tujuan strategis yang 
harus selesai pada 
tahun ini tertunda 
antara 2 - 3 bulan', '2024-05-01 04:39:30', '2024-05-01 04:39:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 5, 'Minimal 1 parameter 
tujuan strategis yang 
harus selesai pada tahun 
ini tertunda lebih dari 9 
bulan', '2024-05-01 04:39:30', '2024-05-01 04:39:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 4, 'Terhindar dari Tuntutan hukum terhadap Perusahaan dilaporkan kepada pengadilan (Perdata dan Pidana)', '2024-05-01 08:43:13', '2024-05-01 08:43:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 1, 'Terhindar dari surat peringatan informal diberikan kepada Manajemen dan atau Perusahaan', '2024-05-01 08:43:14', '2024-05-01 08:43:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 2, 'Terhindar dari Surat peringatan formal diberikan kepada Manajemen dan atau Perusahaan', '2024-05-01 08:43:14', '2024-05-01 08:43:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 3, 'Terhindar dari Tuntutan hukum terhadap Manajemen dilaporkan kepada pengadilan (Perdata dan Pidana)', '2024-05-01 08:43:14', '2024-05-01 08:43:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 5, 'Manajemen dan Perusahaan Terhindar dari kekalahan dalam proses hukum di pengadilan dan berkewajiban untuk memenuhi putusan hukum', '2024-05-01 08:43:14', '2024-05-01 08:43:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5456 (class 0 OID 31282)
-- Dependencies: 253
-- Data for Name: mt_risk_matrix; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (1, 1, 5, 'border-left:7px dotted #000 !important; border-right:7px dotted #000 !important;  undefined', -1, '2024-05-13 07:45:28', '2024-05-14 08:07:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (2, 1, 5, NULL, -1, NULL, '2024-05-14 08:09:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (1, 2, 5, NULL, -1, NULL, '2024-05-14 08:09:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (1, 3, 5, NULL, -1, NULL, '2024-05-14 08:10:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (1, 4, 5, NULL, -1, NULL, '2024-05-14 08:10:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (1, 5, 6, 'border-r-8  undefined', -1, NULL, '2024-05-14 08:12:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (2, 4, 6, 'border-t-8  border-r-8', -1, NULL, '2024-05-14 08:14:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (2, 3, 6, 'border-r-8', -1, NULL, '2024-05-14 08:15:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (2, 2, 6, NULL, -1, NULL, '2024-05-14 08:16:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (3, 1, 6, 'border-r-8', -1, NULL, '2024-05-14 08:17:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (3, 2, 6, 'border-r-8  border-t-8', -1, NULL, '2024-05-14 08:18:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (4, 1, 2, NULL, -1, NULL, '2024-05-14 08:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (4, 2, 8, NULL, -1, NULL, '2024-05-14 08:20:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (4, 3, 8, NULL, -1, NULL, '2024-05-14 08:21:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (3, 3, 7, NULL, -1, NULL, '2024-05-14 08:22:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (3, 4, 2, NULL, -1, NULL, '2024-05-14 08:22:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (2, 5, 7, NULL, -1, NULL, '2024-05-14 08:23:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (3, 5, 8, NULL, -1, NULL, '2024-05-14 08:24:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (4, 5, 9, NULL, -1, NULL, '2024-05-14 08:24:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (4, 4, 8, NULL, -1, NULL, '2024-05-14 08:25:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (5, 4, 9, NULL, -1, NULL, '2024-05-14 08:26:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (5, 5, 9, NULL, -1, NULL, '2024-05-14 08:26:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (5, 3, 9, NULL, -1, NULL, '2024-05-14 08:27:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (5, 2, 9, NULL, -1, NULL, '2024-05-14 08:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (5, 1, 9, NULL, -1, NULL, '2024-05-14 08:27:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20);
INSERT INTO public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) VALUES (1, 1, 4, NULL, 1, '2024-05-15 08:03:36', '2024-05-15 08:03:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5458 (class 0 OID 31754)
-- Dependencies: 255
-- Data for Name: mt_risk_perlakuan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_perlakuan (id_perlakuan, nama, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'nama perlakuan risiko1', 'ket perlakuan risiko1', 1, '2024-05-08 06:45:15', '2024-05-08 06:45:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_perlakuan (id_perlakuan, nama, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'nama perlakuan risiko2', 'ket perlakuan risiko2', 2, '2024-05-08 06:45:35', '2024-05-08 06:45:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5484 (class 0 OID 32010)
-- Dependencies: 281
-- Data for Name: mt_risk_sasaran; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'Nilai ekonomi dan sosial', '2024-04-23 09:00:04', '2024-04-23 09:00:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'Inovasi bisnis model', '2024-04-23 09:00:16', '2024-04-23 09:00:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 'Kepemimpinan teknologi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 'Peningkatan investasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 'Pengembangan talenta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5469 (class 0 OID 31866)
-- Dependencies: 266
-- Data for Name: mt_risk_sikap_terhadap_risiko; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Tidak Toleran', '2024-04-22 09:32:48', '2024-04-22 09:32:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Konservatif', '2024-04-22 09:33:03', '2024-04-22 09:33:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'Moderat', '2024-04-22 09:33:33', '2024-04-22 09:33:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'Strategis', '2024-04-22 09:33:41', '2024-04-22 09:33:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5467 (class 0 OID 31850)
-- Dependencies: 264
-- Data for Name: mt_risk_taksonomi; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, '1.1.1', 'Risiko terkait Dividen', 1, 1, NULL, '2024-04-22 04:35:48', '2024-04-22 08:56:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, '1.1.2', 'Risiko terkait PMN', 1, 1, NULL, '2024-04-22 04:40:20', '2024-04-22 08:57:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, '1.1.3', 'Risiko terkait Subsidi & Kompensasi', 1, 1, NULL, '2024-04-22 06:02:38', '2024-04-22 08:58:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, '1.2.4', 'Risiko terkait Kebijakan SDM', 2, NULL, NULL, '2024-04-22 09:00:39', '2024-04-22 09:00:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, '1.2.5', 'Risiko terkait Kebijakan Sektoral', 2, NULL, NULL, '2024-04-22 09:01:36', '2024-04-22 09:01:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, '1.3.6', 'Risiko terkait Konsentrasi Portofolio', 3, NULL, NULL, '2024-04-22 09:02:42', '2024-04-22 09:02:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, '2.4.7', 'Risiko terkait Struktur Korporasi', 4, NULL, NULL, '2024-04-22 09:06:05', '2024-04-22 09:06:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (8, '2.5.8', 'Risiko terkait M&A, JV, Restru', 5, NULL, NULL, '2024-04-22 09:07:06', '2024-04-22 09:07:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (9, '3.6.9', 'Risiko terkait Formulasi Strategis', 6, NULL, NULL, '2024-04-23 01:28:12', '2024-04-23 01:28:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (10, '3.6.10', 'Risiko terkait Pasar & Makroekonomi', 6, NULL, NULL, '2024-04-23 01:29:28', '2024-04-23 01:29:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (11, '3.6.11', 'Risiko terkait Keuangan', 6, NULL, NULL, '2024-04-23 01:30:13', '2024-04-23 01:30:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (12, '3.6.12', 'Risiko terkait Hukum, Reputasi & Kepatuhan', 6, NULL, NULL, '2024-04-23 01:31:34', '2024-04-23 01:31:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, '3.6.13', 'Risiko terkait Proyek', 6, NULL, NULL, '2024-04-23 01:32:47', '2024-04-23 01:32:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (15, '3.6.14', 'Risiko terkait Teknologi Informasi & Keamanan Siber', 6, NULL, NULL, '2024-04-23 01:33:45', '2024-04-23 01:33:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (16, '3.6.15', 'Risiko terkait Sosial & Lingkungan', 6, NULL, NULL, '2024-04-23 01:34:43', '2024-04-23 01:34:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (17, '3.6.16', 'Risiko terkait Operasional', 6, NULL, NULL, '2024-04-23 01:35:16', '2024-04-23 01:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (18, '3.7.17', 'Risiko terkait Kredit', 7, NULL, NULL, '2024-04-23 01:35:53', '2024-04-23 01:35:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (19, '3.7.18', 'Risiko terkait Likuiditas', 7, NULL, NULL, '2024-04-23 01:36:49', '2024-04-23 01:36:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (20, '3.8.19', 'Risiko terkait Investasi', 8, NULL, NULL, '2024-04-23 01:37:28', '2024-04-23 01:37:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (21, '3.8.20', 'Risiko terkait Aktuarial', 8, NULL, NULL, '2024-04-23 01:38:10', '2024-04-23 01:38:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, '3.6.12', 'Risiko terkait Hukum, Reputasi & Kepatuhan', 6, NULL, NULL, '2024-04-23 01:31:44', '2024-04-23 01:39:14', NULL, NULL, NULL, NULL, '2024-04-23 01:39:14', NULL, NULL);


--
-- TOC entry 5465 (class 0 OID 31836)
-- Dependencies: 262
-- Data for Name: mt_risk_taksonomi_area; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, '1.1', 'Risiko Fiskal', 2, NULL, '2024-04-19 07:31:29', '2024-04-22 08:47:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, '1.2', 'Risiko Kebijakan', 2, NULL, '2024-04-22 08:48:20', '2024-04-22 08:48:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, '1.3', 'Risiko Komposisi', 2, NULL, '2024-04-22 08:49:02', '2024-04-22 08:49:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, '2.4', 'Risiko Struktur', 3, NULL, '2024-04-22 08:50:16', '2024-04-22 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, '2.5', 'Risiko Restrukturisasi dan Reorganisasi', 3, NULL, '2024-04-22 08:51:26', '2024-04-22 08:51:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, '3.6', 'Risiko Industri Umum', 4, NULL, '2024-04-22 08:52:01', '2024-04-22 08:52:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, '3.7', 'Risiko Industri Perbankan', 4, NULL, '2024-04-22 08:52:53', '2024-04-22 08:53:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (8, '3.8', 'Risiko Industri Asuransi', 4, NULL, '2024-04-22 08:53:59', '2024-04-22 08:53:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5463 (class 0 OID 31829)
-- Dependencies: 260
-- Data for Name: mt_risk_taksonomi_objective; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, '1', 'Kategori Risiko Korporat & Portofolio Bisnis', '2024-04-19 02:17:16', '2024-04-19 04:20:35', NULL, NULL, NULL, NULL, '2024-04-19 04:20:35', NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, '1', 'Risiko Portofolio BUMN', '2024-04-19 02:17:26', '2024-04-22 08:43:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, '2', 'Risiko Struktur Korporasi dan Organisasi BUMN', '2024-04-19 02:17:36', '2024-04-22 08:44:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, '3', 'Risiko Bisnis BUMN', '2024-04-22 08:45:21', '2024-04-22 08:45:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5450 (class 0 OID 31219)
-- Dependencies: 247
-- Data for Name: mt_risk_tingkat; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Moderat', '#ff9f00', 'Eksploitasi (Exploit), Meningkatkan (Enhance), Berbagi 
(Sharing)', 1, '2024-05-11 04:34:25', '2024-05-11 04:54:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Poor', '#ff001f', 'Eksploitasi (Exploit), Meningkatkan (Enhance), Berbagi 
(Sharing)', 1, '2024-05-11 04:33:53', '2024-05-11 04:57:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'Good', '#ffeb00', 'Eksploitasi (Exploit), Meningkatkan (Enhance), Berbagi (Sharing), Menerima (Accept)', 1, '2024-05-11 04:34:58', '2024-05-11 04:57:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'Low', '#00a707', '1. Diterima dan tetap Dimonitor
2. Diputuskan oleh Pemilik Risiko (Risk Owner) (EVP, Dir.AP, Project Manager (PM), Branch Manager (BM)', -1, '2024-05-11 04:58:27', '2024-05-11 04:58:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, 'Moderate', '#ffeb00', '1. Dimitigasi atau diturunkan
2. Dibahas oleh Rapat Eksekutif Manajemen Risiko (REMR) dan diputuskan oleh Direktur terkait dan segera dilaporkan pada Rapat Direksi 
3. Rapat Direksi berhak untuk meninjau kembali keputusan Direktur terkait.', -1, '2024-05-11 05:01:36', '2024-05-11 05:01:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (8, 'Moderate to  High', '#ff9f00', '1. Dimitigasi atau diturunkan; atau
2. Dibagi (sharing) atau Transfer
3. Dibahas oleh Rapat Eksekutif Manajemen Risiko (REMR) dan diputuskan oleh Direktur terkait dan segera dilaporkan pada Rapat Direksi 
4. Rapat Direksi berhak untuk meninjau kembali keputusan Direktur terkait.', -1, '2024-05-11 05:02:28', '2024-05-11 05:02:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, 'Low to  Moderate', '#99ec25', '1. Diterima dan tetap Dimonitor; atau
2. Dimitigasi atau diturunkan
3. Diputuskan oleh Pemilik Risiko (Risk Owner (EVP, Dir.AP, Project Manager (PM), Branch Manager (BM)', -1, '2024-05-11 05:00:33', '2024-05-11 05:02:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (9, 'High', '#ff001f', '1. Dimitigasi atau diturunkan; atau
2. Dihindari
3. Diputuskan oleh Rapat Direksi', -1, '2024-05-11 05:03:17', '2024-05-11 05:03:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'Excelent', '#00a707', 'Eksploitasi (Exploit), Meningkatkan (Enhance), Berbagi (Sharing), Menerima (Accept)', 1, '2024-05-11 04:35:50', '2024-05-11 05:07:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5482 (class 0 OID 31998)
-- Dependencies: 279
-- Data for Name: mt_risk_tingkat_agregasi_risiko; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_risk_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, created_by, updated_by, deleted_by, id_tingkat_agregasi_risiko_parent) VALUES (1, 'Risiko Korporat', '2024-04-18 02:18:17', '2024-04-26 03:27:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_risk_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, created_by, updated_by, deleted_by, id_tingkat_agregasi_risiko_parent) VALUES (2, 'Risiko Divisi', '2024-04-18 02:19:19', '2024-04-26 03:28:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.mt_risk_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, created_by, updated_by, deleted_by, id_tingkat_agregasi_risiko_parent) VALUES (3, 'Risiko Proyek', '2024-04-26 03:28:30', '2024-04-26 03:28:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);


--
-- TOC entry 5459 (class 0 OID 31762)
-- Dependencies: 256
-- Data for Name: mt_risk_tingkat_perlakuan; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5461 (class 0 OID 31787)
-- Dependencies: 258
-- Data for Name: mt_sdm_jabatan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Jabatan1', NULL, NULL, NULL, NULL, '2024-04-17', '2024-04-27', NULL, '2', 1, '2024-04-18 03:05:05', '2024-04-18 03:05:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Jabatan2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-02 02:50:03', '2024-05-02 03:04:52', NULL, NULL, NULL, NULL, '2024-05-02 03:04:52', NULL, NULL);
INSERT INTO public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'Jabatan2x', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-02 03:06:57', '2024-05-02 07:24:07', NULL, NULL, NULL, NULL, '2024-05-02 07:24:07', NULL, NULL);
INSERT INTO public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'Joko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-02 07:36:02', '2024-05-02 07:36:12', NULL, NULL, NULL, NULL, '2024-05-02 07:36:12', NULL, NULL);
INSERT INTO public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'Jabatan3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-02 07:54:42', '2024-05-02 07:56:51', NULL, NULL, NULL, NULL, '2024-05-02 07:56:51', NULL, NULL);


--
-- TOC entry 5547 (class 0 OID 32631)
-- Dependencies: 344
-- Data for Name: mt_sdm_kelompok_bisnis; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_sdm_kelompok_bisnis (id_kelompok_bisnis, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'Korporat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_kelompok_bisnis (id_kelompok_bisnis, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'Jasa Konstruksi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_kelompok_bisnis (id_kelompok_bisnis, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 'Badan Usaha Jalan Tol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_kelompok_bisnis (id_kelompok_bisnis, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 'Anak Perusahaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5451 (class 0 OID 31233)
-- Dependencies: 248
-- Data for Name: mt_sdm_pegawai; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5452 (class 0 OID 31243)
-- Dependencies: 249
-- Data for Name: mt_sdm_unit; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('rr', 'rrr1', '2024-04-18 01:59:17', '2024-04-26 01:30:52', NULL, NULL, NULL, NULL, '2024-04-26 01:30:52', NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.02', 'Sekretaris Perusahaan', '2024-04-26 01:31:30', '2024-04-26 01:31:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.03', 'Divisi Legal', '2024-04-26 01:32:08', '2024-04-26 01:32:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.04', 'Divisi Pengembangan Bisnis', '2024-04-26 01:32:29', '2024-04-26 01:32:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.05', 'Divisi Human Capital', '2024-04-26 01:32:45', '2024-04-26 01:32:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.06', 'Divisi Corporate Planning', '2024-04-26 01:33:02', '2024-04-26 01:33:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.07', 'Divisi Akuntansi & Keuangan', '2024-04-26 01:33:29', '2024-04-26 01:33:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.08', 'Divisi QHSSE', '2024-04-26 01:33:50', '2024-04-26 01:33:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.09', 'Divisi Manajemen Risiko', '2024-04-26 01:34:22', '2024-04-26 01:34:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.10', 'Divisi Sistem, TI & Riset Teknologi', '2024-04-26 01:34:43', '2024-04-26 01:34:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.11', 'Proyek Khusus/KPBU', '2024-04-26 01:35:01', '2024-04-26 01:35:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.01', 'Divisi EPC', '2024-04-26 01:35:17', '2024-04-26 01:35:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.02', 'Divisi Gedung', '2024-04-26 01:35:30', '2024-04-26 01:35:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.03', 'Divisi Sipil Umum', '2024-04-26 01:36:03', '2024-04-26 01:36:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.04', 'Divisi Operasi & Pemeliharaan Jalan Tol', '2024-04-26 01:36:22', '2024-04-26 01:36:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.05', 'Divisi Perencanaan Jalan Tol', '2024-04-26 01:36:39', '2024-04-26 01:36:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.06', 'Divisi Pembangunan Jalan Tol', '2024-04-26 01:36:53', '2024-04-26 01:36:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('SB.07', 'Unit Pengadaan Jalan Tol', '2024-04-26 01:37:21', '2024-04-26 01:37:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('AP.01', 'Hutama Karya Infrastruktur (HKI)', '2024-04-26 01:37:38', '2024-04-26 01:37:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('AP.02', 'HAKAASTON (HKA)', '2024-04-26 01:37:52', '2024-04-26 01:37:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('AP.03', 'Hutama Karya Realtindo (HKR)', '2024-04-26 01:38:10', '2024-04-26 01:38:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('AP.04', 'Hutama Marga Waskita (HMW)', '2024-04-26 01:38:25', '2024-04-26 01:38:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('AP.05', 'EPC Energy Singapore (EES)', '2024-04-26 01:38:43', '2024-04-26 01:38:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) VALUES ('KP.01', 'SPI', '2024-04-26 01:30:33', '2024-05-07 16:07:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);


--
-- TOC entry 5478 (class 0 OID 31945)
-- Dependencies: 275
-- Data for Name: mt_status_pengajuan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (1, 'Draft Risk Limit', '2024-04-18 02:30:07', '2024-04-18 02:30:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (2, 'Risk Limit ke Risk Owner', '2024-04-18 02:30:23', '2024-04-18 02:30:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (3, 'Risk Limit ke Koordinator Divisi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (4, 'Risk Limit ke Koordinator KP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (5, 'Draft BK1 sd BK6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (6, 'BK1 sd BK6 ke Risk Owner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (7, 'BK1 sd BK6 ke Koordinator Divisi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (8, 'BK1 sd BK6 ke Koordinator KP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (9, 'Pemantauan Realisasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (10, 'Draft BK7 sd BK10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (11, 'BK7 sd BK10 ke Risk Owner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (12, 'BK7 sd BK10 ke Koordinator Divisi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) VALUES (13, 'BK7 sd BK10 ke Koordinator KP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5523 (class 0 OID 32342)
-- Dependencies: 320
-- Data for Name: mt_status_rencana_perlakuan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_status_rencana_perlakuan (id_status_rencana_perlakuan, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'statusrencana1', '2024-05-09 08:20:45', '2024-05-09 08:20:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_status_rencana_perlakuan (id_status_rencana_perlakuan, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'statusrencana2', '2024-05-09 08:20:55', '2024-05-09 08:20:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5545 (class 0 OID 32612)
-- Dependencies: 342
-- Data for Name: mt_template_laporan; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 'laporan_bk_risiko', 'aa', '["sasaran","sasaran_nama","jenis_risiko_nama","taksonomi_nama"]', '2024-05-02 18:52:35', '2024-05-03 02:00:54', NULL, NULL, NULL, '2024-05-03 02:00:54', NULL, NULL, NULL);
INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 'laporan_bk_risiko', 'Form Identifikasi Risiko', '["sasaran","sasaran_nama","jenis_risiko_nama","taksonomi_nama","no_risiko","nama","deskripsi","no_penyebab","penyebab_nama","kri_nama","kri_satuan","kri_threshold","kri_aman","kri_hati_hati","kri_bahaya","control_jenis","control_nama","control_efektivitas","dampak_kategori","dampak_nama","dampak_perkiraan_terpapar"]', '2024-05-03 03:03:53', '2024-05-03 03:03:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 'laporan_bk_risiko', 'Analisa Risiko Inheren', '["no_risiko","nama","risiko_inheren","penjelasan_dampak","nilai_dampak_inheren","skala_dampak","nilai_kemungkinan","skala_probabilitas","eksposur_risiko","skala_risiko","level_risiko"]', '2024-05-03 03:06:33', '2024-05-03 03:06:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 'laporan_bk_risiko', 'Analisa Risiko Residual', '["no_risiko","nama","residual","res_nilai_dampak","res_nilai_dampakq1","res_nilai_dampakq2","res_nilai_dampakq3","res_nilai_dampakq4","res_skala_dampak","res_skala_dampakq1","res_skala_dampakq2","res_skala_dampakq3","res_skala_dampakq4","res_nilai_probabilitas","res_nilai_probabilitasq1","res_nilai_probabilitasq2","res_nilai_probabilitasq3","res_nilai_probabilitasq4","res_skala_probabilitas","res_skala_probabilitasq1","res_skala_probabilitasq2","res_skala_probabilitasq3","res_skala_probabilitasq4","res_eksposur_risiko","res_eksposur_risikoq1","res_eksposur_risikoq2","res_eksposur_risikoq3","res_eksposur_risikoq4","res_skala_risiko","res_skala_risikoq1","res_skala_risikoq2","res_skala_risikoq3","res_skala_risikoq4","res_level_risiko","res_level_risikoq1","res_level_risikoq2","res_level_risikoq3","res_level_risikoq4"]', '2024-05-03 03:08:56', '2024-05-03 03:08:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 'laporan_bk_risiko', 'Rencana Perlakuan Risiko', '["no_risiko","nama","no_penyebab","penyebab_nama","mitigasi_opsi","mitigasi_jenis","mitigasi_nama","mitigasi_output_perlakuan","mitigasi_biaya","mitigasi","mitigasi_pic","mitigasi_timeline","mitigasi_timeline1","mitigasi_timeline2","mitigasi_timeline3","mitigasi_timeline4","mitigasi_timeline5","mitigasi_timeline6","mitigasi_timeline7","mitigasi_timeline8","mitigasi_timeline9","mitigasi_timeline10","mitigasi_timeline11","mitigasi_timeline12"]', '2024-05-03 03:09:55', '2024-05-03 03:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (6, 'laporan_bk_risiko', 'Realisasi Risiko Residual', '["penjelasan_dampak","realisasi","real_nilai_dampak","real_nilai_dampakq1","real_nilai_dampakq2","real_nilai_dampakq3","real_nilai_dampakq4","real_skala_dampak","real_skala_dampakq1","real_skala_dampakq2","real_skala_dampakq3","real_skala_dampakq4","real_nilai_probabilitas","real_nilai_probabilitasq1","real_nilai_probabilitasq2","real_nilai_probabilitasq3","real_nilai_probabilitasq4","real_skala_probabilitas","real_skala_probabilitasq1","real_skala_probabilitasq2","real_skala_probabilitasq3","real_skala_probabilitasq4","real_eksposur_risiko","real_eksposur_risikoq1","real_eksposur_risikoq2","real_eksposur_risikoq3","real_eksposur_risikoq4","real_skala_risiko","real_skala_risikoq1","real_skala_risikoq2","real_skala_risikoq3","real_skala_risikoq4","real_level_risiko","real_level_risikoq1","real_level_risikoq2","real_level_risikoq3","real_level_risikoq4"]', '2024-05-03 03:12:19', '2024-05-03 03:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 'laporan_bk_risiko', 'Realisasi Pelaksanaan Perlakuan Risiko dan Biaya', '["realisasi_mitigasi_nama","realisasi_mitigasi_output_perlakuan","realisasi_mitigasi_biaya","realisasi_mitigasi_serapan_biaya","realisasi_mitigasi_pic","realisasi_timeline","realisasi_timeline1","realisasi_timeline2","realisasi_timeline3","realisasi_timeline4","realisasi_timeline5","realisasi_timeline6","realisasi_timeline7","realisasi_timeline8","realisasi_timeline9","realisasi_timeline10","realisasi_timeline11","realisasi_timeline12","realisasi_mitigasi_status_rencana_perlakuan","realisasi_penjelasan_status_rencana_perlakuan","progress_perlakuan","progress_perlakuan1","progress_perlakuan2","progress_perlakuan3","progress_perlakuan4"]', '2024-05-03 03:13:11', '2024-05-03 03:13:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5476 (class 0 OID 31923)
-- Dependencies: 273
-- Data for Name: risk_capacity_limit; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_capacity_limit (id_capacity_limit, tahun, kapasitas_risiko, persentase_toleran, risk_limit, modified_by, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 2021, 5928.00, 10.00, 211.36, NULL, NULL, 482.00, 4, 'Draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_capacity_limit (id_capacity_limit, tahun, kapasitas_risiko, persentase_toleran, risk_limit, modified_by, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 2022, 5692.00, 10.00, 1.00, NULL, NULL, 837.60, 4, 'Draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_capacity_limit (id_capacity_limit, tahun, kapasitas_risiko, persentase_toleran, risk_limit, modified_by, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 2023, 5088.00, 10.00, 211.36, NULL, NULL, 894.00, 4, 'Draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_capacity_limit (id_capacity_limit, tahun, kapasitas_risiko, persentase_toleran, risk_limit, modified_by, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 2023, 5088000000000.00, 10.00, 211000000000.00, NULL, NULL, 893000000000.00, 5, 'Draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5490 (class 0 OID 32053)
-- Dependencies: 287
-- Data for Name: risk_dampak; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (1, 1, 'asdasd', '2024-04-25 09:14:29', '2024-04-25 09:16:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdasd', 'Aktif', 'rr');
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (2, 1, 'asd', '2024-04-25 22:54:15', '2024-04-25 22:54:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asd', 'Aktif', 'rr');
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (4, 2, 'asdasd', '2024-04-30 03:37:47', '2024-04-30 03:37:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (5, 2, 'asdasd', '2024-04-30 03:39:42', '2024-04-30 03:39:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (6, 2, 'asdasd', '2024-04-30 03:40:52', '2024-04-30 03:40:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (7, 2, 'asdasd', '2024-04-30 03:41:02', '2024-04-30 03:41:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (9, 2, 'okelah', '2024-05-01 01:34:06', '2024-05-01 01:34:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (10, 6, 'Mengurangi laba', '2024-05-01 02:31:59', '2024-05-01 02:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (11, 2, 'fffffffff', '2024-05-02 04:26:14', '2024-05-02 04:26:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (12, 11, 'dampakbaru123', '2024-05-03 08:54:48', '2024-05-03 08:54:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (13, 11, 'dampakbaru345', '2024-05-03 08:54:48', '2024-05-03 08:54:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (14, 12, 'nama dampak4444', '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);
INSERT INTO public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (15, 12, 'namadamxxxx', '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Draft', NULL);


--
-- TOC entry 5471 (class 0 OID 31874)
-- Dependencies: 268
-- Data for Name: risk_metrik_strategi_risiko; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_jenis_risiko, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_register, deleted_by, deleted_by_desc, tahun) VALUES (2, 1, 1, 'testing', 1, 'testing', 'testing', 123123.00, '2024-04-23 06:05:43', '2024-04-23 06:05:43', NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_jenis_risiko, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_register, deleted_by, deleted_by_desc, tahun) VALUES (3, 1, 2, 'asdasd', 2, 'asdsad', 'sadasd', 32132123.00, '2024-04-24 03:43:28', '2024-04-24 03:43:28', NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_jenis_risiko, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_register, deleted_by, deleted_by_desc, tahun) VALUES (1, 1, 1, 'asd', 1, 'asdasd', 'adasd', 231123.00, '2024-04-22 09:51:47', '2024-05-01 02:56:36', NULL, NULL, '2024-05-01 02:56:36', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_jenis_risiko, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_register, deleted_by, deleted_by_desc, tahun) VALUES (4, 10, 2, 'Mengerjakan penugasan pemerintah dalam bentuk proyek strategis nasional atau untuk menyelenggarakan fungsi kemanfaatan umum dengan ketentuan secara finansial fisibel atau apabila tidak fisibel secara finansial diberikan kompensasi/subsidi atau
pembiayaan dari PMN untuk memperoleh margin yang wajar.', 2, 'Keterlambatan PMN', 'Bulan', 2.00, '2024-05-01 03:01:06', '2024-05-01 03:01:06', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL);


--
-- TOC entry 5527 (class 0 OID 32363)
-- Dependencies: 324
-- Data for Name: risk_msg; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5528 (class 0 OID 32371)
-- Dependencies: 325
-- Data for Name: risk_msg_penerima; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5488 (class 0 OID 32044)
-- Dependencies: 285
-- Data for Name: risk_penyebab; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (1, 1, 'asdasd', '2024-04-25 09:10:47', '2024-04-25 09:14:02', NULL, NULL, NULL, '2024-04-25 09:14:02', NULL, NULL, NULL, 'asdasd', NULL, 'rr');
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (2, 1, 'asdasd', '2024-04-25 09:14:10', '2024-04-25 09:16:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdasd', 'Aktif', 'rr');
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (3, 1, 'aasd', '2024-04-25 22:53:52', '2024-04-25 22:53:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdasd', 'Aktif', 'rr');
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (7, 6, 'Peningkatan suku bunga karena penurunan kredit rating yang disebabkan oleh beban bunga yang meningkat, Tingkat hutang yang tinggi sementara pendapatan sangat rendah, Kesulitan likuiditas owner', '2024-05-01 02:31:59', '2024-05-03 03:02:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (24, 11, 'penyebab1', '2024-05-03 08:54:48', '2024-05-10 02:28:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (25, 11, 'penyebab2', '2024-05-03 08:54:48', '2024-05-10 02:28:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (26, 12, 'p1', '2024-05-08 01:54:36', '2024-05-10 02:28:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);
INSERT INTO public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (27, 12, 'p2', '2024-05-08 01:54:36', '2024-05-10 02:28:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);


--
-- TOC entry 5492 (class 0 OID 32082)
-- Dependencies: 289
-- Data for Name: risk_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (19, 'sasaran bumn1', 1, 2, 1, 11, 'peristiwabaru risk12', 'desc', 5, 1, 'asumsi1', 2000000.00, 2, 2.00, 2, '2024-05-03 08:54:48', '2024-05-10 01:58:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (7, 'Des sasaran bumn 123 aaaaaaa', 1, 3, 2, 2, 'Demo / Gangguan Sosial Masyarakat di sekitar lingkungan Proyek', 'des peristiwa risiki', 5, 0, 'asumsi perhi 123 aaaaaaaaaa', 200000.00, 5, 50.00, 3, '2024-04-30 03:37:47', '2024-05-13 08:26:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (10, 'Des sasaran bumn', 1, 3, 2, 2, 'Demo / Gangguan Sosial Masyarakat di sekitar lingkungan Proyek', 'des peristiwa risiki', 5, 1, NULL, NULL, NULL, NULL, NULL, '2024-04-30 03:41:02', '2024-05-02 04:17:00', NULL, NULL, NULL, '2024-05-02 04:17:00', NULL, NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (9, 'Des sasaran bumn', 1, 3, 2, 2, 'Demo / Gangguan Sosial Masyarakat di sekitar lingkungan Proyek', 'des peristiwa risiki', 5, 1, NULL, NULL, NULL, NULL, NULL, '2024-04-30 03:40:52', '2024-05-02 04:17:06', NULL, NULL, NULL, '2024-05-02 04:17:06', NULL, NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (8, 'Des sasaran bumn', 1, 3, 2, 2, 'Demo / Gangguan Sosial Masyarakat di sekitar lingkungan Proyek', 'des peristiwa risiki', 5, 1, 'keterangan perhitungan dampak22', 200000000.00, 3, 23.00, 3, '2024-04-30 03:39:42', '2024-05-03 01:50:41', NULL, NULL, NULL, '2024-05-03 01:50:41', NULL, NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (14, 'Laba bersih korporasi 2024 senilai 249 M', 1, 10, 7, 6, 'Peningkatan Beban Bunga', 'Peningkatan Beban Bunga', 4, 1, NULL, NULL, NULL, NULL, NULL, '2024-05-01 02:31:59', '2024-05-01 02:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status) VALUES (20, 'sasaran12345', 2, 2, 2, 12, 'perisst w 555', 'dessscvvv', 5, 1, 'a1', 20000000.00, 3, 4.00, 2, '2024-05-08 01:54:36', '2024-05-08 02:07:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5500 (class 0 OID 32177)
-- Dependencies: 297
-- Data for Name: risk_profile_control; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (21, 19, 1, 'fffff', 2, '2024-05-03 08:54:48', '2024-05-03 08:54:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 7, 1, 'exisco', 2, '2024-04-30 03:37:47', '2024-04-30 03:37:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 8, 1, 'exisco', 2, '2024-04-30 03:39:42', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 9, 1, 'exisco', 2, '2024-04-30 03:40:52', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 10, 1, 'exisco', 2, '2024-04-30 03:41:02', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 14, 1, 'Berdasarkan data historis', 1, '2024-05-01 02:31:59', '2024-05-01 02:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (16, 8, 3, 'asiap', 2, '2024-05-02 04:26:14', '2024-05-02 04:26:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (22, 20, 1, 'fffff', 2, '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5494 (class 0 OID 32138)
-- Dependencies: 291
-- Data for Name: risk_profile_dampak; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (19, 12, 'dampakbaru123', NULL, '10menit', 8, '2024-05-03 08:54:48', '2024-05-03 08:54:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (19, 13, 'dampakbaru345', NULL, '2detik', 9, '2024-05-03 08:54:48', '2024-05-03 08:54:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 1, 'asdasd', NULL, '10menit', 1, '2024-04-30 03:37:47', '2024-04-30 03:37:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 9, 'okelah', NULL, '20menit', 5, '2024-05-01 01:34:06', '2024-05-01 01:34:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 1, 'asdasd', NULL, NULL, 2, '2024-04-30 03:39:42', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 1, 'asdasd', NULL, NULL, 3, '2024-04-30 03:40:52', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (10, 1, 'asdasd', NULL, NULL, 4, '2024-04-30 03:41:02', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (14, 10, 'Mengurangi laba', NULL, 'Jan 2024 - Dec 2024', 6, '2024-05-01 02:31:59', '2024-05-01 02:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 11, 'fffffffff', NULL, '10menit', 7, '2024-05-02 04:26:14', '2024-05-02 04:26:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (20, 14, 'nama dampak4444', NULL, '10m', 10, '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (20, 15, 'namadamxxxx', NULL, '12c', 11, '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5496 (class 0 OID 32156)
-- Dependencies: 293
-- Data for Name: risk_profile_kri; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 'des kri', 8, 'kilo', NULL, NULL, NULL, '-', NULL, NULL, 0, '1', '1', '1', '2024-04-30 03:39:42', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 'kri dess', 8, 'kilo', 2, 2, 'gass', '+', 2, 2, 1, NULL, NULL, NULL, '2024-04-30 03:39:42', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 'des kri', 9, 'kilo', NULL, NULL, NULL, '-', NULL, NULL, 0, '1', '1', '1', '2024-04-30 03:40:52', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (10, 'kri dess', 9, 'kilo', 2, 2, 'gass', '+', 2, 2, 1, NULL, NULL, NULL, '2024-04-30 03:40:52', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (11, 'des kri', 10, 'kilo', NULL, NULL, NULL, '-', NULL, NULL, 0, '1', '1', '1', '2024-04-30 03:41:02', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (12, 'kri dess', 10, 'kilo', 2, 2, 'gass', '+', 2, 2, 1, NULL, NULL, NULL, '2024-04-30 03:41:02', '2024-04-30 07:55:53', NULL, NULL, NULL, '2024-04-30 07:55:53', NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (16, 'Peningkatan suku bunga', 14, '%', 0, 2, NULL, '-', 2, 3.5, 1, NULL, NULL, NULL, '2024-05-01 02:31:59', '2024-05-01 02:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (23, 'aaaaaaa', 8, 'gram', NULL, NULL, NULL, '-', NULL, NULL, 0, '2', '2', '2', '2024-05-02 04:26:14', '2024-05-02 04:26:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (24, 'bbbbbb', 8, 'gram', 2, 2, 'okelah', '+', 1, 1, 1, NULL, NULL, NULL, '2024-05-02 04:26:14', '2024-05-02 04:26:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (30, 'Joko', 20, '%', 8, 8, 'uuuu', '+', 8, 8, 0, NULL, NULL, NULL, '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (31, 'Shofa Miftakhul M', 20, '%', NULL, NULL, NULL, '-', NULL, NULL, 1, '6', '6', '6', '2024-05-08 01:54:36', '2024-05-08 01:54:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (32, 'errtttttt', 19, '%', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'aman1', 'hh', 'rrr', '2024-05-09 08:52:55', '2024-05-09 08:52:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (33, 'sssssssssssssssssssssss', 19, '%', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'gg', 'yy', 'B', '2024-05-09 08:52:55', '2024-05-09 08:52:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (29, 'errtrt', 19, '%', 3, 5, 'siap bos', '+', 3, 5, 1, NULL, NULL, NULL, '2024-05-03 08:54:48', '2024-05-03 08:54:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (34, 'dddddddddd', 19, '%', 3, 9, 'zzzzzzzzzzzzzz', '-', 3, 9, 1, NULL, NULL, NULL, '2024-05-10 01:58:44', '2024-05-10 01:58:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 'des kri', 7, 'kilo', NULL, NULL, NULL, '-', NULL, NULL, 0, '1', '1', '1', '2024-04-30 03:37:47', '2024-04-30 03:37:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (6, 'kri dess', 7, 'kilo', 2, 2, 'gass', '+', 2, 2, 1, NULL, NULL, NULL, '2024-04-30 03:37:47', '2024-04-30 03:37:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5519 (class 0 OID 32313)
-- Dependencies: 316
-- Data for Name: risk_profile_kri_hasil; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (5, '20245', 4, 29, 3, 5, 5, 3, NULL, NULL, NULL, 'Aman', '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (6, '20245', 2, 34, 3, 9, 9, 3, NULL, NULL, NULL, 'Bahaya', '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (7, '20245', NULL, 32, NULL, NULL, NULL, NULL, 'aman1', 'hh', 'rrr', 'Hati_hati', '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5');
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (8, '20245', NULL, 33, NULL, NULL, NULL, NULL, 'gg', 'yy', 'B', 'Bahaya', '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7');
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (9, '20241', 5, 29, 3, 5, 5, 3, NULL, NULL, NULL, 'Bahaya', '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (10, '20241', 2, 34, 3, 9, 9, 3, NULL, NULL, NULL, 'Bahaya', '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (11, '20241', NULL, 32, NULL, NULL, NULL, NULL, 'aman1', 'hh', 'rrr', 'Aman', '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6');
INSERT INTO public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) VALUES (12, '20241', NULL, 33, NULL, NULL, NULL, NULL, 'gg', 'yy', 'B', 'Hati_hati', '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7');


--
-- TOC entry 5512 (class 0 OID 32244)
-- Dependencies: 309
-- Data for Name: risk_profile_mitigasi; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 19, 76, NULL, 'rencanaaaaaaax', 'ouput des', 3000000.00, 2, 1, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 19, 76, NULL, 'rencana baru123', 'outputss', 305000.00, 2, 1, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 19, 76, 2, 'Rencan rrrrrr234', 'ouptnyacccc', 2400000.00, 2, 1, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (10, 19, 76, 2, 'ccccccccccccccccccccc', 'dddddddddddddddddd', 500000.00, 2, 1, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (11, 19, 76, 1, 'aaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 400000.00, 1, 1, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (12, 14, 57, 1, 'Diturunkan', 'menjadi lebih baik', 1000000.00, 1, 1, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5513 (class 0 OID 32277)
-- Dependencies: 310
-- Data for Name: risk_profile_mitigasi_jenis; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 1, 2, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 2, 1, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (10, 2, 3, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (11, 1, 5, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (11, 2, 4, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (12, 1, 6, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5525 (class 0 OID 32349)
-- Dependencies: 322
-- Data for Name: risk_profile_mitigasi_realisasi; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1, 7, '20245', 1, 'a', 4.00, NULL, 'ouput des', 5000.00, 1, 1, '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (2, 8, '20245', 2, 'a', 5.00, NULL, 'outputss', 4000.00, 1, 1, '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 9, '20245', 2, 'a', 6.00, NULL, 'ouptnyacccc', 6000.00, 1, 1, '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 10, '20245', 2, 'a', 7.00, NULL, 'dddddddddddddddddd', 9000.00, 1, 1, '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (5, 11, '20245', 1, 'a', 8.00, NULL, 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 1000.00, 1, 1, '2024-05-10 03:04:20', '2024-05-10 03:06:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (6, 7, '20241', NULL, NULL, NULL, NULL, 'ouput des', NULL, 1, 1, '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 8, '20241', NULL, NULL, NULL, NULL, 'outputss', NULL, 1, 1, '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 9, '20241', NULL, NULL, NULL, NULL, 'ouptnyacccc', NULL, 1, NULL, '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (9, 10, '20241', NULL, NULL, NULL, NULL, 'dddddddddddddddddd', NULL, 1, NULL, '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (10, 11, '20241', NULL, NULL, NULL, NULL, 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', NULL, 1, NULL, '2024-05-10 03:24:11', '2024-05-10 03:25:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5515 (class 0 OID 32291)
-- Dependencies: 312
-- Data for Name: risk_profile_mitigasi_timeline; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (39, '20241', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (40, '20242', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (41, '20243', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (42, '20244', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (43, '20245', 1, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (44, '20246', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (45, '20247', 1, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (46, '20248', 1, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (47, '20249', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (48, '202410', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (49, '202411', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (50, '202412', 0, 7, '2024-05-08 07:38:23', '2024-05-08 07:38:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (51, '20241', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (52, '20242', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (53, '20243', 1, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (54, '20244', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (55, '20245', 1, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (56, '20246', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (57, '20247', 1, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (58, '20248', 1, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (59, '20249', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (60, '202410', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (61, '202411', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (62, '202412', 0, 8, '2024-05-08 07:39:40', '2024-05-08 07:39:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (87, '20241', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (88, '20242', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (89, '20243', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (90, '20244', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (91, '20245', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (92, '20246', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (93, '20247', 1, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (94, '20248', 0, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (95, '20249', 0, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (96, '202410', 0, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (97, '202411', 0, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (98, '202412', 0, 11, '2024-05-09 08:49:50', '2024-05-09 08:50:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (99, '20241', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (100, '20242', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (101, '20243', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (102, '20244', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (63, '20241', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (64, '20242', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (65, '20243', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (66, '20244', 1, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (67, '20245', 1, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (68, '20246', 1, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (69, '20247', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (70, '20248', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (71, '20249', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (72, '202410', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (73, '202411', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (74, '202412', 0, 9, '2024-05-09 02:15:03', '2024-05-09 02:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (75, '20241', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (76, '20242', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (77, '20243', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (78, '20244', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (79, '20245', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (80, '20246', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (81, '20247', 1, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (82, '20248', 0, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (83, '20249', 0, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (84, '202410', 0, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (85, '202411', 0, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (86, '202412', 0, 10, '2024-05-09 07:43:42', '2024-05-09 07:43:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (103, '20245', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (104, '20246', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (105, '20247', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (106, '20248', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (107, '20249', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (108, '202410', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (109, '202411', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (110, '202412', 1, 12, '2024-05-10 07:42:52', '2024-05-10 07:42:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5521 (class 0 OID 32330)
-- Dependencies: 318
-- Data for Name: risk_profile_mitigasi_timeline_realisasi; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5493 (class 0 OID 32121)
-- Dependencies: 290
-- Data for Name: risk_profile_penyebab; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 7, 'Peningkatan suku bunga karena penurunan kredit rating yang disebabkan oleh beban bunga yang meningkat, Tingkat hutang yang tinggi sementara pendapatan sangat rendah, Kesulitan likuiditas owner', NULL, 64, '2024-05-02 04:26:14', '2024-05-02 04:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (8, 2, 'asdasd', NULL, 65, '2024-05-02 04:26:14', '2024-05-02 04:27:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (20, 26, 'p1', NULL, 78, '2024-05-08 01:54:36', '2024-05-08 02:07:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (20, 27, 'p2', NULL, 79, '2024-05-08 01:54:36', '2024-05-08 02:07:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (19, 24, 'penyebab1', NULL, 76, '2024-05-03 08:54:48', '2024-05-10 01:58:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (19, 25, 'penyebab2', NULL, 77, '2024-05-03 08:54:48', '2024-05-10 01:58:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 2, 'asdasd', NULL, 48, '2024-04-30 08:19:19', '2024-04-30 08:19:43', NULL, NULL, NULL, '2024-04-30 08:19:43', NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 2, 'asdasd', NULL, 52, '2024-04-30 08:22:29', '2024-05-13 08:26:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 3, 'aasd', NULL, 53, '2024-04-30 08:23:06', '2024-05-13 08:26:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (7, 2, 'asdasd', NULL, 49, '2024-04-30 08:19:43', '2024-04-30 08:22:29', NULL, NULL, NULL, '2024-04-30 08:22:29', NULL, NULL, NULL);
INSERT INTO public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (14, 7, 'Peningkatan suku bunga karena penurunan kredit rating yang disebabkan oleh beban bunga yang meningkat, Tingkat hutang yang tinggi sementara pendapatan sangat rendah, Kesulitan likuiditas owner', NULL, 57, '2024-05-01 02:31:59', '2024-05-01 02:31:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5517 (class 0 OID 32304)
-- Dependencies: 314
-- Data for Name: risk_profile_realisasi_residual; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_realisasi_residual (id_realisasi_residual, id_risk_profile, periode, penjelasan_dampak, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (3, 7, '20245', 'asumsi1111', 200000, 3, 4.00, 2, '2024-05-09 03:47:53', '2024-05-09 03:48:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_realisasi_residual (id_realisasi_residual, id_risk_profile, periode, penjelasan_dampak, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (4, 7, '20241', 'Asumsi Perhitungan Dampak73883', 3000000, 2, 7.00, 4, '2024-05-09 03:54:33', '2024-05-09 03:54:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5504 (class 0 OID 32198)
-- Dependencies: 301
-- Data for Name: risk_profile_target_residual; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_profile_target_residual (id_target_residual, id_risk_profile, periode, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (19, 7, '2024q1', 9, 2, 3.00, 2, '2024-05-08 04:11:50', '2024-05-08 06:31:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_target_residual (id_target_residual, id_risk_profile, periode, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (20, 7, '2024q2', 10, 3, 3.00, 3, '2024-05-08 04:11:50', '2024-05-08 06:31:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_target_residual (id_target_residual, id_risk_profile, periode, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (21, 7, '2024q3', 9, 1, 3.00, 1, '2024-05-08 04:11:50', '2024-05-08 06:31:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_profile_target_residual (id_target_residual, id_risk_profile, periode, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (22, 7, '2024q4', 9, 4, 3.00, 2, '2024-05-08 04:11:50', '2024-05-08 06:31:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5480 (class 0 OID 31952)
-- Dependencies: 277
-- Data for Name: risk_register; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (3, 'Toni', '54', '2024-04-18 04:06:58', '2024-04-19 01:43:51', '2024-04-19 01:43:51', NULL, NULL, NULL, NULL, 44, NULL, NULL, 'g', 2, '1', '345', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (2, 'PT ID2', '454', '2024-04-18 04:05:17', '2024-04-19 01:43:57', '2024-04-19 01:43:57', NULL, NULL, NULL, NULL, 43, NULL, 1, NULL, 1, '1', '123', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (1, 'PT ID', 'rf', '2024-04-18 04:04:40', '2024-04-19 01:49:05', '2024-04-19 01:49:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '123', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (8, 'SPI 1', NULL, '2024-04-23 01:38:54', '2024-04-26 01:47:05', '2024-04-26 01:47:05', NULL, NULL, NULL, NULL, NULL, NULL, 4, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (9, 'SPI 2', NULL, '2024-04-23 01:39:48', '2024-04-26 01:47:10', '2024-04-26 01:47:10', NULL, NULL, NULL, NULL, NULL, NULL, 4, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (10, 'SPI 3', 'Baik', '2024-04-23 01:54:16', '2024-04-26 01:47:17', '2024-04-26 01:47:17', NULL, NULL, NULL, NULL, NULL, 'rr', 4, '1', 2, '0', '345re54', NULL, 1, 'Jabatan1', NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (12, 'Proyek', NULL, '2024-04-26 01:48:29', '2024-04-26 01:48:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (13, 'Proyek contoh', NULL, '2024-04-26 01:48:57', '2024-04-26 01:48:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, '1', NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (6, 'Divisi Legal', NULL, '2024-04-19 01:54:25', '2024-04-26 01:50:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, NULL, 'KP.03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (7, 'Divisi Pengembangan Bisnis', NULL, '2024-04-19 01:54:46', '2024-04-26 01:50:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, NULL, 'KP.04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (14, 'Divisi Human Capital', NULL, '2024-04-26 01:52:00', '2024-04-26 01:52:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (15, 'Divisi Corporate Planning', NULL, '2024-04-26 01:52:26', '2024-04-26 01:52:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (16, 'Divisi Akuntansi & Keuangan', NULL, '2024-04-26 01:52:51', '2024-04-26 01:52:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (17, 'Divisi QHSSE', NULL, '2024-04-26 01:53:16', '2024-04-26 01:53:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (18, 'Divisi Manajemen Risiko', NULL, '2024-04-26 01:53:52', '2024-04-26 01:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (19, 'Divisi Sistem, TI & Riset Teknologi', NULL, '2024-04-26 01:54:18', '2024-04-26 01:54:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (20, 'Proyek Khusus/KPBU', NULL, '2024-04-26 01:54:45', '2024-04-26 01:54:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'KP.11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (21, 'Divisi EPC', NULL, '2024-04-26 01:55:11', '2024-04-26 01:55:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.01', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (22, 'Divisi Gedung', NULL, '2024-04-26 01:55:33', '2024-04-26 01:55:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (23, 'Divisi Sipil Umum', NULL, '2024-04-26 01:55:57', '2024-04-26 01:55:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (24, 'Divisi Operasi & Pemeliharaan Jalan Tol', NULL, '2024-04-26 01:56:27', '2024-04-26 01:56:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (25, 'Divisi Perencanaan Jalan Tol', NULL, '2024-04-26 01:56:56', '2024-04-26 01:56:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (26, 'Divisi Pembangunan Jalan Tol', NULL, '2024-04-26 01:57:38', '2024-04-26 01:57:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (27, 'Unit Pengadaan Jalan Tol', NULL, '2024-04-26 01:58:01', '2024-04-26 01:58:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'SB.07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (28, 'Hutama Karya Infrastruktur (HKI)', NULL, '2024-04-26 01:58:20', '2024-04-26 01:58:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'AP.01', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (29, 'HAKAASTON (HKA)', NULL, '2024-04-26 01:58:45', '2024-04-26 01:58:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'AP.02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (30, 'Hutama Karya Realtindo (HKR)', NULL, '2024-04-26 01:59:09', '2024-04-26 01:59:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'AP.03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (31, 'Hutama Marga Waskita (HMW)', NULL, '2024-04-26 01:59:39', '2024-04-26 01:59:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'AP.04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (32, 'EPC Energy Singapore (EES)', NULL, '2024-04-26 01:59:58', '2024-04-26 01:59:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '1', NULL, '0', 'AP.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (11, 'Divisi/Departemen/Ap', NULL, '2024-04-26 01:47:47', '2024-05-03 03:47:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (34, 'Marketing', NULL, '2024-05-03 03:48:26', '2024-05-03 03:48:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (35, 'REM', NULL, '2024-05-03 03:50:14', '2024-05-03 03:50:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (36, 'REL', NULL, '2024-05-03 03:50:27', '2024-05-03 03:50:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (37, 'REP', NULL, '2024-05-03 03:50:41', '2024-05-03 03:50:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (38, 'Pra tender pembangunan kedung kementerian', NULL, '2024-05-03 03:51:27', '2024-05-03 03:51:27', NULL, NULL, NULL, NULL, NULL, NULL, 'AP.05', 35, '1', 3, '0', '01', NULL, 1, 'Jabatan1', NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (39, 'Izin KSO', NULL, '2024-05-03 03:52:19', '2024-05-03 03:52:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (4, 'SPI', NULL, '2024-04-19 01:53:37', '2024-05-08 04:18:37', NULL, NULL, NULL, NULL, NULL, NULL, 'KP.01', 11, '1', 2, NULL, 'KP.01', NULL, 1, 'Jabatan1', NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (33, 'Risiko Korporat', NULL, '2024-04-26 03:32:54', '2024-05-08 04:26:12', NULL, NULL, NULL, NULL, NULL, NULL, 'KP.02', NULL, '1', 1, '0', 'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) VALUES (5, 'Sekretaris Perusahaan', NULL, '2024-04-19 01:54:01', '2024-05-08 04:27:01', NULL, NULL, NULL, NULL, NULL, NULL, 'KP.02', 11, '1', 2, NULL, 'KP.02', NULL, 1, 'Jabatan1', NULL, NULL, NULL, NULL);


--
-- TOC entry 5486 (class 0 OID 32017)
-- Dependencies: 283
-- Data for Name: risk_risiko; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (1, 1, 3, 'asdasd', '2024-04-24 07:09:42', '2024-04-25 08:50:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdasd', 'Aktif', 'rr');
INSERT INTO public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (2, 7, 8, 'Demo / Gangguan Sosial Masyarakat di sekitar lingkungan Proyek', '2024-04-26 03:22:34', '2024-04-26 03:23:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', 'KP.04');
INSERT INTO public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (6, 7, 10, 'Peningkatan Beban Bunga', '2024-05-01 02:31:59', '2024-05-03 03:01:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);
INSERT INTO public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (11, 1, 2, 'peristiwabaru risk12', '2024-05-03 08:54:48', '2024-05-10 02:28:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);
INSERT INTO public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) VALUES (12, 2, 2, 'perisst w 555', '2024-05-08 01:54:36', '2024-05-10 02:28:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aktif', NULL);


--
-- TOC entry 5473 (class 0 OID 31898)
-- Dependencies: 270
-- Data for Name: risk_sasaran; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_sasaran (id_sasaran, nama, hasil_yang_diharapkan, nilai_risiko, nilai_limit, is_accept, id_register, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tahun) VALUES (4, 'Pilihan Sasaran', 'Hasil yang diharapkan dapat diterima perusahaan', 'Nilai Risiko Yang Akan Timbul', 'Nilai limit risiko sesuai dengan parameter risiko dalam Metrik Strategi Risiko', 1, 4, '2024-04-30 09:11:48', '2024-05-01 03:01:23', NULL, NULL, NULL, '2024-05-01 03:01:23', NULL, NULL, NULL, NULL);
INSERT INTO public.risk_sasaran (id_sasaran, nama, hasil_yang_diharapkan, nilai_risiko, nilai_limit, is_accept, id_register, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tahun) VALUES (5, 'Fokus sebagai market leader sektor jalan dan jembatan', 'Peningkatan laba operasi dari hasil eksternalisasi Sektor Jalan & Jembatan  Rp 563 miliar', 'Kenaikan HPP proyek eksternal sebesar Rp 58 M (1,35%)', 'Kenaikan HPP proyek eksternal sebesar Rp 60 M', 1, 4, '2024-05-01 03:02:17', '2024-05-01 03:52:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.risk_sasaran (id_sasaran, nama, hasil_yang_diharapkan, nilai_risiko, nilai_limit, is_accept, id_register, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tahun) VALUES (6, 'Cost Leadership', '% HPP konsolidasi tidak lebih buruk dari 89%', 'Peningkatan beban usaha sebesar 1% (Rp 15 M)', 'Peningkatan beban usaha sebesar 2% (Rp 30 M)', -1, 4, '2024-05-01 03:03:24', '2024-05-01 03:54:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5474 (class 0 OID 31907)
-- Dependencies: 271
-- Data for Name: risk_sasaran_strategi; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, NULL, '2024-04-30 09:11:48', '2024-04-30 09:34:05', NULL, NULL, NULL, '2024-04-30 09:34:05', NULL, NULL, NULL, 1);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, NULL, '2024-04-30 09:11:48', '2024-04-30 09:34:05', NULL, NULL, NULL, '2024-04-30 09:34:05', NULL, NULL, NULL, 2);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'Pilihan Strategi 1', '2024-04-30 09:34:05', '2024-04-30 09:42:17', NULL, NULL, NULL, '2024-04-30 09:42:17', NULL, NULL, NULL, 3);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'Pilihan Strategi 2', '2024-04-30 09:34:05', '2024-04-30 09:42:17', NULL, NULL, NULL, '2024-04-30 09:42:17', NULL, NULL, NULL, 4);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'Pilihan Strategi 3', '2024-04-30 09:34:05', '2024-04-30 09:42:17', NULL, NULL, NULL, '2024-04-30 09:42:17', NULL, NULL, NULL, 5);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'a', '2024-04-30 09:42:17', '2024-04-30 09:42:33', NULL, NULL, NULL, '2024-04-30 09:42:33', NULL, NULL, NULL, 6);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'b', '2024-04-30 09:42:17', '2024-04-30 09:42:33', NULL, NULL, NULL, '2024-04-30 09:42:33', NULL, NULL, NULL, 7);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'c', '2024-04-30 09:42:17', '2024-04-30 09:42:33', NULL, NULL, NULL, '2024-04-30 09:42:33', NULL, NULL, NULL, 8);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'd', '2024-04-30 09:42:17', '2024-04-30 09:42:33', NULL, NULL, NULL, '2024-04-30 09:42:33', NULL, NULL, NULL, 9);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'e', '2024-04-30 09:42:17', '2024-04-30 09:42:33', NULL, NULL, NULL, '2024-04-30 09:42:33', NULL, NULL, NULL, 10);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'a', '2024-04-30 09:42:33', '2024-04-30 09:59:10', NULL, NULL, NULL, '2024-04-30 09:59:10', NULL, NULL, NULL, 11);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'c', '2024-04-30 09:42:33', '2024-04-30 09:59:10', NULL, NULL, NULL, '2024-04-30 09:59:10', NULL, NULL, NULL, 12);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'd', '2024-04-30 09:42:33', '2024-04-30 09:59:10', NULL, NULL, NULL, '2024-04-30 09:59:10', NULL, NULL, NULL, 13);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'e', '2024-04-30 09:42:33', '2024-04-30 09:59:10', NULL, NULL, NULL, '2024-04-30 09:59:10', NULL, NULL, NULL, 14);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'f', '2024-04-30 09:42:33', '2024-04-30 09:59:10', NULL, NULL, NULL, '2024-04-30 09:59:10', NULL, NULL, NULL, 15);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'a', '2024-04-30 09:59:10', '2024-04-30 10:02:42', NULL, NULL, NULL, '2024-04-30 10:02:42', NULL, NULL, NULL, 16);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'c', '2024-04-30 09:59:10', '2024-04-30 10:02:42', NULL, NULL, NULL, '2024-04-30 10:02:42', NULL, NULL, NULL, 17);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'd', '2024-04-30 09:59:10', '2024-04-30 10:02:42', NULL, NULL, NULL, '2024-04-30 10:02:42', NULL, NULL, NULL, 18);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'f', '2024-04-30 09:59:10', '2024-04-30 10:02:42', NULL, NULL, NULL, '2024-04-30 10:02:42', NULL, NULL, NULL, 19);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'g', '2024-04-30 09:59:10', '2024-04-30 10:02:42', NULL, NULL, NULL, '2024-04-30 10:02:42', NULL, NULL, NULL, 20);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'hhh', '2024-04-30 10:02:42', '2024-04-30 10:02:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'qwqe', '2024-04-30 10:02:42', '2024-04-30 10:02:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (4, 'sdfsdf', '2024-04-30 10:02:42', '2024-04-30 10:02:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (5, 'Peningkatan kualitas perencanaan mulai dari pra tender', '2024-05-01 03:02:17', '2024-05-01 03:02:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (5, 'Kerjasama dengan mitra skala global untuk pengembangan kapabilitas', '2024-05-01 03:02:17', '2024-05-01 03:02:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (5, 'Identifikasi proyek berdasarkan kelembagaan secara selektif dan sesuai dengan thresold perusahaan', '2024-05-01 03:02:17', '2024-05-01 03:02:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (6, 'Peningkatan kualitas deliverable proses bisnis konstruksi proyek jasa konstruksi dan jalan tol melalui implementasi program-program Integrated Digital Construction', '2024-05-01 03:03:24', '2024-05-01 03:03:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (6, 'Implementasi ERP dan BIM untuk meningkatkan efisiensi dan pengendalian kinerja secara transparan', '2024-05-01 03:03:24', '2024-05-01 03:03:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28);
INSERT INTO public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) VALUES (6, 'Penguatan pengendalian buaya, mutu dan kualitas serta waktu', '2024-05-01 03:03:24', '2024-05-01 03:03:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29);


--
-- TOC entry 5434 (class 0 OID 30886)
-- Dependencies: 231
-- Data for Name: sys_action; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'index', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'delete', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'index', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, 'delete', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'add', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'edit', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, 'add', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (8, 'edit', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (9, 'index', 42, '2024-04-03 04:58:18', '2024-04-03 04:58:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (10, 'index', 43, '2024-04-03 04:58:51', '2024-04-03 04:58:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (11, 'add', 43, '2024-04-03 04:58:54', '2024-04-03 04:58:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (12, 'edit', 43, '2024-04-03 04:58:57', '2024-04-03 04:58:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 'delete', 43, '2024-04-03 04:59:00', '2024-04-03 04:59:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (14, 'index', 44, '2024-04-03 05:02:21', '2024-04-03 05:02:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (15, 'add', 44, '2024-04-03 05:02:24', '2024-04-03 05:02:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (16, 'edit', 44, '2024-04-03 05:02:26', '2024-04-03 05:02:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (17, 'delete', 44, '2024-04-03 05:02:29', '2024-04-03 05:02:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (18, 'index', 45, '2024-04-03 06:41:45', '2024-04-03 06:41:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (19, 'add', 45, '2024-04-03 06:41:48', '2024-04-03 06:41:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (20, 'edit', 45, '2024-04-03 06:41:51', '2024-04-03 06:41:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (21, 'delete', 45, '2024-04-03 06:41:55', '2024-04-03 06:41:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (22, 'index', 46, '2024-04-03 06:54:13', '2024-04-03 06:54:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (23, 'add', 46, '2024-04-03 06:54:16', '2024-04-03 06:54:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (24, 'edit', 46, '2024-04-03 06:54:18', '2024-04-03 06:54:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (25, 'delete', 46, '2024-04-03 06:54:20', '2024-04-03 06:54:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (26, 'index', 47, '2024-04-03 06:54:50', '2024-04-03 06:54:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (27, 'add', 47, '2024-04-03 06:54:52', '2024-04-03 06:54:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (28, 'edit', 47, '2024-04-03 06:54:55', '2024-04-03 06:54:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (29, 'delete', 47, '2024-04-03 06:54:58', '2024-04-03 06:54:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (30, 'index', 48, '2024-04-03 06:55:27', '2024-04-03 06:55:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (31, 'add', 48, '2024-04-03 06:55:30', '2024-04-03 06:55:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (32, 'edit', 48, '2024-04-03 06:55:32', '2024-04-03 06:55:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (33, 'delete', 48, '2024-04-03 06:55:34', '2024-04-03 06:55:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (34, 'index', 49, '2024-04-03 06:56:09', '2024-04-03 06:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (35, 'add', 49, '2024-04-03 06:56:10', '2024-04-03 06:56:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (36, 'edit', 49, '2024-04-03 06:56:11', '2024-04-03 06:56:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (37, 'delete', 49, '2024-04-03 06:56:12', '2024-04-03 06:56:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (38, 'index', 50, '2024-04-03 06:56:33', '2024-04-03 06:56:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (39, 'add', 50, '2024-04-03 06:56:34', '2024-04-03 06:56:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (40, 'edit', 50, '2024-04-03 06:56:35', '2024-04-03 06:56:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (41, 'delete', 50, '2024-04-03 06:56:36', '2024-04-03 06:56:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (42, 'index', 51, '2024-04-03 06:57:05', '2024-04-03 06:57:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (43, 'add', 51, '2024-04-03 06:57:07', '2024-04-03 06:57:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (44, 'edit', 51, '2024-04-03 06:57:08', '2024-04-03 06:57:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (45, 'delete', 51, '2024-04-03 06:57:09', '2024-04-03 06:57:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (46, 'index', NULL, '2024-04-03 07:07:50', '2024-04-03 07:07:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (47, 'index', 33, '2024-04-03 07:10:37', '2024-04-03 07:10:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (48, 'add', 33, '2024-04-03 07:11:15', '2024-04-03 07:11:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (49, 'edit', 33, '2024-04-03 07:11:22', '2024-04-03 07:11:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (50, 'delete', 33, '2024-04-03 07:11:29', '2024-04-03 07:13:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (51, 'delete', 33, '2024-04-03 07:13:12', '2024-04-03 07:13:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (52, 'index', 31, '2024-04-03 07:13:55', '2024-04-03 07:13:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (53, 'add', 31, '2024-04-03 07:13:59', '2024-04-03 07:13:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (54, 'edit', 31, '2024-04-03 07:14:04', '2024-04-03 07:14:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (55, 'delete', 31, '2024-04-03 07:14:10', '2024-04-03 07:14:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (56, 'index', 52, '2024-04-03 07:33:03', '2024-04-03 07:33:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (57, 'add', 52, '2024-04-03 07:33:04', '2024-04-03 07:33:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (58, 'edit', 52, '2024-04-03 07:33:05', '2024-04-03 07:33:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (59, 'delete', 52, '2024-04-03 07:33:06', '2024-04-03 07:33:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (60, 'index', 53, '2024-04-03 07:34:11', '2024-04-03 07:34:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (61, 'add', 53, '2024-04-03 07:34:12', '2024-04-03 07:34:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (62, 'edit', 53, '2024-04-03 07:34:13', '2024-04-03 07:34:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (63, 'delete', 53, '2024-04-03 07:34:14', '2024-04-03 07:34:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (64, 'index', 54, '2024-04-03 07:35:02', '2024-04-03 07:35:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (65, 'add', 54, '2024-04-03 07:35:03', '2024-04-03 07:35:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (66, 'edit', 54, '2024-04-03 07:35:04', '2024-04-03 07:35:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (67, 'delete', 54, '2024-04-03 07:35:05', '2024-04-03 07:35:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (68, 'index', 55, '2024-04-03 07:35:51', '2024-04-03 07:35:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (69, 'add', 55, '2024-04-03 07:35:52', '2024-04-03 07:35:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (70, 'edit', 55, '2024-04-03 07:35:53', '2024-04-03 07:35:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (71, 'delete', 55, '2024-04-03 07:35:55', '2024-04-03 07:35:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (72, 'index', 56, '2024-04-03 07:36:50', '2024-04-03 07:36:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (73, 'add', 56, '2024-04-03 07:36:51', '2024-04-03 07:36:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (74, 'edit', 56, '2024-04-03 07:36:52', '2024-04-03 07:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (75, 'delete', 56, '2024-04-03 07:36:53', '2024-04-03 07:36:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (76, 'index', 57, '2024-04-03 07:37:42', '2024-04-03 07:37:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (77, 'add', 57, '2024-04-03 07:37:43', '2024-04-03 07:37:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (78, 'edit', 57, '2024-04-03 07:37:44', '2024-04-03 07:37:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (79, 'delete', 57, '2024-04-03 07:37:45', '2024-04-03 07:37:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (80, 'index', 58, '2024-04-03 07:38:55', '2024-04-03 07:38:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (81, 'add', 58, '2024-04-03 07:38:56', '2024-04-03 07:38:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (82, 'edit', 58, '2024-04-03 07:38:57', '2024-04-03 07:38:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (83, 'delete', 58, '2024-04-03 07:38:58', '2024-04-03 07:38:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (84, 'index', 59, '2024-04-03 07:40:14', '2024-04-03 07:40:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (85, 'add', 59, '2024-04-03 07:40:15', '2024-04-03 07:40:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (86, 'edit', 59, '2024-04-03 07:40:16', '2024-04-03 07:40:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (87, 'delete', 59, '2024-04-03 07:40:17', '2024-04-03 07:40:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (88, 'index', 60, '2024-04-03 07:44:32', '2024-04-03 07:44:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (89, 'add', 60, '2024-04-03 07:44:33', '2024-04-03 07:44:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (90, 'edit', 60, '2024-04-03 07:44:35', '2024-04-03 07:44:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (91, 'delete', 60, '2024-04-03 07:44:36', '2024-04-03 07:44:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (92, 'index', 61, '2024-04-03 07:46:06', '2024-04-03 07:46:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (93, 'add', 61, '2024-04-03 07:46:07', '2024-04-03 07:46:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (94, 'edit', 61, '2024-04-03 07:46:08', '2024-04-03 07:46:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (95, 'delete', 61, '2024-04-03 07:46:09', '2024-04-03 07:46:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (96, 'index', 62, '2024-04-05 02:32:47', '2024-04-05 02:32:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (97, 'add', 62, '2024-04-05 02:32:48', '2024-04-05 02:32:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (98, 'edit', 62, '2024-04-05 02:32:49', '2024-04-05 02:32:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (99, 'delete', 62, '2024-04-05 02:32:51', '2024-04-05 02:32:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (100, 'index', 63, '2024-04-05 07:20:29', '2024-04-05 07:20:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (101, 'add', 63, '2024-04-05 07:20:30', '2024-04-05 07:20:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (102, 'edit', 63, '2024-04-05 07:20:31', '2024-04-05 07:20:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (103, 'delete', 63, '2024-04-05 07:20:32', '2024-04-05 07:20:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (104, 'index', 64, '2024-04-05 07:21:07', '2024-04-05 07:21:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (105, 'add', 64, '2024-04-05 07:21:08', '2024-04-05 07:21:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (106, 'edit', 64, '2024-04-05 07:21:09', '2024-04-05 07:21:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (107, 'delete', 64, '2024-04-05 07:21:10', '2024-04-05 07:21:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (108, 'index', 65, '2024-04-05 07:21:49', '2024-04-05 07:21:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (109, 'add', 65, '2024-04-05 07:21:50', '2024-04-05 07:21:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (110, 'edit', 65, '2024-04-05 07:21:51', '2024-04-05 07:21:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (111, 'delete', 65, '2024-04-05 07:21:52', '2024-04-05 07:21:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (112, 'index', 66, '2024-04-05 07:22:49', '2024-04-05 07:22:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (113, 'add', 66, '2024-04-05 07:22:50', '2024-04-05 07:22:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (114, 'edit', 66, '2024-04-05 07:22:51', '2024-04-05 07:22:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (115, 'delete', 66, '2024-04-05 07:22:52', '2024-04-05 07:22:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (116, 'index', 67, '2024-04-05 07:23:44', '2024-04-05 07:23:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (117, 'add', 67, '2024-04-05 07:23:45', '2024-04-05 07:23:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (118, 'edit', 67, '2024-04-05 07:23:46', '2024-04-05 07:23:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (119, 'delete', 67, '2024-04-05 07:23:47', '2024-04-05 07:23:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (120, 'index', 68, '2024-04-05 07:24:39', '2024-04-05 07:24:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (121, 'add', 68, '2024-04-05 07:24:40', '2024-04-05 07:24:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (122, 'edit', 68, '2024-04-05 07:24:41', '2024-04-05 07:24:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (123, 'delete', 68, '2024-04-05 07:24:42', '2024-04-05 07:24:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (124, 'index', 69, '2024-04-05 07:25:38', '2024-04-05 07:25:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (125, 'add', 69, '2024-04-05 07:25:39', '2024-04-05 07:25:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (126, 'edit', 69, '2024-04-05 07:25:40', '2024-04-05 07:25:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (127, 'delete', 69, '2024-04-05 07:25:41', '2024-04-05 07:25:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (128, 'index', 70, '2024-04-05 07:26:18', '2024-04-05 07:26:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (129, 'add', 70, '2024-04-05 07:26:20', '2024-04-05 07:26:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (130, 'edit', 70, '2024-04-05 07:26:21', '2024-04-05 07:26:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (131, 'delete', 70, '2024-04-05 07:26:22', '2024-04-05 07:26:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (132, 'index', 71, '2024-04-05 07:27:21', '2024-04-05 07:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (133, 'add', 71, '2024-04-05 07:27:22', '2024-04-05 07:27:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (134, 'edit', 71, '2024-04-05 07:27:23', '2024-04-05 07:27:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (135, 'delete', 71, '2024-04-05 07:27:24', '2024-04-05 07:27:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (136, 'index', 72, '2024-04-05 07:28:37', '2024-04-05 07:28:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (137, 'add', 72, '2024-04-05 07:28:38', '2024-04-05 07:28:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (138, 'edit', 72, '2024-04-05 07:28:39', '2024-04-05 07:28:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (139, 'delete', 72, '2024-04-05 07:28:40', '2024-04-05 07:28:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (140, 'index', 73, '2024-04-05 07:29:16', '2024-04-05 07:29:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (141, 'add', 73, '2024-04-05 07:29:17', '2024-04-05 07:29:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (142, 'edit', 73, '2024-04-05 07:29:18', '2024-04-05 07:29:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (143, 'delete', 73, '2024-04-05 07:29:19', '2024-04-05 07:29:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (144, 'index', 74, '2024-04-05 07:30:09', '2024-04-05 07:30:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (145, 'add', 74, '2024-04-05 07:30:10', '2024-04-05 07:30:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (146, 'edit', 74, '2024-04-05 07:30:11', '2024-04-05 07:30:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (147, 'delete', 74, '2024-04-05 07:30:12', '2024-04-05 07:30:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (148, 'index', 75, '2024-04-05 07:31:11', '2024-04-05 07:31:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (149, 'add', 75, '2024-04-05 07:31:12', '2024-04-05 07:31:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (150, 'edit', 75, '2024-04-05 07:31:13', '2024-04-05 07:31:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (151, 'delete', 75, '2024-04-05 07:31:14', '2024-04-05 07:31:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (152, 'index', 76, '2024-04-05 07:31:37', '2024-04-05 07:31:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (153, 'add', 76, '2024-04-05 07:31:38', '2024-04-05 07:31:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (154, 'edit', 76, '2024-04-05 07:31:39', '2024-04-05 07:31:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (155, 'delete', 76, '2024-04-05 07:31:40', '2024-04-05 07:31:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (156, 'index', 77, '2024-04-05 07:32:10', '2024-04-05 07:32:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (157, 'add', 77, '2024-04-05 07:32:11', '2024-04-05 07:32:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (158, 'edit', 77, '2024-04-05 07:32:12', '2024-04-05 07:32:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (159, 'delete', 77, '2024-04-05 07:32:13', '2024-04-05 07:32:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (160, 'index', 78, '2024-04-05 07:33:18', '2024-04-05 07:33:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (161, 'add', 78, '2024-04-05 07:33:19', '2024-04-05 07:33:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (162, 'edit', 78, '2024-04-05 07:33:20', '2024-04-05 07:33:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (163, 'delete', 78, '2024-04-05 07:33:22', '2024-04-05 07:33:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (164, 'index', 79, '2024-04-17 07:11:56', '2024-04-17 07:11:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (165, 'add', 79, '2024-04-17 07:11:57', '2024-04-17 07:11:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (166, 'edit', 79, '2024-04-17 07:11:58', '2024-04-17 07:11:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (167, 'delete', 79, '2024-04-17 07:11:59', '2024-04-17 07:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (168, 'index', 80, '2024-04-18 02:05:45', '2024-04-18 02:05:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (169, 'add', 80, '2024-04-18 02:05:49', '2024-04-18 02:05:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (170, 'edit', 80, '2024-04-18 02:05:52', '2024-04-18 02:05:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (171, 'delete', 80, '2024-04-18 02:05:55', '2024-04-18 02:05:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (172, 'index', 81, '2024-04-18 02:10:48', '2024-04-18 02:10:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (173, 'add', 81, '2024-04-18 02:10:50', '2024-04-18 02:10:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (174, 'edit', 81, '2024-04-18 02:10:53', '2024-04-18 02:10:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (175, 'delete', 81, '2024-04-18 02:10:57', '2024-04-18 02:10:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (176, 'index', 82, '2024-04-18 04:02:27', '2024-04-18 04:02:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (177, 'add', 82, '2024-04-18 04:02:28', '2024-04-18 04:02:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (178, 'edit', 82, '2024-04-18 04:02:29', '2024-04-18 04:02:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (179, 'delete', 82, '2024-04-18 04:02:30', '2024-04-18 04:02:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (180, 'index', 83, '2024-04-18 04:03:06', '2024-04-18 04:03:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (181, 'add', 83, '2024-04-18 04:03:08', '2024-04-18 04:03:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (182, 'edit', 83, '2024-04-18 04:03:10', '2024-04-18 04:03:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (183, 'delete', 83, '2024-04-18 04:03:11', '2024-04-18 04:03:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (184, 'index', 84, '2024-04-18 04:03:39', '2024-04-18 04:03:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (185, 'add', 84, '2024-04-18 04:03:40', '2024-04-18 04:03:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (186, 'edit', 84, '2024-04-18 04:03:41', '2024-04-18 04:03:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (187, 'delete', 84, '2024-04-18 04:03:42', '2024-04-18 04:03:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (188, 'index', 85, '2024-04-18 08:53:50', '2024-04-18 08:53:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (189, 'add', 85, '2024-04-18 08:53:51', '2024-04-18 08:53:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (190, 'edit', 85, '2024-04-18 08:53:53', '2024-04-18 08:53:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (191, 'delete', 85, '2024-04-18 08:53:54', '2024-04-18 08:53:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (192, 'index', 86, '2024-04-22 08:12:22', '2024-04-22 08:12:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (193, 'add', 86, '2024-04-22 08:12:24', '2024-04-22 08:12:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (194, 'edit', 86, '2024-04-22 08:12:24', '2024-04-22 08:12:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (195, 'delete', 86, '2024-04-22 08:12:25', '2024-04-22 08:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (196, 'index', 87, '2024-04-22 08:13:12', '2024-04-22 08:13:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (197, 'add', 87, '2024-04-22 08:13:12', '2024-04-22 08:13:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (198, 'edit', 87, '2024-04-22 08:13:13', '2024-04-22 08:13:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (199, 'delete', 87, '2024-04-22 08:13:14', '2024-04-22 08:13:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (200, 'index', 88, '2024-04-23 08:52:33', '2024-04-23 08:52:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (201, 'add', 88, '2024-04-23 08:52:34', '2024-04-23 08:52:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (202, 'edit', 88, '2024-04-23 08:52:34', '2024-04-23 08:52:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (203, 'delete', 88, '2024-04-23 08:52:35', '2024-04-23 08:52:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (204, 'index', 89, '2024-04-25 03:50:20', '2024-04-25 03:50:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (205, 'add', 89, '2024-04-25 03:50:21', '2024-04-25 03:50:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (206, 'edit', 89, '2024-04-25 03:50:21', '2024-04-25 03:50:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (207, 'delete', 89, '2024-04-25 03:50:22', '2024-04-25 03:50:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (208, 'index', 90, '2024-04-25 03:51:14', '2024-04-25 03:51:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (209, 'add', 90, '2024-04-25 03:51:15', '2024-04-25 03:51:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (210, 'edit', 90, '2024-04-25 03:51:16', '2024-04-25 03:51:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (211, 'delete', 90, '2024-04-25 03:51:17', '2024-04-25 03:51:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (212, 'approve', 82, '2024-04-25 08:46:44', '2024-04-25 08:46:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (213, 'approve', 83, '2024-04-25 08:58:20', '2024-04-25 08:58:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (214, 'approve', 84, '2024-04-25 08:58:25', '2024-04-25 08:58:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (215, 'index', 91, '2024-04-26 02:31:22', '2024-04-26 02:31:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (216, 'add', 91, '2024-04-26 02:31:23', '2024-04-26 02:31:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (217, 'edit', 91, '2024-04-26 02:31:25', '2024-04-26 02:31:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (218, 'delete', 91, '2024-04-26 02:31:27', '2024-04-26 02:31:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (219, 'index', 92, '2024-04-26 02:41:40', '2024-04-26 02:41:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (220, 'add', 92, '2024-04-26 02:41:41', '2024-04-26 02:41:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (221, 'edit', 92, '2024-04-26 02:41:41', '2024-04-26 02:41:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (222, 'delete', 92, '2024-04-26 02:41:42', '2024-04-26 02:41:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (223, 'index', 93, '2024-04-26 08:49:34', '2024-04-26 08:49:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (224, 'add', 93, '2024-04-26 08:49:35', '2024-04-26 08:49:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (225, 'edit', 93, '2024-04-26 08:49:35', '2024-04-26 08:49:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (226, 'delete', 93, '2024-04-26 08:49:36', '2024-04-26 08:49:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (227, 'approve', 47, '2024-05-01 03:46:04', '2024-05-01 03:46:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (228, 'index', 94, '2024-05-02 01:58:05', '2024-05-02 01:58:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (229, 'add', 94, '2024-05-02 01:58:06', '2024-05-02 01:58:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (230, 'edit', 94, '2024-05-02 01:58:08', '2024-05-02 01:58:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (231, 'delete', 94, '2024-05-02 01:58:09', '2024-05-02 01:58:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (232, 'index', 95, '2024-05-07 02:51:30', '2024-05-07 02:51:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (233, 'add', 95, '2024-05-07 02:51:32', '2024-05-07 02:51:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (234, 'edit', 95, '2024-05-07 02:51:34', '2024-05-07 02:51:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (235, 'delete', 95, '2024-05-07 02:51:35', '2024-05-07 02:51:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (236, 'index', 96, '2024-05-07 02:52:44', '2024-05-07 02:52:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (237, 'add', 96, '2024-05-07 02:52:45', '2024-05-07 02:52:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (238, 'edit', 96, '2024-05-07 02:52:47', '2024-05-07 02:52:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (239, 'delete', 96, '2024-05-07 02:52:48', '2024-05-07 02:52:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (240, 'index', 97, '2024-05-07 10:26:43', '2024-05-07 10:26:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (241, 'add', 97, '2024-05-07 10:26:45', '2024-05-07 10:26:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (242, 'edit', 97, '2024-05-07 10:26:47', '2024-05-07 10:26:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (243, 'delete', 97, '2024-05-07 10:26:49', '2024-05-07 10:26:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (244, 'index', 98, '2024-05-07 11:46:27', '2024-05-07 11:46:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (245, 'add', 98, '2024-05-07 11:46:28', '2024-05-07 11:46:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (246, 'edit', 98, '2024-05-07 11:46:29', '2024-05-07 11:46:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (247, 'delete', 98, '2024-05-07 11:46:30', '2024-05-07 11:46:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (248, 'index', 99, '2024-05-08 06:22:42', '2024-05-08 06:22:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (249, 'add', 99, '2024-05-08 06:22:43', '2024-05-08 06:22:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (250, 'edit', 99, '2024-05-08 06:22:44', '2024-05-08 06:22:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (251, 'delete', 99, '2024-05-08 06:22:46', '2024-05-08 06:22:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (252, 'index', 100, '2024-05-08 06:23:26', '2024-05-08 06:23:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (253, 'add', 100, '2024-05-08 06:23:28', '2024-05-08 06:23:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (254, 'edit', 100, '2024-05-08 06:23:31', '2024-05-08 06:23:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (255, 'delete', 100, '2024-05-08 06:23:32', '2024-05-08 06:23:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (256, 'index', 101, '2024-05-09 04:23:16', '2024-05-09 04:23:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (257, 'add', 101, '2024-05-09 04:23:17', '2024-05-09 04:23:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (258, 'edit', 101, '2024-05-09 04:23:19', '2024-05-09 04:23:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (259, 'delete', 101, '2024-05-09 04:23:20', '2024-05-09 04:23:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (260, 'index', 102, '2024-05-10 02:54:44', '2024-05-10 02:54:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (261, 'add', 102, '2024-05-10 02:54:45', '2024-05-10 02:54:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (262, 'edit', 102, '2024-05-10 02:54:46', '2024-05-10 02:54:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (263, 'delete', 102, '2024-05-10 02:54:46', '2024-05-10 02:54:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (264, 'index', 103, '2024-05-10 03:19:43', '2024-05-10 03:19:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (265, 'add', 103, '2024-05-10 03:19:44', '2024-05-10 03:19:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (266, 'edit', 103, '2024-05-10 03:19:44', '2024-05-10 03:19:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (267, 'delete', 103, '2024-05-10 03:19:45', '2024-05-10 03:19:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (268, 'index', 104, '2024-05-10 03:22:38', '2024-05-10 03:22:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (269, 'add', 104, '2024-05-10 03:22:38', '2024-05-10 03:22:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (270, 'edit', 104, '2024-05-10 03:22:39', '2024-05-10 03:22:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (271, 'delete', 104, '2024-05-10 03:22:40', '2024-05-10 03:22:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (272, 'index', 105, '2024-05-10 08:38:05', '2024-05-10 08:38:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (273, 'add', 105, '2024-05-10 08:38:06', '2024-05-10 08:38:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (274, 'edit', 105, '2024-05-10 08:38:06', '2024-05-10 08:38:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (275, 'delete', 105, '2024-05-10 08:38:07', '2024-05-10 08:38:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (276, 'index', 106, '2024-05-10 08:49:22', '2024-05-10 08:49:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (277, 'add', 106, '2024-05-10 08:49:23', '2024-05-10 08:49:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (278, 'edit', 106, '2024-05-10 08:49:23', '2024-05-10 08:49:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (279, 'delete', 106, '2024-05-10 08:49:24', '2024-05-10 08:49:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (280, 'index', 107, '2024-05-10 09:05:30', '2024-05-10 09:05:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (281, 'add', 107, '2024-05-10 09:05:30', '2024-05-10 09:05:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (282, 'edit', 107, '2024-05-10 09:05:31', '2024-05-10 09:05:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (283, 'delete', 107, '2024-05-10 09:05:32', '2024-05-10 09:05:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5424 (class 0 OID 29214)
-- Dependencies: 221
-- Data for Name: sys_cache; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_327360af2b78489d7f7b94bfa4cb95c1:timer', 'i:1713339672;', 1713339672, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('asd@asd.cp|127.0.0.1:timer', 'i:1710393314;', 1710393314, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('asd@asd.cp|127.0.0.1', 'i:1;', 1710393314, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('asdasd@a.com|127.0.0.1:timer', 'i:1711163286;', 1711163286, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('asdasd@a.com|127.0.0.1', 'i:1;', 1711163286, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_327360af2b78489d7f7b94bfa4cb95c1', 'i:3;', 1713339672, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('asd@a.com|127.0.0.1:timer', 'i:1711166044;', 1711166044, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('asd@a.com|127.0.0.1', 'i:1;', 1711166044, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_a75f3f172bfb296f2e10cbfc6dfc1883:timer', 'i:1712115118;', 1712115118, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_a75f3f172bfb296f2e10cbfc6dfc1883', 'i:1;', 1712115118, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_95fbb0af7523375ccab7651d3152d3d2:timer', 'i:1712303609;', 1712303609, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_95fbb0af7523375ccab7651d3152d3d2', 'i:1;', 1712303609, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_3b54f25d9a479c36b85cb7e52206e29d:timer', 'i:1711585158;', 1711585158, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_3b54f25d9a479c36b85cb7e52206e29d', 'i:1;', 1711585158, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_robinbuah@gmail.com|192.168.1.24:timer', 'i:1711601600;', 1711601600, NULL, NULL);
INSERT INTO public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) VALUES ('laravel_cache_robinbuah@gmail.com|192.168.1.24', 'i:1;', 1711601600, NULL, NULL);


--
-- TOC entry 5425 (class 0 OID 29221)
-- Dependencies: 222
-- Data for Name: sys_cache_lock; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5430 (class 0 OID 29246)
-- Dependencies: 227
-- Data for Name: sys_failed_job; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5436 (class 0 OID 30898)
-- Dependencies: 233
-- Data for Name: sys_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (9, 'Administrator 2', '2024-04-03 03:40:58', '2024-04-03 07:54:53', NULL, NULL, NULL, NULL, '2024-04-03 07:54:53', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (8, 'Administrator 2', '2024-04-03 03:39:57', '2024-04-03 07:54:59', NULL, NULL, NULL, NULL, '2024-04-03 07:54:59', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (7, 'Administrator 2', '2024-04-03 03:39:21', '2024-04-03 07:55:07', NULL, NULL, NULL, NULL, '2024-04-03 07:55:07', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (6, 'Administrator 2', '2024-04-03 03:38:56', '2024-04-03 07:55:13', NULL, NULL, NULL, NULL, '2024-04-03 07:55:13', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (5, 'Administrator 3', '2024-04-03 03:38:06', '2024-04-03 07:58:08', NULL, NULL, NULL, NULL, '2024-04-03 07:58:08', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (4, 'Administrator 2', '2024-04-03 03:37:32', '2024-04-03 07:58:22', NULL, NULL, NULL, NULL, '2024-04-03 07:58:22', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (3, 'Administrator 2', '2024-04-03 03:37:10', '2024-04-03 07:58:35', NULL, NULL, NULL, NULL, '2024-04-03 07:58:35', NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (11, 'Owner', '2024-04-25 08:47:55', '2024-04-25 08:47:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (12, 'Reviewer Korporat', '2024-04-25 08:48:15', '2024-04-25 08:48:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Koordinator Korporat', NULL, '2024-04-25 08:48:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (10, 'Officer', '2024-04-25 08:47:42', '2024-04-25 08:49:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (13, 'Koordinator Divisi', '2024-04-25 08:48:28', '2024-04-25 08:49:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5443 (class 0 OID 30937)
-- Dependencies: 240
-- Data for Name: sys_group_action; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1257, 22, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1257, 23, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1257, 24, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1257, 25, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1258, 164, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1258, 165, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1258, 166, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1258, 167, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1259, 30, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1259, 31, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1259, 32, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1259, 33, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1260, 26, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1260, 27, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1260, 28, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1260, 29, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1260, 227, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1261, 18, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1261, 19, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1261, 20, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1261, 21, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1262, 215, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1262, 216, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1262, 217, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1262, 218, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1263, 34, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1263, 35, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1263, 36, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1263, 37, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1264, 38, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1264, 39, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1264, 40, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1264, 41, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1265, 176, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1265, 177, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1265, 178, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1265, 179, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1265, 212, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1266, 180, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1266, 181, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1266, 182, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1266, 183, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1266, 213, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1267, 184, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1267, 185, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1267, 186, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1267, 187, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1267, 214, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1268, 42, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1268, 43, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1268, 44, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1268, 45, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1269, 232, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1269, 233, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1269, 234, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1269, 235, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1270, 236, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1270, 237, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1270, 238, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1270, 239, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1271, 228, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1271, 229, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1271, 230, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1271, 231, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1272, 240, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1272, 241, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1272, 242, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1272, 243, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1273, 244, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1273, 245, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1273, 246, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1273, 247, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1274, 47, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1274, 48, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1274, 49, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1274, 50, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1274, 51, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1275, 124, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1275, 125, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (816, 5, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (816, 7, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (816, 6, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (816, 8, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (817, 10, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (817, 11, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (817, 12, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (817, 13, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (818, 14, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (818, 15, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (818, 16, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (818, 17, '2024-05-02 02:08:59', '2024-05-02 02:08:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1275, 126, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1275, 127, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1276, 168, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1276, 169, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (77, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (77, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (77, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (77, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (78, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (78, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (78, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (78, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (79, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (79, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (79, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (79, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (80, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (80, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (80, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (80, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (81, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (81, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (81, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (81, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (82, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (82, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (82, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (82, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (83, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (83, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (83, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (83, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (84, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (84, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (84, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (84, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (84, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (85, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (85, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (85, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (85, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (86, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (86, 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (86, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (86, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (87, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (87, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (87, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (87, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (88, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (88, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (88, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (88, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (89, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (89, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (89, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (89, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (90, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (90, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (90, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (90, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (91, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (91, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (91, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (91, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (92, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (92, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (92, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (92, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (93, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (93, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (93, 134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (93, 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (94, 136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (94, 137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (94, 138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (94, 139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (95, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (95, 141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (95, 142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (95, 143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (96, 144, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (96, 145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (96, 146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (96, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (97, 148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (97, 149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (97, 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (97, 151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (98, 152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (98, 153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (98, 154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (98, 155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (99, 156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (99, 157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (99, 158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (99, 159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (100, 160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (100, 161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (100, 162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (100, 163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (102, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (102, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (102, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (102, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (103, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (103, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (103, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (103, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (104, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (104, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (104, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (104, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1276, 170, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1276, 171, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1277, 200, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1277, 201, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1277, 202, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1277, 203, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1278, 260, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1278, 261, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1278, 262, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1278, 263, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1279, 136, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1279, 137, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1279, 138, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1279, 139, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1280, 132, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1280, 133, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1280, 134, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1280, 135, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1281, 128, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1281, 129, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1281, 130, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1281, 131, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1282, 264, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1282, 265, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1282, 266, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1282, 267, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1283, 192, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1283, 193, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1283, 194, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1283, 195, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1284, 196, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1284, 197, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1284, 198, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1284, 199, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1285, 268, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1285, 269, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1285, 270, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1285, 271, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1286, 104, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1286, 105, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1286, 106, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1286, 107, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1287, 100, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1287, 101, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1287, 102, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1287, 103, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1288, 108, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1288, 109, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1288, 110, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1288, 111, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1289, 112, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1289, 113, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1289, 114, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1289, 115, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1290, 219, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1290, 220, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1290, 221, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1290, 222, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1291, 223, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1291, 224, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1291, 225, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1291, 226, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1292, 140, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1292, 141, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1292, 142, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1292, 143, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1293, 144, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1293, 145, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1293, 146, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1293, 147, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1294, 116, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1294, 117, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1294, 118, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1294, 119, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1295, 276, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1295, 277, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1295, 278, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1295, 279, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1296, 204, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1296, 205, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1296, 206, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1296, 207, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1297, 208, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1297, 209, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1297, 210, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1297, 211, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1298, 280, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1298, 281, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1298, 282, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1298, 283, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1299, 120, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1299, 121, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1299, 122, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1299, 123, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1300, 248, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1300, 249, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1300, 250, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1300, 251, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1301, 252, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1301, 253, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1301, 254, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1301, 255, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1302, 256, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1302, 257, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1302, 258, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1302, 259, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1303, 272, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1303, 273, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1303, 274, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1303, 275, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1304, 148, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1304, 149, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1304, 150, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1304, 151, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1305, 152, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1305, 153, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1305, 154, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1305, 155, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1306, 156, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1306, 157, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1306, 158, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1306, 159, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1308, 5, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1308, 7, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1308, 6, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1308, 8, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1309, 10, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1309, 11, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1309, 12, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1309, 13, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1310, 14, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1310, 15, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1310, 16, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) VALUES (1310, 17, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5442 (class 0 OID 30921)
-- Dependencies: 239
-- Data for Name: sys_group_menu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1257, 1, 46, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1258, 1, 79, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1259, 1, 48, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1260, 1, 47, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1261, 1, 45, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1262, 1, 91, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1263, 1, 49, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1264, 1, 50, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1265, 1, 82, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1266, 1, 83, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1267, 1, 84, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1268, 1, 51, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1269, 1, 95, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1270, 1, 96, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1271, 1, 94, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1272, 1, 97, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1273, 1, 98, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1274, 1, 33, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1275, 1, 69, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1276, 1, 80, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1277, 1, 88, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1278, 1, 102, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1279, 1, 72, '2024-05-10 09:09:54', '2024-05-10 09:09:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1280, 1, 71, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1281, 1, 70, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1282, 1, 103, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1283, 1, 86, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1284, 1, 87, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1285, 1, 104, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1286, 1, 64, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1287, 1, 63, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1288, 1, 65, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1289, 1, 66, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1290, 1, 92, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1291, 1, 93, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1292, 1, 73, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1293, 1, 74, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1294, 1, 67, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1295, 1, 106, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1296, 1, 89, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1297, 1, 90, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1298, 1, 107, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1299, 1, 68, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1300, 1, 99, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1301, 1, 100, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1302, 1, 101, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1303, 1, 105, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1304, 1, 75, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1305, 1, 76, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1306, 1, 77, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1307, 1, 38, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1308, 1, 2, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (815, 13, 38, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (816, 13, 2, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (817, 13, 43, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (818, 13, 44, '2024-05-02 02:08:58', '2024-05-02 02:08:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1309, 1, 43, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (1310, 1, 44, '2024-05-10 09:09:55', '2024-05-10 09:09:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (77, 2, 46, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (78, 2, 48, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (79, 2, 47, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (80, 2, 45, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (81, 2, 49, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (82, 2, 51, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (83, 2, 50, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (84, 2, 33, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (85, 2, 63, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (86, 2, 64, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (87, 2, 65, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (88, 2, 66, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (89, 2, 67, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (90, 2, 68, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (91, 2, 69, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (92, 2, 70, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (93, 2, 71, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (94, 2, 72, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (95, 2, 73, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (96, 2, 74, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (97, 2, 75, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (98, 2, 76, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (99, 2, 77, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (100, 2, 78, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (101, 2, 38, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (102, 2, 2, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (103, 2, 43, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) VALUES (104, 2, 44, '2024-04-05 07:38:08', '2024-04-05 07:38:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5427 (class 0 OID 29229)
-- Dependencies: 224
-- Data for Name: sys_job; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5428 (class 0 OID 29238)
-- Dependencies: 225
-- Data for Name: sys_job_batch; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5440 (class 0 OID 30914)
-- Dependencies: 237
-- Data for Name: sys_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5432 (class 0 OID 30879)
-- Dependencies: 229
-- Data for Name: sys_menu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (22, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:25:01', '2024-04-03 07:53:59', '2024-04-03 07:53:59', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (35, NULL, 'SDM Unit', 'mt_sdm_unit', NULL, 'pie', 1, '2024-04-02 04:35:32', '2024-04-03 07:51:08', '2024-04-03 07:51:08', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (8, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:06:45', '2024-04-03 07:51:17', '2024-04-03 07:51:17', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (10, NULL, 'M111enu 1', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:07:34', '2024-04-03 07:51:22', '2024-04-03 07:51:22', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (23, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:25:58', '2024-04-03 07:54:06', '2024-04-03 07:54:06', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (41, 38, 'User', 'sys_user', NULL, 'person', 1, '2024-04-03 04:37:06', '2024-04-03 07:51:50', '2024-04-03 07:51:50', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (25, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:31:29', '2024-04-03 07:54:11', '2024-04-03 07:54:11', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (24, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:29:44', '2024-04-03 07:54:16', '2024-04-03 07:54:16', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (26, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:31:52', '2024-04-03 07:54:23', '2024-04-03 07:54:23', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (42, NULL, 'User', 'sys_user', NULL, 'person', 1, '2024-04-03 04:56:40', '2024-04-03 07:54:35', '2024-04-03 07:54:35', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (49, 79, 'Profil Risiko', 'risk_profile', 4, 'info', 0, '2024-04-03 06:56:08', '2024-04-18 22:31:16', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (36, 33, 'Menu', 'sys_menu', 1, 'pie', 1, '2024-04-02 04:40:02', '2024-04-05 02:02:13', '2024-04-05 02:02:13', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (39, 38, 'Menu', 'sys_menu', 1, 'pie', 1, '2024-04-02 06:05:01', '2024-04-03 07:51:57', '2024-04-03 07:51:57', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (37, 33, 'SDM Unit', 'mt_sdm_unit', NULL, 'pie', 1, '2024-04-02 04:41:24', '2024-04-05 02:02:19', '2024-04-05 02:02:19', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (52, 33, 'Direktorat', 'mt_direktorat', NULL, NULL, 1, '2024-04-03 07:33:02', '2024-04-05 02:02:26', '2024-04-05 02:02:26', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (46, NULL, 'Dashboard', 'dashboard', 0, 'home', 1, '2024-04-03 06:54:11', '2024-04-05 02:03:21', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (57, 33, 'Fraud Jenis', 'mt_fraud_jenis', NULL, NULL, 1, '2024-04-03 07:37:41', '2024-04-05 07:17:25', '2024-04-05 07:17:25', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (9, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:07:04', '2024-04-03 07:52:04', '2024-04-03 07:52:04', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (11, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:08:04', '2024-04-03 07:52:10', '2024-04-03 07:52:10', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (58, 33, 'Fraud Kategori', 'mt_fraud_kategori', NULL, NULL, 1, '2024-04-03 07:38:54', '2024-04-05 07:17:31', '2024-04-05 07:17:31', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (59, 33, 'Fraud Kemungkinan Kriteria', 'mt_fraud_kemungkinan_kriteria', NULL, NULL, 1, '2024-04-03 07:40:13', '2024-04-05 07:17:38', '2024-04-05 07:17:38', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (32, NULL, 'Menu', 'sys_menu', NULL, 'pie', 1, '2024-04-02 04:28:26', '2024-04-03 07:52:19', '2024-04-03 07:52:19', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (53, 33, 'Efektifitas', 'mt_efektifitas', NULL, NULL, 1, '2024-04-03 07:34:09', '2024-04-05 07:17:50', '2024-04-05 07:17:50', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (55, 33, 'Fraud Dampak Level', 'mt_fraud_dampak_level', NULL, NULL, 1, '2024-04-03 07:35:49', '2024-04-05 07:17:56', '2024-04-05 07:17:56', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (60, 33, 'Fraud Kemungkinan Level', 'mt_fraud_kemungkinan_level', NULL, NULL, 1, '2024-04-03 07:44:31', '2024-04-05 07:18:03', '2024-04-05 07:18:03', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (61, 33, 'Fraud Kemungkinan', 'mt_fraud_kemungkinan', NULL, NULL, 1, '2024-04-03 07:46:05', '2024-04-05 07:18:09', '2024-04-05 07:18:09', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (34, 33, 'SDM Unit', 'mt_sdm_unit', NULL, 'pie', NULL, '2024-04-02 04:30:42', '2024-04-05 07:19:14', '2024-04-05 07:19:14', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (30, NULL, 'Menu', 'sys_menu', NULL, 'pie', NULL, '2024-04-02 03:50:18', '2024-04-03 07:52:27', '2024-04-03 07:52:27', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 38, 'Group', 'group', NULL, NULL, 1, NULL, '2024-04-02 06:08:13', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (12, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:11:27', '2024-04-03 07:52:34', '2024-04-03 07:52:34', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (56, 33, 'Matrix Risiko', 'mt_risk_matrix', NULL, NULL, 1, '2024-04-03 07:36:48', '2024-04-05 07:19:25', '2024-04-05 07:19:25', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (71, 102, 'Kategori Risiko', 'mt_risk_taksonomi_area', 2, NULL, 1, '2024-04-05 07:27:20', '2024-05-10 03:16:44', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (14, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:13:14', '2024-04-03 07:52:39', '2024-04-03 07:52:39', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (54, 33, 'Kriteria Dampak Risiko', 'mt_risk_kriteria_dampak', NULL, NULL, 1, '2024-04-03 07:35:00', '2024-04-05 07:19:33', '2024-04-05 07:19:33', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (31, 33, 'Dampak Risiko', 'mt_risk_dampak', NULL, NULL, 1, '2024-04-02 04:11:16', '2024-04-05 07:19:40', '2024-04-05 07:19:40', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (51, NULL, 'Laporan', 'report', 7, 'print', 1, '2024-04-03 06:57:04', '2024-04-18 04:07:25', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (13, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:11:52', '2024-04-03 07:52:45', '2024-04-03 07:52:45', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (62, 33, 'Dampak Kemungkinan', 'mt_risk_kemungkinan', NULL, NULL, 1, '2024-04-05 02:32:46', '2024-04-05 07:19:45', '2024-04-05 07:19:45', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (29, NULL, 'SDM Unit', 'mt_sdm_unit', NULL, 'pie', NULL, '2024-04-02 03:25:34', '2024-04-03 07:52:53', '2024-04-03 07:52:53', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (38, NULL, 'Pengaturan', 'setting', 9, 'settings', 1, '2024-04-02 06:00:19', '2024-04-05 04:05:54', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (40, 33, 'Dampak Kriteria Risiko Detail', 'mt_risk_kriteria_dampak_detail', NULL, NULL, 1, '2024-04-02 06:20:35', '2024-04-05 07:19:52', '2024-04-05 07:19:52', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (15, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:13:42', '2024-04-03 07:53:12', '2024-04-03 07:53:12', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (44, 38, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-03 05:02:19', '2024-04-03 07:42:15', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (43, 38, 'User', 'sys_user', NULL, NULL, 1, '2024-04-03 04:58:48', '2024-04-03 07:42:30', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (1, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, NULL, '2024-04-03 07:49:32', '2024-04-03 07:49:32', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (3, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 03:53:56', '2024-04-03 07:49:37', '2024-04-03 07:49:37', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (28, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:32:51', '2024-04-03 07:49:43', '2024-04-03 07:49:43', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (27, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:32:41', '2024-04-03 07:49:48', '2024-04-03 07:49:48', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (4, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:00:14', '2024-04-03 07:50:37', '2024-04-03 07:50:37', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (5, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:02:24', '2024-04-03 07:50:41', '2024-04-03 07:50:41', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (6, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:04:24', '2024-04-03 07:50:48', '2024-04-03 07:50:48', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (7, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:05:29', '2024-04-03 07:51:02', '2024-04-03 07:51:02', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (17, NULL, NULL, 'sys_menu', NULL, NULL, 1, '2024-04-01 04:20:52', '2024-04-03 07:53:18', '2024-04-03 07:53:18', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (16, NULL, NULL, 'sys_menu', NULL, NULL, 1, '2024-04-01 04:15:25', '2024-04-03 07:53:23', '2024-04-03 07:53:23', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (18, NULL, 'Menu', 'sys_menu', NULL, NULL, 1, '2024-04-01 04:22:31', '2024-04-03 07:53:29', '2024-04-03 07:53:29', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (19, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:23:50', '2024-04-03 07:53:38', '2024-04-03 07:53:38', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (20, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:24:19', '2024-04-03 07:53:48', '2024-04-03 07:53:48', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (21, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-01 04:24:34', '2024-04-03 07:53:55', '2024-04-03 07:53:55', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (45, 79, 'Risk Capacity & Risk Appetie', 'risk_capacity_limit', 3, 'warning', 0, '2024-04-03 06:41:42', '2024-04-18 22:32:59', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (33, NULL, 'Referensi', 'master', 8, 'folder', 1, '2024-04-02 04:29:42', '2024-04-05 04:14:02', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (47, 79, 'Sasaran & Strategi Bisnis2', 'risk_sasaran', 2, 'check_circle', 0, '2024-04-03 06:54:47', '2024-04-18 22:33:22', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (48, 79, 'Matrix & Strategi Risiko', 'risk_metrik_strategi_risiko', 1, 'timeline', 0, '2024-04-03 06:55:24', '2024-04-18 22:33:41', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (79, NULL, 'Risk Register', 'risk_register', 1, 'list_alt', 1, '2024-04-17 07:11:54', '2024-04-17 08:01:32', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (82, 50, 'Risiko', 'risk_risiko', 1, 'risk', 1, '2024-04-18 04:02:25', '2024-04-18 04:02:25', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (83, 50, 'Penyebab', 'risk_penyebab', 2, 'couse', 1, '2024-04-18 04:03:03', '2024-04-18 04:03:03', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (63, 104, 'Dampak', 'mt_risk_dampak', 2, NULL, 1, '2024-04-05 07:20:28', '2024-05-10 03:24:43', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (70, 102, 'Kelompok Peristiwa Risiko', 'mt_risk_taksonomi', 3, NULL, 1, '2024-04-05 07:26:17', '2024-05-10 03:16:57', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (64, 104, 'Kemungkinan', 'mt_risk_kemungkinan', 1, NULL, 1, '2024-04-05 07:21:06', '2024-05-10 03:24:34', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (80, 33, 'Tingkat Agregasi Risiko', 'mt_risk_tingkat_agregasi_risiko', 1, NULL, 0, '2024-04-18 02:05:37', '2024-05-10 09:01:14', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (67, 33, 'Matrix Risiko', 'mt_risk_matrix', 5, NULL, 1, '2024-04-05 07:23:43', '2024-05-10 08:48:08', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (72, 102, 'Tema Risiko', 'mt_risk_taksonomi_objective', 1, NULL, 1, '2024-04-05 07:28:36', '2024-05-10 02:55:09', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (76, 105, 'Unit', 'mt_sdm_unit', NULL, NULL, 1, '2024-04-05 07:31:35', '2024-05-10 08:38:31', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (75, 105, 'Jabatan', 'mt_sdm_jabatan', NULL, NULL, 1, '2024-04-05 07:31:10', '2024-05-10 08:38:48', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (77, 105, 'Pegawai', 'mt_sdm_pegawai', NULL, NULL, 1, '2024-04-05 07:32:09', '2024-05-10 08:39:07', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (74, 73, 'Perlakuan Tingkat Risiko', 'mt_risk_tingkat_perlakuan', NULL, NULL, 0, '2024-04-05 07:30:08', '2024-05-10 08:47:14', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (73, 33, 'Tanggapan atas Risiko', 'mt_risk_tingkat', 4, NULL, 1, '2024-04-05 07:29:15', '2024-05-10 08:47:54', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (78, 33, 'Metrik Strategi Risiko', 'risk_metrik_strategi_risiko', NULL, NULL, 1, '2024-04-05 07:33:17', '2024-05-10 08:51:29', '2024-05-10 08:51:29', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (65, 104, 'Dampak Kriteria Risiko', 'mt_risk_kriteria_dampak', NULL, NULL, 0, '2024-04-05 07:21:48', '2024-05-10 08:52:24', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (81, 33, 'Status Pengajuan', 'mt_status_pengajuan', NULL, NULL, 0, '2024-04-18 02:10:45', '2024-05-10 08:56:27', '2024-05-10 08:56:27', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (69, 33, 'Sikap Terhadap Risiko', 'mt_risk_sikap_terhadap_risiko', 1, NULL, 1, '2024-04-05 07:25:37', '2024-05-10 09:05:13', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (68, 107, 'Opsi Perlakuan Risiko', 'mt_risk_perlakuan', 1, NULL, 1, '2024-04-05 07:24:38', '2024-05-10 09:06:45', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (84, 50, 'Dampak', 'risk_dampak', 3, 'impect', 1, '2024-04-18 04:03:38', '2024-04-18 04:03:38', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (50, NULL, 'Risk Library', 'risk_library', 6, 'library_books', 1, '2024-04-03 06:56:32', '2024-04-18 04:07:09', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (85, 33, 'Taksonomi', '-', NULL, NULL, 1, '2024-04-18 08:53:49', '2024-04-18 22:07:17', '2024-04-18 22:07:17', NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (95, 51, 'Metrik Strategi Risiko', 'laporan_matrik_strategi_risiko', 1, NULL, 1, '2024-05-07 02:51:28', '2024-05-07 02:51:52', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (94, 51, 'BK Risiko', 'laporan_bk_risiko', 3, 'report', 1, '2024-05-02 01:58:04', '2024-05-07 02:52:05', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (96, 51, 'Sasaran dan Strategi Bisnis', 'laporan_sasaran_strategi_bisnis', 2, NULL, 1, '2024-05-07 02:52:42', '2024-05-07 02:53:08', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (97, 51, 'Loss Event', 'laporan_loss_event', 4, NULL, 1, '2024-05-07 10:26:42', '2024-05-07 10:26:42', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (98, 51, 'Top Risk', 'laporan_top_risk', 4, NULL, 1, '2024-05-07 11:46:27', '2024-05-07 11:46:27', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (91, 79, 'Lost Event', 'lost_event', 3, 'warning', 0, '2024-04-26 02:31:20', '2024-05-09 04:00:20', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (102, 33, 'Kategori Risiko KBUMN', NULL, 1, NULL, 1, '2024-05-10 02:54:43', '2024-05-10 02:54:43', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (103, 33, 'Kategori Risiko Perusahaan', NULL, 2, NULL, 1, '2024-05-10 03:19:43', '2024-05-10 03:19:43', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (87, 103, 'Jenis Risiko', 'mt_risk_jenis_risiko', 2, NULL, 1, '2024-04-22 08:13:10', '2024-05-10 03:20:37', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (86, 103, 'Kategori Risiko', 'mt_risk_kategori_risiko', 1, NULL, 1, '2024-04-22 08:12:22', '2024-05-10 03:21:02', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (104, 33, 'Kriteria Risiko', NULL, 3, NULL, 1, '2024-05-10 03:22:37', '2024-05-10 03:22:37', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (92, 104, 'Kriteria Dampak Kualitatif Negatif', 'mt_risk_kriteria_dampak/-1', NULL, NULL, 1, '2024-04-26 02:41:39', '2024-05-10 03:25:22', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (93, 104, 'Kriteria Dampak Kualitatif Positif', 'mt_risk_kriteria_dampak/1', NULL, NULL, 1, '2024-04-26 08:49:33', '2024-05-10 03:25:37', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (105, 33, 'SDM', NULL, 10, NULL, 1, '2024-05-10 08:38:04', '2024-05-10 08:48:20', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (89, 106, 'Jenis Kontrol Risiko', 'mt_risk_jenis_control', NULL, NULL, 1, '2024-04-25 03:50:19', '2024-05-10 08:49:54', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (90, 106, 'Efektifitas Kontrol Risiko', 'mt_risk_efektifitas_control', NULL, NULL, 1, '2024-04-25 03:51:13', '2024-05-10 08:50:17', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (66, 104, 'Detail Dampak Kriteria Risiko', 'mt_risk_kriteria_dampak_detail', NULL, NULL, 0, '2024-04-05 07:22:48', '2024-05-10 08:52:14', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (88, 33, 'Sasaran Risiko', 'mt_risk_sasaran', 1, NULL, 1, '2024-04-23 08:52:32', '2024-05-10 09:00:50', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (107, 33, 'Perlakuan Risiko', NULL, 7, NULL, 1, '2024-05-10 09:05:29', '2024-05-10 09:05:29', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (100, 107, 'Jenis Perlakuan Risiko', 'mt_risk_jenis_perlakuan', 2, NULL, 1, '2024-05-08 06:23:24', '2024-05-10 09:06:58', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (101, 107, 'Status Rencana Perlakuan', 'mt_status_rencana_perlakuan', 3, NULL, 1, '2024-05-09 04:23:15', '2024-05-10 09:07:30', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (99, 107, 'Jenis Program RKAP', 'mt_risk_jenis_program_rkap', 2, NULL, 1, '2024-05-08 06:22:40', '2024-05-10 09:08:28', NULL, NULL, NULL);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) VALUES (106, 33, 'Kontrol Risiko', NULL, 6, NULL, 1, '2024-05-10 08:49:21', '2024-05-10 09:13:39', NULL, NULL, NULL);


--
-- TOC entry 5419 (class 0 OID 29181)
-- Dependencies: 216
-- Data for Name: sys_migration; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (1, '0001_01_01_000000_create_users_table', 1, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (2, '0001_01_01_000001_create_cache_table', 1, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (3, '0001_01_01_000002_create_jobs_table', 1, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (4, '2024_03_14_080020_create_articel_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (5, '2024_03_14_080020_create_sys_cache_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (6, '2024_03_14_080020_create_sys_cache_locks_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (7, '2024_03_14_080020_create_sys_failed_jobs_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (8, '2024_03_14_080020_create_sys_job_batches_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (9, '2024_03_14_080020_create_sys_jobs_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (10, '2024_03_14_080020_create_sys_password_reset_tokens_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (11, '2024_03_14_080020_create_sys_sessions_table', 0, NULL, NULL);
INSERT INTO public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) VALUES (12, '2024_03_14_080020_create_sys_users_table', 0, NULL, NULL);


--
-- TOC entry 5422 (class 0 OID 29198)
-- Dependencies: 219
-- Data for Name: sys_password_reset_token; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5423 (class 0 OID 29205)
-- Dependencies: 220
-- Data for Name: sys_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('I2guOEP58Awykx7AFZto1rLOASBgxbUXHsTCimiV', NULL, '192.168.1.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidHdrOUZObGtkMFRQVlBKbGZjQ0hydThiQVpGODVJT2RZT3VXTDAzeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713340336, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('sIMt0SZEileRYhsna1s00lhvVAetbpum7B83SOvL', NULL, '192.168.1.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlgxdFNFa3F2cGVyam56WHRQd09aQ1hSWTNrMldSN01zaVcwcDJFNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vMTkyLjE2OC4xLjQvaGtfcm1zL3B1YmxpYyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1713337803, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('Q8eJHmY9id4Hb3YXZu8TBYvOuZTGdo7dGSIlkmuG', NULL, '192.168.1.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ25qcjNRV3h3aUJlbU40N1BRbWppOGZ1TWpSOVhwcGlrUHBFSFlWNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713339752, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('Ab327WqjweQynUQ3cJoQ0SLpjvAherNbVMoMcqLU', NULL, '192.168.1.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmhRb1BGRnJEYm9iZFJCQlRsN2xtcFdiUU1yUlFjMm5KNGltNXhFWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713339888, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('sFyL5bzfYkuhAt6clrj4opS5a8LpKsL3n8GSrpDy', NULL, '192.168.1.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidXhDMXlWMFlPaElJRGIzWXgxZ01NUm9aZXpZVWgxWXNWQm1tNm13SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713340298, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('qswuC5gNERiR9tXR8vaGDPtRnquxLP91wcLr3wXq', NULL, '192.168.1.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieWY1ZjlTQWZiZlVRaTBxQkZubWx5TmtiTWZ2MTNHT3cwd2thbjVEaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713340349, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('vzW8iLyryC4sLHdePj4DfD7vgxFcGjiUODw0d1OD', 1, '192.168.1.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEN0WFYySGtwcGFHVXhGenRnTVBwZ1lYNDFOcmlTUzZxWUpVM3poVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1713340419, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('aLsesntU5ZTNyJ2e0LU7bS7iqSw5pFWicZqQzySw', NULL, '192.168.1.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUWI4aXlIOThJS2FaMTBjSUU5bkkwc3hreW93c1R4MFZiRFBmSEt0aCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713339880, NULL, NULL);
INSERT INTO public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) VALUES ('vNYy0yGYiJBk520pjtjp6fgs01gWPcNCXpBPGJ8w', NULL, '192.168.1.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSWhpMU5SSVVVRllJT2hmUk02a3BZWTNKV3VHZERlb3ViMzFwWHljSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713339904, NULL, NULL);


--
-- TOC entry 5438 (class 0 OID 30905)
-- Dependencies: 235
-- Data for Name: sys_setting; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5421 (class 0 OID 29188)
-- Dependencies: 218
-- Data for Name: sys_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt, deleted_at, deleted_by, deleted_by_desc) VALUES (1, 'Solikul Arip', 'solikul.arip@gmail.com', NULL, '$2y$12$JM0.n35quF6jl8Rvtd5EyOJfik0b1xGq/MDVYrnBErhxvnG2iI4Tq', NULL, '2024-03-14 06:51:28', '2024-03-14 06:51:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt, deleted_at, deleted_by, deleted_by_desc) VALUES (2, 'Test', 'test@gmail.com', NULL, '$2y$10$iNRmhIGOsrdmT3JZymxOhOtzh3W9phqODqtQMXgQRyVtvjttAiXcC', NULL, '2024-04-02 01:51:29', '2024-04-02 01:51:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5444 (class 0 OID 30951)
-- Dependencies: 241
-- Data for Name: sys_user_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sys_user_group (id_user, id_group, deleted_by, deleted_by_desc) VALUES (1, 1, NULL, NULL);


--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 338
-- Name: lost_event_id_lost_event_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lost_event_id_lost_event_seq', 1, false);


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 330
-- Name: mt_lost_event_kategori_id_lost_event_kategori_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_lost_event_kategori_id_lost_event_kategori_seq', 1, false);


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 334
-- Name: mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq', 1, false);


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 332
-- Name: mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq', 1, false);


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 336
-- Name: mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq', 1, false);


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 242
-- Name: mt_risk_dampak_id_dampak_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_dampak_id_dampak_seq', 5, true);


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 298
-- Name: mt_risk_efektifitas_control_id_efektifitas_control_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_efektifitas_control_id_efektifitas_control_seq', 5, true);


--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 294
-- Name: mt_risk_jenis_control_id_jenis_control_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_jenis_control_id_jenis_control_seq', 6, true);


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 304
-- Name: mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq', 2, true);


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 306
-- Name: mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq', 2, true);


--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 328
-- Name: mt_risk_jenis_risiko_id_jenis_risiko_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_jenis_risiko_id_jenis_risiko_seq', 11, true);


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 326
-- Name: mt_risk_kategori_risiko_id_kategori_risiko_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_kategori_risiko_id_kategori_risiko_seq', 3, true);


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 244
-- Name: mt_risk_kemungkinan_id_kemungkinan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_kemungkinan_id_kemungkinan_seq', 7, true);


--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 250
-- Name: mt_risk_kriteria_dampak_id_kriteria_dampak_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq', 14, true);


--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 254
-- Name: mt_risk_perlakuan_id_perluakuan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_perlakuan_id_perluakuan_seq', 2, true);


--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 265
-- Name: mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq', 4, true);


--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 261
-- Name: mt_risk_taksonomi_area_id_taksonomi_area_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq', 8, true);


--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 263
-- Name: mt_risk_taksonomi_id_taksonomi_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_taksonomi_id_taksonomi_seq', 21, true);


--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 259
-- Name: mt_risk_taksonomi_objective_id_taksonomi_objective_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq', 4, true);


--
-- TOC entry 5635 (class 0 OID 0)
-- Dependencies: 278
-- Name: mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq', 3, true);


--
-- TOC entry 5636 (class 0 OID 0)
-- Dependencies: 246
-- Name: mt_risk_tingkat_id_tingkat_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_risk_tingkat_id_tingkat_seq', 9, true);


--
-- TOC entry 5637 (class 0 OID 0)
-- Dependencies: 280
-- Name: mt_sasaran_id_sasaran_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_sasaran_id_sasaran_seq', 5, true);


--
-- TOC entry 5638 (class 0 OID 0)
-- Dependencies: 257
-- Name: mt_sdm_jabatan_id_jabatan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_sdm_jabatan_id_jabatan_seq', 5, true);


--
-- TOC entry 5639 (class 0 OID 0)
-- Dependencies: 343
-- Name: mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq', 4, true);


--
-- TOC entry 5640 (class 0 OID 0)
-- Dependencies: 274
-- Name: mt_status_pengajuan_id_status_pengajuan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_status_pengajuan_id_status_pengajuan_seq', 13, true);


--
-- TOC entry 5641 (class 0 OID 0)
-- Dependencies: 319
-- Name: mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq', 2, true);


--
-- TOC entry 5642 (class 0 OID 0)
-- Dependencies: 341
-- Name: mt_tamplate_laporan_id_tamplate_laporan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mt_tamplate_laporan_id_tamplate_laporan_seq', 7, true);


--
-- TOC entry 5643 (class 0 OID 0)
-- Dependencies: 272
-- Name: risk_capacity_limit_id_capacity_limit_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_capacity_limit_id_capacity_limit_seq', 4, true);


--
-- TOC entry 5644 (class 0 OID 0)
-- Dependencies: 286
-- Name: risk_dampak_id_dampak_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_dampak_id_dampak_seq', 15, true);


--
-- TOC entry 5645 (class 0 OID 0)
-- Dependencies: 267
-- Name: risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq', 4, true);


--
-- TOC entry 5646 (class 0 OID 0)
-- Dependencies: 323
-- Name: risk_msg_id_msg_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_msg_id_msg_seq', 1, false);


--
-- TOC entry 5647 (class 0 OID 0)
-- Dependencies: 284
-- Name: risk_penyebab_id_penyebab_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_penyebab_id_penyebab_seq', 27, true);


--
-- TOC entry 5648 (class 0 OID 0)
-- Dependencies: 296
-- Name: risk_profile_control_id_control_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_control_id_control_seq', 22, true);


--
-- TOC entry 5649 (class 0 OID 0)
-- Dependencies: 303
-- Name: risk_profile_dampak_id_profile_dampak_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_dampak_id_profile_dampak_seq', 11, true);


--
-- TOC entry 5650 (class 0 OID 0)
-- Dependencies: 288
-- Name: risk_profile_id_risk_profile_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_id_risk_profile_seq', 20, true);


--
-- TOC entry 5651 (class 0 OID 0)
-- Dependencies: 315
-- Name: risk_profile_kri_hasil_id_kri_hasil_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_kri_hasil_id_kri_hasil_seq', 12, true);


--
-- TOC entry 5652 (class 0 OID 0)
-- Dependencies: 292
-- Name: risk_profile_kri_id_kri_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_kri_id_kri_seq', 34, true);


--
-- TOC entry 5653 (class 0 OID 0)
-- Dependencies: 308
-- Name: risk_profile_mitigasi_id_mitigasi_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_mitigasi_id_mitigasi_seq', 12, true);


--
-- TOC entry 5654 (class 0 OID 0)
-- Dependencies: 345
-- Name: risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq', 6, true);


--
-- TOC entry 5655 (class 0 OID 0)
-- Dependencies: 321
-- Name: risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq', 10, true);


--
-- TOC entry 5656 (class 0 OID 0)
-- Dependencies: 317
-- Name: risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq', 1, false);


--
-- TOC entry 5657 (class 0 OID 0)
-- Dependencies: 311
-- Name: risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq', 110, true);


--
-- TOC entry 5658 (class 0 OID 0)
-- Dependencies: 302
-- Name: risk_profile_penyebab_id_profile_penyebab_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_penyebab_id_profile_penyebab_seq', 79, true);


--
-- TOC entry 5659 (class 0 OID 0)
-- Dependencies: 313
-- Name: risk_profile_realisasi_residual_id_realisasi_residual_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_realisasi_residual_id_realisasi_residual_seq', 4, true);


--
-- TOC entry 5660 (class 0 OID 0)
-- Dependencies: 300
-- Name: risk_profile_target_residual_id_target_residual_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_profile_target_residual_id_target_residual_seq', 22, true);


--
-- TOC entry 5661 (class 0 OID 0)
-- Dependencies: 276
-- Name: risk_register_id_register_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_register_id_register_seq', 39, true);


--
-- TOC entry 5662 (class 0 OID 0)
-- Dependencies: 282
-- Name: risk_risiko_id_risiko_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_risiko_id_risiko_seq', 12, true);


--
-- TOC entry 5663 (class 0 OID 0)
-- Dependencies: 269
-- Name: risk_sasaran_id_sasaran_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_sasaran_id_sasaran_seq', 6, true);


--
-- TOC entry 5664 (class 0 OID 0)
-- Dependencies: 340
-- Name: risk_sasaran_strategi_id_sasaran_strategi_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.risk_sasaran_strategi_id_sasaran_strategi_seq', 29, true);


--
-- TOC entry 5665 (class 0 OID 0)
-- Dependencies: 230
-- Name: sys_action_id_action_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sys_action_id_action_seq', 283, true);


--
-- TOC entry 5666 (class 0 OID 0)
-- Dependencies: 232
-- Name: sys_group_id_group_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sys_group_id_group_seq', 13, true);


--
-- TOC entry 5667 (class 0 OID 0)
-- Dependencies: 238
-- Name: sys_group_menu_id_group_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 1310, true);


--
-- TOC entry 5668 (class 0 OID 0)
-- Dependencies: 236
-- Name: sys_log_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sys_log_id_log_seq', 12211, true);


--
-- TOC entry 5669 (class 0 OID 0)
-- Dependencies: 228
-- Name: sys_menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 107, true);


--
-- TOC entry 5670 (class 0 OID 0)
-- Dependencies: 234
-- Name: sys_setting_id_setting_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);


--
-- TOC entry 5671 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 5069 (class 2606 OID 29227)
-- Name: sys_cache_lock cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_cache_lock
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 5067 (class 2606 OID 29220)
-- Name: sys_cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 5076 (class 2606 OID 29254)
-- Name: sys_failed_job failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 5078 (class 2606 OID 29256)
-- Name: sys_failed_job failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 5114 (class 2606 OID 31834)
-- Name: mt_risk_taksonomi_objective idx_18d8a35225719b65; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi_objective
    ADD CONSTRAINT idx_18d8a35225719b65 PRIMARY KEY (id_taksonomi_objective);


--
-- TOC entry 5112 (class 2606 OID 31792)
-- Name: mt_sdm_jabatan idx_1e38228f1edb51f5; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT idx_1e38228f1edb51f5 PRIMARY KEY (id_jabatan);


--
-- TOC entry 5130 (class 2606 OID 31950)
-- Name: mt_status_pengajuan idx_38d4e01f5bd43ed6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_status_pengajuan
    ADD CONSTRAINT idx_38d4e01f5bd43ed6 PRIMARY KEY (id_status_pengajuan);


--
-- TOC entry 5182 (class 2606 OID 32376)
-- Name: risk_msg_penerima idx_3c73a326dee309e5; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_msg_penerima
    ADD CONSTRAINT idx_3c73a326dee309e5 PRIMARY KEY (id_msg, id_user);


--
-- TOC entry 5150 (class 2606 OID 32163)
-- Name: risk_profile_kri idx_42f7b767e5e7e8f2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_kri
    ADD CONSTRAINT idx_42f7b767e5e7e8f2 PRIMARY KEY (id_kri);


--
-- TOC entry 5172 (class 2606 OID 32318)
-- Name: risk_profile_kri_hasil idx_590a4ea9ee7c6349; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_kri_hasil
    ADD CONSTRAINT idx_590a4ea9ee7c6349 PRIMARY KEY (id_kri_hasil);


--
-- TOC entry 5134 (class 2606 OID 32003)
-- Name: mt_risk_tingkat_agregasi_risiko idx_6d38b409db81e919; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko
    ADD CONSTRAINT idx_6d38b409db81e919 PRIMARY KEY (id_tingkat_agregasi_risiko);


--
-- TOC entry 5118 (class 2606 OID 31857)
-- Name: mt_risk_taksonomi idx_ae01f0becb598a2e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT idx_ae01f0becb598a2e PRIMARY KEY (id_taksonomi);


--
-- TOC entry 5180 (class 2606 OID 32370)
-- Name: risk_msg idx_bc4dae4133700974; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT idx_bc4dae4133700974 PRIMARY KEY (id_msg);


--
-- TOC entry 5132 (class 2606 OID 31961)
-- Name: risk_register idx_c3ae979ce28d717c; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT idx_c3ae979ce28d717c PRIMARY KEY (id_register);


--
-- TOC entry 5116 (class 2606 OID 31843)
-- Name: mt_risk_taksonomi_area idx_efeea3ec186756aa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT idx_efeea3ec186756aa PRIMARY KEY (id_taksonomi_area);


--
-- TOC entry 5074 (class 2606 OID 29244)
-- Name: sys_job_batch job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_job_batch
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 5071 (class 2606 OID 29236)
-- Name: sys_job jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 5196 (class 2606 OID 32581)
-- Name: lost_event lost_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_pkey PRIMARY KEY (id_lost_event);


--
-- TOC entry 5055 (class 2606 OID 29186)
-- Name: sys_migration migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_migration
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 5188 (class 2606 OID 32513)
-- Name: mt_lost_event_kategori mt_lost_event_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_kategori
    ADD CONSTRAINT mt_lost_event_kategori_pkey PRIMARY KEY (id_lost_event_kategori);


--
-- TOC entry 5192 (class 2606 OID 32531)
-- Name: mt_lost_event_frakuensi_kejadian mt_lost_event_kejadian_berulang_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian
    ADD CONSTRAINT mt_lost_event_kejadian_berulang_pkey PRIMARY KEY (id_lost_event_frakuensi_kejadian);


--
-- TOC entry 5190 (class 2606 OID 32522)
-- Name: mt_lost_event_sumber_penyebab_kejadian mt_lost_event_penyebab_kejadian_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian
    ADD CONSTRAINT mt_lost_event_penyebab_kejadian_pkey PRIMARY KEY (id_lost_event_sumber_penyebab_kejadian);


--
-- TOC entry 5194 (class 2606 OID 32540)
-- Name: mt_lost_event_status_asuransi mt_lost_event_status_asuransi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_lost_event_status_asuransi
    ADD CONSTRAINT mt_lost_event_status_asuransi_pkey PRIMARY KEY (id_lost_event_status_asuransi);


--
-- TOC entry 5092 (class 2606 OID 31194)
-- Name: mt_risk_dampak mt_risk_dampak_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_dampak
    ADD CONSTRAINT mt_risk_dampak_pkey PRIMARY KEY (id_dampak);


--
-- TOC entry 5156 (class 2606 OID 32191)
-- Name: mt_risk_efektifitas_control mt_risk_efektifitas_control_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_efektifitas_control
    ADD CONSTRAINT mt_risk_efektifitas_control_pkey PRIMARY KEY (id_efektifitas_control);


--
-- TOC entry 5152 (class 2606 OID 32175)
-- Name: mt_risk_jenis_control mt_risk_jenis_control_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_control
    ADD CONSTRAINT mt_risk_jenis_control_pkey PRIMARY KEY (id_jenis_control);


--
-- TOC entry 5160 (class 2606 OID 32234)
-- Name: mt_risk_jenis_perlakuan mt_risk_jenis_perlakuan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_perlakuan
    ADD CONSTRAINT mt_risk_jenis_perlakuan_pkey PRIMARY KEY (id_jenis_perlakuan);


--
-- TOC entry 5162 (class 2606 OID 32241)
-- Name: mt_risk_jenis_program_rkap mt_risk_jenis_program_rkap_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_program_rkap
    ADD CONSTRAINT mt_risk_jenis_program_rkap_pkey PRIMARY KEY (id_jenis_program_rkap);


--
-- TOC entry 5186 (class 2606 OID 32414)
-- Name: mt_risk_jenis_risiko mt_risk_jenis_risiko_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_risiko
    ADD CONSTRAINT mt_risk_jenis_risiko_pkey PRIMARY KEY (id_jenis_risiko);


--
-- TOC entry 5184 (class 2606 OID 32405)
-- Name: mt_risk_kategori_risiko mt_risk_kategori_risiko_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kategori_risiko
    ADD CONSTRAINT mt_risk_kategori_risiko_pkey PRIMARY KEY (id_kategori_risiko);


--
-- TOC entry 5094 (class 2606 OID 31209)
-- Name: mt_risk_kemungkinan mt_risk_kemungkinan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kemungkinan
    ADD CONSTRAINT mt_risk_kemungkinan_pkey PRIMARY KEY (id_kemungkinan);


--
-- TOC entry 5104 (class 2606 OID 31271)
-- Name: mt_risk_kriteria_dampak_detail mt_risk_kriteria_dampak_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT mt_risk_kriteria_dampak_detail_pkey PRIMARY KEY (id_kriteria_dampak, id_dampak);


--
-- TOC entry 5102 (class 2606 OID 31260)
-- Name: mt_risk_kriteria_dampak mt_risk_kriteria_dampak_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT mt_risk_kriteria_dampak_pkey PRIMARY KEY (id_kriteria_dampak);


--
-- TOC entry 5106 (class 2606 OID 34561)
-- Name: mt_risk_matrix mt_risk_matrix_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT mt_risk_matrix_pkey PRIMARY KEY (jenis, id_kemungkinan, id_dampak);


--
-- TOC entry 5108 (class 2606 OID 31761)
-- Name: mt_risk_perlakuan mt_risk_perlakuan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_perlakuan
    ADD CONSTRAINT mt_risk_perlakuan_pkey PRIMARY KEY (id_perlakuan);


--
-- TOC entry 5136 (class 2606 OID 32091)
-- Name: mt_risk_sasaran mt_risk_sasaran_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_sasaran
    ADD CONSTRAINT mt_risk_sasaran_pkey PRIMARY KEY (id_sasaran);


--
-- TOC entry 5120 (class 2606 OID 31871)
-- Name: mt_risk_sikap_terhadap_risiko mt_risk_sikap_terhadap_risiko_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko
    ADD CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey PRIMARY KEY (id_sikap_terhadap_risiko);


--
-- TOC entry 5110 (class 2606 OID 31766)
-- Name: mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_pkey PRIMARY KEY (id_tingkat, id_perlakuan);


--
-- TOC entry 5096 (class 2606 OID 31232)
-- Name: mt_risk_tingkat mt_risk_tingkat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat
    ADD CONSTRAINT mt_risk_tingkat_pkey PRIMARY KEY (id_tingkat);


--
-- TOC entry 5200 (class 2606 OID 32636)
-- Name: mt_sdm_kelompok_bisnis mt_sdm_kelompok_bisnis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_kelompok_bisnis
    ADD CONSTRAINT mt_sdm_kelompok_bisnis_pkey PRIMARY KEY (id_kelompok_bisnis);


--
-- TOC entry 5098 (class 2606 OID 31242)
-- Name: mt_sdm_pegawai mt_sdm_pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT mt_sdm_pegawai_pkey PRIMARY KEY (nid);


--
-- TOC entry 5100 (class 2606 OID 31250)
-- Name: mt_sdm_unit mt_sdm_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_pkey PRIMARY KEY (id_unit);


--
-- TOC entry 5176 (class 2606 OID 32347)
-- Name: mt_status_rencana_perlakuan mt_status_rencana_perlakuan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_status_rencana_perlakuan
    ADD CONSTRAINT mt_status_rencana_perlakuan_pkey PRIMARY KEY (id_status_rencana_perlakuan);


--
-- TOC entry 5198 (class 2606 OID 32619)
-- Name: mt_template_laporan mt_tamplate_laporan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_template_laporan
    ADD CONSTRAINT mt_tamplate_laporan_pkey PRIMARY KEY (id_template_laporan);


--
-- TOC entry 5061 (class 2606 OID 29204)
-- Name: sys_password_reset_token password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_password_reset_token
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 5128 (class 2606 OID 31928)
-- Name: risk_capacity_limit risk_capacity_limit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_pkey PRIMARY KEY (id_capacity_limit);


--
-- TOC entry 5142 (class 2606 OID 32060)
-- Name: risk_dampak risk_dampak_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak_pkey PRIMARY KEY (id_dampak);


--
-- TOC entry 5122 (class 2606 OID 31881)
-- Name: risk_metrik_strategi_risiko risk_metrik_strategi_risiko_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_pkey PRIMARY KEY (id_metrik_strategi_risiko);


--
-- TOC entry 5140 (class 2606 OID 32051)
-- Name: risk_penyebab risk_penyebab_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_pkey PRIMARY KEY (id_penyebab);


--
-- TOC entry 5154 (class 2606 OID 32184)
-- Name: risk_profile_control risk_profile_control_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_pkey PRIMARY KEY (id_control);


--
-- TOC entry 5148 (class 2606 OID 32225)
-- Name: risk_profile_dampak risk_profile_dampak_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_pkey PRIMARY KEY (id_profile_dampak);


--
-- TOC entry 5166 (class 2606 OID 32707)
-- Name: risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_pkey PRIMARY KEY (id_mitigasi_jenis);


--
-- TOC entry 5164 (class 2606 OID 32251)
-- Name: risk_profile_mitigasi risk_profile_mitigasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_pkey PRIMARY KEY (id_mitigasi);


--
-- TOC entry 5178 (class 2606 OID 32356)
-- Name: risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_pkey PRIMARY KEY (id_mitigasi_realisasi);


--
-- TOC entry 5168 (class 2606 OID 32296)
-- Name: risk_profile_mitigasi_timeline risk_profile_mitigasi_timeline_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_timeline
    ADD CONSTRAINT risk_profile_mitigasi_timeline_pkey PRIMARY KEY (id_mitigasi_timeline);


--
-- TOC entry 5174 (class 2606 OID 32335)
-- Name: risk_profile_mitigasi_timeline_realisasi risk_profile_mitigasi_timeline_realisasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_timeline_realisasi_pkey PRIMARY KEY (id_mitigasi_timeline_realisasi);


--
-- TOC entry 5146 (class 2606 OID 32215)
-- Name: risk_profile_penyebab risk_profile_penyebab_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_pkey PRIMARY KEY (id_profile_penyebab);


--
-- TOC entry 5144 (class 2606 OID 32089)
-- Name: risk_profile risk_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_pkey PRIMARY KEY (id_risk_profile);


--
-- TOC entry 5170 (class 2606 OID 32311)
-- Name: risk_profile_realisasi_residual risk_profile_realisasi_residual_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_realisasi_residual
    ADD CONSTRAINT risk_profile_realisasi_residual_pkey PRIMARY KEY (id_realisasi_residual);


--
-- TOC entry 5158 (class 2606 OID 32205)
-- Name: risk_profile_target_residual risk_profile_target_residual_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_target_residual
    ADD CONSTRAINT risk_profile_target_residual_pkey PRIMARY KEY (id_target_residual);


--
-- TOC entry 5138 (class 2606 OID 32024)
-- Name: risk_risiko risk_risiko_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_pkey PRIMARY KEY (id_risiko);


--
-- TOC entry 5124 (class 2606 OID 31906)
-- Name: risk_sasaran risk_sasaran_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_pkey PRIMARY KEY (id_sasaran);


--
-- TOC entry 5126 (class 2606 OID 32590)
-- Name: risk_sasaran_strategi risk_sasaran_strategi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_pkey PRIMARY KEY (id_sasaran_strategi);


--
-- TOC entry 5064 (class 2606 OID 29211)
-- Name: sys_session sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_session
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5082 (class 2606 OID 30891)
-- Name: sys_action sys_action_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT sys_action_pk PRIMARY KEY (id_action);


--
-- TOC entry 5090 (class 2606 OID 30926)
-- Name: sys_group_menu sys_group_menu_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT sys_group_menu_pk PRIMARY KEY (id_group_menu);


--
-- TOC entry 5084 (class 2606 OID 30903)
-- Name: sys_group sys_group_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group
    ADD CONSTRAINT sys_group_pk PRIMARY KEY (id_group);


--
-- TOC entry 5088 (class 2606 OID 31182)
-- Name: sys_log sys_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id_log);


--
-- TOC entry 5080 (class 2606 OID 30884)
-- Name: sys_menu sys_menu_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pk PRIMARY KEY (id_menu);


--
-- TOC entry 5086 (class 2606 OID 30912)
-- Name: sys_setting sys_setting_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_setting
    ADD CONSTRAINT sys_setting_pk PRIMARY KEY (id_setting);


--
-- TOC entry 5057 (class 2606 OID 29197)
-- Name: sys_user users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 5059 (class 2606 OID 29195)
-- Name: sys_user users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 5072 (class 1259 OID 29237)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.sys_job USING btree (queue);


--
-- TOC entry 5062 (class 1259 OID 29213)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_last_activity_index ON public.sys_session USING btree (last_activity);


--
-- TOC entry 5065 (class 1259 OID 29212)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_index ON public.sys_session USING btree (id_user);


--
-- TOC entry 5201 (class 2606 OID 30892)
-- Name: sys_action aksi_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT aksi_fk1 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;


--
-- TOC entry 5227 (class 2606 OID 31962)
-- Name: risk_register fk_388ab7f7f4fd9818; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_388ab7f7f4fd9818 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);


--
-- TOC entry 5210 (class 2606 OID 31272)
-- Name: mt_risk_kriteria_dampak_detail fk_41ba39047b02c6e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_41ba39047b02c6e5 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);


--
-- TOC entry 5211 (class 2606 OID 31277)
-- Name: mt_risk_kriteria_dampak_detail fk_4d57df3881e291e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_4d57df3881e291e2 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5228 (class 2606 OID 31967)
-- Name: risk_register fk_65f431cf37d7f015; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_65f431cf37d7f015 FOREIGN KEY (id_parent_register) REFERENCES public.risk_register(id_register);


--
-- TOC entry 5252 (class 2606 OID 32164)
-- Name: risk_profile_kri fk_6fcacdedc08a791a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_kri
    ADD CONSTRAINT fk_6fcacdedc08a791a FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;


--
-- TOC entry 5219 (class 2606 OID 31858)
-- Name: mt_risk_taksonomi fk_726c58c036e9bcdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT fk_726c58c036e9bcdd FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);


--
-- TOC entry 5229 (class 2606 OID 31972)
-- Name: risk_register fk_9bca8419236912b5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_9bca8419236912b5 FOREIGN KEY (id_owner) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5212 (class 2606 OID 31288)
-- Name: mt_risk_matrix fk_a4669bbd55458901; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_a4669bbd55458901 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5218 (class 2606 OID 31844)
-- Name: mt_risk_taksonomi_area fk_a9d39025b9658c1d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT fk_a9d39025b9658c1d FOREIGN KEY (id_taksonomi_objective) REFERENCES public.mt_risk_taksonomi_objective(id_taksonomi_objective);


--
-- TOC entry 5217 (class 2606 OID 31793)
-- Name: mt_sdm_jabatan fk_b743dfd89358fc4e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_b743dfd89358fc4e FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5213 (class 2606 OID 31293)
-- Name: mt_risk_matrix fk_d414e4107f6c8462; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_d414e4107f6c8462 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5263 (class 2606 OID 32319)
-- Name: risk_profile_kri_hasil fk_d4582e0c20c52b33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_kri_hasil
    ADD CONSTRAINT fk_d4582e0c20c52b33 FOREIGN KEY (id_kri) REFERENCES public.risk_profile_kri(id_kri) ON DELETE CASCADE;


--
-- TOC entry 5214 (class 2606 OID 31298)
-- Name: mt_risk_matrix fk_e3066883e2e9bb72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_e3066883e2e9bb72 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON DELETE CASCADE;


--
-- TOC entry 5230 (class 2606 OID 31977)
-- Name: risk_register fk_e839a323c85d81e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_e839a323c85d81e2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5209 (class 2606 OID 31261)
-- Name: mt_risk_kriteria_dampak fk_f9422fdc528daf94; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT fk_f9422fdc528daf94 FOREIGN KEY (id_induk) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);


--
-- TOC entry 5204 (class 2606 OID 30940)
-- Name: sys_group_action group_action_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk1 FOREIGN KEY (id_group_menu) REFERENCES public.sys_group_menu(id_group_menu) MATCH FULL;


--
-- TOC entry 5205 (class 2606 OID 30945)
-- Name: sys_group_action group_action_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk2 FOREIGN KEY (id_action) REFERENCES public.sys_action(id_action) MATCH FULL;


--
-- TOC entry 5202 (class 2606 OID 30927)
-- Name: sys_group_menu group_menu_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk1 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) MATCH FULL;


--
-- TOC entry 5203 (class 2606 OID 30932)
-- Name: sys_group_menu group_menu_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk2 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;


--
-- TOC entry 5268 (class 2606 OID 32550)
-- Name: lost_event lost_event_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk1 FOREIGN KEY (id_lost_event_kategori) REFERENCES public.mt_lost_event_kategori(id_lost_event_kategori) ON DELETE CASCADE;


--
-- TOC entry 5269 (class 2606 OID 32555)
-- Name: lost_event lost_event_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk2 FOREIGN KEY (id_lost_event_sumber_penyebab_kejadian) REFERENCES public.mt_lost_event_sumber_penyebab_kejadian(id_lost_event_sumber_penyebab_kejadian) ON DELETE CASCADE;


--
-- TOC entry 5270 (class 2606 OID 32560)
-- Name: lost_event lost_event_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk3 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE;


--
-- TOC entry 5271 (class 2606 OID 32565)
-- Name: lost_event lost_event_fk4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk4 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi);


--
-- TOC entry 5272 (class 2606 OID 32570)
-- Name: lost_event lost_event_fk5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk5 FOREIGN KEY (id_lost_event_frakuensi_kejadian) REFERENCES public.mt_lost_event_frakuensi_kejadian(id_lost_event_frakuensi_kejadian) ON DELETE CASCADE;


--
-- TOC entry 5273 (class 2606 OID 32575)
-- Name: lost_event lost_event_fk6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk6 FOREIGN KEY (id_lost_event_status_asuransi) REFERENCES public.mt_lost_event_status_asuransi(id_lost_event_status_asuransi) ON DELETE CASCADE;


--
-- TOC entry 5274 (class 2606 OID 32710)
-- Name: lost_event lost_event_fk7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk7 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5267 (class 2606 OID 32415)
-- Name: mt_risk_jenis_risiko mt_risk_jenis_risiko_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_jenis_risiko
    ADD CONSTRAINT mt_risk_jenis_risiko_fk FOREIGN KEY (id_kategori_risiko) REFERENCES public.mt_risk_kategori_risiko(id_kategori_risiko) ON DELETE CASCADE;


--
-- TOC entry 5215 (class 2606 OID 31767)
-- Name: mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk1 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5216 (class 2606 OID 31772)
-- Name: mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk2 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perlakuan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5208 (class 2606 OID 32638)
-- Name: mt_sdm_unit mt_sdm_unit_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_fk FOREIGN KEY (id_kelompok_bisnis) REFERENCES public.mt_sdm_kelompok_bisnis(id_kelompok_bisnis) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5226 (class 2606 OID 31982)
-- Name: risk_capacity_limit risk_capacity_limit_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_fk1 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5237 (class 2606 OID 32076)
-- Name: risk_dampak risk_dampak; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5238 (class 2606 OID 32495)
-- Name: risk_dampak risk_dampak_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak_fk1 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) NOT VALID;


--
-- TOC entry 5220 (class 2606 OID 32431)
-- Name: risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk1 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5221 (class 2606 OID 31887)
-- Name: risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk2 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5222 (class 2606 OID 32471)
-- Name: risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk3 FOREIGN KEY (id_sikap_terhadap_risiko) REFERENCES public.mt_risk_sikap_terhadap_risiko(id_sikap_terhadap_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5223 (class 2606 OID 31987)
-- Name: risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5235 (class 2606 OID 32071)
-- Name: risk_penyebab risk_penyebab_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_fk1 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5236 (class 2606 OID 32500)
-- Name: risk_penyebab risk_penyebab_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_fk2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) NOT VALID;


--
-- TOC entry 5253 (class 2606 OID 32192)
-- Name: risk_profile_control risk_profile_control_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_fk1 FOREIGN KEY (id_efektifitas_control) REFERENCES public.mt_risk_efektifitas_control(id_efektifitas_control) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5254 (class 2606 OID 32486)
-- Name: risk_profile_control risk_profile_control_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_fk2 FOREIGN KEY (id_jenis_control) REFERENCES public.mt_risk_jenis_control(id_jenis_control) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5250 (class 2606 OID 32145)
-- Name: risk_profile_dampak risk_profile_dampak_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;


--
-- TOC entry 5251 (class 2606 OID 32150)
-- Name: risk_profile_dampak risk_profile_dampak_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_fk2 FOREIGN KEY (id_dampak) REFERENCES public.risk_dampak(id_dampak) ON DELETE CASCADE;


--
-- TOC entry 5239 (class 2606 OID 32092)
-- Name: risk_profile risk_profile_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.mt_risk_sasaran(id_sasaran) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5240 (class 2606 OID 32463)
-- Name: risk_profile risk_profile_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk2 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5241 (class 2606 OID 32102)
-- Name: risk_profile risk_profile_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk3 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5242 (class 2606 OID 32107)
-- Name: risk_profile risk_profile_fk4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5243 (class 2606 OID 32476)
-- Name: risk_profile risk_profile_fk5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk5 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5244 (class 2606 OID 32591)
-- Name: risk_profile risk_profile_fk6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk6 FOREIGN KEY (id_dampak_inheren) REFERENCES public.mt_risk_dampak(id_dampak) NOT VALID;


--
-- TOC entry 5245 (class 2606 OID 32596)
-- Name: risk_profile risk_profile_fk7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk7 FOREIGN KEY (id_kemungkinan_inheren) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) NOT VALID;


--
-- TOC entry 5246 (class 2606 OID 32620)
-- Name: risk_profile risk_profile_fk8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk8 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak) ON DELETE SET NULL NOT VALID;


--
-- TOC entry 5247 (class 2606 OID 34555)
-- Name: risk_profile risk_profile_fk9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk9 FOREIGN KEY (id_risk_profile_sebelum) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5255 (class 2606 OID 32252)
-- Name: risk_profile_mitigasi risk_profile_mitigasi_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;


--
-- TOC entry 5256 (class 2606 OID 32257)
-- Name: risk_profile_mitigasi risk_profile_mitigasi_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk2 FOREIGN KEY (id_profile_penyebab) REFERENCES public.risk_profile_penyebab(id_profile_penyebab) ON DELETE CASCADE;


--
-- TOC entry 5257 (class 2606 OID 32262)
-- Name: risk_profile_mitigasi risk_profile_mitigasi_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk3 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perlakuan) ON DELETE CASCADE;


--
-- TOC entry 5258 (class 2606 OID 32267)
-- Name: risk_profile_mitigasi risk_profile_mitigasi_fk4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk4 FOREIGN KEY (id_jenis_program_rkap) REFERENCES public.mt_risk_jenis_program_rkap(id_jenis_program_rkap) ON DELETE CASCADE;


--
-- TOC entry 5259 (class 2606 OID 32272)
-- Name: risk_profile_mitigasi risk_profile_mitigasi_fk5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk5 FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE;


--
-- TOC entry 5260 (class 2606 OID 32280)
-- Name: risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_fk1 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi);


--
-- TOC entry 5261 (class 2606 OID 32285)
-- Name: risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_fk2 FOREIGN KEY (id_jenis_perlakuan) REFERENCES public.mt_risk_jenis_perlakuan(id_jenis_perlakuan) ON DELETE CASCADE;


--
-- TOC entry 5265 (class 2606 OID 32357)
-- Name: risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_fk1 FOREIGN KEY (id_status_rencana_perlakuan) REFERENCES public.mt_status_rencana_perlakuan(id_status_rencana_perlakuan) ON DELETE CASCADE;


--
-- TOC entry 5266 (class 2606 OID 32604)
-- Name: risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_fk2 FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5262 (class 2606 OID 32297)
-- Name: risk_profile_mitigasi_timeline risk_profile_mitigasi_timeline; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_timeline
    ADD CONSTRAINT risk_profile_mitigasi_timeline FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi) ON DELETE CASCADE;


--
-- TOC entry 5264 (class 2606 OID 32336)
-- Name: risk_profile_mitigasi_timeline_realisasi risk_profile_mitigasi_timeline_realisasi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_timeline_realisasi FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi) ON DELETE CASCADE;


--
-- TOC entry 5248 (class 2606 OID 32128)
-- Name: risk_profile_penyebab risk_profile_penyebab_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;


--
-- TOC entry 5249 (class 2606 OID 32133)
-- Name: risk_profile_penyebab risk_profile_penyebab_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_fk2 FOREIGN KEY (id_penyebab) REFERENCES public.risk_penyebab(id_penyebab) ON DELETE CASCADE;


--
-- TOC entry 5231 (class 2606 OID 32004)
-- Name: risk_register risk_register_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT risk_register_fk1 FOREIGN KEY (id_tingkat_agregasi_risiko) REFERENCES public.mt_risk_tingkat_agregasi_risiko(id_tingkat_agregasi_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5232 (class 2606 OID 32061)
-- Name: risk_risiko risk_risiko_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk1 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5233 (class 2606 OID 32447)
-- Name: risk_risiko risk_risiko_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk2 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5234 (class 2606 OID 32481)
-- Name: risk_risiko risk_risiko_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk3 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5224 (class 2606 OID 31992)
-- Name: risk_sasaran risk_sasaran_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_fk2 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 5225 (class 2606 OID 31912)
-- Name: risk_sasaran_strategi risk_sasaran_strategi_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.risk_sasaran(id_sasaran) ON DELETE CASCADE;


--
-- TOC entry 5206 (class 2606 OID 30954)
-- Name: sys_user_group sys_user_group_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk1 FOREIGN KEY (id_user) REFERENCES public.sys_user(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5207 (class 2606 OID 30959)
-- Name: sys_user_group sys_user_group_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-05-15 18:48:32

--
-- PostgreSQL database dump complete
--

