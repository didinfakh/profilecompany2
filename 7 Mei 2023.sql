PGDMP                      |         
   hk_rms_dev    16.2    16.0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    29179 
   hk_rms_dev    DATABASE     �   CREATE DATABASE hk_rms_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE hk_rms_dev;
                postgres    false            �            1259    29246    sys_failed_job    TABLE     l  CREATE TABLE public.sys_failed_job (
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
 "   DROP TABLE public.sys_failed_job;
       public         heap    postgres    false            �            1259    29245    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    227            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.sys_failed_job.id;
          public          postgres    false    226            �            1259    29229    sys_job    TABLE     >  CREATE TABLE public.sys_job (
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
    DROP TABLE public.sys_job;
       public         heap    postgres    false            �            1259    29228    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    224            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.sys_job.id;
          public          postgres    false    223            S           1259    32542 
   lost_event    TABLE       CREATE TABLE public.lost_event (
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
    status character varying(20)
);
    DROP TABLE public.lost_event;
       public         heap    postgres    false            R           1259    32541    lost_event_id_lost_event_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_event_id_lost_event_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.lost_event_id_lost_event_seq;
       public          postgres    false    339            �           0    0    lost_event_id_lost_event_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.lost_event_id_lost_event_seq OWNED BY public.lost_event.id_lost_event;
          public          postgres    false    338            �            1259    29181    sys_migration    TABLE     �   CREATE TABLE public.sys_migration (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 !   DROP TABLE public.sys_migration;
       public         heap    postgres    false            �            1259    29180    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    216            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.sys_migration.id;
          public          postgres    false    215            O           1259    32524     mt_lost_event_frakuensi_kejadian    TABLE     �  CREATE TABLE public.mt_lost_event_frakuensi_kejadian (
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
 4   DROP TABLE public.mt_lost_event_frakuensi_kejadian;
       public         heap    postgres    false            K           1259    32506    mt_lost_event_kategori    TABLE     �  CREATE TABLE public.mt_lost_event_kategori (
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
 *   DROP TABLE public.mt_lost_event_kategori;
       public         heap    postgres    false            J           1259    32505 1   mt_lost_event_kategori_id_lost_event_kategori_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq;
       public          postgres    false    331            �           0    0 1   mt_lost_event_kategori_id_lost_event_kategori_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq OWNED BY public.mt_lost_event_kategori.id_lost_event_kategori;
          public          postgres    false    330            N           1259    32523 ?   mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq;
       public          postgres    false    335            �           0    0 ?   mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq OWNED BY public.mt_lost_event_frakuensi_kejadian.id_lost_event_frakuensi_kejadian;
          public          postgres    false    334            M           1259    32515 &   mt_lost_event_sumber_penyebab_kejadian    TABLE     �  CREATE TABLE public.mt_lost_event_sumber_penyebab_kejadian (
    id_lost_event_penyebab_kejadian integer NOT NULL,
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
 :   DROP TABLE public.mt_lost_event_sumber_penyebab_kejadian;
       public         heap    postgres    false            L           1259    32514 ?   mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq;
       public          postgres    false    333            �           0    0 ?   mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq OWNED BY public.mt_lost_event_sumber_penyebab_kejadian.id_lost_event_penyebab_kejadian;
          public          postgres    false    332            Q           1259    32533    mt_lost_event_status_asuransi    TABLE     �  CREATE TABLE public.mt_lost_event_status_asuransi (
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
 1   DROP TABLE public.mt_lost_event_status_asuransi;
       public         heap    postgres    false            P           1259    32532 ?   mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq;
       public          postgres    false    337            �           0    0 ?   mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq OWNED BY public.mt_lost_event_status_asuransi.id_lost_event_status_asuransi;
          public          postgres    false    336            �            1259    31184    mt_risk_dampak    TABLE     �  CREATE TABLE public.mt_risk_dampak (
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
 "   DROP TABLE public.mt_risk_dampak;
       public         heap    postgres    false            �            1259    31183    mt_risk_dampak_id_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_dampak_id_dampak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.mt_risk_dampak_id_dampak_seq;
       public          postgres    false    243            �           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mt_risk_dampak_id_dampak_seq OWNED BY public.mt_risk_dampak.id_dampak;
          public          postgres    false    242            +           1259    32186    mt_risk_efektifitas_control    TABLE     �  CREATE TABLE public.mt_risk_efektifitas_control (
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
 /   DROP TABLE public.mt_risk_efektifitas_control;
       public         heap    postgres    false            *           1259    32185 6   mt_risk_efektifitas_control_id_efektifitas_control_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq;
       public          postgres    false    299            �           0    0 6   mt_risk_efektifitas_control_id_efektifitas_control_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq OWNED BY public.mt_risk_efektifitas_control.id_efektifitas_control;
          public          postgres    false    298            '           1259    32170    mt_risk_jenis_control    TABLE     �  CREATE TABLE public.mt_risk_jenis_control (
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
 )   DROP TABLE public.mt_risk_jenis_control;
       public         heap    postgres    false            &           1259    32169 *   mt_risk_jenis_control_id_jenis_control_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq;
       public          postgres    false    295            �           0    0 *   mt_risk_jenis_control_id_jenis_control_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq OWNED BY public.mt_risk_jenis_control.id_jenis_control;
          public          postgres    false    294            1           1259    32227    mt_risk_jenis_perlakuan    TABLE     ~   CREATE TABLE public.mt_risk_jenis_perlakuan (
    id_jenis_perlakuan integer NOT NULL,
    nama character varying NOT NULL
);
 +   DROP TABLE public.mt_risk_jenis_perlakuan;
       public         heap    postgres    false            0           1259    32226 .   mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq;
       public          postgres    false    305            �           0    0 .   mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq OWNED BY public.mt_risk_jenis_perlakuan.id_jenis_perlakuan;
          public          postgres    false    304            3           1259    32236    mt_risk_jenis_program_rkap    TABLE     �   CREATE TABLE public.mt_risk_jenis_program_rkap (
    id_jenis_program_rkap integer NOT NULL,
    nama character varying(200)
);
 .   DROP TABLE public.mt_risk_jenis_program_rkap;
       public         heap    postgres    false            2           1259    32235 4   mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq;
       public          postgres    false    307            �           0    0 4   mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq OWNED BY public.mt_risk_jenis_program_rkap.id_jenis_program_rkap;
          public          postgres    false    306            I           1259    32407    mt_risk_jenis_risiko    TABLE       CREATE TABLE public.mt_risk_jenis_risiko (
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
 (   DROP TABLE public.mt_risk_jenis_risiko;
       public         heap    postgres    false            H           1259    32406 (   mt_risk_jenis_risiko_id_jenis_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq;
       public          postgres    false    329            �           0    0 (   mt_risk_jenis_risiko_id_jenis_risiko_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq OWNED BY public.mt_risk_jenis_risiko.id_jenis_risiko;
          public          postgres    false    328            G           1259    32400    mt_risk_kategori_risiko    TABLE     �  CREATE TABLE public.mt_risk_kategori_risiko (
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
 +   DROP TABLE public.mt_risk_kategori_risiko;
       public         heap    postgres    false            F           1259    32399 .   mt_risk_kategori_risiko_id_kategori_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq;
       public          postgres    false    327            �           0    0 .   mt_risk_kategori_risiko_id_kategori_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq OWNED BY public.mt_risk_kategori_risiko.id_kategori_risiko;
          public          postgres    false    326            �            1259    31196    mt_risk_kemungkinan    TABLE     �  CREATE TABLE public.mt_risk_kemungkinan (
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
 '   DROP TABLE public.mt_risk_kemungkinan;
       public         heap    postgres    false            �            1259    31195 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq;
       public          postgres    false    245            �           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_risk_kemungkinan.id_kemungkinan;
          public          postgres    false    244            �            1259    31252    mt_risk_kriteria_dampak    TABLE     Q  CREATE TABLE public.mt_risk_kriteria_dampak (
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
 +   DROP TABLE public.mt_risk_kriteria_dampak;
       public         heap    postgres    false            �            1259    31266    mt_risk_kriteria_dampak_detail    TABLE       CREATE TABLE public.mt_risk_kriteria_dampak_detail (
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
 2   DROP TABLE public.mt_risk_kriteria_dampak_detail;
       public         heap    postgres    false            �            1259    31251 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq;
       public          postgres    false    251            �           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_risk_kriteria_dampak.id_kriteria_dampak;
          public          postgres    false    250            �            1259    31282    mt_risk_matrix    TABLE     6  CREATE TABLE public.mt_risk_matrix (
    id_dampak bigint NOT NULL,
    id_kemungkinan bigint NOT NULL,
    id_tingkat bigint,
    css character varying(200) DEFAULT NULL::character varying,
    jenis integer,
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
 "   DROP TABLE public.mt_risk_matrix;
       public         heap    postgres    false            �            1259    31754    mt_risk_perlakuan    TABLE     �  CREATE TABLE public.mt_risk_perlakuan (
    id_perluakuan integer NOT NULL,
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
 %   DROP TABLE public.mt_risk_perlakuan;
       public         heap    postgres    false            �            1259    31753 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq;
       public          postgres    false    255            �           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq OWNED BY public.mt_risk_perlakuan.id_perluakuan;
          public          postgres    false    254                       1259    32010    mt_risk_sasaran    TABLE     �  CREATE TABLE public.mt_risk_sasaran (
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
 #   DROP TABLE public.mt_risk_sasaran;
       public         heap    postgres    false            
           1259    31866    mt_risk_sikap_terhadap_risiko    TABLE     �  CREATE TABLE public.mt_risk_sikap_terhadap_risiko (
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
 1   DROP TABLE public.mt_risk_sikap_terhadap_risiko;
       public         heap    postgres    false            	           1259    31865 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq;
       public          postgres    false    266            �           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq OWNED BY public.mt_risk_sikap_terhadap_risiko.id_sikap_terhadap_risiko;
          public          postgres    false    265                       1259    31850    mt_risk_taksonomi    TABLE     N  CREATE TABLE public.mt_risk_taksonomi (
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
 %   DROP TABLE public.mt_risk_taksonomi;
       public         heap    postgres    false                       1259    31836    mt_risk_taksonomi_area    TABLE     /  CREATE TABLE public.mt_risk_taksonomi_area (
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
 *   DROP TABLE public.mt_risk_taksonomi_area;
       public         heap    postgres    false                       1259    31835 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq;
       public          postgres    false    262            �           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq OWNED BY public.mt_risk_taksonomi_area.id_taksonomi_area;
          public          postgres    false    261                       1259    31849 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq;
       public          postgres    false    264            �           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq OWNED BY public.mt_risk_taksonomi.id_taksonomi;
          public          postgres    false    263                       1259    31829    mt_risk_taksonomi_objective    TABLE       CREATE TABLE public.mt_risk_taksonomi_objective (
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
 /   DROP TABLE public.mt_risk_taksonomi_objective;
       public         heap    postgres    false                       1259    31828 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq;
       public          postgres    false    260            �           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq OWNED BY public.mt_risk_taksonomi_objective.id_taksonomi_objective;
          public          postgres    false    259            �            1259    31219    mt_risk_tingkat    TABLE     t  CREATE TABLE public.mt_risk_tingkat (
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
 #   DROP TABLE public.mt_risk_tingkat;
       public         heap    postgres    false                       1259    31998    mt_risk_tingkat_agregasi_risiko    TABLE       CREATE TABLE public.mt_risk_tingkat_agregasi_risiko (
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
 3   DROP TABLE public.mt_risk_tingkat_agregasi_risiko;
       public         heap    postgres    false                       1259    31997 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 U   DROP SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq;
       public          postgres    false    279            �           0    0 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq OWNED BY public.mt_risk_tingkat_agregasi_risiko.id_tingkat_agregasi_risiko;
          public          postgres    false    278            �            1259    31218    mt_risk_tingkat_id_tingkat_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_id_tingkat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mt_risk_tingkat_id_tingkat_seq;
       public          postgres    false    247            �           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mt_risk_tingkat_id_tingkat_seq OWNED BY public.mt_risk_tingkat.id_tingkat;
          public          postgres    false    246                        1259    31762    mt_risk_tingkat_perlakuan    TABLE     �   CREATE TABLE public.mt_risk_tingkat_perlakuan (
    id_tingkat bigint NOT NULL,
    id_perlakuan bigint NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 -   DROP TABLE public.mt_risk_tingkat_perlakuan;
       public         heap    postgres    false                       1259    32009    mt_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.mt_sasaran_id_sasaran_seq;
       public          postgres    false    281            �           0    0    mt_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.mt_sasaran_id_sasaran_seq OWNED BY public.mt_risk_sasaran.id_sasaran;
          public          postgres    false    280                       1259    31787    mt_sdm_jabatan    TABLE       CREATE TABLE public.mt_sdm_jabatan (
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
 "   DROP TABLE public.mt_sdm_jabatan;
       public         heap    postgres    false                       1259    31786    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq;
       public          postgres    false    258            �           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq OWNED BY public.mt_sdm_jabatan.id_jabatan;
          public          postgres    false    257            �            1259    31233    mt_sdm_pegawai    TABLE     p  CREATE TABLE public.mt_sdm_pegawai (
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
 "   DROP TABLE public.mt_sdm_pegawai;
       public         heap    postgres    false            �            1259    31243    mt_sdm_unit    TABLE     �  CREATE TABLE public.mt_sdm_unit (
    id_unit character varying(18) NOT NULL,
    nama character varying(100) NOT NULL,
    is_aktif character varying(1) DEFAULT '1'::character varying NOT NULL,
    kode_distrik character varying(2) DEFAULT NULL::character varying,
    id_mig_dep integer,
    kode_lama character varying(45) DEFAULT NULL::character varying,
    id_subunitkerja integer,
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
    DROP TABLE public.mt_sdm_unit;
       public         heap    postgres    false                       1259    31945    mt_status_pengajuan    TABLE     �  CREATE TABLE public.mt_status_pengajuan (
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
 '   DROP TABLE public.mt_status_pengajuan;
       public         heap    postgres    false                       1259    31944 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq;
       public          postgres    false    275            �           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq OWNED BY public.mt_status_pengajuan.id_status_pengajuan;
          public          postgres    false    274            @           1259    32342    mt_status_rencana_perlakuan    TABLE     �   CREATE TABLE public.mt_status_rencana_perlakuan (
    id_status_rencana_perlakuan integer NOT NULL,
    nama character varying(200)
);
 /   DROP TABLE public.mt_status_rencana_perlakuan;
       public         heap    postgres    false            ?           1259    32341 ;   mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 R   DROP SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq;
       public          postgres    false    320            �           0    0 ;   mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq OWNED BY public.mt_status_rencana_perlakuan.id_status_rencana_perlakuan;
          public          postgres    false    319            V           1259    32612    mt_template_laporan    TABLE     �  CREATE TABLE public.mt_template_laporan (
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
 '   DROP TABLE public.mt_template_laporan;
       public         heap    postgres    false            U           1259    32611 +   mt_tamplate_laporan_id_tamplate_laporan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq;
       public          postgres    false    342            �           0    0 +   mt_tamplate_laporan_id_tamplate_laporan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq OWNED BY public.mt_template_laporan.id_template_laporan;
          public          postgres    false    341                       1259    31923    risk_capacity_limit    TABLE     �  CREATE TABLE public.risk_capacity_limit (
    id_capacity_limit bigint NOT NULL,
    tahun integer NOT NULL,
    kapasitas_risiko numeric(15,2) NOT NULL,
    persentase_toleran numeric(5,2) NOT NULL,
    risk_limit numeric(5,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    total_realisasi_eksposur_risiko_residual numeric(15,2),
    id_register bigint,
    deleted_by bigint,
    deleted_by_desc character varying(200),
    status character varying(20)
);
 '   DROP TABLE public.risk_capacity_limit;
       public         heap    postgres    false                       1259    31922 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq;
       public          postgres    false    273            �           0    0 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq OWNED BY public.risk_capacity_limit.id_capacity_limit;
          public          postgres    false    272                       1259    32053    risk_dampak    TABLE       CREATE TABLE public.risk_dampak (
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
    DROP TABLE public.risk_dampak;
       public         heap    postgres    false                       1259    32052    risk_dampak_id_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_dampak_id_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.risk_dampak_id_dampak_seq;
       public          postgres    false    287            �           0    0    risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.risk_dampak_id_dampak_seq OWNED BY public.risk_dampak.id_dampak;
          public          postgres    false    286                       1259    31874    risk_metrik_strategi_risiko    TABLE       CREATE TABLE public.risk_metrik_strategi_risiko (
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
 /   DROP TABLE public.risk_metrik_strategi_risiko;
       public         heap    postgres    false                       1259    31873 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq;
       public          postgres    false    268            �           0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq OWNED BY public.risk_metrik_strategi_risiko.id_metrik_strategi_risiko;
          public          postgres    false    267            D           1259    32363    risk_msg    TABLE        CREATE TABLE public.risk_msg (
    id_msg bigint NOT NULL,
    msg character varying(4000),
    url character varying(4000)
);
    DROP TABLE public.risk_msg;
       public         heap    postgres    false            C           1259    32362    risk_msg_id_msg_seq    SEQUENCE     |   CREATE SEQUENCE public.risk_msg_id_msg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_msg_id_msg_seq;
       public          postgres    false    324            �           0    0    risk_msg_id_msg_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_msg_id_msg_seq OWNED BY public.risk_msg.id_msg;
          public          postgres    false    323            E           1259    32371    risk_msg_penerima    TABLE     �   CREATE TABLE public.risk_msg_penerima (
    id_msg bigint NOT NULL,
    is_read character varying(1) DEFAULT '0'::character varying,
    id_user bigint NOT NULL
);
 %   DROP TABLE public.risk_msg_penerima;
       public         heap    postgres    false                       1259    32044    risk_penyebab    TABLE     #  CREATE TABLE public.risk_penyebab (
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
 !   DROP TABLE public.risk_penyebab;
       public         heap    postgres    false                       1259    32043    risk_penyebab_id_penyebab_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_penyebab_id_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_penyebab_id_penyebab_seq;
       public          postgres    false    285            �           0    0    risk_penyebab_id_penyebab_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_penyebab_id_penyebab_seq OWNED BY public.risk_penyebab.id_penyebab;
          public          postgres    false    284            !           1259    32082    risk_profile    TABLE     �  CREATE TABLE public.risk_profile (
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
    tanggapan character varying(2000)
);
     DROP TABLE public.risk_profile;
       public         heap    postgres    false            )           1259    32177    risk_profile_control    TABLE       CREATE TABLE public.risk_profile_control (
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
 (   DROP TABLE public.risk_profile_control;
       public         heap    postgres    false            (           1259    32176 #   risk_profile_control_id_control_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_control_id_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.risk_profile_control_id_control_seq;
       public          postgres    false    297            �           0    0 #   risk_profile_control_id_control_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.risk_profile_control_id_control_seq OWNED BY public.risk_profile_control.id_control;
          public          postgres    false    296            #           1259    32138    risk_profile_dampak    TABLE     \  CREATE TABLE public.risk_profile_dampak (
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
 '   DROP TABLE public.risk_profile_dampak;
       public         heap    postgres    false            /           1259    32216 )   risk_profile_dampak_id_profile_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq;
       public          postgres    false    291            �           0    0 )   risk_profile_dampak_id_profile_dampak_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq OWNED BY public.risk_profile_dampak.id_profile_dampak;
          public          postgres    false    303                        1259    32081     risk_profile_id_risk_profile_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_id_risk_profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.risk_profile_id_risk_profile_seq;
       public          postgres    false    289            �           0    0     risk_profile_id_risk_profile_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.risk_profile_id_risk_profile_seq OWNED BY public.risk_profile.id_risk_profile;
          public          postgres    false    288            %           1259    32156    risk_profile_kri    TABLE     b  CREATE TABLE public.risk_profile_kri (
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
 $   DROP TABLE public.risk_profile_kri;
       public         heap    postgres    false            <           1259    32313    risk_profile_kri_hasil    TABLE     �  CREATE TABLE public.risk_profile_kri_hasil (
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
    threshold character varying(100)
);
 *   DROP TABLE public.risk_profile_kri_hasil;
       public         heap    postgres    false            ;           1259    32312 '   risk_profile_kri_hasil_id_kri_hasil_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq;
       public          postgres    false    316            �           0    0 '   risk_profile_kri_hasil_id_kri_hasil_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq OWNED BY public.risk_profile_kri_hasil.id_kri_hasil;
          public          postgres    false    315            $           1259    32155    risk_profile_kri_id_kri_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_kri_id_kri_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_profile_kri_id_kri_seq;
       public          postgres    false    293            �           0    0    risk_profile_kri_id_kri_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_profile_kri_id_kri_seq OWNED BY public.risk_profile_kri.id_kri;
          public          postgres    false    292            5           1259    32244    risk_profile_mitigasi    TABLE     �  CREATE TABLE public.risk_profile_mitigasi (
    id_mitigasi bigint NOT NULL,
    id_risk_profile bigint,
    id_profile_penyebab bigint,
    id_perluakuan integer,
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
 )   DROP TABLE public.risk_profile_mitigasi;
       public         heap    postgres    false            4           1259    32243 %   risk_profile_mitigasi_id_mitigasi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq;
       public          postgres    false    309            �           0    0 %   risk_profile_mitigasi_id_mitigasi_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq OWNED BY public.risk_profile_mitigasi.id_mitigasi;
          public          postgres    false    308            6           1259    32277    risk_profile_mitigasi_jenis    TABLE     l   CREATE TABLE public.risk_profile_mitigasi_jenis (
    id_mitigasi bigint,
    id_jenis_perlakuan integer
);
 /   DROP TABLE public.risk_profile_mitigasi_jenis;
       public         heap    postgres    false            B           1259    32349    risk_profile_mitigasi_realisasi    TABLE     �  CREATE TABLE public.risk_profile_mitigasi_realisasi (
    id_mitigasi_realisasi bigint NOT NULL,
    id_mitigasi bigint,
    periode character varying(20),
    id_status_rencana_perlakuan integer,
    penjelasan_status_rencana_perlakuan character varying(3000),
    progress numeric(5,2),
    nama character varying(2000),
    output_perlakuan character varying(2000),
    biaya numeric(15,2),
    id_pic integer
);
 3   DROP TABLE public.risk_profile_mitigasi_realisasi;
       public         heap    postgres    false            A           1259    32348 9   risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq;
       public          postgres    false    322            �           0    0 9   risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq OWNED BY public.risk_profile_mitigasi_realisasi.id_mitigasi_realisasi;
          public          postgres    false    321            >           1259    32330 (   risk_profile_mitigasi_timeline_realisasi    TABLE     �   CREATE TABLE public.risk_profile_mitigasi_timeline_realisasi (
    id_mitigasi_timeline_realisasi bigint NOT NULL,
    periode character varying(20) NOT NULL,
    is_proses integer NOT NULL,
    id_mitigasi bigint
);
 <   DROP TABLE public.risk_profile_mitigasi_timeline_realisasi;
       public         heap    postgres    false            =           1259    32329 ?   risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq;
       public          postgres    false    318            �           0    0 ?   risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq OWNED BY public.risk_profile_mitigasi_timeline_realisasi.id_mitigasi_timeline_realisasi;
          public          postgres    false    317            8           1259    32291    risk_profile_mitigasi_timeline    TABLE     �   CREATE TABLE public.risk_profile_mitigasi_timeline (
    id_mitigasi_timeline bigint NOT NULL,
    periode character varying(20) NOT NULL,
    is_proses integer NOT NULL,
    id_mitigasi bigint
);
 2   DROP TABLE public.risk_profile_mitigasi_timeline;
       public         heap    postgres    false            7           1259    32290 7   risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq;
       public          postgres    false    312            �           0    0 7   risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq OWNED BY public.risk_profile_mitigasi_timeline.id_mitigasi_timeline;
          public          postgres    false    311            "           1259    32121    risk_profile_penyebab    TABLE     3  CREATE TABLE public.risk_profile_penyebab (
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
 )   DROP TABLE public.risk_profile_penyebab;
       public         heap    postgres    false            .           1259    32206 -   risk_profile_penyebab_id_profile_penyebab_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq;
       public          postgres    false    290            �           0    0 -   risk_profile_penyebab_id_profile_penyebab_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq OWNED BY public.risk_profile_penyebab.id_profile_penyebab;
          public          postgres    false    302            :           1259    32304    risk_profile_realisasi_residual    TABLE     �  CREATE TABLE public.risk_profile_realisasi_residual (
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
 3   DROP TABLE public.risk_profile_realisasi_residual;
       public         heap    postgres    false            9           1259    32303 9   risk_profile_realisasi_residual_id_realisasi_residual_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq;
       public          postgres    false    314            �           0    0 9   risk_profile_realisasi_residual_id_realisasi_residual_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq OWNED BY public.risk_profile_realisasi_residual.id_realisasi_residual;
          public          postgres    false    313            -           1259    32198    risk_profile_target_residual    TABLE     c  CREATE TABLE public.risk_profile_target_residual (
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
 0   DROP TABLE public.risk_profile_target_residual;
       public         heap    postgres    false            ,           1259    32197 3   risk_profile_target_residual_id_target_residual_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_target_residual_id_target_residual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.risk_profile_target_residual_id_target_residual_seq;
       public          postgres    false    301            �           0    0 3   risk_profile_target_residual_id_target_residual_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_target_residual_id_target_residual_seq OWNED BY public.risk_profile_target_residual.id_target_residual;
          public          postgres    false    300                       1259    31952    risk_register    TABLE     �  CREATE TABLE public.risk_register (
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
 !   DROP TABLE public.risk_register;
       public         heap    postgres    false                       1259    31951    risk_register_id_register_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_register_id_register_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_register_id_register_seq;
       public          postgres    false    277            �           0    0    risk_register_id_register_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_register_id_register_seq OWNED BY public.risk_register.id_register;
          public          postgres    false    276                       1259    32017    risk_risiko    TABLE     ?  CREATE TABLE public.risk_risiko (
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
    DROP TABLE public.risk_risiko;
       public         heap    postgres    false                       1259    32016    risk_risiko_id_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_risiko_id_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.risk_risiko_id_risiko_seq;
       public          postgres    false    283            �           0    0    risk_risiko_id_risiko_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.risk_risiko_id_risiko_seq OWNED BY public.risk_risiko.id_risiko;
          public          postgres    false    282                       1259    31898    risk_sasaran    TABLE     �  CREATE TABLE public.risk_sasaran (
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
     DROP TABLE public.risk_sasaran;
       public         heap    postgres    false                       1259    31897    risk_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_sasaran_id_sasaran_seq;
       public          postgres    false    270            �           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_sasaran_id_sasaran_seq OWNED BY public.risk_sasaran.id_sasaran;
          public          postgres    false    269                       1259    31907    risk_sasaran_strategi    TABLE     �  CREATE TABLE public.risk_sasaran_strategi (
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
 )   DROP TABLE public.risk_sasaran_strategi;
       public         heap    postgres    false            T           1259    32582 -   risk_sasaran_strategi_id_sasaran_strategi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq;
       public          postgres    false    271            �           0    0 -   risk_sasaran_strategi_id_sasaran_strategi_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq OWNED BY public.risk_sasaran_strategi.id_sasaran_strategi;
          public          postgres    false    340            �            1259    30886 
   sys_action    TABLE     �  CREATE TABLE public.sys_action (
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
    DROP TABLE public.sys_action;
       public         heap    postgres    false            �            1259    30885    sys_action_id_action_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_action_id_action_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sys_action_id_action_seq;
       public          postgres    false    231            �           0    0    sys_action_id_action_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sys_action_id_action_seq OWNED BY public.sys_action.id_action;
          public          postgres    false    230            �            1259    29214 	   sys_cache    TABLE     �   CREATE TABLE public.sys_cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
    DROP TABLE public.sys_cache;
       public         heap    postgres    false            �            1259    29221    sys_cache_lock    TABLE     �   CREATE TABLE public.sys_cache_lock (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 "   DROP TABLE public.sys_cache_lock;
       public         heap    postgres    false            �            1259    30898 	   sys_group    TABLE     �  CREATE TABLE public.sys_group (
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
    DROP TABLE public.sys_group;
       public         heap    postgres    false            �            1259    30937    sys_group_action    TABLE     �  CREATE TABLE public.sys_group_action (
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
 $   DROP TABLE public.sys_group_action;
       public         heap    postgres    false            �            1259    30897    sys_group_id_group_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_group_id_group_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.sys_group_id_group_seq;
       public          postgres    false    233            �           0    0    sys_group_id_group_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sys_group_id_group_seq OWNED BY public.sys_group.id_group;
          public          postgres    false    232            �            1259    30921    sys_group_menu    TABLE     �  CREATE TABLE public.sys_group_menu (
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
 "   DROP TABLE public.sys_group_menu;
       public         heap    postgres    false            �            1259    30920     sys_group_menu_id_group_menu_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_group_menu_id_group_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.sys_group_menu_id_group_menu_seq;
       public          postgres    false    239            �           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.sys_group_menu_id_group_menu_seq OWNED BY public.sys_group_menu.id_group_menu;
          public          postgres    false    238            �            1259    29238    sys_job_batch    TABLE     �  CREATE TABLE public.sys_job_batch (
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
 !   DROP TABLE public.sys_job_batch;
       public         heap    postgres    false            �            1259    30914    sys_log    TABLE     {  CREATE TABLE public.sys_log (
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
    DROP TABLE public.sys_log;
       public         heap    postgres    false            �            1259    30913    sys_log_id_log_seq    SEQUENCE     {   CREATE SEQUENCE public.sys_log_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sys_log_id_log_seq;
       public          postgres    false    237            �           0    0    sys_log_id_log_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sys_log_id_log_seq OWNED BY public.sys_log.id_log;
          public          postgres    false    236            �            1259    30879    sys_menu    TABLE     �  CREATE TABLE public.sys_menu (
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
    DROP TABLE public.sys_menu;
       public         heap    postgres    false            �            1259    30878    sys_menu_id_menu_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_menu_id_menu_seq;
       public          postgres    false    229            �           0    0    sys_menu_id_menu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_id_menu_seq OWNED BY public.sys_menu.id_menu;
          public          postgres    false    228            �            1259    29198    sys_password_reset_token    TABLE     �   CREATE TABLE public.sys_password_reset_token (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 ,   DROP TABLE public.sys_password_reset_token;
       public         heap    postgres    false            �            1259    29205    sys_session    TABLE       CREATE TABLE public.sys_session (
    id character varying(255) NOT NULL,
    id_user bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
    DROP TABLE public.sys_session;
       public         heap    postgres    false            �            1259    30905    sys_setting    TABLE     �   CREATE TABLE public.sys_setting (
    id_setting integer NOT NULL,
    nama character varying(100),
    isi character varying(500),
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
    DROP TABLE public.sys_setting;
       public         heap    postgres    false            �            1259    30904    sys_setting_id_setting_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_setting_id_setting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.sys_setting_id_setting_seq;
       public          postgres    false    235            �           0    0    sys_setting_id_setting_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_setting_id_setting_seq OWNED BY public.sys_setting.id_setting;
          public          postgres    false    234            �            1259    29188    sys_user    TABLE     �  CREATE TABLE public.sys_user (
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
    DROP TABLE public.sys_user;
       public         heap    postgres    false            �            1259    30951    sys_user_group    TABLE     �   CREATE TABLE public.sys_user_group (
    id_user bigint,
    id_group bigint,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 "   DROP TABLE public.sys_user_group;
       public         heap    postgres    false            �            1259    29187    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            �           0    0    users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_id_seq OWNED BY public.sys_user.id_user;
          public          postgres    false    217            �           2604    32545    lost_event id_lost_event    DEFAULT     �   ALTER TABLE ONLY public.lost_event ALTER COLUMN id_lost_event SET DEFAULT nextval('public.lost_event_id_lost_event_seq'::regclass);
 G   ALTER TABLE public.lost_event ALTER COLUMN id_lost_event DROP DEFAULT;
       public          postgres    false    339    338    339            �           2604    32527 A   mt_lost_event_frakuensi_kejadian id_lost_event_frakuensi_kejadian    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian ALTER COLUMN id_lost_event_frakuensi_kejadian SET DEFAULT nextval('public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq'::regclass);
 p   ALTER TABLE public.mt_lost_event_frakuensi_kejadian ALTER COLUMN id_lost_event_frakuensi_kejadian DROP DEFAULT;
       public          postgres    false    335    334    335            �           2604    32509 -   mt_lost_event_kategori id_lost_event_kategori    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_kategori ALTER COLUMN id_lost_event_kategori SET DEFAULT nextval('public.mt_lost_event_kategori_id_lost_event_kategori_seq'::regclass);
 \   ALTER TABLE public.mt_lost_event_kategori ALTER COLUMN id_lost_event_kategori DROP DEFAULT;
       public          postgres    false    330    331    331            �           2604    32536 ;   mt_lost_event_status_asuransi id_lost_event_status_asuransi    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_status_asuransi ALTER COLUMN id_lost_event_status_asuransi SET DEFAULT nextval('public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq'::regclass);
 j   ALTER TABLE public.mt_lost_event_status_asuransi ALTER COLUMN id_lost_event_status_asuransi DROP DEFAULT;
       public          postgres    false    336    337    337            �           2604    32518 F   mt_lost_event_sumber_penyebab_kejadian id_lost_event_penyebab_kejadian    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian ALTER COLUMN id_lost_event_penyebab_kejadian SET DEFAULT nextval('public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq'::regclass);
 u   ALTER TABLE public.mt_lost_event_sumber_penyebab_kejadian ALTER COLUMN id_lost_event_penyebab_kejadian DROP DEFAULT;
       public          postgres    false    332    333    333            v           2604    31187    mt_risk_dampak id_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_risk_dampak_id_dampak_seq'::regclass);
 G   ALTER TABLE public.mt_risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    32189 2   mt_risk_efektifitas_control id_efektifitas_control    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_control ALTER COLUMN id_efektifitas_control SET DEFAULT nextval('public.mt_risk_efektifitas_control_id_efektifitas_control_seq'::regclass);
 a   ALTER TABLE public.mt_risk_efektifitas_control ALTER COLUMN id_efektifitas_control DROP DEFAULT;
       public          postgres    false    299    298    299            �           2604    32173 &   mt_risk_jenis_control id_jenis_control    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_control ALTER COLUMN id_jenis_control SET DEFAULT nextval('public.mt_risk_jenis_control_id_jenis_control_seq'::regclass);
 U   ALTER TABLE public.mt_risk_jenis_control ALTER COLUMN id_jenis_control DROP DEFAULT;
       public          postgres    false    295    294    295            �           2604    32230 *   mt_risk_jenis_perlakuan id_jenis_perlakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_perlakuan ALTER COLUMN id_jenis_perlakuan SET DEFAULT nextval('public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_jenis_perlakuan ALTER COLUMN id_jenis_perlakuan DROP DEFAULT;
       public          postgres    false    305    304    305            �           2604    32239 0   mt_risk_jenis_program_rkap id_jenis_program_rkap    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_program_rkap ALTER COLUMN id_jenis_program_rkap SET DEFAULT nextval('public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq'::regclass);
 _   ALTER TABLE public.mt_risk_jenis_program_rkap ALTER COLUMN id_jenis_program_rkap DROP DEFAULT;
       public          postgres    false    306    307    307            �           2604    32410 $   mt_risk_jenis_risiko id_jenis_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_risiko ALTER COLUMN id_jenis_risiko SET DEFAULT nextval('public.mt_risk_jenis_risiko_id_jenis_risiko_seq'::regclass);
 S   ALTER TABLE public.mt_risk_jenis_risiko ALTER COLUMN id_jenis_risiko DROP DEFAULT;
       public          postgres    false    329    328    329            �           2604    32403 *   mt_risk_kategori_risiko id_kategori_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kategori_risiko ALTER COLUMN id_kategori_risiko SET DEFAULT nextval('public.mt_risk_kategori_risiko_id_kategori_risiko_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kategori_risiko ALTER COLUMN id_kategori_risiko DROP DEFAULT;
       public          postgres    false    327    326    327            x           2604    31199 "   mt_risk_kemungkinan id_kemungkinan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_risk_kemungkinan_id_kemungkinan_seq'::regclass);
 Q   ALTER TABLE public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    31255 *   mt_risk_kriteria_dampak id_kriteria_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak DROP DEFAULT;
       public          postgres    false    251    250    251            �           2604    31757    mt_risk_perlakuan id_perluakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_perlakuan ALTER COLUMN id_perluakuan SET DEFAULT nextval('public.mt_risk_perlakuan_id_perluakuan_seq'::regclass);
 N   ALTER TABLE public.mt_risk_perlakuan ALTER COLUMN id_perluakuan DROP DEFAULT;
       public          postgres    false    255    254    255            �           2604    32013    mt_risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.mt_sasaran_id_sasaran_seq'::regclass);
 I   ALTER TABLE public.mt_risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    281    280    281            �           2604    31869 6   mt_risk_sikap_terhadap_risiko id_sikap_terhadap_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko SET DEFAULT nextval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq'::regclass);
 e   ALTER TABLE public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko DROP DEFAULT;
       public          postgres    false    266    265    266            �           2604    31853    mt_risk_taksonomi id_taksonomi    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi ALTER COLUMN id_taksonomi SET DEFAULT nextval('public.mt_risk_taksonomi_id_taksonomi_seq'::regclass);
 M   ALTER TABLE public.mt_risk_taksonomi ALTER COLUMN id_taksonomi DROP DEFAULT;
       public          postgres    false    263    264    264            �           2604    31839 (   mt_risk_taksonomi_area id_taksonomi_area    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area SET DEFAULT nextval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq'::regclass);
 W   ALTER TABLE public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area DROP DEFAULT;
       public          postgres    false    261    262    262            �           2604    31832 2   mt_risk_taksonomi_objective id_taksonomi_objective    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective SET DEFAULT nextval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq'::regclass);
 a   ALTER TABLE public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective DROP DEFAULT;
       public          postgres    false    260    259    260            {           2604    31222    mt_risk_tingkat id_tingkat    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_risk_tingkat_id_tingkat_seq'::regclass);
 I   ALTER TABLE public.mt_risk_tingkat ALTER COLUMN id_tingkat DROP DEFAULT;
       public          postgres    false    247    246    247            �           2604    32001 :   mt_risk_tingkat_agregasi_risiko id_tingkat_agregasi_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko SET DEFAULT nextval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq'::regclass);
 i   ALTER TABLE public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko DROP DEFAULT;
       public          postgres    false    278    279    279            �           2604    31790    mt_sdm_jabatan id_jabatan    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.mt_sdm_jabatan_id_jabatan_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_jabatan ALTER COLUMN id_jabatan DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    31948 '   mt_status_pengajuan id_status_pengajuan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan SET DEFAULT nextval('public.mt_status_pengajuan_id_status_pengajuan_seq'::regclass);
 V   ALTER TABLE public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan DROP DEFAULT;
       public          postgres    false    274    275    275            �           2604    32345 7   mt_status_rencana_perlakuan id_status_rencana_perlakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_rencana_perlakuan ALTER COLUMN id_status_rencana_perlakuan SET DEFAULT nextval('public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq'::regclass);
 f   ALTER TABLE public.mt_status_rencana_perlakuan ALTER COLUMN id_status_rencana_perlakuan DROP DEFAULT;
       public          postgres    false    319    320    320            �           2604    32615 '   mt_template_laporan id_template_laporan    DEFAULT     �   ALTER TABLE ONLY public.mt_template_laporan ALTER COLUMN id_template_laporan SET DEFAULT nextval('public.mt_tamplate_laporan_id_tamplate_laporan_seq'::regclass);
 V   ALTER TABLE public.mt_template_laporan ALTER COLUMN id_template_laporan DROP DEFAULT;
       public          postgres    false    341    342    342            �           2604    31926 %   risk_capacity_limit id_capacity_limit    DEFAULT     �   ALTER TABLE ONLY public.risk_capacity_limit ALTER COLUMN id_capacity_limit SET DEFAULT nextval('public.risk_capacity_limit_id_capacity_limit_seq'::regclass);
 T   ALTER TABLE public.risk_capacity_limit ALTER COLUMN id_capacity_limit DROP DEFAULT;
       public          postgres    false    273    272    273            �           2604    32056    risk_dampak id_dampak    DEFAULT     ~   ALTER TABLE ONLY public.risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.risk_dampak_id_dampak_seq'::regclass);
 D   ALTER TABLE public.risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    287    286    287            �           2604    31877 5   risk_metrik_strategi_risiko id_metrik_strategi_risiko    DEFAULT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko SET DEFAULT nextval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq'::regclass);
 d   ALTER TABLE public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko DROP DEFAULT;
       public          postgres    false    267    268    268            �           2604    32366    risk_msg id_msg    DEFAULT     r   ALTER TABLE ONLY public.risk_msg ALTER COLUMN id_msg SET DEFAULT nextval('public.risk_msg_id_msg_seq'::regclass);
 >   ALTER TABLE public.risk_msg ALTER COLUMN id_msg DROP DEFAULT;
       public          postgres    false    324    323    324            �           2604    32047    risk_penyebab id_penyebab    DEFAULT     �   ALTER TABLE ONLY public.risk_penyebab ALTER COLUMN id_penyebab SET DEFAULT nextval('public.risk_penyebab_id_penyebab_seq'::regclass);
 H   ALTER TABLE public.risk_penyebab ALTER COLUMN id_penyebab DROP DEFAULT;
       public          postgres    false    284    285    285            �           2604    32085    risk_profile id_risk_profile    DEFAULT     �   ALTER TABLE ONLY public.risk_profile ALTER COLUMN id_risk_profile SET DEFAULT nextval('public.risk_profile_id_risk_profile_seq'::regclass);
 K   ALTER TABLE public.risk_profile ALTER COLUMN id_risk_profile DROP DEFAULT;
       public          postgres    false    289    288    289            �           2604    32180    risk_profile_control id_control    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_control ALTER COLUMN id_control SET DEFAULT nextval('public.risk_profile_control_id_control_seq'::regclass);
 N   ALTER TABLE public.risk_profile_control ALTER COLUMN id_control DROP DEFAULT;
       public          postgres    false    296    297    297            �           2604    32217 %   risk_profile_dampak id_profile_dampak    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_dampak ALTER COLUMN id_profile_dampak SET DEFAULT nextval('public.risk_profile_dampak_id_profile_dampak_seq'::regclass);
 T   ALTER TABLE public.risk_profile_dampak ALTER COLUMN id_profile_dampak DROP DEFAULT;
       public          postgres    false    303    291            �           2604    32159    risk_profile_kri id_kri    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_kri ALTER COLUMN id_kri SET DEFAULT nextval('public.risk_profile_kri_id_kri_seq'::regclass);
 F   ALTER TABLE public.risk_profile_kri ALTER COLUMN id_kri DROP DEFAULT;
       public          postgres    false    292    293    293            �           2604    32316 #   risk_profile_kri_hasil id_kri_hasil    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_kri_hasil ALTER COLUMN id_kri_hasil SET DEFAULT nextval('public.risk_profile_kri_hasil_id_kri_hasil_seq'::regclass);
 R   ALTER TABLE public.risk_profile_kri_hasil ALTER COLUMN id_kri_hasil DROP DEFAULT;
       public          postgres    false    315    316    316            �           2604    32247 !   risk_profile_mitigasi id_mitigasi    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi ALTER COLUMN id_mitigasi SET DEFAULT nextval('public.risk_profile_mitigasi_id_mitigasi_seq'::regclass);
 P   ALTER TABLE public.risk_profile_mitigasi ALTER COLUMN id_mitigasi DROP DEFAULT;
       public          postgres    false    309    308    309            �           2604    32352 5   risk_profile_mitigasi_realisasi id_mitigasi_realisasi    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi ALTER COLUMN id_mitigasi_realisasi SET DEFAULT nextval('public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq'::regclass);
 d   ALTER TABLE public.risk_profile_mitigasi_realisasi ALTER COLUMN id_mitigasi_realisasi DROP DEFAULT;
       public          postgres    false    321    322    322            �           2604    32294 3   risk_profile_mitigasi_timeline id_mitigasi_timeline    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline ALTER COLUMN id_mitigasi_timeline SET DEFAULT nextval('public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq'::regclass);
 b   ALTER TABLE public.risk_profile_mitigasi_timeline ALTER COLUMN id_mitigasi_timeline DROP DEFAULT;
       public          postgres    false    311    312    312            �           2604    32333 G   risk_profile_mitigasi_timeline_realisasi id_mitigasi_timeline_realisasi    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi ALTER COLUMN id_mitigasi_timeline_realisasi SET DEFAULT nextval('public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq'::regclass);
 v   ALTER TABLE public.risk_profile_mitigasi_timeline_realisasi ALTER COLUMN id_mitigasi_timeline_realisasi DROP DEFAULT;
       public          postgres    false    318    317    318            �           2604    32207 )   risk_profile_penyebab id_profile_penyebab    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_penyebab ALTER COLUMN id_profile_penyebab SET DEFAULT nextval('public.risk_profile_penyebab_id_profile_penyebab_seq'::regclass);
 X   ALTER TABLE public.risk_profile_penyebab ALTER COLUMN id_profile_penyebab DROP DEFAULT;
       public          postgres    false    302    290            �           2604    32307 5   risk_profile_realisasi_residual id_realisasi_residual    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_realisasi_residual ALTER COLUMN id_realisasi_residual SET DEFAULT nextval('public.risk_profile_realisasi_residual_id_realisasi_residual_seq'::regclass);
 d   ALTER TABLE public.risk_profile_realisasi_residual ALTER COLUMN id_realisasi_residual DROP DEFAULT;
       public          postgres    false    314    313    314            �           2604    32201 /   risk_profile_target_residual id_target_residual    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_target_residual ALTER COLUMN id_target_residual SET DEFAULT nextval('public.risk_profile_target_residual_id_target_residual_seq'::regclass);
 ^   ALTER TABLE public.risk_profile_target_residual ALTER COLUMN id_target_residual DROP DEFAULT;
       public          postgres    false    301    300    301            �           2604    31955    risk_register id_register    DEFAULT     �   ALTER TABLE ONLY public.risk_register ALTER COLUMN id_register SET DEFAULT nextval('public.risk_register_id_register_seq'::regclass);
 H   ALTER TABLE public.risk_register ALTER COLUMN id_register DROP DEFAULT;
       public          postgres    false    277    276    277            �           2604    32020    risk_risiko id_risiko    DEFAULT     ~   ALTER TABLE ONLY public.risk_risiko ALTER COLUMN id_risiko SET DEFAULT nextval('public.risk_risiko_id_risiko_seq'::regclass);
 D   ALTER TABLE public.risk_risiko ALTER COLUMN id_risiko DROP DEFAULT;
       public          postgres    false    282    283    283            �           2604    31901    risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.risk_sasaran_id_sasaran_seq'::regclass);
 F   ALTER TABLE public.risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    270    269    270            �           2604    32583 )   risk_sasaran_strategi id_sasaran_strategi    DEFAULT     �   ALTER TABLE ONLY public.risk_sasaran_strategi ALTER COLUMN id_sasaran_strategi SET DEFAULT nextval('public.risk_sasaran_strategi_id_sasaran_strategi_seq'::regclass);
 X   ALTER TABLE public.risk_sasaran_strategi ALTER COLUMN id_sasaran_strategi DROP DEFAULT;
       public          postgres    false    340    271            q           2604    30889    sys_action id_action    DEFAULT     |   ALTER TABLE ONLY public.sys_action ALTER COLUMN id_action SET DEFAULT nextval('public.sys_action_id_action_seq'::regclass);
 C   ALTER TABLE public.sys_action ALTER COLUMN id_action DROP DEFAULT;
       public          postgres    false    231    230    231            m           2604    29249    sys_failed_job id    DEFAULT     s   ALTER TABLE ONLY public.sys_failed_job ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 @   ALTER TABLE public.sys_failed_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            r           2604    30901    sys_group id_group    DEFAULT     x   ALTER TABLE ONLY public.sys_group ALTER COLUMN id_group SET DEFAULT nextval('public.sys_group_id_group_seq'::regclass);
 A   ALTER TABLE public.sys_group ALTER COLUMN id_group DROP DEFAULT;
       public          postgres    false    233    232    233            u           2604    30924    sys_group_menu id_group_menu    DEFAULT     �   ALTER TABLE ONLY public.sys_group_menu ALTER COLUMN id_group_menu SET DEFAULT nextval('public.sys_group_menu_id_group_menu_seq'::regclass);
 K   ALTER TABLE public.sys_group_menu ALTER COLUMN id_group_menu DROP DEFAULT;
       public          postgres    false    238    239    239            l           2604    29232 
   sys_job id    DEFAULT     e   ALTER TABLE ONLY public.sys_job ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 9   ALTER TABLE public.sys_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            t           2604    30917    sys_log id_log    DEFAULT     p   ALTER TABLE ONLY public.sys_log ALTER COLUMN id_log SET DEFAULT nextval('public.sys_log_id_log_seq'::regclass);
 =   ALTER TABLE public.sys_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    236    237    237            o           2604    30882    sys_menu id_menu    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.sys_menu_id_menu_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    228    229    229            j           2604    29184    sys_migration id    DEFAULT     q   ALTER TABLE ONLY public.sys_migration ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 ?   ALTER TABLE public.sys_migration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            s           2604    30908    sys_setting id_setting    DEFAULT     �   ALTER TABLE ONLY public.sys_setting ALTER COLUMN id_setting SET DEFAULT nextval('public.sys_setting_id_setting_seq'::regclass);
 E   ALTER TABLE public.sys_setting ALTER COLUMN id_setting DROP DEFAULT;
       public          postgres    false    235    234    235            k           2604    29191    sys_user id_user    DEFAULT     l   ALTER TABLE ONLY public.sys_user ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    32542 
   lost_event 
   TABLE DATA           f  COPY public.lost_event (id_lost_event, nama_kejadian, identifikasi_kejadian, id_lost_event_kategori, id_lost_event_sumber_penyebab_kejadian, penanganan_saat_kejadian, deskripsi_kejadian, id_jenis_risiko, id_taksonomi, penjelasan_kerugian, nilai_kerugian, is_kejadian_berulang, id_lost_event_frakuensi_kejadian, mitigasi_yang_direncanakan, realisasi_mitigasi, perbaikan_mendatang, pihak_terkait, id_lost_event_status_asuransi, nilai_premi, nilai_klaim, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, penyebab_kejadian, status) FROM stdin;
    public          postgres    false    339   9      �          0    32524     mt_lost_event_frakuensi_kejadian 
   TABLE DATA           �   COPY public.mt_lost_event_frakuensi_kejadian (id_lost_event_frakuensi_kejadian, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    335   $9      �          0    32506    mt_lost_event_kategori 
   TABLE DATA           �   COPY public.mt_lost_event_kategori (id_lost_event_kategori, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    331   A9      �          0    32533    mt_lost_event_status_asuransi 
   TABLE DATA           �   COPY public.mt_lost_event_status_asuransi (id_lost_event_status_asuransi, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    337   ^9      �          0    32515 &   mt_lost_event_sumber_penyebab_kejadian 
   TABLE DATA           �   COPY public.mt_lost_event_sumber_penyebab_kejadian (id_lost_event_penyebab_kejadian, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    333   {9      :          0    31184    mt_risk_dampak 
   TABLE DATA           �   COPY public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    243   �9      r          0    32186    mt_risk_efektifitas_control 
   TABLE DATA           �   COPY public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    299   �:      n          0    32170    mt_risk_jenis_control 
   TABLE DATA           �   COPY public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    295   L;      x          0    32227    mt_risk_jenis_perlakuan 
   TABLE DATA           K   COPY public.mt_risk_jenis_perlakuan (id_jenis_perlakuan, nama) FROM stdin;
    public          postgres    false    305   �;      z          0    32236    mt_risk_jenis_program_rkap 
   TABLE DATA           Q   COPY public.mt_risk_jenis_program_rkap (id_jenis_program_rkap, nama) FROM stdin;
    public          postgres    false    307   <      �          0    32407    mt_risk_jenis_risiko 
   TABLE DATA           �   COPY public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    329   8<      �          0    32400    mt_risk_kategori_risiko 
   TABLE DATA           �   COPY public.mt_risk_kategori_risiko (id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    327   �=      <          0    31196    mt_risk_kemungkinan 
   TABLE DATA           c  COPY public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    245   7>      B          0    31252    mt_risk_kriteria_dampak 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    251   q?      C          0    31266    mt_risk_kriteria_dampak_detail 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    252   �@      D          0    31282    mt_risk_matrix 
   TABLE DATA           �   COPY public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) FROM stdin;
    public          postgres    false    253   ~B      F          0    31754    mt_risk_perlakuan 
   TABLE DATA           �   COPY public.mt_risk_perlakuan (id_perluakuan, nama, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    255   �B      `          0    32010    mt_risk_sasaran 
   TABLE DATA           �   COPY public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    281   �B      Q          0    31866    mt_risk_sikap_terhadap_risiko 
   TABLE DATA           �   COPY public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    266   `C      O          0    31850    mt_risk_taksonomi 
   TABLE DATA           �   COPY public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    264   �C      M          0    31836    mt_risk_taksonomi_area 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    262   GF      K          0    31829    mt_risk_taksonomi_objective 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    260   QG      >          0    31219    mt_risk_tingkat 
   TABLE DATA           �   COPY public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    247   H      ^          0    31998    mt_risk_tingkat_agregasi_risiko 
   TABLE DATA           �   COPY public.mt_risk_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, created_by, updated_by, deleted_by, id_tingkat_agregasi_risiko_parent) FROM stdin;
    public          postgres    false    279   2H      G          0    31762    mt_risk_tingkat_perlakuan 
   TABLE DATA           j   COPY public.mt_risk_tingkat_perlakuan (id_tingkat, id_perlakuan, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    256   �H      I          0    31787    mt_sdm_jabatan 
   TABLE DATA           8  COPY public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    258   �H      ?          0    31233    mt_sdm_pegawai 
   TABLE DATA           �   COPY public.mt_sdm_pegawai (nid, email, position_id, nama_lengkap, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    248   zI      @          0    31243    mt_sdm_unit 
   TABLE DATA           �   COPY public.mt_sdm_unit (id_unit, nama, is_aktif, kode_distrik, id_mig_dep, kode_lama, id_subunitkerja, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    249   �I      Z          0    31945    mt_status_pengajuan 
   TABLE DATA           �   COPY public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    275   L      �          0    32342    mt_status_rencana_perlakuan 
   TABLE DATA           X   COPY public.mt_status_rencana_perlakuan (id_status_rencana_perlakuan, nama) FROM stdin;
    public          postgres    false    320   ]L      �          0    32612    mt_template_laporan 
   TABLE DATA           �   COPY public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    342   zL      X          0    31923    risk_capacity_limit 
   TABLE DATA           5  COPY public.risk_capacity_limit (id_capacity_limit, tahun, kapasitas_risiko, persentase_toleran, risk_limit, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register, deleted_by, deleted_by_desc, status) FROM stdin;
    public          postgres    false    273   �O      f          0    32053    risk_dampak 
   TABLE DATA           �   COPY public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) FROM stdin;
    public          postgres    false    287   _P      S          0    31874    risk_metrik_strategi_risiko 
   TABLE DATA           \  COPY public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_jenis_risiko, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_register, deleted_by, deleted_by_desc, tahun) FROM stdin;
    public          postgres    false    268   aQ      �          0    32363    risk_msg 
   TABLE DATA           4   COPY public.risk_msg (id_msg, msg, url) FROM stdin;
    public          postgres    false    324   �R      �          0    32371    risk_msg_penerima 
   TABLE DATA           E   COPY public.risk_msg_penerima (id_msg, is_read, id_user) FROM stdin;
    public          postgres    false    325   �R      d          0    32044    risk_penyebab 
   TABLE DATA           �   COPY public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) FROM stdin;
    public          postgres    false    285   S      h          0    32082    risk_profile 
   TABLE DATA           �  COPY public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan) FROM stdin;
    public          postgres    false    289   KT      p          0    32177    risk_profile_control 
   TABLE DATA           �   COPY public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    297   �U      j          0    32138    risk_profile_dampak 
   TABLE DATA           �   COPY public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    291   �V      l          0    32156    risk_profile_kri 
   TABLE DATA           B  COPY public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    293   �W      �          0    32313    risk_profile_kri_hasil 
   TABLE DATA           �   COPY public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, threshold) FROM stdin;
    public          postgres    false    316   �X      |          0    32244    risk_profile_mitigasi 
   TABLE DATA           *  COPY public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perluakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    309   	Y      }          0    32277    risk_profile_mitigasi_jenis 
   TABLE DATA           V   COPY public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan) FROM stdin;
    public          postgres    false    310   &Y      �          0    32349    risk_profile_mitigasi_realisasi 
   TABLE DATA           �   COPY public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic) FROM stdin;
    public          postgres    false    322   CY                0    32291    risk_profile_mitigasi_timeline 
   TABLE DATA           o   COPY public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi) FROM stdin;
    public          postgres    false    312   `Y      �          0    32330 (   risk_profile_mitigasi_timeline_realisasi 
   TABLE DATA           �   COPY public.risk_profile_mitigasi_timeline_realisasi (id_mitigasi_timeline_realisasi, periode, is_proses, id_mitigasi) FROM stdin;
    public          postgres    false    318   }Y      i          0    32121    risk_profile_penyebab 
   TABLE DATA           �   COPY public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    290   �Y      �          0    32304    risk_profile_realisasi_residual 
   TABLE DATA           4  COPY public.risk_profile_realisasi_residual (id_realisasi_residual, id_risk_profile, periode, penjelasan_dampak, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    314   �Z      t          0    32198    risk_profile_target_residual 
   TABLE DATA             COPY public.risk_profile_target_residual (id_target_residual, id_risk_profile, periode, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    301   [      \          0    31952    risk_register 
   TABLE DATA           o  COPY public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai) FROM stdin;
    public          postgres    false    277   #[      b          0    32017    risk_risiko 
   TABLE DATA           �   COPY public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) FROM stdin;
    public          postgres    false    283   {_      U          0    31898    risk_sasaran 
   TABLE DATA             COPY public.risk_sasaran (id_sasaran, nama, hasil_yang_diharapkan, nilai_risiko, nilai_limit, is_accept, id_register, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tahun) FROM stdin;
    public          postgres    false    270   w`      V          0    31907    risk_sasaran_strategi 
   TABLE DATA           �   COPY public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) FROM stdin;
    public          postgres    false    271   "b      .          0    30886 
   sys_action 
   TABLE DATA           �   COPY public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    231   �d      $          0    29214 	   sys_cache 
   TABLE DATA           X   COPY public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    221   xm      %          0    29221    sys_cache_lock 
   TABLE DATA           ]   COPY public.sys_cache_lock (key, owner, expiration, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    222   �n      *          0    29246    sys_failed_job 
   TABLE DATA           �   COPY public.sys_failed_job (id, uuid, connection, queue, payload, exception, failed_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    227   �n      0          0    30898 	   sys_group 
   TABLE DATA           �   COPY public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    233   �n      7          0    30937    sys_group_action 
   TABLE DATA           �   COPY public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    240   p      6          0    30921    sys_group_menu 
   TABLE DATA           �   COPY public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    239   �t      '          0    29229    sys_job 
   TABLE DATA           �   COPY public.sys_job (id, queue, payload, attempts, reserved_at, available_at, created_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    224   �v      (          0    29238    sys_job_batch 
   TABLE DATA           �   COPY public.sys_job_batch (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    225   �v      4          0    30914    sys_log 
   TABLE DATA           �   COPY public.sys_log (page, activity, ip, activity_time, user_desc, action, table_name, id_log, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    237   w      ,          0    30879    sys_menu 
   TABLE DATA           �   COPY public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    229    w                0    29181    sys_migration 
   TABLE DATA           Z   COPY public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    216   �      "          0    29198    sys_password_reset_token 
   TABLE DATA           i   COPY public.sys_password_reset_token (email, token, created_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    219   Ӏ      #          0    29205    sys_session 
   TABLE DATA              COPY public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    220   ��      2          0    30905    sys_setting 
   TABLE DATA           Y   COPY public.sys_setting (id_setting, nama, isi, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    235   ��      !          0    29188    sys_user 
   TABLE DATA           �   COPY public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    218   ��      8          0    30951    sys_user_group 
   TABLE DATA           X   COPY public.sys_user_group (id_user, id_group, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    241   ��      �           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    226            �           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    223            �           0    0    lost_event_id_lost_event_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.lost_event_id_lost_event_seq', 1, false);
          public          postgres    false    338            �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          postgres    false    215            �           0    0 1   mt_lost_event_kategori_id_lost_event_kategori_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.mt_lost_event_kategori_id_lost_event_kategori_seq', 1, false);
          public          postgres    false    330            �           0    0 ?   mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq', 1, false);
          public          postgres    false    334            �           0    0 ?   mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq', 1, false);
          public          postgres    false    332            �           0    0 ?   mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq', 1, false);
          public          postgres    false    336            �           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_risk_dampak_id_dampak_seq', 5, true);
          public          postgres    false    242            �           0    0 6   mt_risk_efektifitas_control_id_efektifitas_control_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.mt_risk_efektifitas_control_id_efektifitas_control_seq', 5, true);
          public          postgres    false    298            �           0    0 *   mt_risk_jenis_control_id_jenis_control_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.mt_risk_jenis_control_id_jenis_control_seq', 6, true);
          public          postgres    false    294            �           0    0 .   mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq', 1, false);
          public          postgres    false    304            �           0    0 4   mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq', 1, false);
          public          postgres    false    306            �           0    0 (   mt_risk_jenis_risiko_id_jenis_risiko_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.mt_risk_jenis_risiko_id_jenis_risiko_seq', 11, true);
          public          postgres    false    328            �           0    0 .   mt_risk_kategori_risiko_id_kategori_risiko_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.mt_risk_kategori_risiko_id_kategori_risiko_seq', 3, true);
          public          postgres    false    326            �           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.mt_risk_kemungkinan_id_kemungkinan_seq', 7, true);
          public          postgres    false    244            �           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq', 14, true);
          public          postgres    false    250            �           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.mt_risk_perlakuan_id_perluakuan_seq', 1, false);
          public          postgres    false    254            �           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq', 4, true);
          public          postgres    false    265            �           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq', 8, true);
          public          postgres    false    261            �           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_risk_taksonomi_id_taksonomi_seq', 21, true);
          public          postgres    false    263            �           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq', 4, true);
          public          postgres    false    259            �           0    0 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE SET     l   SELECT pg_catalog.setval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq', 3, true);
          public          postgres    false    278            �           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mt_risk_tingkat_id_tingkat_seq', 1, false);
          public          postgres    false    246            �           0    0    mt_sasaran_id_sasaran_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.mt_sasaran_id_sasaran_seq', 5, true);
          public          postgres    false    280            �           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.mt_sdm_jabatan_id_jabatan_seq', 5, true);
          public          postgres    false    257            �           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.mt_status_pengajuan_id_status_pengajuan_seq', 2, true);
          public          postgres    false    274            �           0    0 ;   mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq    SEQUENCE SET     j   SELECT pg_catalog.setval('public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq', 1, false);
          public          postgres    false    319            �           0    0 +   mt_tamplate_laporan_id_tamplate_laporan_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.mt_tamplate_laporan_id_tamplate_laporan_seq', 7, true);
          public          postgres    false    341            �           0    0 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.risk_capacity_limit_id_capacity_limit_seq', 3, true);
          public          postgres    false    272            �           0    0    risk_dampak_id_dampak_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.risk_dampak_id_dampak_seq', 13, true);
          public          postgres    false    286            �           0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq', 4, true);
          public          postgres    false    267            �           0    0    risk_msg_id_msg_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_msg_id_msg_seq', 1, false);
          public          postgres    false    323            �           0    0    risk_penyebab_id_penyebab_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_penyebab_id_penyebab_seq', 25, true);
          public          postgres    false    284            �           0    0 #   risk_profile_control_id_control_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.risk_profile_control_id_control_seq', 21, true);
          public          postgres    false    296                        0    0 )   risk_profile_dampak_id_profile_dampak_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.risk_profile_dampak_id_profile_dampak_seq', 9, true);
          public          postgres    false    303                       0    0     risk_profile_id_risk_profile_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.risk_profile_id_risk_profile_seq', 19, true);
          public          postgres    false    288                       0    0 '   risk_profile_kri_hasil_id_kri_hasil_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.risk_profile_kri_hasil_id_kri_hasil_seq', 1, false);
          public          postgres    false    315                       0    0    risk_profile_kri_id_kri_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.risk_profile_kri_id_kri_seq', 29, true);
          public          postgres    false    292                       0    0 %   risk_profile_mitigasi_id_mitigasi_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.risk_profile_mitigasi_id_mitigasi_seq', 1, false);
          public          postgres    false    308                       0    0 9   risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq', 1, false);
          public          postgres    false    321                       0    0 ?   risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq', 1, false);
          public          postgres    false    317                       0    0 7   risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq', 1, false);
          public          postgres    false    311                       0    0 -   risk_profile_penyebab_id_profile_penyebab_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.risk_profile_penyebab_id_profile_penyebab_seq', 77, true);
          public          postgres    false    302            	           0    0 9   risk_profile_realisasi_residual_id_realisasi_residual_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.risk_profile_realisasi_residual_id_realisasi_residual_seq', 1, false);
          public          postgres    false    313            
           0    0 3   risk_profile_target_residual_id_target_residual_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.risk_profile_target_residual_id_target_residual_seq', 1, false);
          public          postgres    false    300                       0    0    risk_register_id_register_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_register_id_register_seq', 39, true);
          public          postgres    false    276                       0    0    risk_risiko_id_risiko_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.risk_risiko_id_risiko_seq', 11, true);
          public          postgres    false    282                       0    0    risk_sasaran_id_sasaran_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.risk_sasaran_id_sasaran_seq', 6, true);
          public          postgres    false    269                       0    0 -   risk_sasaran_strategi_id_sasaran_strategi_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.risk_sasaran_strategi_id_sasaran_strategi_seq', 29, true);
          public          postgres    false    340                       0    0    sys_action_id_action_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sys_action_id_action_seq', 239, true);
          public          postgres    false    230                       0    0    sys_group_id_group_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sys_group_id_group_seq', 13, true);
          public          postgres    false    232                       0    0     sys_group_menu_id_group_menu_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 906, true);
          public          postgres    false    238                       0    0    sys_log_id_log_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_log_id_log_seq', 12211, true);
          public          postgres    false    236                       0    0    sys_menu_id_menu_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 96, true);
          public          postgres    false    228                       0    0    sys_setting_id_setting_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);
          public          postgres    false    234                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    217            �           2606    29227    sys_cache_lock cache_locks_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_cache_lock
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 I   ALTER TABLE ONLY public.sys_cache_lock DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    222            �           2606    29220    sys_cache cache_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sys_cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.sys_cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    221            �           2606    29254    sys_failed_job failed_jobs_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    227            �           2606    29256 &   sys_failed_job failed_jobs_uuid_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 P   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    227            �           2606    31834 0   mt_risk_taksonomi_objective idx_18d8a35225719b65 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective
    ADD CONSTRAINT idx_18d8a35225719b65 PRIMARY KEY (id_taksonomi_objective);
 Z   ALTER TABLE ONLY public.mt_risk_taksonomi_objective DROP CONSTRAINT idx_18d8a35225719b65;
       public            postgres    false    260            �           2606    31792 #   mt_sdm_jabatan idx_1e38228f1edb51f5 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT idx_1e38228f1edb51f5 PRIMARY KEY (id_jabatan);
 M   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT idx_1e38228f1edb51f5;
       public            postgres    false    258                       2606    31950 (   mt_status_pengajuan idx_38d4e01f5bd43ed6 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_status_pengajuan
    ADD CONSTRAINT idx_38d4e01f5bd43ed6 PRIMARY KEY (id_status_pengajuan);
 R   ALTER TABLE ONLY public.mt_status_pengajuan DROP CONSTRAINT idx_38d4e01f5bd43ed6;
       public            postgres    false    275            7           2606    32376 &   risk_msg_penerima idx_3c73a326dee309e5 
   CONSTRAINT     q   ALTER TABLE ONLY public.risk_msg_penerima
    ADD CONSTRAINT idx_3c73a326dee309e5 PRIMARY KEY (id_msg, id_user);
 P   ALTER TABLE ONLY public.risk_msg_penerima DROP CONSTRAINT idx_3c73a326dee309e5;
       public            postgres    false    325    325                       2606    32163 %   risk_profile_kri idx_42f7b767e5e7e8f2 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_profile_kri
    ADD CONSTRAINT idx_42f7b767e5e7e8f2 PRIMARY KEY (id_kri);
 O   ALTER TABLE ONLY public.risk_profile_kri DROP CONSTRAINT idx_42f7b767e5e7e8f2;
       public            postgres    false    293            -           2606    32318 +   risk_profile_kri_hasil idx_590a4ea9ee7c6349 
   CONSTRAINT     s   ALTER TABLE ONLY public.risk_profile_kri_hasil
    ADD CONSTRAINT idx_590a4ea9ee7c6349 PRIMARY KEY (id_kri_hasil);
 U   ALTER TABLE ONLY public.risk_profile_kri_hasil DROP CONSTRAINT idx_590a4ea9ee7c6349;
       public            postgres    false    316            	           2606    32003 4   mt_risk_tingkat_agregasi_risiko idx_6d38b409db81e919 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko
    ADD CONSTRAINT idx_6d38b409db81e919 PRIMARY KEY (id_tingkat_agregasi_risiko);
 ^   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko DROP CONSTRAINT idx_6d38b409db81e919;
       public            postgres    false    279            �           2606    31857 &   mt_risk_taksonomi idx_ae01f0becb598a2e 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT idx_ae01f0becb598a2e PRIMARY KEY (id_taksonomi);
 P   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT idx_ae01f0becb598a2e;
       public            postgres    false    264            5           2606    32370    risk_msg idx_bc4dae4133700974 
   CONSTRAINT     _   ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT idx_bc4dae4133700974 PRIMARY KEY (id_msg);
 G   ALTER TABLE ONLY public.risk_msg DROP CONSTRAINT idx_bc4dae4133700974;
       public            postgres    false    324                       2606    31961 "   risk_register idx_c3ae979ce28d717c 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT idx_c3ae979ce28d717c PRIMARY KEY (id_register);
 L   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT idx_c3ae979ce28d717c;
       public            postgres    false    277            �           2606    31843 +   mt_risk_taksonomi_area idx_efeea3ec186756aa 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT idx_efeea3ec186756aa PRIMARY KEY (id_taksonomi_area);
 U   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT idx_efeea3ec186756aa;
       public            postgres    false    262            �           2606    29244    sys_job_batch job_batches_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_job_batch
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.sys_job_batch DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    225            �           2606    29236    sys_job jobs_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sys_job DROP CONSTRAINT jobs_pkey;
       public            postgres    false    224            E           2606    32581    lost_event lost_event_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_pkey PRIMARY KEY (id_lost_event);
 D   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_pkey;
       public            postgres    false    339            �           2606    29186    sys_migration migrations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sys_migration
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.sys_migration DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            =           2606    32513 2   mt_lost_event_kategori mt_lost_event_kategori_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_kategori
    ADD CONSTRAINT mt_lost_event_kategori_pkey PRIMARY KEY (id_lost_event_kategori);
 \   ALTER TABLE ONLY public.mt_lost_event_kategori DROP CONSTRAINT mt_lost_event_kategori_pkey;
       public            postgres    false    331            A           2606    32531 E   mt_lost_event_frakuensi_kejadian mt_lost_event_kejadian_berulang_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian
    ADD CONSTRAINT mt_lost_event_kejadian_berulang_pkey PRIMARY KEY (id_lost_event_frakuensi_kejadian);
 o   ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian DROP CONSTRAINT mt_lost_event_kejadian_berulang_pkey;
       public            postgres    false    335            ?           2606    32522 K   mt_lost_event_sumber_penyebab_kejadian mt_lost_event_penyebab_kejadian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian
    ADD CONSTRAINT mt_lost_event_penyebab_kejadian_pkey PRIMARY KEY (id_lost_event_penyebab_kejadian);
 u   ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian DROP CONSTRAINT mt_lost_event_penyebab_kejadian_pkey;
       public            postgres    false    333            C           2606    32540 @   mt_lost_event_status_asuransi mt_lost_event_status_asuransi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_status_asuransi
    ADD CONSTRAINT mt_lost_event_status_asuransi_pkey PRIMARY KEY (id_lost_event_status_asuransi);
 j   ALTER TABLE ONLY public.mt_lost_event_status_asuransi DROP CONSTRAINT mt_lost_event_status_asuransi_pkey;
       public            postgres    false    337            �           2606    31194 "   mt_risk_dampak mt_risk_dampak_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_risk_dampak
    ADD CONSTRAINT mt_risk_dampak_pkey PRIMARY KEY (id_dampak);
 L   ALTER TABLE ONLY public.mt_risk_dampak DROP CONSTRAINT mt_risk_dampak_pkey;
       public            postgres    false    243                       2606    32191 <   mt_risk_efektifitas_control mt_risk_efektifitas_control_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_control
    ADD CONSTRAINT mt_risk_efektifitas_control_pkey PRIMARY KEY (id_efektifitas_control);
 f   ALTER TABLE ONLY public.mt_risk_efektifitas_control DROP CONSTRAINT mt_risk_efektifitas_control_pkey;
       public            postgres    false    299                       2606    32175 0   mt_risk_jenis_control mt_risk_jenis_control_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.mt_risk_jenis_control
    ADD CONSTRAINT mt_risk_jenis_control_pkey PRIMARY KEY (id_jenis_control);
 Z   ALTER TABLE ONLY public.mt_risk_jenis_control DROP CONSTRAINT mt_risk_jenis_control_pkey;
       public            postgres    false    295            #           2606    32234 4   mt_risk_jenis_perlakuan mt_risk_jenis_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_jenis_perlakuan
    ADD CONSTRAINT mt_risk_jenis_perlakuan_pkey PRIMARY KEY (id_jenis_perlakuan);
 ^   ALTER TABLE ONLY public.mt_risk_jenis_perlakuan DROP CONSTRAINT mt_risk_jenis_perlakuan_pkey;
       public            postgres    false    305            %           2606    32241 :   mt_risk_jenis_program_rkap mt_risk_jenis_program_rkap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_jenis_program_rkap
    ADD CONSTRAINT mt_risk_jenis_program_rkap_pkey PRIMARY KEY (id_jenis_program_rkap);
 d   ALTER TABLE ONLY public.mt_risk_jenis_program_rkap DROP CONSTRAINT mt_risk_jenis_program_rkap_pkey;
       public            postgres    false    307            ;           2606    32414 .   mt_risk_jenis_risiko mt_risk_jenis_risiko_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.mt_risk_jenis_risiko
    ADD CONSTRAINT mt_risk_jenis_risiko_pkey PRIMARY KEY (id_jenis_risiko);
 X   ALTER TABLE ONLY public.mt_risk_jenis_risiko DROP CONSTRAINT mt_risk_jenis_risiko_pkey;
       public            postgres    false    329            9           2606    32405 4   mt_risk_kategori_risiko mt_risk_kategori_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kategori_risiko
    ADD CONSTRAINT mt_risk_kategori_risiko_pkey PRIMARY KEY (id_kategori_risiko);
 ^   ALTER TABLE ONLY public.mt_risk_kategori_risiko DROP CONSTRAINT mt_risk_kategori_risiko_pkey;
       public            postgres    false    327            �           2606    31209 ,   mt_risk_kemungkinan mt_risk_kemungkinan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.mt_risk_kemungkinan
    ADD CONSTRAINT mt_risk_kemungkinan_pkey PRIMARY KEY (id_kemungkinan);
 V   ALTER TABLE ONLY public.mt_risk_kemungkinan DROP CONSTRAINT mt_risk_kemungkinan_pkey;
       public            postgres    false    245            �           2606    31271 B   mt_risk_kriteria_dampak_detail mt_risk_kriteria_dampak_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT mt_risk_kriteria_dampak_detail_pkey PRIMARY KEY (id_kriteria_dampak, id_dampak);
 l   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT mt_risk_kriteria_dampak_detail_pkey;
       public            postgres    false    252    252            �           2606    31260 4   mt_risk_kriteria_dampak mt_risk_kriteria_dampak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT mt_risk_kriteria_dampak_pkey PRIMARY KEY (id_kriteria_dampak);
 ^   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT mt_risk_kriteria_dampak_pkey;
       public            postgres    false    251            �           2606    31287 "   mt_risk_matrix mt_risk_matrix_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT mt_risk_matrix_pkey PRIMARY KEY (id_dampak, id_kemungkinan);
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT mt_risk_matrix_pkey;
       public            postgres    false    253    253            �           2606    31761 (   mt_risk_perlakuan mt_risk_perlakuan_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.mt_risk_perlakuan
    ADD CONSTRAINT mt_risk_perlakuan_pkey PRIMARY KEY (id_perluakuan);
 R   ALTER TABLE ONLY public.mt_risk_perlakuan DROP CONSTRAINT mt_risk_perlakuan_pkey;
       public            postgres    false    255                       2606    32091 $   mt_risk_sasaran mt_risk_sasaran_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_sasaran
    ADD CONSTRAINT mt_risk_sasaran_pkey PRIMARY KEY (id_sasaran);
 N   ALTER TABLE ONLY public.mt_risk_sasaran DROP CONSTRAINT mt_risk_sasaran_pkey;
       public            postgres    false    281            �           2606    31871 @   mt_risk_sikap_terhadap_risiko mt_risk_sikap_terhadap_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko
    ADD CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey PRIMARY KEY (id_sikap_terhadap_risiko);
 j   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko DROP CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey;
       public            postgres    false    266            �           2606    31766 8   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_pkey PRIMARY KEY (id_tingkat, id_perlakuan);
 b   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_pkey;
       public            postgres    false    256    256            �           2606    31232 $   mt_risk_tingkat mt_risk_tingkat_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_tingkat
    ADD CONSTRAINT mt_risk_tingkat_pkey PRIMARY KEY (id_tingkat);
 N   ALTER TABLE ONLY public.mt_risk_tingkat DROP CONSTRAINT mt_risk_tingkat_pkey;
       public            postgres    false    247            �           2606    31242 "   mt_sdm_pegawai mt_sdm_pegawai_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT mt_sdm_pegawai_pkey PRIMARY KEY (nid);
 L   ALTER TABLE ONLY public.mt_sdm_pegawai DROP CONSTRAINT mt_sdm_pegawai_pkey;
       public            postgres    false    248            �           2606    31250    mt_sdm_unit mt_sdm_unit_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_pkey PRIMARY KEY (id_unit);
 F   ALTER TABLE ONLY public.mt_sdm_unit DROP CONSTRAINT mt_sdm_unit_pkey;
       public            postgres    false    249            1           2606    32347 <   mt_status_rencana_perlakuan mt_status_rencana_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_rencana_perlakuan
    ADD CONSTRAINT mt_status_rencana_perlakuan_pkey PRIMARY KEY (id_status_rencana_perlakuan);
 f   ALTER TABLE ONLY public.mt_status_rencana_perlakuan DROP CONSTRAINT mt_status_rencana_perlakuan_pkey;
       public            postgres    false    320            G           2606    32619 ,   mt_template_laporan mt_tamplate_laporan_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.mt_template_laporan
    ADD CONSTRAINT mt_tamplate_laporan_pkey PRIMARY KEY (id_template_laporan);
 V   ALTER TABLE ONLY public.mt_template_laporan DROP CONSTRAINT mt_tamplate_laporan_pkey;
       public            postgres    false    342            �           2606    29204 3   sys_password_reset_token password_reset_tokens_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sys_password_reset_token
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 ]   ALTER TABLE ONLY public.sys_password_reset_token DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    219                       2606    31928 ,   risk_capacity_limit risk_capacity_limit_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_pkey PRIMARY KEY (id_capacity_limit);
 V   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit_pkey;
       public            postgres    false    273                       2606    32060    risk_dampak risk_dampak_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak_pkey PRIMARY KEY (id_dampak);
 F   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT risk_dampak_pkey;
       public            postgres    false    287            �           2606    31881 <   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_pkey PRIMARY KEY (id_metrik_strategi_risiko);
 f   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_pkey;
       public            postgres    false    268                       2606    32051     risk_penyebab risk_penyebab_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_pkey PRIMARY KEY (id_penyebab);
 J   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT risk_penyebab_pkey;
       public            postgres    false    285                       2606    32184 .   risk_profile_control risk_profile_control_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_pkey PRIMARY KEY (id_control);
 X   ALTER TABLE ONLY public.risk_profile_control DROP CONSTRAINT risk_profile_control_pkey;
       public            postgres    false    297                       2606    32225 ,   risk_profile_dampak risk_profile_dampak_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_pkey PRIMARY KEY (id_profile_dampak);
 V   ALTER TABLE ONLY public.risk_profile_dampak DROP CONSTRAINT risk_profile_dampak_pkey;
       public            postgres    false    291            '           2606    32251 0   risk_profile_mitigasi risk_profile_mitigasi_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_pkey PRIMARY KEY (id_mitigasi);
 Z   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_pkey;
       public            postgres    false    309            3           2606    32356 D   risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_pkey PRIMARY KEY (id_mitigasi_realisasi);
 n   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi DROP CONSTRAINT risk_profile_mitigasi_realisasi_pkey;
       public            postgres    false    322            )           2606    32296 B   risk_profile_mitigasi_timeline risk_profile_mitigasi_timeline_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline
    ADD CONSTRAINT risk_profile_mitigasi_timeline_pkey PRIMARY KEY (id_mitigasi_timeline);
 l   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline DROP CONSTRAINT risk_profile_mitigasi_timeline_pkey;
       public            postgres    false    312            /           2606    32335 V   risk_profile_mitigasi_timeline_realisasi risk_profile_mitigasi_timeline_realisasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_timeline_realisasi_pkey PRIMARY KEY (id_mitigasi_timeline_realisasi);
 �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi DROP CONSTRAINT risk_profile_mitigasi_timeline_realisasi_pkey;
       public            postgres    false    318                       2606    32215 0   risk_profile_penyebab risk_profile_penyebab_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_pkey PRIMARY KEY (id_profile_penyebab);
 Z   ALTER TABLE ONLY public.risk_profile_penyebab DROP CONSTRAINT risk_profile_penyebab_pkey;
       public            postgres    false    290                       2606    32089    risk_profile risk_profile_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_pkey PRIMARY KEY (id_risk_profile);
 H   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_pkey;
       public            postgres    false    289            +           2606    32311 D   risk_profile_realisasi_residual risk_profile_realisasi_residual_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_realisasi_residual
    ADD CONSTRAINT risk_profile_realisasi_residual_pkey PRIMARY KEY (id_realisasi_residual);
 n   ALTER TABLE ONLY public.risk_profile_realisasi_residual DROP CONSTRAINT risk_profile_realisasi_residual_pkey;
       public            postgres    false    314            !           2606    32205 >   risk_profile_target_residual risk_profile_target_residual_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_target_residual
    ADD CONSTRAINT risk_profile_target_residual_pkey PRIMARY KEY (id_target_residual);
 h   ALTER TABLE ONLY public.risk_profile_target_residual DROP CONSTRAINT risk_profile_target_residual_pkey;
       public            postgres    false    301                       2606    32024    risk_risiko risk_risiko_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_pkey PRIMARY KEY (id_risiko);
 F   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_pkey;
       public            postgres    false    283            �           2606    31906    risk_sasaran risk_sasaran_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_pkey PRIMARY KEY (id_sasaran);
 H   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_pkey;
       public            postgres    false    270                       2606    32590 0   risk_sasaran_strategi risk_sasaran_strategi_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_pkey PRIMARY KEY (id_sasaran_strategi);
 Z   ALTER TABLE ONLY public.risk_sasaran_strategi DROP CONSTRAINT risk_sasaran_strategi_pkey;
       public            postgres    false    271            �           2606    29211    sys_session sessions_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_session
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.sys_session DROP CONSTRAINT sessions_pkey;
       public            postgres    false    220            �           2606    30891    sys_action sys_action_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT sys_action_pk PRIMARY KEY (id_action);
 B   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT sys_action_pk;
       public            postgres    false    231            �           2606    30926     sys_group_menu sys_group_menu_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT sys_group_menu_pk PRIMARY KEY (id_group_menu);
 J   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT sys_group_menu_pk;
       public            postgres    false    239            �           2606    30903    sys_group sys_group_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sys_group
    ADD CONSTRAINT sys_group_pk PRIMARY KEY (id_group);
 @   ALTER TABLE ONLY public.sys_group DROP CONSTRAINT sys_group_pk;
       public            postgres    false    233            �           2606    31182    sys_log sys_log_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id_log);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public            postgres    false    237            �           2606    30884    sys_menu sys_menu_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pk PRIMARY KEY (id_menu);
 >   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pk;
       public            postgres    false    229            �           2606    30912    sys_setting sys_setting_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.sys_setting
    ADD CONSTRAINT sys_setting_pk PRIMARY KEY (id_setting);
 D   ALTER TABLE ONLY public.sys_setting DROP CONSTRAINT sys_setting_pk;
       public            postgres    false    235            �           2606    29197    sys_user users_email_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 E   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_email_unique;
       public            postgres    false    218            �           2606    29195    sys_user users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           1259    29237    jobs_queue_index    INDEX     E   CREATE INDEX jobs_queue_index ON public.sys_job USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    224            �           1259    29213    sessions_last_activity_index    INDEX     ]   CREATE INDEX sessions_last_activity_index ON public.sys_session USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    220            �           1259    29212    sessions_user_id_index    INDEX     Q   CREATE INDEX sessions_user_id_index ON public.sys_session USING btree (id_user);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    220            H           2606    30892    sys_action aksi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT aksi_fk1 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 =   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT aksi_fk1;
       public          postgres    false    5075    231    229            a           2606    31962 !   risk_register fk_388ab7f7f4fd9818    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_388ab7f7f4fd9818 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_388ab7f7f4fd9818;
       public          postgres    false    275    5125    277            P           2606    31272 2   mt_risk_kriteria_dampak_detail fk_41ba39047b02c6e5    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_41ba39047b02c6e5 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_41ba39047b02c6e5;
       public          postgres    false    251    252    5097            Q           2606    31277 2   mt_risk_kriteria_dampak_detail fk_4d57df3881e291e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_4d57df3881e291e2 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_4d57df3881e291e2;
       public          postgres    false    243    252    5087            b           2606    31967 !   risk_register fk_65f431cf37d7f015    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_65f431cf37d7f015 FOREIGN KEY (id_parent_register) REFERENCES public.risk_register(id_register);
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_65f431cf37d7f015;
       public          postgres    false    277    5127    277            y           2606    32164 $   risk_profile_kri fk_6fcacdedc08a791a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_kri
    ADD CONSTRAINT fk_6fcacdedc08a791a FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.risk_profile_kri DROP CONSTRAINT fk_6fcacdedc08a791a;
       public          postgres    false    289    5139    293            Y           2606    31858 %   mt_risk_taksonomi fk_726c58c036e9bcdd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT fk_726c58c036e9bcdd FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 O   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT fk_726c58c036e9bcdd;
       public          postgres    false    5111    262    264            c           2606    31972 !   risk_register fk_9bca8419236912b5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_9bca8419236912b5 FOREIGN KEY (id_owner) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_9bca8419236912b5;
       public          postgres    false    5107    277    258            R           2606    31288 "   mt_risk_matrix fk_a4669bbd55458901    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_a4669bbd55458901 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_a4669bbd55458901;
       public          postgres    false    5089    245    253            X           2606    31844 *   mt_risk_taksonomi_area fk_a9d39025b9658c1d    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT fk_a9d39025b9658c1d FOREIGN KEY (id_taksonomi_objective) REFERENCES public.mt_risk_taksonomi_objective(id_taksonomi_objective);
 T   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT fk_a9d39025b9658c1d;
       public          postgres    false    262    260    5109            W           2606    31793 "   mt_sdm_jabatan fk_b743dfd89358fc4e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_b743dfd89358fc4e FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_b743dfd89358fc4e;
       public          postgres    false    5095    258    249            S           2606    31293 "   mt_risk_matrix fk_d414e4107f6c8462    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_d414e4107f6c8462 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_d414e4107f6c8462;
       public          postgres    false    243    5087    253            �           2606    32319 *   risk_profile_kri_hasil fk_d4582e0c20c52b33    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_kri_hasil
    ADD CONSTRAINT fk_d4582e0c20c52b33 FOREIGN KEY (id_kri) REFERENCES public.risk_profile_kri(id_kri) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.risk_profile_kri_hasil DROP CONSTRAINT fk_d4582e0c20c52b33;
       public          postgres    false    5145    293    316            T           2606    31298 "   mt_risk_matrix fk_e3066883e2e9bb72    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_e3066883e2e9bb72 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_e3066883e2e9bb72;
       public          postgres    false    5091    247    253            d           2606    31977 !   risk_register fk_e839a323c85d81e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_e839a323c85d81e2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_e839a323c85d81e2;
       public          postgres    false    249    277    5095            O           2606    31261 +   mt_risk_kriteria_dampak fk_f9422fdc528daf94    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT fk_f9422fdc528daf94 FOREIGN KEY (id_induk) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 U   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT fk_f9422fdc528daf94;
       public          postgres    false    5097    251    251            K           2606    30940 !   sys_group_action group_action_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk1 FOREIGN KEY (id_group_menu) REFERENCES public.sys_group_menu(id_group_menu) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk1;
       public          postgres    false    239    5085    240            L           2606    30945 !   sys_group_action group_action_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk2 FOREIGN KEY (id_action) REFERENCES public.sys_action(id_action) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk2;
       public          postgres    false    240    5077    231            I           2606    30927    sys_group_menu group_menu_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk1 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk1;
       public          postgres    false    5079    233    239            J           2606    30932    sys_group_menu group_menu_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk2 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk2;
       public          postgres    false    229    5075    239            �           2606    32550    lost_event lost_event_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk1 FOREIGN KEY (id_lost_event_kategori) REFERENCES public.mt_lost_event_kategori(id_lost_event_kategori) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk1;
       public          postgres    false    5181    339    331            �           2606    32555    lost_event lost_event_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk2 FOREIGN KEY (id_lost_event_sumber_penyebab_kejadian) REFERENCES public.mt_lost_event_sumber_penyebab_kejadian(id_lost_event_penyebab_kejadian) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk2;
       public          postgres    false    339    333    5183            �           2606    32560    lost_event lost_event_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk3 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk3;
       public          postgres    false    5179    339    329            �           2606    32565    lost_event lost_event_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk4 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi);
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk4;
       public          postgres    false    339    5113    264            �           2606    32570    lost_event lost_event_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk5 FOREIGN KEY (id_lost_event_frakuensi_kejadian) REFERENCES public.mt_lost_event_frakuensi_kejadian(id_lost_event_frakuensi_kejadian) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk5;
       public          postgres    false    339    5185    335            �           2606    32575    lost_event lost_event_fk6    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk6 FOREIGN KEY (id_lost_event_status_asuransi) REFERENCES public.mt_lost_event_status_asuransi(id_lost_event_status_asuransi) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk6;
       public          postgres    false    5187    339    337            �           2606    32415 ,   mt_risk_jenis_risiko mt_risk_jenis_risiko_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_jenis_risiko
    ADD CONSTRAINT mt_risk_jenis_risiko_fk FOREIGN KEY (id_kategori_risiko) REFERENCES public.mt_risk_kategori_risiko(id_kategori_risiko) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.mt_risk_jenis_risiko DROP CONSTRAINT mt_risk_jenis_risiko_fk;
       public          postgres    false    329    5177    327            U           2606    31767 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk1 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk1;
       public          postgres    false    5091    247    256            V           2606    31772 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk2 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perluakuan) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk2;
       public          postgres    false    255    5103    256            `           2606    31982 +   risk_capacity_limit risk_capacity_limit_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_fk1 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit_fk1;
       public          postgres    false    277    273    5127            k           2606    32076    risk_dampak risk_dampak    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT risk_dampak;
       public          postgres    false    287    5133    283            l           2606    32495    risk_dampak risk_dampak_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak_fk1 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) NOT VALID;
 E   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT risk_dampak_fk1;
       public          postgres    false    287    249    5095            Z           2606    32431 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk1 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk1;
       public          postgres    false    5179    268    329            [           2606    31887 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk2 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk2;
       public          postgres    false    264    268    5113            \           2606    32471 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk3 FOREIGN KEY (id_sikap_terhadap_risiko) REFERENCES public.mt_risk_sikap_terhadap_risiko(id_sikap_terhadap_risiko) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk3;
       public          postgres    false    5115    266    268            ]           2606    31987 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk4;
       public          postgres    false    277    5127    268            i           2606    32071    risk_penyebab risk_penyebab_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_fk1 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT risk_penyebab_fk1;
       public          postgres    false    5133    285    283            j           2606    32500    risk_penyebab risk_penyebab_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_fk2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) NOT VALID;
 I   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT risk_penyebab_fk2;
       public          postgres    false    249    285    5095            z           2606    32192 -   risk_profile_control risk_profile_control_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_fk1 FOREIGN KEY (id_efektifitas_control) REFERENCES public.mt_risk_efektifitas_control(id_efektifitas_control) ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public.risk_profile_control DROP CONSTRAINT risk_profile_control_fk1;
       public          postgres    false    5151    297    299            {           2606    32486 -   risk_profile_control risk_profile_control_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_fk2 FOREIGN KEY (id_jenis_control) REFERENCES public.mt_risk_jenis_control(id_jenis_control) ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public.risk_profile_control DROP CONSTRAINT risk_profile_control_fk2;
       public          postgres    false    295    5147    297            w           2606    32145 +   risk_profile_dampak risk_profile_dampak_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.risk_profile_dampak DROP CONSTRAINT risk_profile_dampak_fk1;
       public          postgres    false    5139    289    291            x           2606    32150 +   risk_profile_dampak risk_profile_dampak_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_fk2 FOREIGN KEY (id_dampak) REFERENCES public.risk_dampak(id_dampak) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.risk_profile_dampak DROP CONSTRAINT risk_profile_dampak_fk2;
       public          postgres    false    291    287    5137            m           2606    32092    risk_profile risk_profile_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.mt_risk_sasaran(id_sasaran) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk1;
       public          postgres    false    5131    281    289            n           2606    32463    risk_profile risk_profile_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk2 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk2;
       public          postgres    false    289    5179    329            o           2606    32102    risk_profile risk_profile_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk3 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk3;
       public          postgres    false    264    289    5113            p           2606    32107    risk_profile risk_profile_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk4;
       public          postgres    false    277    5127    289            q           2606    32476    risk_profile risk_profile_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk5 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk5;
       public          postgres    false    283    5133    289            r           2606    32591    risk_profile risk_profile_fk6    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk6 FOREIGN KEY (id_dampak_inheren) REFERENCES public.mt_risk_dampak(id_dampak) NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk6;
       public          postgres    false    243    5087    289            s           2606    32596    risk_profile risk_profile_fk7    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk7 FOREIGN KEY (id_kemungkinan_inheren) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk7;
       public          postgres    false    289    5089    245            t           2606    32620    risk_profile risk_profile_fk8    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk8 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak) ON DELETE SET NULL NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk8;
       public          postgres    false    289    5097    251            |           2606    32252 /   risk_profile_mitigasi risk_profile_mitigasi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk1;
       public          postgres    false    5139    289    309            }           2606    32257 /   risk_profile_mitigasi risk_profile_mitigasi_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk2 FOREIGN KEY (id_profile_penyebab) REFERENCES public.risk_profile_penyebab(id_profile_penyebab) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk2;
       public          postgres    false    5141    290    309            ~           2606    32262 /   risk_profile_mitigasi risk_profile_mitigasi_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk3 FOREIGN KEY (id_perluakuan) REFERENCES public.mt_risk_perlakuan(id_perluakuan) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk3;
       public          postgres    false    5103    255    309                       2606    32267 /   risk_profile_mitigasi risk_profile_mitigasi_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk4 FOREIGN KEY (id_jenis_program_rkap) REFERENCES public.mt_risk_jenis_program_rkap(id_jenis_program_rkap) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk4;
       public          postgres    false    307    5157    309            �           2606    32272 /   risk_profile_mitigasi risk_profile_mitigasi_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk5 FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk5;
       public          postgres    false    309    258    5107            �           2606    32280 ;   risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_fk1 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi);
 e   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis DROP CONSTRAINT risk_profile_mitigasi_jenis_fk1;
       public          postgres    false    5159    310    309            �           2606    32285 ;   risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_fk2 FOREIGN KEY (id_jenis_perlakuan) REFERENCES public.mt_risk_jenis_perlakuan(id_jenis_perlakuan) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis DROP CONSTRAINT risk_profile_mitigasi_jenis_fk2;
       public          postgres    false    305    310    5155            �           2606    32357 C   risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_fk1 FOREIGN KEY (id_status_rencana_perlakuan) REFERENCES public.mt_status_rencana_perlakuan(id_status_rencana_perlakuan) ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi DROP CONSTRAINT risk_profile_mitigasi_realisasi_fk1;
       public          postgres    false    320    322    5169            �           2606    32604 C   risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_fk2 FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE NOT VALID;
 m   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi DROP CONSTRAINT risk_profile_mitigasi_realisasi_fk2;
       public          postgres    false    322    258    5107            �           2606    32297 =   risk_profile_mitigasi_timeline risk_profile_mitigasi_timeline    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline
    ADD CONSTRAINT risk_profile_mitigasi_timeline FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline DROP CONSTRAINT risk_profile_mitigasi_timeline;
       public          postgres    false    312    309    5159            �           2606    32336 Q   risk_profile_mitigasi_timeline_realisasi risk_profile_mitigasi_timeline_realisasi    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_timeline_realisasi FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi) ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi DROP CONSTRAINT risk_profile_mitigasi_timeline_realisasi;
       public          postgres    false    309    5159    318            u           2606    32128 /   risk_profile_penyebab risk_profile_penyebab_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_penyebab DROP CONSTRAINT risk_profile_penyebab_fk1;
       public          postgres    false    5139    290    289            v           2606    32133 /   risk_profile_penyebab risk_profile_penyebab_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_fk2 FOREIGN KEY (id_penyebab) REFERENCES public.risk_penyebab(id_penyebab) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_penyebab DROP CONSTRAINT risk_profile_penyebab_fk2;
       public          postgres    false    5135    290    285            e           2606    32004    risk_register risk_register_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT risk_register_fk1 FOREIGN KEY (id_tingkat_agregasi_risiko) REFERENCES public.mt_risk_tingkat_agregasi_risiko(id_tingkat_agregasi_risiko) ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT risk_register_fk1;
       public          postgres    false    5129    279    277            f           2606    32061    risk_risiko risk_risiko_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk1 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_fk1;
       public          postgres    false    283    264    5113            g           2606    32447    risk_risiko risk_risiko_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk2 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_fk2;
       public          postgres    false    5179    329    283            h           2606    32481    risk_risiko risk_risiko_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk3 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_fk3;
       public          postgres    false    5095    249    283            ^           2606    31992    risk_sasaran risk_sasaran_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_fk2 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_fk2;
       public          postgres    false    5127    270    277            _           2606    31912 /   risk_sasaran_strategi risk_sasaran_strategi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.risk_sasaran(id_sasaran) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_sasaran_strategi DROP CONSTRAINT risk_sasaran_strategi_fk1;
       public          postgres    false    270    5119    271            M           2606    30954 !   sys_user_group sys_user_group_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk1 FOREIGN KEY (id_user) REFERENCES public.sys_user(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk1;
       public          postgres    false    218    241    5054            N           2606    30959 !   sys_user_group sys_user_group_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk2;
       public          postgres    false    5079    241    233            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      :   $  x���MO�0�s��xDK)r�`��a��e,N�R����.b��LJ�B�y���g08~�Mo�Nh>��~���V����SO/4���`���2�nxk�b@?�z�����Z�R\���w@~��x����'_��)�T�P�,����n�2���J$ۊ�����[���S� �ݫ-�nDI͢��=�]o��m���ou�������j�x(��fpt8�erx��B� �㊍A�� u�ߢ�fQC��[��g:;�,w|���C-­�t}��<�E%�u�$�r?(�      r   p   x�3�t.�.-PHI�SpMK�.�L�4202�50�52U00�20�25�*㇉��0TNMJL�L�C7����d�V���L�LĬ;�r�&N�R<�£�C7���qqq "X[Q      n   �   x���1�0й9�G
!M��+ q�.V�DԐXi��a( *EH������8�bp�"J`� 8����&�=�"�8`*�T���T�n�jd�����	�\8��^��Ͳ���c��aӅ;����s����C��A&���k���bT�B< :v�^      x      x������ � �      z      x������ � �      �   a  x�u�1o�0�g��*:4��@�ڪ������Y�7q	&2Ъ��:�!!�ox��|Ѐ�El_�QeM���V�UC�qy�X��C�#q!x"h�j�W�	�C��U(�Z��$z�(s"[0��I
TC9��$GVЀM�����A�9����G�Zii>���4��@����z.E������4ШZÕDæ6&���&��x�E�;�9v���S��6$Zu6��M�$�T$���e�t��D��g���
�#ԋc���^��W]�U�ζ�mw�;��Vx���U���!m�f�J��6ua?�g�A;K�rƕ_�l62J�����Q�g'���|��)����"�_�<x      �   ~   x�u���0Dg�+2�%�����Ds� YTv���ԩ�tӓ��e��f�Ƈ�E{[�)����ՙ5V��	`B�1]�rsqY}�p���Oo�*m���\�:��ygib��yI/�9����BF      <   *  x�u�Mn� ���S��f0�eVU��H�2�V��F����kl�	q��ȶ����������ѝ�������><�:F���5��
����QZ),	�?���M��A̅�t�U1D.y�*.x
�j�'s�E�����2I�$cє$a9%I�_Ήڵ\2�ӹ?t��TyKeUR�ŔOF�s��Y�*xp�G�_�0�U�P)���"Z�F'E˩�0���
�6���̷�	�&͙�K��{{+;w8S���6A�W����Kck��f��i�#jx��F��P�ݟHNվ���&M��      B   c  x����n�0Eg�+�.D=l�cѡ@�6K�,L#���0d��+�C�`���k�\��"�]��e�������Ah�m�l��
t��Y��~2-z��2f�X�Jt�e5f�)�
�r�*4%ϲcaV�X�����U<�a�H��i@g�0���07H��)怇U��MP�T]��b5���rβ�ư�5��[��tN�Q0��v-�A�X�g�� W��`5f�][jd�{.t=RO7���'�T��p?�N�\L�\:�+H.f��b5ֹ[������!��=x�>PW�ot�;}Q��}8����D�u�ݿ1�����
��g���쿔6t	�>���4��&��,���      C   �  x�œAn�0E���l� ����"5K6�p�dlU�}��,%R�UB��3o�ؑX��Vi�rCul��Vʴuǚzk��R��ź�^�q=���=+�(�s�4!a�u�$2d�$hIk�]�z�q�W�0�0I�&ᤖ��|�H,�IX�)��N�N`������B�y(��-=�f���b��n�6l�����39�z����Uu>s9��쥩�s��g�j����:�IPr�X)T������剷��d/kzB`���M�N���WD�i"R?�	�e4��q#,��V鏣�*�:`ۂ� [�ODv�^&(�I�Y<&{�����\3��o��)W&�؈��57X�q�ԙc/�K/���D����|P9~|�5�����,�\|����%�o�.��      D      x������ � �      F      x������ � �      `   �   x�}�Q
�0D��S���B�A)H�ϊKX��
	��
�k�k�73��(�ɬ��H!H�Y�;�;7���oz��/�ԋe�Bf��TL�����5;��3���Y1�$	�L��>��!B=�K=^]!�	��p�@B�pE�7���-W7      Q   r   x�3��LI�V��I-J��4202�50�52R0��26�2��*㇉��8���S��K2�е[c�j�1�o~
�E%�Z��c�����!��Ř�L��a5(F��� ��C%      O   U  x���Mk�0��)|�5z�n�R֥�B3v�E!j�)��l�����`��4���%?�0�rx�g�Z��D�m���w{0�0x�<N�����J%
%�Y��R�j�i�^��sb�y�Tq:_�R\�ˋqy1_~��[{��U���n-敊r%�۩g�'�㹜{k��?��>��m���Wm�J4h�J�(�H�u!��ǔ(��J�D^&\��]��˶!v�5�l '���P�"��y��]{���x	�L$���h�rp�y��snsu{�}�q�=�dR�VK�j5�2o��}���4�%ܤ��Ѷ��{"�c�b�P�������VG��v1|8�%��p�Md�k�k�~�T1�f8�'&i�/���é]�n�Qus�]��,�[�.�IN�e�/�x�+4ÑbB�F�n��p�ك����-����۽�K� �,���r���jv�����G�v���ə�.V���ͷ��=xh��P�D3\�A�r���:���H�����4�Tˣu=����J6h�B|��:gI�<�w(��)kܩ�ў2�a�Ó6��^��%���q�ζLf�Q��l/~�z�W��o5�7      M   �   x�m�Mj�0��|
] FI��.�B)���]6
1Aq,)��iH4���0ϋeK&k�v>�q�o>���?��7�碵JZ� �խ���hqU�*���p�g7��ߑ΂ 7V�<O�s�{� r#a͠�+�}�y���T���5���A׬�nHw�'�<?���O.���'_�n�k���������Lyb���
In$�"���.,ߗ.��)�.tX��6���Pּ�����UU����q      K   �   x�uб
�0�9y���*�%U�ѵXEq�PK�4���oņZᖻ���NJ�u�ƛ�Bi��:`'�}ا��7�3� C�1��*�U|3�I�L����T�)���R�C��p���J3(c�%����ky7���5z��Ӧ9�ऒ�4'����L�����'g��zM)}�Yf�      >      x������ � �      ^   n   x�3��,���W��/*�/J,�4202�50�5�P00�2��24���)[�[�Zp��aE\F0]2ˀt�,��<�f��3�2�P�_������ �V㌸b���� ڇ7�      G      x������ � �      I   �   x���1
�0Eg����,KQ�2�Yܵ�,z����������C���tO��n�!$��>��$�x�0JN�;/,*Bj��/iB2A�XuY�&ԝ�8�������V���vg*�������lH�]�Yq�rdw
�:%���� >�Ozu      ?      x������ � �      @   f  x���O��0���S�Tm��6� 7��Дݔ����iq�� 'Y�o_�jJ��c!q���~���M�>����k�s^����{7��#�zq��A���}���8w8��қt��i�UK��F��(/�;)8i�����5�p)��VӖ�a�}�5E_I�aw?v'Z����)a9)�ˁ�9��m,�Ռ,ܳVm) 8��^Q������E�������Q���X�N3��=jV��&��C	iem0�{�`�&=��*˖6w�L�Ԍ���}~��0�?�jƾ�3��@�ۃ2Z7���vk�4�"ڑ�U�*�6h�āԌP�Iyu!J�m���t�f�X�N�2�y�c
[����=R3z���grhms�5�����39�ڗm9��bW9�s��L8ȋ��);�#p���;�v�%"ͼE�y���p��b�o��%���]i2K[vk���:v��62��pC]��W�[jZ�L.�U�@	(~�f?�!6�-����U�~o#�b����;�Y2�e���0��2����@�-�SC١�h[m{��������3ԅX~��y��|eJ��� �d��q��p�=H��r�YYj�N����0�~�H�      Z   @   x�3�H�KO�*M�3�4202�50�5�P00�26�20�*㇉��&a�22�*�դ=... h2!m      �      x������ � �      �   @  x���Mo�0��ɯzn�X��Ʒ�0����u�QՎ�IN���)�?���a�Q��˔RN�(�*5�l�gZ�����C�,��mW��Y�](iזՔ�R�'���[��n�ܭ�*zH��g|�f�z�&���W�̉K��Y���q/T-�dNF������ި����kY��J�O�����e�a�6\���D.F}���b��֭��T�?���#}^��k�j]�5���hM�&�Z~Ț.N{:U�g9��Pjٓv;Ϊ�Υ&[�Z�*�Ã���S�$���ϒ�s�������Y=���B�SunNF:W�wQ�CT�K��+��9p59�{��tV�\*�]*]��ES,���4g�'��:��h͠@���2X���=#�g*&*Ԩn�k��A� G0n�W[uaF�!��G��������Ħ%>-��
�o�0	 �i�M"�Rڅ�9��|���>
9D�v�`#�lÌ*D]�dr�I���6i��Y�WR�z�������]:G�d-���Jw�tv;�;|�\W��2�]Cm'ݍт�V�סY˓(��E29�1�	��|@p�_C
���{�M�2�=����u�wo#�q�.3��7�p�{���2H9�qK���>�>�����
�`�b��hޮQ&�klF�3Z�	��!�s�s|J��0�f�O��.V0�=��ߧ�p�G,����^����'۶��[��� ��]��_��];g�
������@2B۷v5��&/F#H�������>@�ŻXc�w�������������CL�����b���R)��D��.x��\.��ġ#      X   �   x���A
1E��)���䧩i׮=�l�x ��؈��B ?�|!0���33	G�H����-,'ᮭ��_M�(��^7UaR>��q�?�d��ˑ7lC�aZ�j����L��T2��4��|JtŎ��>͚SJ/"�=]      f   �   x����n�0���y�N��ԷI\�'�e��M��`�(�rY�C�K��& ��M`diP�;%Q�-(
�^s3��󾇔_ݿ �zQ�iE��ԡE��Ui����Y�؟���Y�S�b��a�T?5��j��&)>�?�j����n���"��PlU��l��K�����:�I���w�V�)?��=�������Vw�l��g�1]��9����E��qw�;������1_��ٵ      S   k  x�uR�r�@}Ư�h��b��}���|	e��^���7�Uk�fg�s�,:I�	���]�I��J���R�K��*�*L�=�v�_���E&�:A_K���:�w��t*qg���D���ܝU��^�<�$��8�|d�{�����g�X��6Ei����I~uͧt���Z���c�~F�u�?���,�����Gہ�m�����!�I���E�E7�6�[O���A�d�C������ o?�bdO�ڐ�ʞ����j�.Gjj�M��8�H^Z|��T�,�c�"<�����7�K�R���~�%�#r_�G��u�I�NR�SH]�{�D_o��̨Ԩ�!w�/�\�n�X,�@�ӹ      �      x������ � �      �      x������ � �      d   %  x����n� ���)� ���ۤ�&U;옋���ъ�����6ղ��v�d!���g�	�}C�$�j��Rj�[#�Q빦��ڍ�kr��.�B>좨�\[1Mcd<�����3��F�F�;��o�5[�7\h=&�g��ΡE�m@8ِc���6.A�Dv8#-��m���챳��������^��u���V?�Z�%_�x����:
�尀W�������h���lo��\ ��Fo��xI�eDy�E(��Q�
���f8�? ��Q���#�K�}���,�\=E����D      h   �  x��S�n�0<���H�!�XEꥩ"���i,b9@d���}�	MC^ʥU�`1�63;kF��:h�k(��&��񞙪�'x�uYv|o�����d�[XY��V{�غt]]b��7;��
��oCk?5�l�%)�|N�Q9�P�)�{,QT*�)J��2G,���F��k'�4^���љ���b*�׶=,[�j���k�!�σZ�\ɓZ�L���J-n��`99-C���QG�}�8ƣ��� �*X�M<�Ej�tBb�R���˕���!)�+Ҁ��`���m�b2�Qۍ���<r�$#�@��-J{6E|Ǣ���VD�(W�_��]t0.~��ho֡�zǢS�#�[&�-S2�Q��s�"6y\�r�$���^�      p   �   x����
�0@��W�&I��[�~�_�Kq������ۡ�	u���^�K�� ����� WȕE�Vl+�˼8'�Bw��VQ1������n�Ip�=/��~�>�0��]�a
���cʵO���4�$�-�e�*���B��,���FSK�^bE�!��З9�2����M��e�7��"+���R����      j   �   x���In�0E��)t�Hyຫ�	�Qj55��E�����؆ҍ.�O�}A_�c3��cY�h%G��r�2�JuN��Ǒ�Y=7�����%�s�;��"��d�����mkv~�c���&N�ܼ������H�2���ڟ���
���H�}{���Em�$I-	�!����n�g�<�W�ԉJZ{J���]��	���z��|�1�?j�R&�'�����_���P7I��E�HjI��%˲_v�      l   &  x���Kn�0����t��y�!�`6QĔ���P�/��$RC��l�^��Ώ���M�2��i�	��A�I�l��f
����(*Ғ�cmہO#+�DZ��k�7�/���/>M�Q�&�Ȩ/���%��_���E\hE�+9z��ǽ|,(�/��$�4��K�5�4͇�r=�"I�$<�V���k��J�_Z�&�wV�Z��2J�!UPL;�Ʀ�2py��3{�u�տ}<*��"9�C��Ų���ˊ�h�YC�bm,�n�R&���L��XN��F�X�@�S�ewW-&      �      x������ � �      |      x������ � �      }      x������ � �      �      x������ � �            x������ � �      �      x������ � �      i   ?  x�ݓKj�0���)� I�Ӳu�B��l�X$©d���Wr�<�B� ���?�f�qE4y���u�z�c��~��a�ao}ѧXl�8$;0m��m�M�����@���)4|N�|`��3i����7`Okq,%�=de��W�ǭˁ��K�`�/oY��RN�\R���4�4�Aӆ��~XEE8��Mk����XM�$��C��U]^���(idu��F��HuF�����7=+~ʔKAs&����=+md��&N,q����a]Wv�i��ڰ�Q�W}���ϣ�.�	�6X�I�?��0���<�j��q�R�7K�(�      �      x������ � �      t      x������ � �      \   H  x����n�H���S�j�#M:��H��N��z�Mu��xeT�#e�~�m��>5X(����9�[f&��X��M nhH�H�GmD	I�j�ߎ!�oV�ǅ���/T�y���'�l�!���36/�i�?��lZ�=��M�ڔB����G��:��T�4K2^.���� ؠ�OѧZ*��i�F�*4CУH�]P�4�Y��ޝJ�]����Zk[t�Ip �f����~�\z�b�f:=;�z�0b#Ts�*8<�;�{���<{G���ǰ�Ǡbu<XX�DQ�)�U�#���"�N�a�y�9p���Щչ�Ɏ��;���A�S�E�A Y���o��!�'�%�^�5
e��(���h��Jo~(�R��%;��P��`A:�e7�S�x��߫m����Ģ����������uͧ���gv�Y�k��1�Y�Xg�����%���8-d7����uQ]
ԃ��k�+�<}z�������n5�����2�o�ц<ïi��%C�|<:}:j��d���d9��:'K��l���T�v_���^�FS�ASW��Ů����-:%��z�E���&�=����n�v��s�Y����@MF��Z�����r���dM^6�%w�W�� ;�,;T�����J��}��+�|QPr�2Ê� b?��Ï��2y��V���~M�N�WZ���GU�)�C�&Q��	G�c|1I^u?�v�B��WZ���BoZ�j��\�Ef�Hn�4/,�4��~G��N#��F���f��x>/�O�J��v�Oأ���SLlg��:O�[V�x�L�MJ{���&	�ic�Qٕ"��.�,<~�-p��e����yP��h���
��&�&�nAv���zXpd$T׺���~jsa�f���FC���mc��?�L�t���U6/����a�OM�7/���:���[���b�:?��K��I�\�'���c�3�����E� @_Qk`�](FA��ڵ��#Erm޴%ۓn�V��@���&���M�}S|�ur���C��_.�m7d���Đ��	����P��3x�����4y      b   �   x���Ak�0����H';N���Q�a�v�E�n0��8���)�62!�}i�P�g2� [��s�w�,^�T���1�Wt�x�9\ %e`5�����}�M���0��+�7N9�9��cȜ��.N}'wMn>.�-R)hW��^�H�7}�yi6d�V
i���3��P��i�3�[����]�_�rF��T{TZ�O|��>��iB٣6?���z��rH|�3��(�� }�n�      U   �  x���[K�@����b^*
V��Ԛ7DԖb}�2!K2�fv7�{'i�T�A a���3�&k2T��zth�z2�����;��;\�Q��)�{���+2H�@�tO���0�HMћ}�PC�N��V*[���Ŷo�6�T���MpT��/�HE��,JgI�E.e�.��lI��<�y���j���ܮ&��nu�9X�'k�i�(,9�W:��9ր�³j
��ZY����`��2��*GP�����EC~�lvf����� :��	4|�ĝ�Hś�:׾(��4�T|W���p,O�lz���y�O(��Ĺ<�R��<;�u@n.�Z�~$�k��t<\�ַ��a��/�0���]�wx��÷0�T�Q��9��`y�8މ��`���<�Z��\.~�n{6�L^F���      V   N  x��V�n�0=G_��m�t�r0�F{�ed�C�r�4��wFvR/�/@���ޛ7I��㯇<��YZΊ���*˪ru+�*���㺛̒rz�A�B�4��8�
��\�ʼʖ�\%�I>1I")&&�#	��Ċ��yr���ĘK��M��B�fb�5b�1�4ܤ��2�q|ҏ@��Yv44[Z�=����O��㞳X�Vi�\A��d�4*thT4�*�i4(MT;1hN�u]p�ݓ�+�z~y�044���*��Ök�[	�҃,;p��4`��
k�v0��7'��,�XZ���2&.��7O`��p������V5(�����5��$���Hs�An'�B���W.Y�M�$6���%#,�	Đ�3h	Ŭ'w���p;����:<�q�,�j���Zqҍ:X-���A[g��_�|&�O�2
���kE;NV����m4~M�'Eþ�(���sb�����2W��*7���oG�_6?Ow�3�����
�O���C7h$4ݫ�f�����b%���h�؆���+|�9q~���#ˍ���H�u��9I�Cf�u      .   �  x���K��6E�Y����R,�+��@��@��0��w���wnL�I]$OQO�'(1�}���ϯ>�ǯ�������_}����P��/��z�[������[���������O���i����s����o>��=�O[|���v̐�
vPr�1ȝ���c|�x�̘3�Ò�ǶaƤ�+t������;��j��cr��ɘ1g�=�̘��
�۠���!2�B4dǌW��*���{�7*D$Θ�{��2(Ň�1(�
�3�4S!g�t͘�F���7̘�{��� ���
�cƘ&a�w�f�9F���N��a��Jo�gƠfj�S�3cL75qL�ό9���1c�0��ʏ�35S�g*tf��&�ꡚ1�25�L�όI��vE�G0:3US#�ܱ,�Xl�F�YegƜaj$7�����E*��L��TM��Xό1���1��̘3L�$�WE.��M���<�u��{Ơ�@K��z�������.aƘ���8�c�����R#�X�����HN�º�{Ƥ����A�)�ϳT�1peI4Qjmm9�Uʘ3ښHn�ƚ1��uZ��7h-�T7 �Y�,���m����Ռ9c����r߀$S��~���Au�3�({:�r8c�؀ �ܳ3cR߀$3�� ���1f�I�bn�pƜ�A���$�1�J���|6�mB(��旾!T:�J�kB$Θ46 fif��Z3�aL��,t��Jg]�kB$S�k=L��ByD3�3cP35a�|Ό1���1��̘s��H���|��S���q�͸7S���3cL75q̵�z�ej"qƤa�u�7���1���0k�kƘnj⬕�s.Si�u͘�M�W�ĸ>���A�ԈYWY�s4S#�T:�G�c�I��Q>*��y�i�vcU3US#�ܱ,�fj�k�f��F��+����S���6�l���>l�TM��3�4S#���9��D�?]�In���6�<�v{V�2A��&��Zo���A3�F��L���s\G���2A��FΎ��4a#��6'��ۆ�	�̝s�	�mC�Ɏ�0)��nk�N��-�s]�2��Ob���M(�KN�C����(c��	R�6pl���*uq�T�L�enB�*�7U�6�+�v�S&H���1�2�A��M s�g&@��	�����q�s�`z����8��ҙ	N�7�L/�� ]�&��(���6I�M:f���M����r�7��M(S�������L �e�L�����9cNh�F��������ez)�w�.t{3��*o&U�3��fF��2�3�aoD�����]̕췣�)�jo䘞�����2Kg�K7{�.�]/���]�m:nO�S&H���1�>�3����2�>��7�L��L����ځa�[ݚ	R�7q�>�f��썠u��L�����W�j�{���ro&��M3#�g���	�6E��7�L�|Y��1dYW�s��R��ٛ8�B���t{�4��^�N"	e�T3��6�R�^)�,9�'���~� Ӕ�MS^�&�iK��rGs���e��ٛƘڔ�@�@f�U3��M(S�w'�H�\W��k�s�;�9�fo���ۛ@;ftٛP�	T��~�&����mi~J�3A��F΁s��$���9�aoD���� 7�&w��r��v��ڛ8i�e���A3�FT�L�����m��W�f�T퍜3�i�FЁ� {*l�1jQ�au�Vʜ	R�7rL��~��)	�̥��{�R"�a&P��{����uAoO�9%q"\�ܛ�J�����I%�L�~iU�w�������g���M�s�a%�ftٛP3���V���Q��{�9�fo�D����۠�ބJ�	԰wYGݾq9g����mN�7�ftٛP��A>��qj�_����@?��ϙ 5{'b&8���]�&T�L���/S���%���`��ٛ83����6�7�<f��}����.̙ U{#'aƜ~j���� {#�`&P��?������^�q��1b&X�b�e\����`ŋ���5.a&X��u������7��L��_�"'`&8�u�f��N T�L����kE��=Ӝ1�yS�*g�e�ǵ*}�G�ř@�^���~�����0e�k���0�Ԫ�mPU"T�L��X���;�����^�늘	���4깓x����#~��y�83���K�	��qB�	T߅SEʫ���O��L��.93�i�pE�h��ř@�]���Q����g�Tw��13����*�	�؅#j�Q���Ǐ�z^      $   9  x���Mn�0���0�gƿt�	z$��)DV=|ML	� R#��[���iƃ?��n��ݎА>!+��&v�����
����yկ� 9m�e5���5���M~m8� �V�S99"���g���ұ����6 ����{ճ�[��x�ׄ2���d6�R�u������w�uNoT�91:��8S k�;( ;2�z�l�Tb�4
��
���
"��H�`$�]a��9��+�PE�q�4[�t
Q�]����ʯl��E�i�3���w�������C�[ж�eL�|Ea��9� ۶i�_,�"�      %      x������ � �      *      x������ � �      0     x����j�0D�گ���VR$��[���s)�:�*JH~�Nh�ڒ%�if�1�H������?/!���ڃv>ڐ $���kd�f�e�٨h�W᫖����
��[�\��-�'�5�c�M�x���૔�	�\�?��k�-+J�De��U�KL�ʔ�O��[��q�L�����Y-��%����[�]�?a(�L;�	�e�$v!ģ�[�����V
��t�_��4-���V8j���_�٧5ȥH���� ����:      7   �  x���[��6D�9���������_G�Zp�p��bu��=�u�e�?˺�Z�_��ײ~��{_�?�����.1��6��SF+��"Ȕ/9f@N
�J���1��j0pV���0��u	�5�qO`�����/F����a?K��P0�1�`�|D8*^� x5�LY��]��3w�z�������ƹ�z����+�kH�4�!�ڼ���wk���8�i��K,Ȕ��^/!kŐ5��w̿�����w�{'�[�'�l8&��ƌ����Gtϯ!�A�%�`O�}ۼ�����A�u~t��א_�m;_C�s�W8��``W��}ڽe`O�R��WF\Apm��3Z|F��hA��Ίϣ���D����U���ޯ��~D�qpD_�q��L`�	�u�QFl�m,8�����������{&κ�/~�F
k��>m$�F��
.�����*.�ם���| 8G�~x?�d�[�E��`DX��X'#S�VS[M	��X'�UM�@`�)�_Ū��	�f���E��q �����Gnz�{������=O��b���������R��J�k�7�/��*z�xO���}Y��RxO��J�=��v��J�=��{*����c�z�
�i*������qi��2��TXOSa=���`F
��祝�{ڲ�)��-��{�e�?RxO���G
�i�t��H��T
���8���
��S)��q��K.��P�k.�S�A�S)��RxO���I�{O��J�=��z�K���Gb]}$��Gb}����&�uDk��1=O�������;;/����T�ڊ��S����N��0!tl�}=�&@��1!x���+BZ>1'@�(��y��R�ש��$$'vˇ�۞��	��l&@pN�l%&@��9�!� ��=��� ��=�9� ����)?�sreC0�srg[1�srgs2Bs���-|B��&�=|Bhb5��ibB��؄��j����&'v�r'�e:�۲�� ��U���#���D\Apu��w����#>O���_
�D� �A�'���+>c��X���x�wq�1�+Sqb��'V��;3�@`bB�[&�V���!!t��@f,�n�`:px p>�܀w�%�;��w�V&,{�w/|�����~:N�Q�(80������hx`#      6   �  x����m�0E�3U���%�����:Vχ�� �>�� >�M:��(������O�;^g}��<�����^�S�4�%T�	�UJ�r��"�%%�J�Ay�{�۠ı�X�_yG)P�J��h*w�Dܠ�n�|�E��\��[�M9/�[��˾஫5
�����(��ռ�v�F��]�.p�����U߽E�ݾ�ܢ�n_��[��]�җ�j��rW�t⮫�N�u��y�j�wC�Ӊ�����ݐ���!gwC�.�x��p7���n�_�4�M�N��nU�[�u��A���\���t0�Jq(����0M��\�VḂ��ƈY��!d�{HqB���.� I24���.�~��]�Pd������9��B:�&B0��%��.jO��s�&�n=ǰ]�v�X:��w!��lTs�م`��Ʋ!Αr��.�뢱��.[e]T��V����)Ő����ڦ�b����u���g��Ϝ�O}=�Ͽ�g(      '      x������ � �      (      x������ � �      4      x������ � �      ,   �  x��ZIoܸ>ӿB���=q�v��g'�'�j��0��!��˿�E"%��m ����Wd�v�1���JX�Ļ��$�U`<I�J�J�(f8n�����'5���w�͋~���P
�R��8[2�*-P�J1??6����7G��!�*!c"���%��a��oB/��+.b:���9��0~��e�}���^��}ә=���������$�=G�h%Ss�����ᔑ}��Fvd0�*.j��D�c`@�AGm�슽��@G1�cs���X��E��&�bNBI��w�:$�U��-�T�ߜ�A��%s�L�
|�	c��ԫ�g���P�)EZ��jd�2 *�Q̱���.��>����x��2z�w�����W��4�B�Q��/��-5�3�0��\KyK�`��J�bV
XH�U]�ڮ6rv�-ڽQ�蕰Ŝ-��ۺ��m�nGv�SJ���f!$[��%�%��̨�c=t��;8tM���&ni����]�OsR�f~ү���uE59\Â��D1+��:�@��b[�\
�W�(������
���zh��NyE�GdEW\r��菏��x�]���Su ܯn��*�1tiZh�b�=�W�/Y1s�I�Qr
�23��o�C��#�y\X3p��b��������zRCm�	^W.����� s������x��ɇ�Gs�3��`�����e���b�[�Bzh*�mA�8�k"�1��E��
_��""҆��y�K�~,�ߴlIYV4rQ�91�,��0/��H�Q�5���t��k_����;jh���)�����'�(E��s��=�X#�*,�*%�J�r���4�z)j��P�G�i�ߛ�A�h�j�pP�� KK({t��
W+��lbR��TfؒɅ�1,�&���zH�`SBM�b�L��Rׄ1g4
0嬒0wVs�3TP'�5�s 99w�4�U�,��1i>�nn�Y_i�q����`.>�@5� uU1�t�����2co�O\���SʨG2��x����s=����aP�gR�O}��˒Y�6!t��T!j_��/M�����®z��ܪ���J����(6�ixO�#Y��m3���H��]�L<�X:kǛ�H*��Ѐ�7�$sGq�����nl�,���IDDr1��#OW\?vh�����0�b�4�S!73�e����I�bν|��r1�2*4�Y[`�5��U`��^fYc�`���8$4���]�\�*Jxv}S��5��q�i��b�:��c���Ɨ`1��&g��}$�4i1��&8yT���J��%2c���@�9'��S��8RC�qg�qS9��F�x�����^=�5�.�	�V��B;�u�b���Y�`�cӋ�iD9bܛG0�Yg�s5�ѹ���ROM��>׏j���������f����G��9�#���������1��a�qcH6} 0A�\�gh{���+r�{Ȝ� O�aQ+_.{$P��l�#��x���8����1�Jޫ��zf��u�������CORE%���4�7�j��1r�s��(u��0�.�s���\�K@��.��y�r�\����`+Q]~w�+�t6�
0Ϝ���Qid1�9Mi�!#���H{v�+�,n�-�;!�nr�(���ڦwk���`5tYbZ�[n�-�u���I&%�:6uBLX��g2a�qssl�韁Ը��֍o��aS���.��Qc��my�"�i����4�_�].k��J��a7b^#�CUM��oJ��%�yJ�)a���m�u_^�7-�1/�Q!6�fk�����}������iż/3�/˙E�F��`x}|QwMM*D�YX���q��~�9��s����A�\���J�Bq���'�L��`���ĨO���i9aB_��F���D����=/Pl"�3Y�jԶ��_���^2�6۶�Ϛ���gK�,pFK_&m�C��0E+���x�!�����׿[\��iᔅ��C̟Äv��d>]��ä�01��F�	�c���!�*!b�F�,����?�]{����a��hcIrݖ(6I*���5y�'�KRi�Y&ļT;kk�!��Gs�7�y�a@������r�[����ȃ��'��a�\�����TFT����a��&ʵ =
�o{��p\vaF�|�3fJ��B�|�E<�D�bj*̹%�t��9؁���cHp^�ϵ^�/�16ӵ�2��-�l���n��L��h��N�z��g�}���]��<���\[���s1߆L����������ۨ�         �   x����
� ���0��j�DO08��hM2<#z�$f,%K?��(�B�\�ƣ7BOto�I�bqU�e�mN���E\����y�)�k��nc�=��a4hg f���A%���Xg&���z�8,�J���(��!>���O�)�䪉����0@p^��ރ�ht%Su��L�t+����5      "      x������ � �      #   �  x�Ŗێ�H�����˽��]E����QAir>d�pR

AE9<�`�=���I&=�@ YaU���_��Wm�c�E��|!Mϲ�0�C���b-q���_��)��S8���j���/�L����T�e�Z���d�����8�~�����1����7������q�'ߪz��Z�϶�Րo��PeU�d��5;�"�)��¿Fb�� �+úS��ʑ,�,�x�j1��[>�ai�]S�Q뙒���0�o����V�|�)3e�pT:h�7��/f)��^���	�!B4@hvg�K}�l�������1� Hvsi��rγ��n���Q������%�*�H�b��Ò��CO �03]K=+$1U �Љ�x%	��-����7IJrK<坕�'?�-�Н�2ۖH6�go�U�r���%�ɹ~�f�p�����~��[�+�Q������vd�Ёꊿ�0�w��!ɘ;�܎5s{<�As��6:�J���pBo"�{���x��]KL�y"�[R�W���:��S����2��l��7"��51��[�����H���L��i>��7g��E���{��T�b�ҁ)��m��g5r�J�O����23"ȋ�QZ�%�AZ�ĸ�T��B�m�6r�d^U�4��	�;�X��p���h���5[4���s��M&d���"�#+��z��gG�>Y�5I�4z����S4�|{�X��ۄ�"}'�}���U��@
M�����><�Gʿ�����W�.\����� @�.�0���q�멮^�F-!2��-�}�=]��9�k\��h(�]cO�N�q���3j�ӗwe��0ȉ���c���Ep�܎��[n@)���P�&T�E��?}A���=����r��E�$�.�W���v�X̱��Z�@m��x�
�*p�7�f�;a�x������m ���-.�eA�ڵ���r>iA����?D"w]f�P�������B�J��R�Yz�X6����6r��&:�*ڃ�*hͽ�U�[d�}HA�)B��^�����KT
d{�s|2[�\'}���˻�v�t葭fe�I	�b�i�LTm��s�r(��6�4���.�{+��b��A/�X��u���l� xpw���j~'J�ף3ݬVl�4�1�Yi�
��W9�`m�9X��ݐ��?��_����? ����      2      x������ � �      !   �   x�}�;�0 ���+XŶ�'�DlD�+.�[�@��׋:���咻�%�8d�{��R����]��c�~�9�N��Ka������[װ���h�J���Qሦ7\�Ө?Ji�Gf3�?��l@��L�:��vmWMK� 8e��j�Ʀ>��d���)yA(�j,�
2r�.3�\��*e���/^%�B�F�k��x[]Q�'��]�      8      x�3�4��"�=... ��     