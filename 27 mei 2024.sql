PGDMP                       |            hk_rms_lanjut_part2    16.1    16.1 ^              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    36953    hk_rms_lanjut_part2    DATABASE     �   CREATE DATABASE hk_rms_lanjut_part2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 #   DROP DATABASE hk_rms_lanjut_part2;
                postgres    false            �            1259    36954    sys_failed_job    TABLE     l  CREATE TABLE public.sys_failed_job (
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
       public         heap    postgres    false            �            1259    36960    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    215                       0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.sys_failed_job.id;
          public          postgres    false    216            �            1259    36961    internal_control_testing    TABLE     �  CREATE TABLE public.internal_control_testing (
    id_internal_control_testing integer NOT NULL,
    sasaran_bumn character varying(2000) NOT NULL,
    business_process character varying(2000) NOT NULL,
    key_control character varying(2000) NOT NULL,
    metode_pengujian character varying(2000) NOT NULL,
    kelemahan_kontrol character varying(2000) NOT NULL,
    rencana_tindak_lanjut character varying(2000) NOT NULL,
    due_date date NOT NULL,
    id_pic integer NOT NULL,
    status_tindak_lanjut character varying(2000) NOT NULL,
    id_register bigint,
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
 ,   DROP TABLE public.internal_control_testing;
       public         heap    postgres    false            �            1259    36966 8   internal_control_testing_id_internal_control_testing_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_control_testing_id_internal_control_testing_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.internal_control_testing_id_internal_control_testing_seq;
       public          postgres    false    217                       0    0 8   internal_control_testing_id_internal_control_testing_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.internal_control_testing_id_internal_control_testing_seq OWNED BY public.internal_control_testing.id_internal_control_testing;
          public          postgres    false    218            �            1259    36967    sys_job    TABLE     >  CREATE TABLE public.sys_job (
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
       public         heap    postgres    false            �            1259    36972    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    219                       0    0    jobs_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.sys_job.id;
          public          postgres    false    220            �            1259    36973 
   lost_event    TABLE     B  CREATE TABLE public.lost_event (
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
    DROP TABLE public.lost_event;
       public         heap    postgres    false            �            1259    36978    lost_event_id_lost_event_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_event_id_lost_event_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.lost_event_id_lost_event_seq;
       public          postgres    false    221                       0    0    lost_event_id_lost_event_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.lost_event_id_lost_event_seq OWNED BY public.lost_event.id_lost_event;
          public          postgres    false    222            �            1259    36979    sys_migration    TABLE     �   CREATE TABLE public.sys_migration (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 !   DROP TABLE public.sys_migration;
       public         heap    postgres    false            �            1259    36982    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    223                       0    0    migrations_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.sys_migration.id;
          public          postgres    false    224            �            1259    36983    mt_assessment_type    TABLE     �  CREATE TABLE public.mt_assessment_type (
    id_assessment_type integer NOT NULL,
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
 &   DROP TABLE public.mt_assessment_type;
       public         heap    postgres    false            �            1259    36988 )   mt_assessment_type_id_assessment_type_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_assessment_type_id_assessment_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.mt_assessment_type_id_assessment_type_seq;
       public          postgres    false    225                       0    0 )   mt_assessment_type_id_assessment_type_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.mt_assessment_type_id_assessment_type_seq OWNED BY public.mt_assessment_type.id_assessment_type;
          public          postgres    false    226            �            1259    36989     mt_lost_event_frakuensi_kejadian    TABLE     �  CREATE TABLE public.mt_lost_event_frakuensi_kejadian (
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
       public         heap    postgres    false            �            1259    36994    mt_lost_event_kategori    TABLE     �  CREATE TABLE public.mt_lost_event_kategori (
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
       public         heap    postgres    false            �            1259    36999 1   mt_lost_event_kategori_id_lost_event_kategori_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq;
       public          postgres    false    228                       0    0 1   mt_lost_event_kategori_id_lost_event_kategori_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_kategori_id_lost_event_kategori_seq OWNED BY public.mt_lost_event_kategori.id_lost_event_kategori;
          public          postgres    false    229            �            1259    37000 ?   mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq;
       public          postgres    false    227                       0    0 ?   mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq OWNED BY public.mt_lost_event_frakuensi_kejadian.id_lost_event_frakuensi_kejadian;
          public          postgres    false    230            �            1259    37001 &   mt_lost_event_sumber_penyebab_kejadian    TABLE     �  CREATE TABLE public.mt_lost_event_sumber_penyebab_kejadian (
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
 :   DROP TABLE public.mt_lost_event_sumber_penyebab_kejadian;
       public         heap    postgres    false            �            1259    37006 ?   mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq;
       public          postgres    false    231                       0    0 ?   mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq OWNED BY public.mt_lost_event_sumber_penyebab_kejadian.id_lost_event_sumber_penyebab_kejadian;
          public          postgres    false    232            �            1259    37007    mt_lost_event_status_asuransi    TABLE     �  CREATE TABLE public.mt_lost_event_status_asuransi (
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
       public         heap    postgres    false            �            1259    37012 ?   mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq;
       public          postgres    false    233                       0    0 ?   mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq OWNED BY public.mt_lost_event_status_asuransi.id_lost_event_status_asuransi;
          public          postgres    false    234            �            1259    37013     mt_risk_agregasi_kelompok_bisnis    TABLE     �  CREATE TABLE public.mt_risk_agregasi_kelompok_bisnis (
    id_risk_agregasi_risiko bigint,
    id_kelompok_bisnis integer,
    id_agregasi_kelompok_bisnis bigint NOT NULL,
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
 4   DROP TABLE public.mt_risk_agregasi_kelompok_bisnis;
       public         heap    postgres    false            �            1259    37018 ?   mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq;
       public          postgres    false    235                       0    0 ?   mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq OWNED BY public.mt_risk_agregasi_kelompok_bisnis.id_agregasi_kelompok_bisnis;
          public          postgres    false    236            �            1259    37019    mt_risk_agregasi_risiko    TABLE     D  CREATE TABLE public.mt_risk_agregasi_risiko (
    id_risk_agregasi_risiko integer NOT NULL,
    nama character varying(2000) NOT NULL,
    id_kelompok_bisnis integer NOT NULL,
    id_kriteria_dampak integer NOT NULL,
    jenis integer NOT NULL,
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
 +   DROP TABLE public.mt_risk_agregasi_risiko;
       public         heap    postgres    false            �            1259    37024 3   mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq;
       public          postgres    false    237                       0    0 3   mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq OWNED BY public.mt_risk_agregasi_risiko.id_risk_agregasi_risiko;
          public          postgres    false    238            �            1259    37025    mt_risk_dampak    TABLE       CREATE TABLE public.mt_risk_dampak (
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
    deleted_by_desc character varying(200),
    warna character varying(10)
);
 "   DROP TABLE public.mt_risk_dampak;
       public         heap    postgres    false            �            1259    37031    mt_risk_dampak_id_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_dampak_id_dampak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.mt_risk_dampak_id_dampak_seq;
       public          postgres    false    239                       0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mt_risk_dampak_id_dampak_seq OWNED BY public.mt_risk_dampak.id_dampak;
          public          postgres    false    240            �            1259    37032    mt_risk_efektifitas_control    TABLE     �  CREATE TABLE public.mt_risk_efektifitas_control (
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
       public         heap    postgres    false            �            1259    37037 6   mt_risk_efektifitas_control_id_efektifitas_control_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq;
       public          postgres    false    241                       0    0 6   mt_risk_efektifitas_control_id_efektifitas_control_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_efektifitas_control_id_efektifitas_control_seq OWNED BY public.mt_risk_efektifitas_control.id_efektifitas_control;
          public          postgres    false    242            �            1259    37038    mt_risk_jenis_control    TABLE     �  CREATE TABLE public.mt_risk_jenis_control (
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
       public         heap    postgres    false            �            1259    37043 *   mt_risk_jenis_control_id_jenis_control_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq;
       public          postgres    false    243                       0    0 *   mt_risk_jenis_control_id_jenis_control_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.mt_risk_jenis_control_id_jenis_control_seq OWNED BY public.mt_risk_jenis_control.id_jenis_control;
          public          postgres    false    244            �            1259    37044    mt_risk_jenis_perlakuan    TABLE     �  CREATE TABLE public.mt_risk_jenis_perlakuan (
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
 +   DROP TABLE public.mt_risk_jenis_perlakuan;
       public         heap    postgres    false            �            1259    37049 .   mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq;
       public          postgres    false    245                       0    0 .   mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq OWNED BY public.mt_risk_jenis_perlakuan.id_jenis_perlakuan;
          public          postgres    false    246            �            1259    37050    mt_risk_jenis_program_rkap    TABLE     �  CREATE TABLE public.mt_risk_jenis_program_rkap (
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
 .   DROP TABLE public.mt_risk_jenis_program_rkap;
       public         heap    postgres    false            �            1259    37055 4   mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq;
       public          postgres    false    247                       0    0 4   mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq OWNED BY public.mt_risk_jenis_program_rkap.id_jenis_program_rkap;
          public          postgres    false    248            �            1259    37056    mt_risk_jenis_risiko    TABLE       CREATE TABLE public.mt_risk_jenis_risiko (
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
       public         heap    postgres    false            �            1259    37061 (   mt_risk_jenis_risiko_id_jenis_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq;
       public          postgres    false    249                       0    0 (   mt_risk_jenis_risiko_id_jenis_risiko_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.mt_risk_jenis_risiko_id_jenis_risiko_seq OWNED BY public.mt_risk_jenis_risiko.id_jenis_risiko;
          public          postgres    false    250            �            1259    37062    mt_risk_kategori_risiko    TABLE     �  CREATE TABLE public.mt_risk_kategori_risiko (
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
       public         heap    postgres    false            �            1259    37067 .   mt_risk_kategori_risiko_id_kategori_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq;
       public          postgres    false    251                       0    0 .   mt_risk_kategori_risiko_id_kategori_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kategori_risiko_id_kategori_risiko_seq OWNED BY public.mt_risk_kategori_risiko.id_kategori_risiko;
          public          postgres    false    252            �            1259    37068    mt_risk_kemungkinan    TABLE     �  CREATE TABLE public.mt_risk_kemungkinan (
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
    deleted_by_desc character varying(200),
    warna character varying(10)
);
 '   DROP TABLE public.mt_risk_kemungkinan;
       public         heap    postgres    false            �            1259    37075 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq;
       public          postgres    false    253                       0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_risk_kemungkinan.id_kemungkinan;
          public          postgres    false    254            �            1259    37076    mt_risk_kriteria_dampak    TABLE     Q  CREATE TABLE public.mt_risk_kriteria_dampak (
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
       public         heap    postgres    false                        1259    37083    mt_risk_kriteria_dampak_detail    TABLE     G  CREATE TABLE public.mt_risk_kriteria_dampak_detail (
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
    deleted_by_desc character varying(200),
    mulai numeric(15,2),
    sampai numeric(15,2)
);
 2   DROP TABLE public.mt_risk_kriteria_dampak_detail;
       public         heap    postgres    false                       1259    37089 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq;
       public          postgres    false    255                        0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_risk_kriteria_dampak.id_kriteria_dampak;
          public          postgres    false    257                       1259    37090    mt_risk_matrix    TABLE     ?  CREATE TABLE public.mt_risk_matrix (
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
 "   DROP TABLE public.mt_risk_matrix;
       public         heap    postgres    false                       1259    37096    mt_risk_perlakuan    TABLE     �  CREATE TABLE public.mt_risk_perlakuan (
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
 %   DROP TABLE public.mt_risk_perlakuan;
       public         heap    postgres    false                       1259    37101 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq;
       public          postgres    false    259            !           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE OWNED BY     j   ALTER SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq OWNED BY public.mt_risk_perlakuan.id_perlakuan;
          public          postgres    false    260                       1259    37102    mt_risk_sasaran    TABLE     �  CREATE TABLE public.mt_risk_sasaran (
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
       public         heap    postgres    false                       1259    37107    mt_risk_sikap_terhadap_risiko    TABLE     �  CREATE TABLE public.mt_risk_sikap_terhadap_risiko (
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
       public         heap    postgres    false                       1259    37112 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq;
       public          postgres    false    262            "           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq OWNED BY public.mt_risk_sikap_terhadap_risiko.id_sikap_terhadap_risiko;
          public          postgres    false    263                       1259    37113    mt_risk_taksonomi    TABLE     N  CREATE TABLE public.mt_risk_taksonomi (
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
       public         heap    postgres    false            	           1259    37118    mt_risk_taksonomi_area    TABLE     /  CREATE TABLE public.mt_risk_taksonomi_area (
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
       public         heap    postgres    false            
           1259    37123 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq;
       public          postgres    false    265            #           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq OWNED BY public.mt_risk_taksonomi_area.id_taksonomi_area;
          public          postgres    false    266                       1259    37124 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq;
       public          postgres    false    264            $           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq OWNED BY public.mt_risk_taksonomi.id_taksonomi;
          public          postgres    false    267                       1259    37125    mt_risk_taksonomi_objective    TABLE       CREATE TABLE public.mt_risk_taksonomi_objective (
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
       public         heap    postgres    false                       1259    37130 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq;
       public          postgres    false    268            %           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq OWNED BY public.mt_risk_taksonomi_objective.id_taksonomi_objective;
          public          postgres    false    269                       1259    37131    mt_risk_tingkat    TABLE     t  CREATE TABLE public.mt_risk_tingkat (
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
       public         heap    postgres    false                       1259    37139    mt_risk_tingkat_agregasi_risiko    TABLE       CREATE TABLE public.mt_risk_tingkat_agregasi_risiko (
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
       public         heap    postgres    false                       1259    37142 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 U   DROP SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq;
       public          postgres    false    271            &           0    0 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq OWNED BY public.mt_risk_tingkat_agregasi_risiko.id_tingkat_agregasi_risiko;
          public          postgres    false    272                       1259    37143    mt_risk_tingkat_id_tingkat_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_id_tingkat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mt_risk_tingkat_id_tingkat_seq;
       public          postgres    false    270            '           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mt_risk_tingkat_id_tingkat_seq OWNED BY public.mt_risk_tingkat.id_tingkat;
          public          postgres    false    273                       1259    37144    mt_risk_tingkat_perlakuan    TABLE     �   CREATE TABLE public.mt_risk_tingkat_perlakuan (
    id_tingkat bigint NOT NULL,
    id_perlakuan bigint NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 -   DROP TABLE public.mt_risk_tingkat_perlakuan;
       public         heap    postgres    false                       1259    37147    mt_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.mt_sasaran_id_sasaran_seq;
       public          postgres    false    261            (           0    0    mt_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.mt_sasaran_id_sasaran_seq OWNED BY public.mt_risk_sasaran.id_sasaran;
          public          postgres    false    275                       1259    37148    mt_sdm_jabatan    TABLE       CREATE TABLE public.mt_sdm_jabatan (
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
       public         heap    postgres    false                       1259    37153    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq;
       public          postgres    false    276            )           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq OWNED BY public.mt_sdm_jabatan.id_jabatan;
          public          postgres    false    277                       1259    37154    mt_sdm_kelompok_bisnis    TABLE     �  CREATE TABLE public.mt_sdm_kelompok_bisnis (
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
 *   DROP TABLE public.mt_sdm_kelompok_bisnis;
       public         heap    postgres    false                       1259    37159 -   mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq;
       public          postgres    false    278            *           0    0 -   mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq OWNED BY public.mt_sdm_kelompok_bisnis.id_kelompok_bisnis;
          public          postgres    false    279                       1259    37160    mt_sdm_pegawai    TABLE     �  CREATE TABLE public.mt_sdm_pegawai (
    nid character varying(10),
    email character varying(500) DEFAULT NULL::character varying,
    position_id character varying(10) DEFAULT NULL::character varying,
    nama_lengkap character varying(500) DEFAULT NULL::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200),
    id_jabatan integer,
    id_pegawai integer NOT NULL
);
 "   DROP TABLE public.mt_sdm_pegawai;
       public         heap    postgres    false                       1259    37168    mt_sdm_pegawai_id_pegawai_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_pegawai_id_pegawai_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_sdm_pegawai_id_pegawai_seq;
       public          postgres    false    280            +           0    0    mt_sdm_pegawai_id_pegawai_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_pegawai_id_pegawai_seq OWNED BY public.mt_sdm_pegawai.id_pegawai;
          public          postgres    false    281                       1259    37169    mt_sdm_unit    TABLE     �  CREATE TABLE public.mt_sdm_unit (
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
    DROP TABLE public.mt_sdm_unit;
       public         heap    postgres    false                       1259    37174    mt_status_pengajuan    TABLE     �  CREATE TABLE public.mt_status_pengajuan (
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
    deleted_by_desc character varying(200),
    warna character varying(10)
);
 '   DROP TABLE public.mt_status_pengajuan;
       public         heap    postgres    false                       1259    37177 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq;
       public          postgres    false    283            ,           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq OWNED BY public.mt_status_pengajuan.id_status_pengajuan;
          public          postgres    false    284                       1259    37178     mt_status_pengajuan_page_disable    TABLE     �  CREATE TABLE public.mt_status_pengajuan_page_disable (
    id_status_pengajuan_page_disable bigint NOT NULL,
    id_status_pengajuan bigint,
    page character varying(1000),
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
 4   DROP TABLE public.mt_status_pengajuan_page_disable;
       public         heap    postgres    false                       1259    37183 5   mt_status_pengajuan_page_id_status_pengajuan_page_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pengajuan_page_id_status_pengajuan_page_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE public.mt_status_pengajuan_page_id_status_pengajuan_page_seq;
       public          postgres    false    285            -           0    0 5   mt_status_pengajuan_page_id_status_pengajuan_page_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_status_pengajuan_page_id_status_pengajuan_page_seq OWNED BY public.mt_status_pengajuan_page_disable.id_status_pengajuan_page_disable;
          public          postgres    false    286                       1259    37184    mt_status_pengajuan_penerima    TABLE     �  CREATE TABLE public.mt_status_pengajuan_penerima (
    id_status_pengajuan_penerima bigint NOT NULL,
    id_status_pengajuan bigint,
    id_tingkat_agregasi_risiko integer,
    id_group integer,
    id_status_pengajuan_selanjutnya bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    id_status_pengajuan_dikembalikan bigint,
    id_assessment_type bigint
);
 0   DROP TABLE public.mt_status_pengajuan_penerima;
       public         heap    postgres    false                        1259    37189 =   mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 T   DROP SEQUENCE public.mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq;
       public          postgres    false    287            .           0    0 =   mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq OWNED BY public.mt_status_pengajuan_penerima.id_status_pengajuan_penerima;
          public          postgres    false    288            !           1259    37190    mt_status_rencana_perlakuan    TABLE     �  CREATE TABLE public.mt_status_rencana_perlakuan (
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
    deleted_by_desc character varying(200),
    keterangan character varying(2000)
);
 /   DROP TABLE public.mt_status_rencana_perlakuan;
       public         heap    postgres    false            "           1259    37195 ;   mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 R   DROP SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq;
       public          postgres    false    289            /           0    0 ;   mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq OWNED BY public.mt_status_rencana_perlakuan.id_status_rencana_perlakuan;
          public          postgres    false    290            #           1259    37196    mt_template_laporan    TABLE     �  CREATE TABLE public.mt_template_laporan (
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
       public         heap    postgres    false            $           1259    37201 +   mt_tamplate_laporan_id_tamplate_laporan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq;
       public          postgres    false    291            0           0    0 +   mt_tamplate_laporan_id_tamplate_laporan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_tamplate_laporan_id_tamplate_laporan_seq OWNED BY public.mt_template_laporan.id_template_laporan;
          public          postgres    false    292            %           1259    37202    risk_capacity_limit    TABLE     �  CREATE TABLE public.risk_capacity_limit (
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
 '   DROP TABLE public.risk_capacity_limit;
       public         heap    postgres    false            &           1259    37207 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq;
       public          postgres    false    293            1           0    0 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq OWNED BY public.risk_capacity_limit.id_capacity_limit;
          public          postgres    false    294            '           1259    37208    risk_dampak    TABLE       CREATE TABLE public.risk_dampak (
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
       public         heap    postgres    false            (           1259    37213    risk_dampak_id_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_dampak_id_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.risk_dampak_id_dampak_seq;
       public          postgres    false    295            2           0    0    risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.risk_dampak_id_dampak_seq OWNED BY public.risk_dampak.id_dampak;
          public          postgres    false    296            )           1259    37214    risk_metrik_strategi_risiko    TABLE       CREATE TABLE public.risk_metrik_strategi_risiko (
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
       public         heap    postgres    false            *           1259    37219 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq;
       public          postgres    false    297            3           0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq OWNED BY public.risk_metrik_strategi_risiko.id_metrik_strategi_risiko;
          public          postgres    false    298            +           1259    37220    risk_msg    TABLE       CREATE TABLE public.risk_msg (
    id_msg bigint NOT NULL,
    msg character varying(4000),
    url character varying(4000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    updated_by_desc character varying(200),
    deleted_by_desc character varying(200),
    id_register bigint,
    id_status_pengajuan integer,
    id_group integer
);
    DROP TABLE public.risk_msg;
       public         heap    postgres    false            ,           1259    37225    risk_msg_id_msg_seq    SEQUENCE     |   CREATE SEQUENCE public.risk_msg_id_msg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_msg_id_msg_seq;
       public          postgres    false    299            4           0    0    risk_msg_id_msg_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_msg_id_msg_seq OWNED BY public.risk_msg.id_msg;
          public          postgres    false    300            -           1259    37226    risk_msg_penerima    TABLE       CREATE TABLE public.risk_msg_penerima (
    id_msg bigint NOT NULL,
    is_read character varying(1) DEFAULT '0'::character varying,
    id_user bigint NOT NULL,
    id_msg_penerima bigint NOT NULL,
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
 %   DROP TABLE public.risk_msg_penerima;
       public         heap    postgres    false            .           1259    37232 %   risk_msg_penerima_id_msg_penerima_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_msg_penerima_id_msg_penerima_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.risk_msg_penerima_id_msg_penerima_seq;
       public          postgres    false    301            5           0    0 %   risk_msg_penerima_id_msg_penerima_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.risk_msg_penerima_id_msg_penerima_seq OWNED BY public.risk_msg_penerima.id_msg_penerima;
          public          postgres    false    302            /           1259    37233    risk_penyebab    TABLE     #  CREATE TABLE public.risk_penyebab (
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
       public         heap    postgres    false            0           1259    37238    risk_penyebab_id_penyebab_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_penyebab_id_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_penyebab_id_penyebab_seq;
       public          postgres    false    303            6           0    0    risk_penyebab_id_penyebab_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_penyebab_id_penyebab_seq OWNED BY public.risk_penyebab.id_penyebab;
          public          postgres    false    304            1           1259    37239    risk_profile    TABLE     T  CREATE TABLE public.risk_profile (
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
    status character varying(20),
    jenis integer,
    id_risk_agregasi_risiko integer
);
     DROP TABLE public.risk_profile;
       public         heap    postgres    false            2           1259    37244    risk_profile_control    TABLE       CREATE TABLE public.risk_profile_control (
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
       public         heap    postgres    false            3           1259    37249 #   risk_profile_control_id_control_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_control_id_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.risk_profile_control_id_control_seq;
       public          postgres    false    306            7           0    0 #   risk_profile_control_id_control_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.risk_profile_control_id_control_seq OWNED BY public.risk_profile_control.id_control;
          public          postgres    false    307            4           1259    37250    risk_profile_dampak    TABLE     \  CREATE TABLE public.risk_profile_dampak (
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
       public         heap    postgres    false            5           1259    37255 )   risk_profile_dampak_id_profile_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq;
       public          postgres    false    308            8           0    0 )   risk_profile_dampak_id_profile_dampak_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_profile_dampak_id_profile_dampak_seq OWNED BY public.risk_profile_dampak.id_profile_dampak;
          public          postgres    false    309            6           1259    37256     risk_profile_id_risk_profile_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_id_risk_profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.risk_profile_id_risk_profile_seq;
       public          postgres    false    305            9           0    0     risk_profile_id_risk_profile_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.risk_profile_id_risk_profile_seq OWNED BY public.risk_profile.id_risk_profile;
          public          postgres    false    310            7           1259    37257    risk_profile_kri    TABLE     b  CREATE TABLE public.risk_profile_kri (
    id_kri bigint NOT NULL,
    nama character varying(500) NOT NULL,
    id_risk_profile bigint NOT NULL,
    satuan character varying(50),
    target_mulai double precision,
    target_sampai double precision,
    keterangan character varying(4000),
    polaritas character varying(2),
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
       public         heap    postgres    false            8           1259    37262    risk_profile_kri_hasil    TABLE     7  CREATE TABLE public.risk_profile_kri_hasil (
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
 *   DROP TABLE public.risk_profile_kri_hasil;
       public         heap    postgres    false            9           1259    37267 '   risk_profile_kri_hasil_id_kri_hasil_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq;
       public          postgres    false    312            :           0    0 '   risk_profile_kri_hasil_id_kri_hasil_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.risk_profile_kri_hasil_id_kri_hasil_seq OWNED BY public.risk_profile_kri_hasil.id_kri_hasil;
          public          postgres    false    313            :           1259    37268    risk_profile_kri_id_kri_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_kri_id_kri_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_profile_kri_id_kri_seq;
       public          postgres    false    311            ;           0    0    risk_profile_kri_id_kri_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_profile_kri_id_kri_seq OWNED BY public.risk_profile_kri.id_kri;
          public          postgres    false    314            ;           1259    37269    risk_profile_mitigasi    TABLE     �  CREATE TABLE public.risk_profile_mitigasi (
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
 )   DROP TABLE public.risk_profile_mitigasi;
       public         heap    postgres    false            <           1259    37274 %   risk_profile_mitigasi_id_mitigasi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq;
       public          postgres    false    315            <           0    0 %   risk_profile_mitigasi_id_mitigasi_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.risk_profile_mitigasi_id_mitigasi_seq OWNED BY public.risk_profile_mitigasi.id_mitigasi;
          public          postgres    false    316            =           1259    37275    risk_profile_mitigasi_jenis    TABLE     �  CREATE TABLE public.risk_profile_mitigasi_jenis (
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
 /   DROP TABLE public.risk_profile_mitigasi_jenis;
       public         heap    postgres    false            >           1259    37280 1   risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq;
       public          postgres    false    317            =           0    0 1   risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq OWNED BY public.risk_profile_mitigasi_jenis.id_mitigasi_jenis;
          public          postgres    false    318            ?           1259    37281    risk_profile_mitigasi_realisasi    TABLE     
  CREATE TABLE public.risk_profile_mitigasi_realisasi (
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
 3   DROP TABLE public.risk_profile_mitigasi_realisasi;
       public         heap    postgres    false            @           1259    37286 9   risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq;
       public          postgres    false    319            >           0    0 9   risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq OWNED BY public.risk_profile_mitigasi_realisasi.id_mitigasi_realisasi;
          public          postgres    false    320            A           1259    37287 (   risk_profile_mitigasi_timeline_realisasi    TABLE     �   CREATE TABLE public.risk_profile_mitigasi_timeline_realisasi (
    id_mitigasi_timeline_realisasi bigint NOT NULL,
    periode character varying(20) NOT NULL,
    is_proses integer NOT NULL,
    id_mitigasi bigint
);
 <   DROP TABLE public.risk_profile_mitigasi_timeline_realisasi;
       public         heap    postgres    false            B           1259    37290 ?   risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq;
       public          postgres    false    321            ?           0    0 ?   risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq OWNED BY public.risk_profile_mitigasi_timeline_realisasi.id_mitigasi_timeline_realisasi;
          public          postgres    false    322            C           1259    37291    risk_profile_mitigasi_timeline    TABLE       CREATE TABLE public.risk_profile_mitigasi_timeline (
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
 2   DROP TABLE public.risk_profile_mitigasi_timeline;
       public         heap    postgres    false            D           1259    37296 7   risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq;
       public          postgres    false    323            @           0    0 7   risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq OWNED BY public.risk_profile_mitigasi_timeline.id_mitigasi_timeline;
          public          postgres    false    324            E           1259    37297    risk_profile_penyebab    TABLE     3  CREATE TABLE public.risk_profile_penyebab (
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
       public         heap    postgres    false            F           1259    37302 -   risk_profile_penyebab_id_profile_penyebab_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq;
       public          postgres    false    325            A           0    0 -   risk_profile_penyebab_id_profile_penyebab_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.risk_profile_penyebab_id_profile_penyebab_seq OWNED BY public.risk_profile_penyebab.id_profile_penyebab;
          public          postgres    false    326            G           1259    37303    risk_profile_realisasi_residual    TABLE     �  CREATE TABLE public.risk_profile_realisasi_residual (
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
    deleted_by_desc character varying(200),
    status character varying(10)
);
 3   DROP TABLE public.risk_profile_realisasi_residual;
       public         heap    postgres    false            H           1259    37308 9   risk_profile_realisasi_residual_id_realisasi_residual_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq;
       public          postgres    false    327            B           0    0 9   risk_profile_realisasi_residual_id_realisasi_residual_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_realisasi_residual_id_realisasi_residual_seq OWNED BY public.risk_profile_realisasi_residual.id_realisasi_residual;
          public          postgres    false    328            I           1259    37309    risk_profile_target_residual    TABLE     c  CREATE TABLE public.risk_profile_target_residual (
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
       public         heap    postgres    false            J           1259    37314 3   risk_profile_target_residual_id_target_residual_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_target_residual_id_target_residual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.risk_profile_target_residual_id_target_residual_seq;
       public          postgres    false    329            C           0    0 3   risk_profile_target_residual_id_target_residual_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_profile_target_residual_id_target_residual_seq OWNED BY public.risk_profile_target_residual.id_target_residual;
          public          postgres    false    330            K           1259    37315    risk_register    TABLE     �  CREATE TABLE public.risk_register (
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
    periode_selesai date,
    sort integer,
    id_kelompok_bisnis integer,
    id_assessment_type integer
);
 !   DROP TABLE public.risk_register;
       public         heap    postgres    false            L           1259    37322    risk_register_id_register_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_register_id_register_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_register_id_register_seq;
       public          postgres    false    331            D           0    0    risk_register_id_register_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_register_id_register_seq OWNED BY public.risk_register.id_register;
          public          postgres    false    332            M           1259    37323    risk_risiko    TABLE     ?  CREATE TABLE public.risk_risiko (
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
       public         heap    postgres    false            N           1259    37328    risk_risiko_id_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_risiko_id_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.risk_risiko_id_risiko_seq;
       public          postgres    false    333            E           0    0    risk_risiko_id_risiko_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.risk_risiko_id_risiko_seq OWNED BY public.risk_risiko.id_risiko;
          public          postgres    false    334            O           1259    37329    risk_sasaran    TABLE     �  CREATE TABLE public.risk_sasaran (
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
       public         heap    postgres    false            P           1259    37335    risk_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_sasaran_id_sasaran_seq;
       public          postgres    false    335            F           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_sasaran_id_sasaran_seq OWNED BY public.risk_sasaran.id_sasaran;
          public          postgres    false    336            Q           1259    37336    risk_sasaran_strategi    TABLE     �  CREATE TABLE public.risk_sasaran_strategi (
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
       public         heap    postgres    false            R           1259    37341 -   risk_sasaran_strategi_id_sasaran_strategi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq;
       public          postgres    false    337            G           0    0 -   risk_sasaran_strategi_id_sasaran_strategi_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.risk_sasaran_strategi_id_sasaran_strategi_seq OWNED BY public.risk_sasaran_strategi.id_sasaran_strategi;
          public          postgres    false    338            S           1259    37342 
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
       public         heap    postgres    false            T           1259    37347    sys_action_id_action_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_action_id_action_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sys_action_id_action_seq;
       public          postgres    false    339            H           0    0    sys_action_id_action_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sys_action_id_action_seq OWNED BY public.sys_action.id_action;
          public          postgres    false    340            U           1259    37348 	   sys_cache    TABLE     �   CREATE TABLE public.sys_cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
    DROP TABLE public.sys_cache;
       public         heap    postgres    false            V           1259    37353    sys_cache_lock    TABLE     �   CREATE TABLE public.sys_cache_lock (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 "   DROP TABLE public.sys_cache_lock;
       public         heap    postgres    false            W           1259    37358 	   sys_group    TABLE     �  CREATE TABLE public.sys_group (
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
       public         heap    postgres    false            X           1259    37363    sys_group_action    TABLE     �  CREATE TABLE public.sys_group_action (
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
       public         heap    postgres    false            Y           1259    37368    sys_group_id_group_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_group_id_group_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.sys_group_id_group_seq;
       public          postgres    false    343            I           0    0    sys_group_id_group_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sys_group_id_group_seq OWNED BY public.sys_group.id_group;
          public          postgres    false    345            Z           1259    37369    sys_group_menu    TABLE     �  CREATE TABLE public.sys_group_menu (
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
       public         heap    postgres    false            [           1259    37374     sys_group_menu_id_group_menu_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_group_menu_id_group_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.sys_group_menu_id_group_menu_seq;
       public          postgres    false    346            J           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.sys_group_menu_id_group_menu_seq OWNED BY public.sys_group_menu.id_group_menu;
          public          postgres    false    347            \           1259    37375    sys_job_batch    TABLE     �  CREATE TABLE public.sys_job_batch (
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
       public         heap    postgres    false            ]           1259    37380    sys_log    TABLE     {  CREATE TABLE public.sys_log (
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
       public         heap    postgres    false            ^           1259    37385    sys_log_id_log_seq    SEQUENCE     {   CREATE SEQUENCE public.sys_log_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sys_log_id_log_seq;
       public          postgres    false    349            K           0    0    sys_log_id_log_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sys_log_id_log_seq OWNED BY public.sys_log.id_log;
          public          postgres    false    350            _           1259    37386    sys_menu    TABLE     �  CREATE TABLE public.sys_menu (
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
       public         heap    postgres    false            `           1259    37392    sys_menu_id_menu_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_menu_id_menu_seq;
       public          postgres    false    351            L           0    0    sys_menu_id_menu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_id_menu_seq OWNED BY public.sys_menu.id_menu;
          public          postgres    false    352            a           1259    37393    sys_password_reset_token    TABLE     �   CREATE TABLE public.sys_password_reset_token (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
 ,   DROP TABLE public.sys_password_reset_token;
       public         heap    postgres    false            b           1259    37398    sys_session    TABLE       CREATE TABLE public.sys_session (
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
       public         heap    postgres    false            c           1259    37403    sys_setting    TABLE     �   CREATE TABLE public.sys_setting (
    id_setting integer NOT NULL,
    nama character varying(100),
    isi character varying(500),
    deleted_by bigint,
    deleted_by_desc character varying(200)
);
    DROP TABLE public.sys_setting;
       public         heap    postgres    false            d           1259    37408    sys_setting_id_setting_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_setting_id_setting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.sys_setting_id_setting_seq;
       public          postgres    false    355            M           0    0    sys_setting_id_setting_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_setting_id_setting_seq OWNED BY public.sys_setting.id_setting;
          public          postgres    false    356            e           1259    37409    sys_user    TABLE     �  CREATE TABLE public.sys_user (
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
    deleted_by_desc character varying(200),
    id_pegawai integer
);
    DROP TABLE public.sys_user;
       public         heap    postgres    false            f           1259    37414    sys_user_group    TABLE     /  CREATE TABLE public.sys_user_group (
    id_user bigint,
    id_group bigint,
    deleted_by bigint,
    deleted_by_desc character varying(200),
    id_jabatan integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.sys_user_group;
       public         heap    postgres    false            g           1259    37417    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    357            N           0    0    users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_id_seq OWNED BY public.sys_user.id_user;
          public          postgres    false    359            �           2604    37418 4   internal_control_testing id_internal_control_testing    DEFAULT     �   ALTER TABLE ONLY public.internal_control_testing ALTER COLUMN id_internal_control_testing SET DEFAULT nextval('public.internal_control_testing_id_internal_control_testing_seq'::regclass);
 c   ALTER TABLE public.internal_control_testing ALTER COLUMN id_internal_control_testing DROP DEFAULT;
       public          postgres    false    218    217            �           2604    37419    lost_event id_lost_event    DEFAULT     �   ALTER TABLE ONLY public.lost_event ALTER COLUMN id_lost_event SET DEFAULT nextval('public.lost_event_id_lost_event_seq'::regclass);
 G   ALTER TABLE public.lost_event ALTER COLUMN id_lost_event DROP DEFAULT;
       public          postgres    false    222    221            �           2604    37420 %   mt_assessment_type id_assessment_type    DEFAULT     �   ALTER TABLE ONLY public.mt_assessment_type ALTER COLUMN id_assessment_type SET DEFAULT nextval('public.mt_assessment_type_id_assessment_type_seq'::regclass);
 T   ALTER TABLE public.mt_assessment_type ALTER COLUMN id_assessment_type DROP DEFAULT;
       public          postgres    false    226    225            �           2604    37421 A   mt_lost_event_frakuensi_kejadian id_lost_event_frakuensi_kejadian    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian ALTER COLUMN id_lost_event_frakuensi_kejadian SET DEFAULT nextval('public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq'::regclass);
 p   ALTER TABLE public.mt_lost_event_frakuensi_kejadian ALTER COLUMN id_lost_event_frakuensi_kejadian DROP DEFAULT;
       public          postgres    false    230    227            �           2604    37422 -   mt_lost_event_kategori id_lost_event_kategori    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_kategori ALTER COLUMN id_lost_event_kategori SET DEFAULT nextval('public.mt_lost_event_kategori_id_lost_event_kategori_seq'::regclass);
 \   ALTER TABLE public.mt_lost_event_kategori ALTER COLUMN id_lost_event_kategori DROP DEFAULT;
       public          postgres    false    229    228            �           2604    37423 ;   mt_lost_event_status_asuransi id_lost_event_status_asuransi    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_status_asuransi ALTER COLUMN id_lost_event_status_asuransi SET DEFAULT nextval('public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq'::regclass);
 j   ALTER TABLE public.mt_lost_event_status_asuransi ALTER COLUMN id_lost_event_status_asuransi DROP DEFAULT;
       public          postgres    false    234    233            �           2604    37424 M   mt_lost_event_sumber_penyebab_kejadian id_lost_event_sumber_penyebab_kejadian    DEFAULT     �   ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian ALTER COLUMN id_lost_event_sumber_penyebab_kejadian SET DEFAULT nextval('public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq'::regclass);
 |   ALTER TABLE public.mt_lost_event_sumber_penyebab_kejadian ALTER COLUMN id_lost_event_sumber_penyebab_kejadian DROP DEFAULT;
       public          postgres    false    232    231            �           2604    37425 <   mt_risk_agregasi_kelompok_bisnis id_agregasi_kelompok_bisnis    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis ALTER COLUMN id_agregasi_kelompok_bisnis SET DEFAULT nextval('public.mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq'::regclass);
 k   ALTER TABLE public.mt_risk_agregasi_kelompok_bisnis ALTER COLUMN id_agregasi_kelompok_bisnis DROP DEFAULT;
       public          postgres    false    236    235            �           2604    37426 /   mt_risk_agregasi_risiko id_risk_agregasi_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_agregasi_risiko ALTER COLUMN id_risk_agregasi_risiko SET DEFAULT nextval('public.mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq'::regclass);
 ^   ALTER TABLE public.mt_risk_agregasi_risiko ALTER COLUMN id_risk_agregasi_risiko DROP DEFAULT;
       public          postgres    false    238    237            �           2604    37427    mt_risk_dampak id_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_risk_dampak_id_dampak_seq'::regclass);
 G   ALTER TABLE public.mt_risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    240    239            �           2604    37428 2   mt_risk_efektifitas_control id_efektifitas_control    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_control ALTER COLUMN id_efektifitas_control SET DEFAULT nextval('public.mt_risk_efektifitas_control_id_efektifitas_control_seq'::regclass);
 a   ALTER TABLE public.mt_risk_efektifitas_control ALTER COLUMN id_efektifitas_control DROP DEFAULT;
       public          postgres    false    242    241            �           2604    37429 &   mt_risk_jenis_control id_jenis_control    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_control ALTER COLUMN id_jenis_control SET DEFAULT nextval('public.mt_risk_jenis_control_id_jenis_control_seq'::regclass);
 U   ALTER TABLE public.mt_risk_jenis_control ALTER COLUMN id_jenis_control DROP DEFAULT;
       public          postgres    false    244    243            �           2604    37430 *   mt_risk_jenis_perlakuan id_jenis_perlakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_perlakuan ALTER COLUMN id_jenis_perlakuan SET DEFAULT nextval('public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_jenis_perlakuan ALTER COLUMN id_jenis_perlakuan DROP DEFAULT;
       public          postgres    false    246    245            �           2604    37431 0   mt_risk_jenis_program_rkap id_jenis_program_rkap    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_program_rkap ALTER COLUMN id_jenis_program_rkap SET DEFAULT nextval('public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq'::regclass);
 _   ALTER TABLE public.mt_risk_jenis_program_rkap ALTER COLUMN id_jenis_program_rkap DROP DEFAULT;
       public          postgres    false    248    247            �           2604    37432 $   mt_risk_jenis_risiko id_jenis_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_jenis_risiko ALTER COLUMN id_jenis_risiko SET DEFAULT nextval('public.mt_risk_jenis_risiko_id_jenis_risiko_seq'::regclass);
 S   ALTER TABLE public.mt_risk_jenis_risiko ALTER COLUMN id_jenis_risiko DROP DEFAULT;
       public          postgres    false    250    249            �           2604    37433 *   mt_risk_kategori_risiko id_kategori_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kategori_risiko ALTER COLUMN id_kategori_risiko SET DEFAULT nextval('public.mt_risk_kategori_risiko_id_kategori_risiko_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kategori_risiko ALTER COLUMN id_kategori_risiko DROP DEFAULT;
       public          postgres    false    252    251            �           2604    37434 "   mt_risk_kemungkinan id_kemungkinan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_risk_kemungkinan_id_kemungkinan_seq'::regclass);
 Q   ALTER TABLE public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan DROP DEFAULT;
       public          postgres    false    254    253            �           2604    37435 *   mt_risk_kriteria_dampak id_kriteria_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak DROP DEFAULT;
       public          postgres    false    257    255            �           2604    37436    mt_risk_perlakuan id_perlakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_perlakuan ALTER COLUMN id_perlakuan SET DEFAULT nextval('public.mt_risk_perlakuan_id_perluakuan_seq'::regclass);
 M   ALTER TABLE public.mt_risk_perlakuan ALTER COLUMN id_perlakuan DROP DEFAULT;
       public          postgres    false    260    259            �           2604    37437    mt_risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.mt_sasaran_id_sasaran_seq'::regclass);
 I   ALTER TABLE public.mt_risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    275    261            �           2604    37438 6   mt_risk_sikap_terhadap_risiko id_sikap_terhadap_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko SET DEFAULT nextval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq'::regclass);
 e   ALTER TABLE public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko DROP DEFAULT;
       public          postgres    false    263    262            �           2604    37439    mt_risk_taksonomi id_taksonomi    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi ALTER COLUMN id_taksonomi SET DEFAULT nextval('public.mt_risk_taksonomi_id_taksonomi_seq'::regclass);
 M   ALTER TABLE public.mt_risk_taksonomi ALTER COLUMN id_taksonomi DROP DEFAULT;
       public          postgres    false    267    264            �           2604    37440 (   mt_risk_taksonomi_area id_taksonomi_area    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area SET DEFAULT nextval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq'::regclass);
 W   ALTER TABLE public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area DROP DEFAULT;
       public          postgres    false    266    265            �           2604    37441 2   mt_risk_taksonomi_objective id_taksonomi_objective    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective SET DEFAULT nextval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq'::regclass);
 a   ALTER TABLE public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective DROP DEFAULT;
       public          postgres    false    269    268            �           2604    37442    mt_risk_tingkat id_tingkat    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_risk_tingkat_id_tingkat_seq'::regclass);
 I   ALTER TABLE public.mt_risk_tingkat ALTER COLUMN id_tingkat DROP DEFAULT;
       public          postgres    false    273    270            �           2604    37443 :   mt_risk_tingkat_agregasi_risiko id_tingkat_agregasi_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko SET DEFAULT nextval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq'::regclass);
 i   ALTER TABLE public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko DROP DEFAULT;
       public          postgres    false    272    271            �           2604    37444    mt_sdm_jabatan id_jabatan    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.mt_sdm_jabatan_id_jabatan_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_jabatan ALTER COLUMN id_jabatan DROP DEFAULT;
       public          postgres    false    277    276            �           2604    37445 )   mt_sdm_kelompok_bisnis id_kelompok_bisnis    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_kelompok_bisnis ALTER COLUMN id_kelompok_bisnis SET DEFAULT nextval('public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq'::regclass);
 X   ALTER TABLE public.mt_sdm_kelompok_bisnis ALTER COLUMN id_kelompok_bisnis DROP DEFAULT;
       public          postgres    false    279    278            �           2604    37446    mt_sdm_pegawai id_pegawai    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_pegawai ALTER COLUMN id_pegawai SET DEFAULT nextval('public.mt_sdm_pegawai_id_pegawai_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_pegawai ALTER COLUMN id_pegawai DROP DEFAULT;
       public          postgres    false    281    280            �           2604    37447 '   mt_status_pengajuan id_status_pengajuan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan SET DEFAULT nextval('public.mt_status_pengajuan_id_status_pengajuan_seq'::regclass);
 V   ALTER TABLE public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan DROP DEFAULT;
       public          postgres    false    284    283            �           2604    37448 A   mt_status_pengajuan_page_disable id_status_pengajuan_page_disable    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pengajuan_page_disable ALTER COLUMN id_status_pengajuan_page_disable SET DEFAULT nextval('public.mt_status_pengajuan_page_id_status_pengajuan_page_seq'::regclass);
 p   ALTER TABLE public.mt_status_pengajuan_page_disable ALTER COLUMN id_status_pengajuan_page_disable DROP DEFAULT;
       public          postgres    false    286    285            �           2604    37449 9   mt_status_pengajuan_penerima id_status_pengajuan_penerima    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima ALTER COLUMN id_status_pengajuan_penerima SET DEFAULT nextval('public.mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq'::regclass);
 h   ALTER TABLE public.mt_status_pengajuan_penerima ALTER COLUMN id_status_pengajuan_penerima DROP DEFAULT;
       public          postgres    false    288    287            �           2604    37450 7   mt_status_rencana_perlakuan id_status_rencana_perlakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_rencana_perlakuan ALTER COLUMN id_status_rencana_perlakuan SET DEFAULT nextval('public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq'::regclass);
 f   ALTER TABLE public.mt_status_rencana_perlakuan ALTER COLUMN id_status_rencana_perlakuan DROP DEFAULT;
       public          postgres    false    290    289            �           2604    37451 '   mt_template_laporan id_template_laporan    DEFAULT     �   ALTER TABLE ONLY public.mt_template_laporan ALTER COLUMN id_template_laporan SET DEFAULT nextval('public.mt_tamplate_laporan_id_tamplate_laporan_seq'::regclass);
 V   ALTER TABLE public.mt_template_laporan ALTER COLUMN id_template_laporan DROP DEFAULT;
       public          postgres    false    292    291            �           2604    37452 %   risk_capacity_limit id_capacity_limit    DEFAULT     �   ALTER TABLE ONLY public.risk_capacity_limit ALTER COLUMN id_capacity_limit SET DEFAULT nextval('public.risk_capacity_limit_id_capacity_limit_seq'::regclass);
 T   ALTER TABLE public.risk_capacity_limit ALTER COLUMN id_capacity_limit DROP DEFAULT;
       public          postgres    false    294    293            �           2604    37453    risk_dampak id_dampak    DEFAULT     ~   ALTER TABLE ONLY public.risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.risk_dampak_id_dampak_seq'::regclass);
 D   ALTER TABLE public.risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    296    295            �           2604    37454 5   risk_metrik_strategi_risiko id_metrik_strategi_risiko    DEFAULT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko SET DEFAULT nextval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq'::regclass);
 d   ALTER TABLE public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko DROP DEFAULT;
       public          postgres    false    298    297            �           2604    37455    risk_msg id_msg    DEFAULT     r   ALTER TABLE ONLY public.risk_msg ALTER COLUMN id_msg SET DEFAULT nextval('public.risk_msg_id_msg_seq'::regclass);
 >   ALTER TABLE public.risk_msg ALTER COLUMN id_msg DROP DEFAULT;
       public          postgres    false    300    299            �           2604    37456 !   risk_msg_penerima id_msg_penerima    DEFAULT     �   ALTER TABLE ONLY public.risk_msg_penerima ALTER COLUMN id_msg_penerima SET DEFAULT nextval('public.risk_msg_penerima_id_msg_penerima_seq'::regclass);
 P   ALTER TABLE public.risk_msg_penerima ALTER COLUMN id_msg_penerima DROP DEFAULT;
       public          postgres    false    302    301            �           2604    37457    risk_penyebab id_penyebab    DEFAULT     �   ALTER TABLE ONLY public.risk_penyebab ALTER COLUMN id_penyebab SET DEFAULT nextval('public.risk_penyebab_id_penyebab_seq'::regclass);
 H   ALTER TABLE public.risk_penyebab ALTER COLUMN id_penyebab DROP DEFAULT;
       public          postgres    false    304    303            �           2604    37458    risk_profile id_risk_profile    DEFAULT     �   ALTER TABLE ONLY public.risk_profile ALTER COLUMN id_risk_profile SET DEFAULT nextval('public.risk_profile_id_risk_profile_seq'::regclass);
 K   ALTER TABLE public.risk_profile ALTER COLUMN id_risk_profile DROP DEFAULT;
       public          postgres    false    310    305            �           2604    37459    risk_profile_control id_control    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_control ALTER COLUMN id_control SET DEFAULT nextval('public.risk_profile_control_id_control_seq'::regclass);
 N   ALTER TABLE public.risk_profile_control ALTER COLUMN id_control DROP DEFAULT;
       public          postgres    false    307    306            �           2604    37460 %   risk_profile_dampak id_profile_dampak    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_dampak ALTER COLUMN id_profile_dampak SET DEFAULT nextval('public.risk_profile_dampak_id_profile_dampak_seq'::regclass);
 T   ALTER TABLE public.risk_profile_dampak ALTER COLUMN id_profile_dampak DROP DEFAULT;
       public          postgres    false    309    308            �           2604    37461    risk_profile_kri id_kri    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_kri ALTER COLUMN id_kri SET DEFAULT nextval('public.risk_profile_kri_id_kri_seq'::regclass);
 F   ALTER TABLE public.risk_profile_kri ALTER COLUMN id_kri DROP DEFAULT;
       public          postgres    false    314    311            �           2604    37462 #   risk_profile_kri_hasil id_kri_hasil    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_kri_hasil ALTER COLUMN id_kri_hasil SET DEFAULT nextval('public.risk_profile_kri_hasil_id_kri_hasil_seq'::regclass);
 R   ALTER TABLE public.risk_profile_kri_hasil ALTER COLUMN id_kri_hasil DROP DEFAULT;
       public          postgres    false    313    312            �           2604    37463 !   risk_profile_mitigasi id_mitigasi    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi ALTER COLUMN id_mitigasi SET DEFAULT nextval('public.risk_profile_mitigasi_id_mitigasi_seq'::regclass);
 P   ALTER TABLE public.risk_profile_mitigasi ALTER COLUMN id_mitigasi DROP DEFAULT;
       public          postgres    false    316    315            �           2604    37464 -   risk_profile_mitigasi_jenis id_mitigasi_jenis    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis ALTER COLUMN id_mitigasi_jenis SET DEFAULT nextval('public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq'::regclass);
 \   ALTER TABLE public.risk_profile_mitigasi_jenis ALTER COLUMN id_mitigasi_jenis DROP DEFAULT;
       public          postgres    false    318    317            �           2604    37465 5   risk_profile_mitigasi_realisasi id_mitigasi_realisasi    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi ALTER COLUMN id_mitigasi_realisasi SET DEFAULT nextval('public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq'::regclass);
 d   ALTER TABLE public.risk_profile_mitigasi_realisasi ALTER COLUMN id_mitigasi_realisasi DROP DEFAULT;
       public          postgres    false    320    319            �           2604    37466 3   risk_profile_mitigasi_timeline id_mitigasi_timeline    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline ALTER COLUMN id_mitigasi_timeline SET DEFAULT nextval('public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq'::regclass);
 b   ALTER TABLE public.risk_profile_mitigasi_timeline ALTER COLUMN id_mitigasi_timeline DROP DEFAULT;
       public          postgres    false    324    323            �           2604    37467 G   risk_profile_mitigasi_timeline_realisasi id_mitigasi_timeline_realisasi    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi ALTER COLUMN id_mitigasi_timeline_realisasi SET DEFAULT nextval('public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq'::regclass);
 v   ALTER TABLE public.risk_profile_mitigasi_timeline_realisasi ALTER COLUMN id_mitigasi_timeline_realisasi DROP DEFAULT;
       public          postgres    false    322    321            �           2604    37468 )   risk_profile_penyebab id_profile_penyebab    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_penyebab ALTER COLUMN id_profile_penyebab SET DEFAULT nextval('public.risk_profile_penyebab_id_profile_penyebab_seq'::regclass);
 X   ALTER TABLE public.risk_profile_penyebab ALTER COLUMN id_profile_penyebab DROP DEFAULT;
       public          postgres    false    326    325            �           2604    37469 5   risk_profile_realisasi_residual id_realisasi_residual    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_realisasi_residual ALTER COLUMN id_realisasi_residual SET DEFAULT nextval('public.risk_profile_realisasi_residual_id_realisasi_residual_seq'::regclass);
 d   ALTER TABLE public.risk_profile_realisasi_residual ALTER COLUMN id_realisasi_residual DROP DEFAULT;
       public          postgres    false    328    327            �           2604    37470 /   risk_profile_target_residual id_target_residual    DEFAULT     �   ALTER TABLE ONLY public.risk_profile_target_residual ALTER COLUMN id_target_residual SET DEFAULT nextval('public.risk_profile_target_residual_id_target_residual_seq'::regclass);
 ^   ALTER TABLE public.risk_profile_target_residual ALTER COLUMN id_target_residual DROP DEFAULT;
       public          postgres    false    330    329            �           2604    37471    risk_register id_register    DEFAULT     �   ALTER TABLE ONLY public.risk_register ALTER COLUMN id_register SET DEFAULT nextval('public.risk_register_id_register_seq'::regclass);
 H   ALTER TABLE public.risk_register ALTER COLUMN id_register DROP DEFAULT;
       public          postgres    false    332    331            �           2604    37472    risk_risiko id_risiko    DEFAULT     ~   ALTER TABLE ONLY public.risk_risiko ALTER COLUMN id_risiko SET DEFAULT nextval('public.risk_risiko_id_risiko_seq'::regclass);
 D   ALTER TABLE public.risk_risiko ALTER COLUMN id_risiko DROP DEFAULT;
       public          postgres    false    334    333            �           2604    37473    risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.risk_sasaran_id_sasaran_seq'::regclass);
 F   ALTER TABLE public.risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    336    335            �           2604    37474 )   risk_sasaran_strategi id_sasaran_strategi    DEFAULT     �   ALTER TABLE ONLY public.risk_sasaran_strategi ALTER COLUMN id_sasaran_strategi SET DEFAULT nextval('public.risk_sasaran_strategi_id_sasaran_strategi_seq'::regclass);
 X   ALTER TABLE public.risk_sasaran_strategi ALTER COLUMN id_sasaran_strategi DROP DEFAULT;
       public          postgres    false    338    337            �           2604    37475    sys_action id_action    DEFAULT     |   ALTER TABLE ONLY public.sys_action ALTER COLUMN id_action SET DEFAULT nextval('public.sys_action_id_action_seq'::regclass);
 C   ALTER TABLE public.sys_action ALTER COLUMN id_action DROP DEFAULT;
       public          postgres    false    340    339            �           2604    37476    sys_failed_job id    DEFAULT     s   ALTER TABLE ONLY public.sys_failed_job ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 @   ALTER TABLE public.sys_failed_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    37477    sys_group id_group    DEFAULT     x   ALTER TABLE ONLY public.sys_group ALTER COLUMN id_group SET DEFAULT nextval('public.sys_group_id_group_seq'::regclass);
 A   ALTER TABLE public.sys_group ALTER COLUMN id_group DROP DEFAULT;
       public          postgres    false    345    343            �           2604    37478    sys_group_menu id_group_menu    DEFAULT     �   ALTER TABLE ONLY public.sys_group_menu ALTER COLUMN id_group_menu SET DEFAULT nextval('public.sys_group_menu_id_group_menu_seq'::regclass);
 K   ALTER TABLE public.sys_group_menu ALTER COLUMN id_group_menu DROP DEFAULT;
       public          postgres    false    347    346            �           2604    37479 
   sys_job id    DEFAULT     e   ALTER TABLE ONLY public.sys_job ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 9   ALTER TABLE public.sys_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    37480    sys_log id_log    DEFAULT     p   ALTER TABLE ONLY public.sys_log ALTER COLUMN id_log SET DEFAULT nextval('public.sys_log_id_log_seq'::regclass);
 =   ALTER TABLE public.sys_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    350    349            �           2604    37481    sys_menu id_menu    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.sys_menu_id_menu_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    352    351            �           2604    37482    sys_migration id    DEFAULT     q   ALTER TABLE ONLY public.sys_migration ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 ?   ALTER TABLE public.sys_migration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    37483    sys_setting id_setting    DEFAULT     �   ALTER TABLE ONLY public.sys_setting ALTER COLUMN id_setting SET DEFAULT nextval('public.sys_setting_id_setting_seq'::regclass);
 E   ALTER TABLE public.sys_setting ALTER COLUMN id_setting DROP DEFAULT;
       public          postgres    false    356    355            �           2604    37484    sys_user id_user    DEFAULT     l   ALTER TABLE ONLY public.sys_user ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    359    357            w          0    36961    internal_control_testing 
   TABLE DATA           h  COPY public.internal_control_testing (id_internal_control_testing, sasaran_bumn, business_process, key_control, metode_pengujian, kelemahan_kontrol, rencana_tindak_lanjut, due_date, id_pic, status_tindak_lanjut, id_register, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    217   :�      {          0    36973 
   lost_event 
   TABLE DATA           �  COPY public.lost_event (id_lost_event, nama_kejadian, identifikasi_kejadian, id_lost_event_kategori, id_lost_event_sumber_penyebab_kejadian, penanganan_saat_kejadian, deskripsi_kejadian, id_jenis_risiko, id_taksonomi, penjelasan_kerugian, nilai_kerugian, is_kejadian_berulang, id_lost_event_frakuensi_kejadian, mitigasi_yang_direncanakan, realisasi_mitigasi, perbaikan_mendatang, pihak_terkait, id_lost_event_status_asuransi, nilai_premi, nilai_klaim, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, penyebab_kejadian, status, tgl_loss_event, id_register) FROM stdin;
    public          postgres    false    221   W�                0    36983    mt_assessment_type 
   TABLE DATA           �   COPY public.mt_assessment_type (id_assessment_type, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    225   G�      �          0    36989     mt_lost_event_frakuensi_kejadian 
   TABLE DATA           �   COPY public.mt_lost_event_frakuensi_kejadian (id_lost_event_frakuensi_kejadian, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    227   ��      �          0    36994    mt_lost_event_kategori 
   TABLE DATA           �   COPY public.mt_lost_event_kategori (id_lost_event_kategori, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    228   ��      �          0    37007    mt_lost_event_status_asuransi 
   TABLE DATA           �   COPY public.mt_lost_event_status_asuransi (id_lost_event_status_asuransi, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    233   @�      �          0    37001 &   mt_lost_event_sumber_penyebab_kejadian 
   TABLE DATA           �   COPY public.mt_lost_event_sumber_penyebab_kejadian (id_lost_event_sumber_penyebab_kejadian, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    231   ]�      �          0    37013     mt_risk_agregasi_kelompok_bisnis 
   TABLE DATA           �   COPY public.mt_risk_agregasi_kelompok_bisnis (id_risk_agregasi_risiko, id_kelompok_bisnis, id_agregasi_kelompok_bisnis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    235   z�      �          0    37019    mt_risk_agregasi_risiko 
   TABLE DATA           �   COPY public.mt_risk_agregasi_risiko (id_risk_agregasi_risiko, nama, id_kelompok_bisnis, id_kriteria_dampak, jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    237   ��      �          0    37025    mt_risk_dampak 
   TABLE DATA             COPY public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, warna) FROM stdin;
    public          postgres    false    239   �      �          0    37032    mt_risk_efektifitas_control 
   TABLE DATA           �   COPY public.mt_risk_efektifitas_control (id_efektifitas_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    241   m�      �          0    37038    mt_risk_jenis_control 
   TABLE DATA           �   COPY public.mt_risk_jenis_control (id_jenis_control, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    243   ��      �          0    37044    mt_risk_jenis_perlakuan 
   TABLE DATA           �   COPY public.mt_risk_jenis_perlakuan (id_jenis_perlakuan, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    245   ��      �          0    37050    mt_risk_jenis_program_rkap 
   TABLE DATA           �   COPY public.mt_risk_jenis_program_rkap (id_jenis_program_rkap, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    247   ��      �          0    37056    mt_risk_jenis_risiko 
   TABLE DATA           �   COPY public.mt_risk_jenis_risiko (id_jenis_risiko, id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    249   ��      �          0    37062    mt_risk_kategori_risiko 
   TABLE DATA           �   COPY public.mt_risk_kategori_risiko (id_kategori_risiko, kode, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    251   ?�      �          0    37068    mt_risk_kemungkinan 
   TABLE DATA           j  COPY public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, warna) FROM stdin;
    public          postgres    false    253   ��      �          0    37076    mt_risk_kriteria_dampak 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    255   �      �          0    37083    mt_risk_kriteria_dampak_detail 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, mulai, sampai) FROM stdin;
    public          postgres    false    256   ��      �          0    37090    mt_risk_matrix 
   TABLE DATA           �   COPY public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, skala) FROM stdin;
    public          postgres    false    258   �	      �          0    37096    mt_risk_perlakuan 
   TABLE DATA           �   COPY public.mt_risk_perlakuan (id_perlakuan, nama, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    259   g      �          0    37102    mt_risk_sasaran 
   TABLE DATA           �   COPY public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    261   �      �          0    37107    mt_risk_sikap_terhadap_risiko 
   TABLE DATA           �   COPY public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    262   ]      �          0    37113    mt_risk_taksonomi 
   TABLE DATA           �   COPY public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    264   �      �          0    37118    mt_risk_taksonomi_area 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    265   D      �          0    37125    mt_risk_taksonomi_objective 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    268   N      �          0    37131    mt_risk_tingkat 
   TABLE DATA           �   COPY public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    270         �          0    37139    mt_risk_tingkat_agregasi_risiko 
   TABLE DATA           �   COPY public.mt_risk_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, created_by, updated_by, deleted_by, id_tingkat_agregasi_risiko_parent) FROM stdin;
    public          postgres    false    271   `      �          0    37144    mt_risk_tingkat_perlakuan 
   TABLE DATA           j   COPY public.mt_risk_tingkat_perlakuan (id_tingkat, id_perlakuan, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    274   �      �          0    37148    mt_sdm_jabatan 
   TABLE DATA           8  COPY public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    276         �          0    37154    mt_sdm_kelompok_bisnis 
   TABLE DATA           �   COPY public.mt_sdm_kelompok_bisnis (id_kelompok_bisnis, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    278   �      �          0    37160    mt_sdm_pegawai 
   TABLE DATA           �   COPY public.mt_sdm_pegawai (nid, email, position_id, nama_lengkap, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_jabatan, id_pegawai) FROM stdin;
    public          postgres    false    280          �          0    37169    mt_sdm_unit 
   TABLE DATA           �   COPY public.mt_sdm_unit (id_unit, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc, id_kelompok_bisnis) FROM stdin;
    public          postgres    false    282   3       �          0    37174    mt_status_pengajuan 
   TABLE DATA           �   COPY public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc, deleted_by, deleted_by_desc, warna) FROM stdin;
    public          postgres    false    283   �"      �          0    37178     mt_status_pengajuan_page_disable 
   TABLE DATA           �   COPY public.mt_status_pengajuan_page_disable (id_status_pengajuan_page_disable, id_status_pengajuan, page, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    285   �#      �          0    37184    mt_status_pengajuan_penerima 
   TABLE DATA           a  COPY public.mt_status_pengajuan_penerima (id_status_pengajuan_penerima, id_status_pengajuan, id_tingkat_agregasi_risiko, id_group, id_status_pengajuan_selanjutnya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_status_pengajuan_dikembalikan, id_assessment_type) FROM stdin;
    public          postgres    false    287   �%      �          0    37190    mt_status_rencana_perlakuan 
   TABLE DATA           �   COPY public.mt_status_rencana_perlakuan (id_status_rencana_perlakuan, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, keterangan) FROM stdin;
    public          postgres    false    289   �'      �          0    37196    mt_template_laporan 
   TABLE DATA           �   COPY public.mt_template_laporan (id_template_laporan, halaman, judul, kolom, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    291   )      �          0    37202    risk_capacity_limit 
   TABLE DATA           R  COPY public.risk_capacity_limit (id_capacity_limit, tahun, kapasitas_risiko, persentase_toleran, risk_limit, modified_by, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    293   S,      �          0    37208    risk_dampak 
   TABLE DATA           �   COPY public.risk_dampak (id_dampak, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) FROM stdin;
    public          postgres    false    295   -      �          0    37214    risk_metrik_strategi_risiko 
   TABLE DATA           \  COPY public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_jenis_risiko, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_register, deleted_by, deleted_by_desc, tahun) FROM stdin;
    public          postgres    false    297   �/      �          0    37220    risk_msg 
   TABLE DATA           �   COPY public.risk_msg (id_msg, msg, url, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_register, id_status_pengajuan, id_group) FROM stdin;
    public          postgres    false    299   g6      �          0    37226    risk_msg_penerima 
   TABLE DATA           �   COPY public.risk_msg_penerima (id_msg, is_read, id_user, id_msg_penerima, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    301   8      �          0    37233    risk_penyebab 
   TABLE DATA           �   COPY public.risk_penyebab (id_penyebab, id_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) FROM stdin;
    public          postgres    false    303   8      �          0    37239    risk_profile 
   TABLE DATA           �  COPY public.risk_profile (id_risk_profile, sasaran, id_sasaran, id_jenis_risiko, id_taksonomi, id_risiko, nama, deskripsi, id_register, is_kuantitatif, penjelasan_dampak, nilai_dampak_inheren, id_dampak_inheren, nilai_kemungkinan, id_kemungkinan_inheren, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tgl_risiko, no_risiko, id_kriteria_dampak, tanggapan, id_risk_profile_sebelum, status, jenis, id_risk_agregasi_risiko) FROM stdin;
    public          postgres    false    305   �>      �          0    37244    risk_profile_control 
   TABLE DATA           �   COPY public.risk_profile_control (id_control, id_risk_profile, id_jenis_control, nama, id_efektifitas_control, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    306   >D      �          0    37250    risk_profile_dampak 
   TABLE DATA           �   COPY public.risk_profile_dampak (id_risk_profile, id_dampak, nama, no, perkiraan_terpapar, id_profile_dampak, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    308   �F      �          0    37257    risk_profile_kri 
   TABLE DATA           B  COPY public.risk_profile_kri (id_kri, nama, id_risk_profile, satuan, target_mulai, target_sampai, keterangan, polaritas, batas_bawah, batas_atas, is_kuantitatif, aman, hati_hati, bahaya, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    311   �I      �          0    37262    risk_profile_kri_hasil 
   TABLE DATA           :  COPY public.risk_profile_kri_hasil (id_kri_hasil, periode, nilai, id_kri, target_mulai, target_sampai, batas_atas, batas_bawah, aman, hati_hati, bahaya, status, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, nilai_kualitatif) FROM stdin;
    public          postgres    false    312   �N      �          0    37269    risk_profile_mitigasi 
   TABLE DATA           )  COPY public.risk_profile_mitigasi (id_mitigasi, id_risk_profile, id_profile_penyebab, id_perlakuan, nama, output_perlakuan, biaya, id_jenis_program_rkap, id_pic, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    315   �O      �          0    37275    risk_profile_mitigasi_jenis 
   TABLE DATA           �   COPY public.risk_profile_mitigasi_jenis (id_mitigasi, id_jenis_perlakuan, id_mitigasi_jenis, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    317   �Q      �          0    37281    risk_profile_mitigasi_realisasi 
   TABLE DATA           e  COPY public.risk_profile_mitigasi_realisasi (id_mitigasi_realisasi, id_mitigasi, periode, id_status_rencana_perlakuan, penjelasan_status_rencana_perlakuan, progress, nama, output_perlakuan, biaya, id_pic, is_ada_progress, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    319   �R      �          0    37291    risk_profile_mitigasi_timeline 
   TABLE DATA           �   COPY public.risk_profile_mitigasi_timeline (id_mitigasi_timeline, periode, is_proses, id_mitigasi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    323   �S      �          0    37287 (   risk_profile_mitigasi_timeline_realisasi 
   TABLE DATA           �   COPY public.risk_profile_mitigasi_timeline_realisasi (id_mitigasi_timeline_realisasi, periode, is_proses, id_mitigasi) FROM stdin;
    public          postgres    false    321   �V      �          0    37297    risk_profile_penyebab 
   TABLE DATA           �   COPY public.risk_profile_penyebab (id_risk_profile, id_penyebab, nama, no, id_profile_penyebab, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    325   �V      �          0    37303    risk_profile_realisasi_residual 
   TABLE DATA           <  COPY public.risk_profile_realisasi_residual (id_realisasi_residual, id_risk_profile, periode, penjelasan_dampak, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, status) FROM stdin;
    public          postgres    false    327   )^      �          0    37309    risk_profile_target_residual 
   TABLE DATA             COPY public.risk_profile_target_residual (id_target_residual, id_risk_profile, periode, nilai_dampak, id_dampak, nilai_kemungkinan, id_kemungkinan, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    329    _      �          0    37315    risk_register 
   TABLE DATA           �  COPY public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc, periode_mulai, periode_selesai, sort, id_kelompok_bisnis, id_assessment_type) FROM stdin;
    public          postgres    false    331   �_      �          0    37323    risk_risiko 
   TABLE DATA           �   COPY public.risk_risiko (id_risiko, id_taksonomi, id_jenis_risiko, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, catatan, status, id_unit) FROM stdin;
    public          postgres    false    333   �f      �          0    37329    risk_sasaran 
   TABLE DATA             COPY public.risk_sasaran (id_sasaran, nama, hasil_yang_diharapkan, nilai_risiko, nilai_limit, is_accept, id_register, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, tahun) FROM stdin;
    public          postgres    false    335   \i      �          0    37336    risk_sasaran_strategi 
   TABLE DATA           �   COPY public.risk_sasaran_strategi (id_sasaran, strategi, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, id_sasaran_strategi) FROM stdin;
    public          postgres    false    337   wl      �          0    37342 
   sys_action 
   TABLE DATA           �   COPY public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    339   1p      �          0    37348 	   sys_cache 
   TABLE DATA           X   COPY public.sys_cache (key, value, expiration, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    341   c{      �          0    37353    sys_cache_lock 
   TABLE DATA           ]   COPY public.sys_cache_lock (key, owner, expiration, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    342   �|      u          0    36954    sys_failed_job 
   TABLE DATA           �   COPY public.sys_failed_job (id, uuid, connection, queue, payload, exception, failed_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    215   �|      �          0    37358 	   sys_group 
   TABLE DATA           �   COPY public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    343   �|      �          0    37363    sys_group_action 
   TABLE DATA           �   COPY public.sys_group_action (id_group_menu, id_action, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    344   �}      �          0    37369    sys_group_menu 
   TABLE DATA           �   COPY public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    346   ��      y          0    36967    sys_job 
   TABLE DATA           �   COPY public.sys_job (id, queue, payload, attempts, reserved_at, available_at, created_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    219   ˅      �          0    37375    sys_job_batch 
   TABLE DATA           �   COPY public.sys_job_batch (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    348   �      �          0    37380    sys_log 
   TABLE DATA           �   COPY public.sys_log (page, activity, ip, activity_time, user_desc, action, table_name, id_log, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    349   �      �          0    37386    sys_menu 
   TABLE DATA           �   COPY public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    351   "�      }          0    36979    sys_migration 
   TABLE DATA           Z   COPY public.sys_migration (id, migration, batch, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    223   �      �          0    37393    sys_password_reset_token 
   TABLE DATA           i   COPY public.sys_password_reset_token (email, token, created_at, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    353   �                 0    37398    sys_session 
   TABLE DATA              COPY public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    354    �                0    37403    sys_setting 
   TABLE DATA           Y   COPY public.sys_setting (id_setting, nama, isi, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    355   ��                0    37409    sys_user 
   TABLE DATA             COPY public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt, deleted_at, deleted_by, deleted_by_desc, id_pegawai) FROM stdin;
    public          postgres    false    357   ʖ                0    37414    sys_user_group 
   TABLE DATA           �   COPY public.sys_user_group (id_user, id_group, deleted_by, deleted_by_desc, id_jabatan, updated_at, created_at, deleted_at) FROM stdin;
    public          postgres    false    358   ��      O           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    216            P           0    0 8   internal_control_testing_id_internal_control_testing_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.internal_control_testing_id_internal_control_testing_seq', 1, false);
          public          postgres    false    218            Q           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    220            R           0    0    lost_event_id_lost_event_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.lost_event_id_lost_event_seq', 3, true);
          public          postgres    false    222            S           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          postgres    false    224            T           0    0 )   mt_assessment_type_id_assessment_type_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.mt_assessment_type_id_assessment_type_seq', 4, true);
          public          postgres    false    226            U           0    0 1   mt_lost_event_kategori_id_lost_event_kategori_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.mt_lost_event_kategori_id_lost_event_kategori_seq', 1, true);
          public          postgres    false    229            V           0    0 ?   mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_lost_event_kejadian_berula_id_lost_event_kejadian_berula_seq', 1, false);
          public          postgres    false    230            W           0    0 ?   mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_lost_event_penyebab_kejadi_id_lost_event_penyebab_kejadi_seq', 1, false);
          public          postgres    false    232            X           0    0 ?   mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_lost_event_status_asuransi_id_lost_event_status_asuransi_seq', 1, false);
          public          postgres    false    234            Y           0    0 ?   mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mt_risk_agregasi_kelompok_bisni_id_agregasi_kelompok_bisnis_seq', 36, true);
          public          postgres    false    236            Z           0    0 3   mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.mt_risk_agregasi_risiko_id_risk_agregasi_risiko_seq', 34, true);
          public          postgres    false    238            [           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_risk_dampak_id_dampak_seq', 5, true);
          public          postgres    false    240            \           0    0 6   mt_risk_efektifitas_control_id_efektifitas_control_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.mt_risk_efektifitas_control_id_efektifitas_control_seq', 5, true);
          public          postgres    false    242            ]           0    0 *   mt_risk_jenis_control_id_jenis_control_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.mt_risk_jenis_control_id_jenis_control_seq', 6, true);
          public          postgres    false    244            ^           0    0 .   mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.mt_risk_jenis_perlakuan_id_jenis_perlakuan_seq', 8, true);
          public          postgres    false    246            _           0    0 4   mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.mt_risk_jenis_program_rkap_id_jenis_program_rkap_seq', 11, true);
          public          postgres    false    248            `           0    0 (   mt_risk_jenis_risiko_id_jenis_risiko_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.mt_risk_jenis_risiko_id_jenis_risiko_seq', 11, true);
          public          postgres    false    250            a           0    0 .   mt_risk_kategori_risiko_id_kategori_risiko_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.mt_risk_kategori_risiko_id_kategori_risiko_seq', 3, true);
          public          postgres    false    252            b           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.mt_risk_kemungkinan_id_kemungkinan_seq', 7, true);
          public          postgres    false    254            c           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq', 40, true);
          public          postgres    false    257            d           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.mt_risk_perlakuan_id_perluakuan_seq', 33, true);
          public          postgres    false    260            e           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq', 4, true);
          public          postgres    false    263            f           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq', 8, true);
          public          postgres    false    266            g           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_risk_taksonomi_id_taksonomi_seq', 21, true);
          public          postgres    false    267            h           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq', 4, true);
          public          postgres    false    269            i           0    0 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE SET     l   SELECT pg_catalog.setval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq', 4, true);
          public          postgres    false    272            j           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_risk_tingkat_id_tingkat_seq', 9, true);
          public          postgres    false    273            k           0    0    mt_sasaran_id_sasaran_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.mt_sasaran_id_sasaran_seq', 5, true);
          public          postgres    false    275            l           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_sdm_jabatan_id_jabatan_seq', 32, true);
          public          postgres    false    277            m           0    0 -   mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.mt_sdm_kelompok_bisnis_id_kelompok_bisnis_seq', 4, true);
          public          postgres    false    279            n           0    0    mt_sdm_pegawai_id_pegawai_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_sdm_pegawai_id_pegawai_seq', 1, false);
          public          postgres    false    281            o           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_status_pengajuan_id_status_pengajuan_seq', 17, true);
          public          postgres    false    284            p           0    0 5   mt_status_pengajuan_page_id_status_pengajuan_page_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.mt_status_pengajuan_page_id_status_pengajuan_page_seq', 74, true);
          public          postgres    false    286            q           0    0 =   mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq    SEQUENCE SET     l   SELECT pg_catalog.setval('public.mt_status_pengajuan_penerima_id_status_pengajuan_penerima_seq', 89, true);
          public          postgres    false    288            r           0    0 ;   mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('public.mt_status_rencana_perlakuan_id_status_rencana_perlakuan_seq', 3, true);
          public          postgres    false    290            s           0    0 +   mt_tamplate_laporan_id_tamplate_laporan_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.mt_tamplate_laporan_id_tamplate_laporan_seq', 7, true);
          public          postgres    false    292            t           0    0 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.risk_capacity_limit_id_capacity_limit_seq', 7, true);
          public          postgres    false    294            u           0    0    risk_dampak_id_dampak_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.risk_dampak_id_dampak_seq', 28, true);
          public          postgres    false    296            v           0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq', 24, true);
          public          postgres    false    298            w           0    0    risk_msg_id_msg_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_msg_id_msg_seq', 31, true);
          public          postgres    false    300            x           0    0 %   risk_msg_penerima_id_msg_penerima_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.risk_msg_penerima_id_msg_penerima_seq', 1, false);
          public          postgres    false    302            y           0    0    risk_penyebab_id_penyebab_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_penyebab_id_penyebab_seq', 61, true);
          public          postgres    false    304            z           0    0 #   risk_profile_control_id_control_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.risk_profile_control_id_control_seq', 34, true);
          public          postgres    false    307            {           0    0 )   risk_profile_dampak_id_profile_dampak_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.risk_profile_dampak_id_profile_dampak_seq', 26, true);
          public          postgres    false    309            |           0    0     risk_profile_id_risk_profile_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.risk_profile_id_risk_profile_seq', 32, true);
          public          postgres    false    310            }           0    0 '   risk_profile_kri_hasil_id_kri_hasil_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.risk_profile_kri_hasil_id_kri_hasil_seq', 14, true);
          public          postgres    false    313            ~           0    0    risk_profile_kri_id_kri_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.risk_profile_kri_id_kri_seq', 50, true);
          public          postgres    false    314                       0    0 %   risk_profile_mitigasi_id_mitigasi_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.risk_profile_mitigasi_id_mitigasi_seq', 17, true);
          public          postgres    false    316            �           0    0 1   risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.risk_profile_mitigasi_jenis_id_mitigasi_jenis_seq', 14, true);
          public          postgres    false    318            �           0    0 9   risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.risk_profile_mitigasi_realisasi_id_mitigasi_realisasi_seq', 12, true);
          public          postgres    false    320            �           0    0 ?   risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.risk_profile_mitigasi_timelin_id_mitigasi_timeline_realisas_seq', 1, false);
          public          postgres    false    322            �           0    0 7   risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.risk_profile_mitigasi_timeline_id_mitigasi_timeline_seq', 170, true);
          public          postgres    false    324            �           0    0 -   risk_profile_penyebab_id_profile_penyebab_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.risk_profile_penyebab_id_profile_penyebab_seq', 115, true);
          public          postgres    false    326            �           0    0 9   risk_profile_realisasi_residual_id_realisasi_residual_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.risk_profile_realisasi_residual_id_realisasi_residual_seq', 6, true);
          public          postgres    false    328            �           0    0 3   risk_profile_target_residual_id_target_residual_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.risk_profile_target_residual_id_target_residual_seq', 30, true);
          public          postgres    false    330            �           0    0    risk_register_id_register_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_register_id_register_seq', 49, true);
          public          postgres    false    332            �           0    0    risk_risiko_id_risiko_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.risk_risiko_id_risiko_seq', 23, true);
          public          postgres    false    334            �           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.risk_sasaran_id_sasaran_seq', 16, true);
          public          postgres    false    336            �           0    0 -   risk_sasaran_strategi_id_sasaran_strategi_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.risk_sasaran_strategi_id_sasaran_strategi_seq', 59, true);
          public          postgres    false    338            �           0    0    sys_action_id_action_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sys_action_id_action_seq', 307, true);
          public          postgres    false    340            �           0    0    sys_group_id_group_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sys_group_id_group_seq', 13, true);
          public          postgres    false    345            �           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 1539, true);
          public          postgres    false    347            �           0    0    sys_log_id_log_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_log_id_log_seq', 12211, true);
          public          postgres    false    350            �           0    0    sys_menu_id_menu_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 113, true);
          public          postgres    false    352            �           0    0    sys_setting_id_setting_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);
          public          postgres    false    356            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 24, true);
          public          postgres    false    359            n           2606    37486    sys_cache_lock cache_locks_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_cache_lock
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 I   ALTER TABLE ONLY public.sys_cache_lock DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    342            l           2606    37488    sys_cache cache_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sys_cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.sys_cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    341            �           2606    37490    sys_failed_job failed_jobs_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    215            �           2606    37492 &   sys_failed_job failed_jobs_uuid_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 P   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    215            "           2606    37494 0   mt_risk_taksonomi_objective idx_18d8a35225719b65 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective
    ADD CONSTRAINT idx_18d8a35225719b65 PRIMARY KEY (id_taksonomi_objective);
 Z   ALTER TABLE ONLY public.mt_risk_taksonomi_objective DROP CONSTRAINT idx_18d8a35225719b65;
       public            postgres    false    268            *           2606    37496 #   mt_sdm_jabatan idx_1e38228f1edb51f5 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT idx_1e38228f1edb51f5 PRIMARY KEY (id_jabatan);
 M   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT idx_1e38228f1edb51f5;
       public            postgres    false    276            2           2606    37498 (   mt_status_pengajuan idx_38d4e01f5bd43ed6 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_status_pengajuan
    ADD CONSTRAINT idx_38d4e01f5bd43ed6 PRIMARY KEY (id_status_pengajuan);
 R   ALTER TABLE ONLY public.mt_status_pengajuan DROP CONSTRAINT idx_38d4e01f5bd43ed6;
       public            postgres    false    283            D           2606    37500 &   risk_msg_penerima idx_3c73a326dee309e5 
   CONSTRAINT     q   ALTER TABLE ONLY public.risk_msg_penerima
    ADD CONSTRAINT idx_3c73a326dee309e5 PRIMARY KEY (id_msg, id_user);
 P   ALTER TABLE ONLY public.risk_msg_penerima DROP CONSTRAINT idx_3c73a326dee309e5;
       public            postgres    false    301    301            N           2606    37502 %   risk_profile_kri idx_42f7b767e5e7e8f2 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_profile_kri
    ADD CONSTRAINT idx_42f7b767e5e7e8f2 PRIMARY KEY (id_kri);
 O   ALTER TABLE ONLY public.risk_profile_kri DROP CONSTRAINT idx_42f7b767e5e7e8f2;
       public            postgres    false    311            P           2606    37504 +   risk_profile_kri_hasil idx_590a4ea9ee7c6349 
   CONSTRAINT     s   ALTER TABLE ONLY public.risk_profile_kri_hasil
    ADD CONSTRAINT idx_590a4ea9ee7c6349 PRIMARY KEY (id_kri_hasil);
 U   ALTER TABLE ONLY public.risk_profile_kri_hasil DROP CONSTRAINT idx_590a4ea9ee7c6349;
       public            postgres    false    312            &           2606    37506 4   mt_risk_tingkat_agregasi_risiko idx_6d38b409db81e919 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko
    ADD CONSTRAINT idx_6d38b409db81e919 PRIMARY KEY (id_tingkat_agregasi_risiko);
 ^   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko DROP CONSTRAINT idx_6d38b409db81e919;
       public            postgres    false    271                       2606    37508 &   mt_risk_taksonomi idx_ae01f0becb598a2e 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT idx_ae01f0becb598a2e PRIMARY KEY (id_taksonomi);
 P   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT idx_ae01f0becb598a2e;
       public            postgres    false    264            B           2606    37510    risk_msg idx_bc4dae4133700974 
   CONSTRAINT     _   ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT idx_bc4dae4133700974 PRIMARY KEY (id_msg);
 G   ALTER TABLE ONLY public.risk_msg DROP CONSTRAINT idx_bc4dae4133700974;
       public            postgres    false    299            b           2606    37512 "   risk_register idx_c3ae979ce28d717c 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT idx_c3ae979ce28d717c PRIMARY KEY (id_register);
 L   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT idx_c3ae979ce28d717c;
       public            postgres    false    331                        2606    37514 +   mt_risk_taksonomi_area idx_efeea3ec186756aa 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT idx_efeea3ec186756aa PRIMARY KEY (id_taksonomi_area);
 U   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT idx_efeea3ec186756aa;
       public            postgres    false    265            �           2606    37516 6   internal_control_testing internal_control_testing_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.internal_control_testing
    ADD CONSTRAINT internal_control_testing_pkey PRIMARY KEY (id_internal_control_testing);
 `   ALTER TABLE ONLY public.internal_control_testing DROP CONSTRAINT internal_control_testing_pkey;
       public            postgres    false    217            t           2606    37518    sys_job_batch job_batches_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_job_batch
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.sys_job_batch DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    348            �           2606    37520    sys_job jobs_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sys_job DROP CONSTRAINT jobs_pkey;
       public            postgres    false    219            �           2606    37522    lost_event lost_event_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_pkey PRIMARY KEY (id_lost_event);
 D   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_pkey;
       public            postgres    false    221            �           2606    37524    sys_migration migrations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sys_migration
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.sys_migration DROP CONSTRAINT migrations_pkey;
       public            postgres    false    223            �           2606    37526 *   mt_assessment_type mt_assessment_type_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_assessment_type
    ADD CONSTRAINT mt_assessment_type_pkey PRIMARY KEY (id_assessment_type);
 T   ALTER TABLE ONLY public.mt_assessment_type DROP CONSTRAINT mt_assessment_type_pkey;
       public            postgres    false    225            �           2606    37528 2   mt_lost_event_kategori mt_lost_event_kategori_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_kategori
    ADD CONSTRAINT mt_lost_event_kategori_pkey PRIMARY KEY (id_lost_event_kategori);
 \   ALTER TABLE ONLY public.mt_lost_event_kategori DROP CONSTRAINT mt_lost_event_kategori_pkey;
       public            postgres    false    228            �           2606    37530 E   mt_lost_event_frakuensi_kejadian mt_lost_event_kejadian_berulang_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian
    ADD CONSTRAINT mt_lost_event_kejadian_berulang_pkey PRIMARY KEY (id_lost_event_frakuensi_kejadian);
 o   ALTER TABLE ONLY public.mt_lost_event_frakuensi_kejadian DROP CONSTRAINT mt_lost_event_kejadian_berulang_pkey;
       public            postgres    false    227            �           2606    37532 K   mt_lost_event_sumber_penyebab_kejadian mt_lost_event_penyebab_kejadian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian
    ADD CONSTRAINT mt_lost_event_penyebab_kejadian_pkey PRIMARY KEY (id_lost_event_sumber_penyebab_kejadian);
 u   ALTER TABLE ONLY public.mt_lost_event_sumber_penyebab_kejadian DROP CONSTRAINT mt_lost_event_penyebab_kejadian_pkey;
       public            postgres    false    231            �           2606    37534 @   mt_lost_event_status_asuransi mt_lost_event_status_asuransi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_lost_event_status_asuransi
    ADD CONSTRAINT mt_lost_event_status_asuransi_pkey PRIMARY KEY (id_lost_event_status_asuransi);
 j   ALTER TABLE ONLY public.mt_lost_event_status_asuransi DROP CONSTRAINT mt_lost_event_status_asuransi_pkey;
       public            postgres    false    233            �           2606    37536 F   mt_risk_agregasi_kelompok_bisnis mt_risk_agregasi_kelompok_bisnis_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis
    ADD CONSTRAINT mt_risk_agregasi_kelompok_bisnis_pkey PRIMARY KEY (id_agregasi_kelompok_bisnis);
 p   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis DROP CONSTRAINT mt_risk_agregasi_kelompok_bisnis_pkey;
       public            postgres    false    235                        2606    37538 4   mt_risk_agregasi_risiko mt_risk_agregasi_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_agregasi_risiko
    ADD CONSTRAINT mt_risk_agregasi_risiko_pkey PRIMARY KEY (id_risk_agregasi_risiko);
 ^   ALTER TABLE ONLY public.mt_risk_agregasi_risiko DROP CONSTRAINT mt_risk_agregasi_risiko_pkey;
       public            postgres    false    237                       2606    37540 "   mt_risk_dampak mt_risk_dampak_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_risk_dampak
    ADD CONSTRAINT mt_risk_dampak_pkey PRIMARY KEY (id_dampak);
 L   ALTER TABLE ONLY public.mt_risk_dampak DROP CONSTRAINT mt_risk_dampak_pkey;
       public            postgres    false    239                       2606    37542 <   mt_risk_efektifitas_control mt_risk_efektifitas_control_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_control
    ADD CONSTRAINT mt_risk_efektifitas_control_pkey PRIMARY KEY (id_efektifitas_control);
 f   ALTER TABLE ONLY public.mt_risk_efektifitas_control DROP CONSTRAINT mt_risk_efektifitas_control_pkey;
       public            postgres    false    241                       2606    37544 0   mt_risk_jenis_control mt_risk_jenis_control_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.mt_risk_jenis_control
    ADD CONSTRAINT mt_risk_jenis_control_pkey PRIMARY KEY (id_jenis_control);
 Z   ALTER TABLE ONLY public.mt_risk_jenis_control DROP CONSTRAINT mt_risk_jenis_control_pkey;
       public            postgres    false    243                       2606    37546 4   mt_risk_jenis_perlakuan mt_risk_jenis_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_jenis_perlakuan
    ADD CONSTRAINT mt_risk_jenis_perlakuan_pkey PRIMARY KEY (id_jenis_perlakuan);
 ^   ALTER TABLE ONLY public.mt_risk_jenis_perlakuan DROP CONSTRAINT mt_risk_jenis_perlakuan_pkey;
       public            postgres    false    245            
           2606    37548 :   mt_risk_jenis_program_rkap mt_risk_jenis_program_rkap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_jenis_program_rkap
    ADD CONSTRAINT mt_risk_jenis_program_rkap_pkey PRIMARY KEY (id_jenis_program_rkap);
 d   ALTER TABLE ONLY public.mt_risk_jenis_program_rkap DROP CONSTRAINT mt_risk_jenis_program_rkap_pkey;
       public            postgres    false    247                       2606    37550 .   mt_risk_jenis_risiko mt_risk_jenis_risiko_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.mt_risk_jenis_risiko
    ADD CONSTRAINT mt_risk_jenis_risiko_pkey PRIMARY KEY (id_jenis_risiko);
 X   ALTER TABLE ONLY public.mt_risk_jenis_risiko DROP CONSTRAINT mt_risk_jenis_risiko_pkey;
       public            postgres    false    249                       2606    37552 4   mt_risk_kategori_risiko mt_risk_kategori_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kategori_risiko
    ADD CONSTRAINT mt_risk_kategori_risiko_pkey PRIMARY KEY (id_kategori_risiko);
 ^   ALTER TABLE ONLY public.mt_risk_kategori_risiko DROP CONSTRAINT mt_risk_kategori_risiko_pkey;
       public            postgres    false    251                       2606    37554 ,   mt_risk_kemungkinan mt_risk_kemungkinan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.mt_risk_kemungkinan
    ADD CONSTRAINT mt_risk_kemungkinan_pkey PRIMARY KEY (id_kemungkinan);
 V   ALTER TABLE ONLY public.mt_risk_kemungkinan DROP CONSTRAINT mt_risk_kemungkinan_pkey;
       public            postgres    false    253                       2606    37556 B   mt_risk_kriteria_dampak_detail mt_risk_kriteria_dampak_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT mt_risk_kriteria_dampak_detail_pkey PRIMARY KEY (id_kriteria_dampak, id_dampak);
 l   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT mt_risk_kriteria_dampak_detail_pkey;
       public            postgres    false    256    256                       2606    37558 4   mt_risk_kriteria_dampak mt_risk_kriteria_dampak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT mt_risk_kriteria_dampak_pkey PRIMARY KEY (id_kriteria_dampak);
 ^   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT mt_risk_kriteria_dampak_pkey;
       public            postgres    false    255                       2606    37560 "   mt_risk_matrix mt_risk_matrix_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT mt_risk_matrix_pkey PRIMARY KEY (jenis, id_kemungkinan, id_dampak);
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT mt_risk_matrix_pkey;
       public            postgres    false    258    258    258                       2606    37562 (   mt_risk_perlakuan mt_risk_perlakuan_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.mt_risk_perlakuan
    ADD CONSTRAINT mt_risk_perlakuan_pkey PRIMARY KEY (id_perlakuan);
 R   ALTER TABLE ONLY public.mt_risk_perlakuan DROP CONSTRAINT mt_risk_perlakuan_pkey;
       public            postgres    false    259                       2606    37564 $   mt_risk_sasaran mt_risk_sasaran_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_sasaran
    ADD CONSTRAINT mt_risk_sasaran_pkey PRIMARY KEY (id_sasaran);
 N   ALTER TABLE ONLY public.mt_risk_sasaran DROP CONSTRAINT mt_risk_sasaran_pkey;
       public            postgres    false    261                       2606    37566 @   mt_risk_sikap_terhadap_risiko mt_risk_sikap_terhadap_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko
    ADD CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey PRIMARY KEY (id_sikap_terhadap_risiko);
 j   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko DROP CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey;
       public            postgres    false    262            (           2606    37568 8   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_pkey PRIMARY KEY (id_tingkat, id_perlakuan);
 b   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_pkey;
       public            postgres    false    274    274            $           2606    37570 $   mt_risk_tingkat mt_risk_tingkat_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_tingkat
    ADD CONSTRAINT mt_risk_tingkat_pkey PRIMARY KEY (id_tingkat);
 N   ALTER TABLE ONLY public.mt_risk_tingkat DROP CONSTRAINT mt_risk_tingkat_pkey;
       public            postgres    false    270            ,           2606    37572 2   mt_sdm_kelompok_bisnis mt_sdm_kelompok_bisnis_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_kelompok_bisnis
    ADD CONSTRAINT mt_sdm_kelompok_bisnis_pkey PRIMARY KEY (id_kelompok_bisnis);
 \   ALTER TABLE ONLY public.mt_sdm_kelompok_bisnis DROP CONSTRAINT mt_sdm_kelompok_bisnis_pkey;
       public            postgres    false    278            .           2606    37574 "   mt_sdm_pegawai mt_sdm_pegawai_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT mt_sdm_pegawai_pkey PRIMARY KEY (id_pegawai);
 L   ALTER TABLE ONLY public.mt_sdm_pegawai DROP CONSTRAINT mt_sdm_pegawai_pkey;
       public            postgres    false    280            0           2606    37576    mt_sdm_unit mt_sdm_unit_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_pkey PRIMARY KEY (id_unit);
 F   ALTER TABLE ONLY public.mt_sdm_unit DROP CONSTRAINT mt_sdm_unit_pkey;
       public            postgres    false    282            4           2606    37578 >   mt_status_pengajuan_page_disable mt_status_pengajuan_page_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_page_disable
    ADD CONSTRAINT mt_status_pengajuan_page_pkey PRIMARY KEY (id_status_pengajuan_page_disable);
 h   ALTER TABLE ONLY public.mt_status_pengajuan_page_disable DROP CONSTRAINT mt_status_pengajuan_page_pkey;
       public            postgres    false    285            6           2606    37580 >   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_pkey PRIMARY KEY (id_status_pengajuan_penerima);
 h   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_pkey;
       public            postgres    false    287            8           2606    37582 <   mt_status_rencana_perlakuan mt_status_rencana_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_rencana_perlakuan
    ADD CONSTRAINT mt_status_rencana_perlakuan_pkey PRIMARY KEY (id_status_rencana_perlakuan);
 f   ALTER TABLE ONLY public.mt_status_rencana_perlakuan DROP CONSTRAINT mt_status_rencana_perlakuan_pkey;
       public            postgres    false    289            :           2606    37584 ,   mt_template_laporan mt_tamplate_laporan_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.mt_template_laporan
    ADD CONSTRAINT mt_tamplate_laporan_pkey PRIMARY KEY (id_template_laporan);
 V   ALTER TABLE ONLY public.mt_template_laporan DROP CONSTRAINT mt_tamplate_laporan_pkey;
       public            postgres    false    291            z           2606    37586 3   sys_password_reset_token password_reset_tokens_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sys_password_reset_token
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 ]   ALTER TABLE ONLY public.sys_password_reset_token DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    353            <           2606    37588 ,   risk_capacity_limit risk_capacity_limit_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_pkey PRIMARY KEY (id_capacity_limit);
 V   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit_pkey;
       public            postgres    false    293            >           2606    37590    risk_dampak risk_dampak_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak_pkey PRIMARY KEY (id_dampak);
 F   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT risk_dampak_pkey;
       public            postgres    false    295            @           2606    37592 <   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_pkey PRIMARY KEY (id_metrik_strategi_risiko);
 f   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_pkey;
       public            postgres    false    297            F           2606    37594     risk_penyebab risk_penyebab_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_pkey PRIMARY KEY (id_penyebab);
 J   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT risk_penyebab_pkey;
       public            postgres    false    303            J           2606    37596 .   risk_profile_control risk_profile_control_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_pkey PRIMARY KEY (id_control);
 X   ALTER TABLE ONLY public.risk_profile_control DROP CONSTRAINT risk_profile_control_pkey;
       public            postgres    false    306            L           2606    37598 ,   risk_profile_dampak risk_profile_dampak_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_pkey PRIMARY KEY (id_profile_dampak);
 V   ALTER TABLE ONLY public.risk_profile_dampak DROP CONSTRAINT risk_profile_dampak_pkey;
       public            postgres    false    308            T           2606    37600 <   risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_pkey PRIMARY KEY (id_mitigasi_jenis);
 f   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis DROP CONSTRAINT risk_profile_mitigasi_jenis_pkey;
       public            postgres    false    317            R           2606    37602 0   risk_profile_mitigasi risk_profile_mitigasi_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_pkey PRIMARY KEY (id_mitigasi);
 Z   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_pkey;
       public            postgres    false    315            V           2606    37604 D   risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_pkey PRIMARY KEY (id_mitigasi_realisasi);
 n   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi DROP CONSTRAINT risk_profile_mitigasi_realisasi_pkey;
       public            postgres    false    319            Z           2606    37606 B   risk_profile_mitigasi_timeline risk_profile_mitigasi_timeline_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline
    ADD CONSTRAINT risk_profile_mitigasi_timeline_pkey PRIMARY KEY (id_mitigasi_timeline);
 l   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline DROP CONSTRAINT risk_profile_mitigasi_timeline_pkey;
       public            postgres    false    323            X           2606    37608 V   risk_profile_mitigasi_timeline_realisasi risk_profile_mitigasi_timeline_realisasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_timeline_realisasi_pkey PRIMARY KEY (id_mitigasi_timeline_realisasi);
 �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi DROP CONSTRAINT risk_profile_mitigasi_timeline_realisasi_pkey;
       public            postgres    false    321            \           2606    37610 0   risk_profile_penyebab risk_profile_penyebab_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_pkey PRIMARY KEY (id_profile_penyebab);
 Z   ALTER TABLE ONLY public.risk_profile_penyebab DROP CONSTRAINT risk_profile_penyebab_pkey;
       public            postgres    false    325            H           2606    37612    risk_profile risk_profile_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_pkey PRIMARY KEY (id_risk_profile);
 H   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_pkey;
       public            postgres    false    305            ^           2606    37614 D   risk_profile_realisasi_residual risk_profile_realisasi_residual_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_realisasi_residual
    ADD CONSTRAINT risk_profile_realisasi_residual_pkey PRIMARY KEY (id_realisasi_residual);
 n   ALTER TABLE ONLY public.risk_profile_realisasi_residual DROP CONSTRAINT risk_profile_realisasi_residual_pkey;
       public            postgres    false    327            `           2606    37616 >   risk_profile_target_residual risk_profile_target_residual_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_target_residual
    ADD CONSTRAINT risk_profile_target_residual_pkey PRIMARY KEY (id_target_residual);
 h   ALTER TABLE ONLY public.risk_profile_target_residual DROP CONSTRAINT risk_profile_target_residual_pkey;
       public            postgres    false    329            d           2606    37618    risk_risiko risk_risiko_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_pkey PRIMARY KEY (id_risiko);
 F   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_pkey;
       public            postgres    false    333            f           2606    37620    risk_sasaran risk_sasaran_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_pkey PRIMARY KEY (id_sasaran);
 H   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_pkey;
       public            postgres    false    335            h           2606    37622 0   risk_sasaran_strategi risk_sasaran_strategi_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_pkey PRIMARY KEY (id_sasaran_strategi);
 Z   ALTER TABLE ONLY public.risk_sasaran_strategi DROP CONSTRAINT risk_sasaran_strategi_pkey;
       public            postgres    false    337            }           2606    37624    sys_session sessions_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_session
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.sys_session DROP CONSTRAINT sessions_pkey;
       public            postgres    false    354            j           2606    37626    sys_action sys_action_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT sys_action_pk PRIMARY KEY (id_action);
 B   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT sys_action_pk;
       public            postgres    false    339            r           2606    37628     sys_group_menu sys_group_menu_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT sys_group_menu_pk PRIMARY KEY (id_group_menu);
 J   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT sys_group_menu_pk;
       public            postgres    false    346            p           2606    37630    sys_group sys_group_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sys_group
    ADD CONSTRAINT sys_group_pk PRIMARY KEY (id_group);
 @   ALTER TABLE ONLY public.sys_group DROP CONSTRAINT sys_group_pk;
       public            postgres    false    343            v           2606    37632    sys_log sys_log_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id_log);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public            postgres    false    349            x           2606    37634    sys_menu sys_menu_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pk PRIMARY KEY (id_menu);
 >   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pk;
       public            postgres    false    351            �           2606    37636    sys_setting sys_setting_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.sys_setting
    ADD CONSTRAINT sys_setting_pk PRIMARY KEY (id_setting);
 D   ALTER TABLE ONLY public.sys_setting DROP CONSTRAINT sys_setting_pk;
       public            postgres    false    355            �           2606    37638    sys_user users_email_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 E   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_email_unique;
       public            postgres    false    357            �           2606    37640    sys_user users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_pkey;
       public            postgres    false    357            �           1259    37641    jobs_queue_index    INDEX     E   CREATE INDEX jobs_queue_index ON public.sys_job USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    219            {           1259    37642    sessions_last_activity_index    INDEX     ]   CREATE INDEX sessions_last_activity_index ON public.sys_session USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    354            ~           1259    37643    sessions_user_id_index    INDEX     Q   CREATE INDEX sessions_user_id_index ON public.sys_session USING btree (id_user);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    354            �           2606    37644    sys_action aksi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT aksi_fk1 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 =   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT aksi_fk1;
       public          postgres    false    339    351    5240            �           2606    37649 !   risk_register fk_388ab7f7f4fd9818    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_388ab7f7f4fd9818 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_388ab7f7f4fd9818;
       public          postgres    false    283    331    5170            �           2606    37654 2   mt_risk_kriteria_dampak_detail fk_41ba39047b02c6e5    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_41ba39047b02c6e5 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_41ba39047b02c6e5;
       public          postgres    false    255    5138    256            �           2606    37659 2   mt_risk_kriteria_dampak_detail fk_4d57df3881e291e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_4d57df3881e291e2 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_4d57df3881e291e2;
       public          postgres    false    239    5122    256            �           2606    37664 !   risk_register fk_65f431cf37d7f015    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_65f431cf37d7f015 FOREIGN KEY (id_parent_register) REFERENCES public.risk_register(id_register);
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_65f431cf37d7f015;
       public          postgres    false    331    5218    331            �           2606    37669 $   risk_profile_kri fk_6fcacdedc08a791a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_kri
    ADD CONSTRAINT fk_6fcacdedc08a791a FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.risk_profile_kri DROP CONSTRAINT fk_6fcacdedc08a791a;
       public          postgres    false    305    311    5192            �           2606    37674 %   mt_risk_taksonomi fk_726c58c036e9bcdd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT fk_726c58c036e9bcdd FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 O   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT fk_726c58c036e9bcdd;
       public          postgres    false    5152    265    264            �           2606    37679 !   risk_register fk_9bca8419236912b5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_9bca8419236912b5 FOREIGN KEY (id_owner) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_9bca8419236912b5;
       public          postgres    false    276    331    5162            �           2606    37684 "   mt_risk_matrix fk_a4669bbd55458901    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_a4669bbd55458901 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_a4669bbd55458901;
       public          postgres    false    258    5136    253            �           2606    37689 *   mt_risk_taksonomi_area fk_a9d39025b9658c1d    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT fk_a9d39025b9658c1d FOREIGN KEY (id_taksonomi_objective) REFERENCES public.mt_risk_taksonomi_objective(id_taksonomi_objective);
 T   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT fk_a9d39025b9658c1d;
       public          postgres    false    265    268    5154            �           2606    37694 "   mt_sdm_jabatan fk_b743dfd89358fc4e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_b743dfd89358fc4e FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_b743dfd89358fc4e;
       public          postgres    false    282    5168    276            �           2606    37699 "   mt_risk_matrix fk_d414e4107f6c8462    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_d414e4107f6c8462 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_d414e4107f6c8462;
       public          postgres    false    258    5122    239            �           2606    37704 *   risk_profile_kri_hasil fk_d4582e0c20c52b33    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_kri_hasil
    ADD CONSTRAINT fk_d4582e0c20c52b33 FOREIGN KEY (id_kri) REFERENCES public.risk_profile_kri(id_kri) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.risk_profile_kri_hasil DROP CONSTRAINT fk_d4582e0c20c52b33;
       public          postgres    false    311    312    5198            �           2606    37709 "   mt_risk_matrix fk_e3066883e2e9bb72    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_e3066883e2e9bb72 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_e3066883e2e9bb72;
       public          postgres    false    5156    270    258            �           2606    37714 !   risk_register fk_e839a323c85d81e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_e839a323c85d81e2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_e839a323c85d81e2;
       public          postgres    false    5168    331    282            �           2606    37719 +   mt_risk_kriteria_dampak fk_f9422fdc528daf94    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT fk_f9422fdc528daf94 FOREIGN KEY (id_induk) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 U   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT fk_f9422fdc528daf94;
       public          postgres    false    255    255    5138            �           2606    37724 !   sys_group_action group_action_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk1 FOREIGN KEY (id_group_menu) REFERENCES public.sys_group_menu(id_group_menu) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk1;
       public          postgres    false    344    346    5234            �           2606    37729 !   sys_group_action group_action_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk2 FOREIGN KEY (id_action) REFERENCES public.sys_action(id_action) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk2;
       public          postgres    false    344    339    5226            �           2606    37734    sys_group_menu group_menu_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk1 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk1;
       public          postgres    false    346    343    5232            �           2606    37739    sys_group_menu group_menu_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk2 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk2;
       public          postgres    false    346    5240    351            �           2606    37744 4   internal_control_testing internal_control_testing_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.internal_control_testing
    ADD CONSTRAINT internal_control_testing_fk FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.internal_control_testing DROP CONSTRAINT internal_control_testing_fk;
       public          postgres    false    217    5162    276            �           2606    37749 5   internal_control_testing internal_control_testing_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.internal_control_testing
    ADD CONSTRAINT internal_control_testing_fk1 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE SET NULL NOT VALID;
 _   ALTER TABLE ONLY public.internal_control_testing DROP CONSTRAINT internal_control_testing_fk1;
       public          postgres    false    217    331    5218            �           2606    37754    lost_event lost_event_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk1 FOREIGN KEY (id_lost_event_kategori) REFERENCES public.mt_lost_event_kategori(id_lost_event_kategori) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk1;
       public          postgres    false    221    228    5112            �           2606    37759    lost_event lost_event_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk2 FOREIGN KEY (id_lost_event_sumber_penyebab_kejadian) REFERENCES public.mt_lost_event_sumber_penyebab_kejadian(id_lost_event_sumber_penyebab_kejadian) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk2;
       public          postgres    false    221    231    5114            �           2606    37764    lost_event lost_event_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk3 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk3;
       public          postgres    false    249    5132    221            �           2606    37769    lost_event lost_event_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk4 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi);
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk4;
       public          postgres    false    5150    264    221            �           2606    37774    lost_event lost_event_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk5 FOREIGN KEY (id_lost_event_frakuensi_kejadian) REFERENCES public.mt_lost_event_frakuensi_kejadian(id_lost_event_frakuensi_kejadian) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk5;
       public          postgres    false    227    221    5110            �           2606    37779    lost_event lost_event_fk6    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk6 FOREIGN KEY (id_lost_event_status_asuransi) REFERENCES public.mt_lost_event_status_asuransi(id_lost_event_status_asuransi) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk6;
       public          postgres    false    221    5116    233            �           2606    37784    lost_event lost_event_fk7    FK CONSTRAINT     �   ALTER TABLE ONLY public.lost_event
    ADD CONSTRAINT lost_event_fk7 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.lost_event DROP CONSTRAINT lost_event_fk7;
       public          postgres    false    5218    331    221            �           2606    37789 4   mt_risk_agregasi_kelompok_bisnis mt_risk_agregasi_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis
    ADD CONSTRAINT mt_risk_agregasi_fk FOREIGN KEY (id_risk_agregasi_risiko) REFERENCES public.mt_risk_agregasi_risiko(id_risk_agregasi_risiko) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis DROP CONSTRAINT mt_risk_agregasi_fk;
       public          postgres    false    235    237    5120            �           2606    37794 5   mt_risk_agregasi_kelompok_bisnis mt_risk_agregasi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis
    ADD CONSTRAINT mt_risk_agregasi_fk1 FOREIGN KEY (id_kelompok_bisnis) REFERENCES public.mt_sdm_kelompok_bisnis(id_kelompok_bisnis) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.mt_risk_agregasi_kelompok_bisnis DROP CONSTRAINT mt_risk_agregasi_fk1;
       public          postgres    false    278    5164    235            �           2606    37799 3   mt_risk_agregasi_risiko mt_risk_agregasi_risiko_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_agregasi_risiko
    ADD CONSTRAINT mt_risk_agregasi_risiko_fk1 FOREIGN KEY (id_kelompok_bisnis) REFERENCES public.mt_sdm_kelompok_bisnis(id_kelompok_bisnis) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.mt_risk_agregasi_risiko DROP CONSTRAINT mt_risk_agregasi_risiko_fk1;
       public          postgres    false    237    278    5164            �           2606    37804 3   mt_risk_agregasi_risiko mt_risk_agregasi_risiko_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_agregasi_risiko
    ADD CONSTRAINT mt_risk_agregasi_risiko_fk2 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.mt_risk_agregasi_risiko DROP CONSTRAINT mt_risk_agregasi_risiko_fk2;
       public          postgres    false    237    255    5138            �           2606    37809 ,   mt_risk_jenis_risiko mt_risk_jenis_risiko_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_jenis_risiko
    ADD CONSTRAINT mt_risk_jenis_risiko_fk FOREIGN KEY (id_kategori_risiko) REFERENCES public.mt_risk_kategori_risiko(id_kategori_risiko) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.mt_risk_jenis_risiko DROP CONSTRAINT mt_risk_jenis_risiko_fk;
       public          postgres    false    5134    251    249            �           2606    37814 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk1 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk1;
       public          postgres    false    270    5156    274            �           2606    37819 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk2 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perlakuan) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk2;
       public          postgres    false    5144    274    259            �           2606    37824 !   mt_sdm_jabatan mt_sdm_jabatan_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT mt_sdm_jabatan_fk1 FOREIGN KEY (id_jabatan_parent) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE SET NULL NOT VALID;
 K   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT mt_sdm_jabatan_fk1;
       public          postgres    false    5162    276    276            �           2606    37829 !   mt_sdm_pegawai mt_sdm_pegawai_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT mt_sdm_pegawai_fk1 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public.mt_sdm_pegawai DROP CONSTRAINT mt_sdm_pegawai_fk1;
       public          postgres    false    276    280    5162            �           2606    37834    mt_sdm_unit mt_sdm_unit_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_fk FOREIGN KEY (id_kelompok_bisnis) REFERENCES public.mt_sdm_kelompok_bisnis(id_kelompok_bisnis) ON DELETE SET NULL NOT VALID;
 D   ALTER TABLE ONLY public.mt_sdm_unit DROP CONSTRAINT mt_sdm_unit_fk;
       public          postgres    false    278    282    5164            �           2606    37839 <   mt_status_pengajuan_page_disable mt_status_pengajuan_page_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_page_disable
    ADD CONSTRAINT mt_status_pengajuan_page_fk FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.mt_status_pengajuan_page_disable DROP CONSTRAINT mt_status_pengajuan_page_fk;
       public          postgres    false    283    5170    285            �           2606    37844 <   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_fk FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_fk;
       public          postgres    false    5170    283    287            �           2606    37849 =   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_fk1 FOREIGN KEY (id_tingkat_agregasi_risiko) REFERENCES public.mt_risk_tingkat_agregasi_risiko(id_tingkat_agregasi_risiko) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_fk1;
       public          postgres    false    271    287    5158            �           2606    37854 =   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_fk2;
       public          postgres    false    287    343    5232            �           2606    37859 =   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_fk3 FOREIGN KEY (id_status_pengajuan_selanjutnya) REFERENCES public.mt_status_pengajuan(id_status_pengajuan) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_fk3;
       public          postgres    false    5170    287    283            �           2606    37864 =   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_fk4 FOREIGN KEY (id_status_pengajuan_dikembalikan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan) ON DELETE CASCADE NOT VALID;
 g   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_fk4;
       public          postgres    false    5170    287    283            �           2606    37869 =   mt_status_pengajuan_penerima mt_status_pengajuan_penerima_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_status_pengajuan_penerima
    ADD CONSTRAINT mt_status_pengajuan_penerima_fk5 FOREIGN KEY (id_assessment_type) REFERENCES public.mt_assessment_type(id_assessment_type) ON DELETE CASCADE NOT VALID;
 g   ALTER TABLE ONLY public.mt_status_pengajuan_penerima DROP CONSTRAINT mt_status_pengajuan_penerima_fk5;
       public          postgres    false    5108    287    225            �           2606    37874 +   risk_capacity_limit risk_capacity_limit_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_fk1 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit_fk1;
       public          postgres    false    331    293    5218            �           2606    37879    risk_dampak risk_dampak    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT risk_dampak;
       public          postgres    false    333    295    5220            �           2606    37884    risk_dampak risk_dampak_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT risk_dampak_fk1 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) NOT VALID;
 E   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT risk_dampak_fk1;
       public          postgres    false    5168    295    282            �           2606    37889 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk1 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk1;
       public          postgres    false    297    249    5132            �           2606    37894 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk2 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk2;
       public          postgres    false    297    5150    264            �           2606    37899 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk3 FOREIGN KEY (id_sikap_terhadap_risiko) REFERENCES public.mt_risk_sikap_terhadap_risiko(id_sikap_terhadap_risiko) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk3;
       public          postgres    false    262    5148    297            �           2606    37904 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk4;
       public          postgres    false    297    331    5218            �           2606    37909    risk_msg risk_msg_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT risk_msg_fk FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.risk_msg DROP CONSTRAINT risk_msg_fk;
       public          postgres    false    299    5218    331            �           2606    37914    risk_msg risk_msg_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT risk_msg_fk1 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.risk_msg DROP CONSTRAINT risk_msg_fk1;
       public          postgres    false    283    299    5170            �           2606    37919    risk_msg risk_msg_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT risk_msg_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) NOT VALID;
 ?   ALTER TABLE ONLY public.risk_msg DROP CONSTRAINT risk_msg_fk2;
       public          postgres    false    299    343    5232            �           2606    37924    risk_penyebab risk_penyebab_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_fk1 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT risk_penyebab_fk1;
       public          postgres    false    333    303    5220            �           2606    37929    risk_penyebab risk_penyebab_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT risk_penyebab_fk2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) NOT VALID;
 I   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT risk_penyebab_fk2;
       public          postgres    false    5168    303    282            �           2606    37934 -   risk_profile_control risk_profile_control_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_fk1 FOREIGN KEY (id_efektifitas_control) REFERENCES public.mt_risk_efektifitas_control(id_efektifitas_control) ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public.risk_profile_control DROP CONSTRAINT risk_profile_control_fk1;
       public          postgres    false    306    5124    241            �           2606    37939 -   risk_profile_control risk_profile_control_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_control
    ADD CONSTRAINT risk_profile_control_fk2 FOREIGN KEY (id_jenis_control) REFERENCES public.mt_risk_jenis_control(id_jenis_control) ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public.risk_profile_control DROP CONSTRAINT risk_profile_control_fk2;
       public          postgres    false    5126    243    306            �           2606    37944 +   risk_profile_dampak risk_profile_dampak_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.risk_profile_dampak DROP CONSTRAINT risk_profile_dampak_fk1;
       public          postgres    false    305    5192    308            �           2606    37949 +   risk_profile_dampak risk_profile_dampak_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_dampak
    ADD CONSTRAINT risk_profile_dampak_fk2 FOREIGN KEY (id_dampak) REFERENCES public.risk_dampak(id_dampak) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.risk_profile_dampak DROP CONSTRAINT risk_profile_dampak_fk2;
       public          postgres    false    295    308    5182            �           2606    37954    risk_profile risk_profile_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.mt_risk_sasaran(id_sasaran) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk1;
       public          postgres    false    305    261    5146            �           2606    37959    risk_profile risk_profile_fk10    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk10 FOREIGN KEY (id_risk_agregasi_risiko) REFERENCES public.risk_profile(id_risk_profile) ON DELETE SET NULL NOT VALID;
 H   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk10;
       public          postgres    false    305    5192    305            �           2606    37964    risk_profile risk_profile_fk11    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk11 FOREIGN KEY (id_risk_agregasi_risiko) REFERENCES public.mt_risk_agregasi_risiko(id_risk_agregasi_risiko) ON DELETE SET NULL NOT VALID;
 H   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk11;
       public          postgres    false    237    5120    305            �           2606    37969    risk_profile risk_profile_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk2 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk2;
       public          postgres    false    5132    305    249            �           2606    37974    risk_profile risk_profile_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk3 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk3;
       public          postgres    false    305    5150    264            �           2606    37979    risk_profile risk_profile_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk4;
       public          postgres    false    5218    305    331            �           2606    37984    risk_profile risk_profile_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk5 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk5;
       public          postgres    false    305    5220    333            �           2606    37989    risk_profile risk_profile_fk6    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk6 FOREIGN KEY (id_dampak_inheren) REFERENCES public.mt_risk_dampak(id_dampak) NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk6;
       public          postgres    false    305    5122    239            �           2606    37994    risk_profile risk_profile_fk7    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk7 FOREIGN KEY (id_kemungkinan_inheren) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk7;
       public          postgres    false    5136    253    305            �           2606    37999    risk_profile risk_profile_fk8    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_fk8 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak) ON DELETE SET NULL NOT VALID;
 G   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_fk8;
       public          postgres    false    305    5138    255            �           2606    38004 /   risk_profile_mitigasi risk_profile_mitigasi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk1;
       public          postgres    false    305    315    5192            �           2606    38009 /   risk_profile_mitigasi risk_profile_mitigasi_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk2 FOREIGN KEY (id_profile_penyebab) REFERENCES public.risk_profile_penyebab(id_profile_penyebab) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk2;
       public          postgres    false    5212    315    325            �           2606    38014 /   risk_profile_mitigasi risk_profile_mitigasi_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk3 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perlakuan) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk3;
       public          postgres    false    5144    315    259            �           2606    38019 /   risk_profile_mitigasi risk_profile_mitigasi_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk4 FOREIGN KEY (id_jenis_program_rkap) REFERENCES public.mt_risk_jenis_program_rkap(id_jenis_program_rkap) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk4;
       public          postgres    false    5130    315    247            �           2606    38024 /   risk_profile_mitigasi risk_profile_mitigasi_fk5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi
    ADD CONSTRAINT risk_profile_mitigasi_fk5 FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_mitigasi DROP CONSTRAINT risk_profile_mitigasi_fk5;
       public          postgres    false    276    315    5162            �           2606    38029 ;   risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_fk1 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi);
 e   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis DROP CONSTRAINT risk_profile_mitigasi_jenis_fk1;
       public          postgres    false    5202    315    317            �           2606    38034 ;   risk_profile_mitigasi_jenis risk_profile_mitigasi_jenis_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis
    ADD CONSTRAINT risk_profile_mitigasi_jenis_fk2 FOREIGN KEY (id_jenis_perlakuan) REFERENCES public.mt_risk_jenis_perlakuan(id_jenis_perlakuan) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.risk_profile_mitigasi_jenis DROP CONSTRAINT risk_profile_mitigasi_jenis_fk2;
       public          postgres    false    245    317    5128            �           2606    38039 C   risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_fk1 FOREIGN KEY (id_status_rencana_perlakuan) REFERENCES public.mt_status_rencana_perlakuan(id_status_rencana_perlakuan) ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi DROP CONSTRAINT risk_profile_mitigasi_realisasi_fk1;
       public          postgres    false    319    289    5176            �           2606    38044 C   risk_profile_mitigasi_realisasi risk_profile_mitigasi_realisasi_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_realisasi_fk2 FOREIGN KEY (id_pic) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE NOT VALID;
 m   ALTER TABLE ONLY public.risk_profile_mitigasi_realisasi DROP CONSTRAINT risk_profile_mitigasi_realisasi_fk2;
       public          postgres    false    276    5162    319            �           2606    38049 =   risk_profile_mitigasi_timeline risk_profile_mitigasi_timeline    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline
    ADD CONSTRAINT risk_profile_mitigasi_timeline FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline DROP CONSTRAINT risk_profile_mitigasi_timeline;
       public          postgres    false    5202    315    323            �           2606    38054 Q   risk_profile_mitigasi_timeline_realisasi risk_profile_mitigasi_timeline_realisasi    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi
    ADD CONSTRAINT risk_profile_mitigasi_timeline_realisasi FOREIGN KEY (id_mitigasi) REFERENCES public.risk_profile_mitigasi(id_mitigasi) ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.risk_profile_mitigasi_timeline_realisasi DROP CONSTRAINT risk_profile_mitigasi_timeline_realisasi;
       public          postgres    false    315    321    5202            �           2606    38059 /   risk_profile_penyebab risk_profile_penyebab_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_fk1 FOREIGN KEY (id_risk_profile) REFERENCES public.risk_profile(id_risk_profile) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_penyebab DROP CONSTRAINT risk_profile_penyebab_fk1;
       public          postgres    false    305    5192    325            �           2606    38064 /   risk_profile_penyebab risk_profile_penyebab_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile_penyebab
    ADD CONSTRAINT risk_profile_penyebab_fk2 FOREIGN KEY (id_penyebab) REFERENCES public.risk_penyebab(id_penyebab) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_profile_penyebab DROP CONSTRAINT risk_profile_penyebab_fk2;
       public          postgres    false    325    5190    303            �           2606    38069    risk_register risk_register_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT risk_register_fk1 FOREIGN KEY (id_tingkat_agregasi_risiko) REFERENCES public.mt_risk_tingkat_agregasi_risiko(id_tingkat_agregasi_risiko) ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT risk_register_fk1;
       public          postgres    false    331    271    5158            �           2606    38074    risk_register risk_register_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT risk_register_fk2 FOREIGN KEY (id_kelompok_bisnis) REFERENCES public.mt_sdm_kelompok_bisnis(id_kelompok_bisnis) ON DELETE SET NULL NOT VALID;
 I   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT risk_register_fk2;
       public          postgres    false    331    278    5164            �           2606    38079    risk_register risk_register_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT risk_register_fk3 FOREIGN KEY (id_assessment_type) REFERENCES public.mt_assessment_type(id_assessment_type) ON DELETE SET NULL NOT VALID;
 I   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT risk_register_fk3;
       public          postgres    false    225    5108    331            �           2606    38084    risk_risiko risk_risiko_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk1 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_fk1;
       public          postgres    false    264    5150    333            �           2606    38089    risk_risiko risk_risiko_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk2 FOREIGN KEY (id_jenis_risiko) REFERENCES public.mt_risk_jenis_risiko(id_jenis_risiko) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_fk2;
       public          postgres    false    249    5132    333            �           2606    38094    risk_risiko risk_risiko_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT risk_risiko_fk3 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(id_unit) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT risk_risiko_fk3;
       public          postgres    false    5168    282    333            �           2606    38099    risk_sasaran risk_sasaran_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_fk2 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_fk2;
       public          postgres    false    331    335    5218            �           2606    38104 /   risk_sasaran_strategi risk_sasaran_strategi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.risk_sasaran(id_sasaran) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_sasaran_strategi DROP CONSTRAINT risk_sasaran_strategi_fk1;
       public          postgres    false    335    337    5222            �           2606    38109    sys_user sys_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user FOREIGN KEY (id_pegawai) REFERENCES public.mt_sdm_pegawai(id_pegawai) ON DELETE SET NULL NOT VALID;
 ;   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user;
       public          postgres    false    5166    357    280            �           2606    38114 !   sys_user_group sys_user_group_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk1 FOREIGN KEY (id_user) REFERENCES public.sys_user(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk1;
       public          postgres    false    5252    358    357            �           2606    38119 !   sys_user_group sys_user_group_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk2;
       public          postgres    false    5232    358    343            �           2606    38124 !   sys_user_group sys_user_group_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk3 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk3;
       public          postgres    false    5162    358    276            w      x������ � �      {   �   x���M��0���)|�[N�J�'�F!�T�	�g1����vR�<��z������I�P�p>�\���`�2���i���yt���,�O!D8<��,h�_�/H_�_A���7o���7@�^Q� O��ȑbO�@�SH2N:p���5Ukcn�d�KBHL_2�n��R��z��Q.�0ʅ�ΜI��+�m��vLWS���~q�����pK퟼M�{^+��泍�         |   x�3��,���W��/*�/J,�4202�50�54W0��2��21�*㇉��8]2ˀ껤$�����;�뷴20�*��Lc΀����l,:,��a5ń�7�(;�$3/S��V1���qqq �F�      �      x������ � �      �   @   x�3��K�MT�N,IM�/�T�N�JL�L�3�4202�50�54W00�2��26�*㇉�b���� g��      �      x������ � �      �      x������ � �      �     x����� �PEp8��p,�ޞ�¯L�a��T��X����^e��itv_��8>��%�]@t�%D�P1�~#���eFO�eFK�"�����o|1,ղ���LE�@l*��� `�"��XEޅ�*B���*Al:q��8Cg��w�2d^�"����b���~fV�M��投!p�!e:!�\;fBȯ�!Ŋ��� V8!�v f��
_R���)V�p�H���"��bE��bE��b���9� �|�1      �   g  x��W�n7]�|W���g���Z�aTh��YfCI�Es9l���!GId)'N�|)���9��&K#UG�r�Q����L���lɞ��,�]�F��;ެyO�������B%4)�m�Ќ�����dyU,�,l��v���Jhk���(^�Ym��#��߆���
}W�7�&�k{��r�����yt��mA7�d)Z.��_���k$dթN��h�,\i�#!�Y�h��b�/���腮}j��I%p���5����b^�y�D�&�ޒ�P�~ �<���rx�M�� �,��?��X�=چ#m(*z��!�k`3��|�%¸j�#,�l�So�ϓ�:���O�Fo_�R\U�b����O|Qb']"��#N�kE�*qu��ʳ/`4����Ļ"�?<��aU�ma�<Yr}���V;r�y�L��E~F���0�},��1�[�&��-$�3.} m�9p�3t&H��F��,ö0f�� ��gA[����~��~t�4�u���D%�!��j�#��h�����L�����/D��y૱u?H�4�,[magY��=8�p�K���:��N�=��@[��ziA&������񭃏�+��%�L�?���0i�|Λ�ۋ*����nO]�7�A[�����S`(�AL�>e���k�Q�4=���S���maf�{������*�kv�A�j�������eiU���3���\:L���r��b�s �L0.�����E lZ���������(`�����|Z�K�)��~7�M�fc�bv��0�'?�c�*Y =%����aJ�߻N!I��bs��S�~���Ԑc�K��Os{�q�xAnd-ݧF�U)��" �:ś��a�����|²��D�����	��v}�i�t7v���qh�H޻�޺�N����w�^>,"*Oݛ��:�: �m]�4SN�1Dy�0v��y��S�b�8�8�7��v6O�5�6�U�/`a�c�܅F(OеX��̩�\�C�����+��c�ز \�����ĉF-��fG����:��+d�؃�+,_�
���w���ԋ@��tT�6��㟭��s-��[�ǫ0�{���=_�p,B�o�4��e4(      �   J  x��ӽN�0 ��~
K�1pv�߁��P��+ԍg��9'-(��N��%'��lN��m�gm+�NԮS-맦��W�Rvv?��U�VY�j7�
�[��aјPw�n���M��0�Sa͇2�^y�������ݓ�SB�d$Y�%O�$�)YJ^Br��W *��
2��%�����AC$�r�1�sH^B����lR�M$4&��J;叒�o�KP�gI␐�.$Y�a)�劤��+ ���ئ1GHez7t���3�D�i��2!�	K�--r�R�hI��gNj����k}�鎝#�?r8,HE)�%)Y{15�xM�7��/6�17      �   p   x�3�t.�.-PHI�SpMK�.�L�4202�50�52U00�20�25�*㇉��0TNMJL�L�C7����d�V���L�LĬ;�r�&N�R<�£�C7���qqq "X[Q      �   �   x���1�0й9�G
!M��+ q�.V�DԐXi��a( *EH������8�bp�"J`� 8����&�=�"�8`*�T���T�n�jd�����	�\8��^��Ͳ���c��aӅ;����s����C��A&���k���bT�B< :v�^      �   �   x���An� E��)8@RaeY��6���$%	��Ƒr�PUj�H�+�@Ob�����θ�� ����hǯx{��z|��2��bI%�����?��oVq�e�y�O�~e���d�����(���%TU�Qu��[06\���hȓ�`�����HZ��]�+2�24��54�ќί���lȉ�Nb�Ӝ��tCu�);OV�1��P��]�ZL���*?�]"�;1�]o�ѝ!Re�71���,�~�"�      �     x�m��j�0�s|
_`KWs+�Rv�.l�{�b��:���}�)����|Lf"���a̛p>-����R�>�*�)���/�r�xm�f����d`��(�8��*i�`�il�λ��S���������Ɍ�{�:����؏�K� 3���dW��|��=�jMf�Z���6�m
����H��������KZ[TdFz��ٰ�{��|���s�IׁaZ���6̕Pe�HcF���g�Z�t��(If�$��7�k
Ó�l���,�nټ      �   a  x�u�1o�0�g��*:4��@�ڪ������Y�7q	&2Ъ��:�!!�ox��|Ѐ�El_�QeM���V�UC�qy�X��C�#q!x"h�j�W�	�C��U(�Z��$z�(s"[0��I
TC9��$GVЀM�����A�9����G�Zii>���4��@����z.E������4ШZÕDæ6&���&��x�E�;�9v���S��6$Zu6��M�$�T$���e�t��D��g���
�#ԋc���^��W]�U�ζ�mw�;��Vx���U���!m�f�J��6ua?�g�A;K�rƕ_�l62J�����Q�g'���|��)����"�_�<x      �   ~   x�u���0Dg�+2�%�����Ds� YTv���ԩ�tӓ��e��f�Ƈ�E{[�)����ՙ5V��	`B�1]�rsqY}�p���Oo�*m���\�:��ygib��yI/�9����BF      �   >  x�uҽn�0 ��~
��Aw�_<f�*5�ԎY����F!��5���$:�d,�>s���A@rr�� �r0��:��n���(�t�q��v�[�����y';:�!�J�_:v��(c�J�BX0*��޽�T)�ٛߵ�X<�C�������1o�t¤5�B]�td��T�c����&���L��0�X&S��(w+�4����'o�UU�₭C�'S�u`��'�5k���4� �c��O���I�K��R���RP�8�kx�;|�D^�G�������0�j�K���v�x�7\��a�`÷%���㶻      �   q  x��WMo�8=˿��ض")ʒn.����7Nn�01csmӂ,e��o�ڱE*�E
$���73o�e���[��S76�Y��j�t57��݌����dt5����j�";��6�B�t���~��q��<��Ei�#��S�>�!��B�Ù�Y��\��޿���lk��S�'SI��Bu��a''Fz���4�x�y!����>6�>�ѽ���]5�fݾ}:r���=�&��E���F���������uî���Ǿ��BA6N���T �_M5��R/�UbW�׏��T�B�E"@bN��IF�=�hlV��纂�E2���wcF��B&��E�s���)u�,����%��a�.ʰ]u�xij��F��[�$�����]GHav���7eS�Ht���٤HTOc(�aE8Y�#Ǿ0������}���ɬ,�MY���Ў�qD;���<�V�ΰ������<� �$)8�"�*�0�u�L����!qۣ��w8%�L������L*O�D~�B�6�i�{��}��wv�-��^!=�;�KV;_��:����j��,\�= �T��"93׵}a3��ffu�`K^(�eKZȬ�K�o�IC�؅~��V�f��<D��{����<ti�%J������h��蕝�{�	��O���u�O�1����G������S�o�����T�NIՅ�������b����j2�܉��m$��ɞ�C����~1�~��4~c��إ{��ƭ��(��?g3 �l@�U[Ȁ
&)��s��(�8w�| ���YF$y�}���R�O�1q=��{>���#П���E#<˽�Nk���LA�fԭ[mݼՃ@L�g��������]@ĸ���3�E|��K]��ѽp�B�O"xo����i=4�c�W ��:ā��v�e���O$J��L6��S�z7H���z�W=�m�SUtvϜ":�̼2umf�FH��}�Ȓ&a=����a���mm�]/��j�����mV��m����vԟy$i�J� 0�z�"�����!���leӞ�(���5�4D��«�(TÖ́�&�Ķo�m,��@���t�^B�C6�J�P�m�nO�%2�}�Qx��gL�L�k����@�V��5���J�/�jͶ?�uN���Ʃ�����9�!Q�҄L]��E����1~�v3� ��w3bg�Ϋ}6�Ƽ��Oo�� �P�E|�}��\�f�(* yjgr�>��j3�4�z(%��S״
�6�C�:��m6��p���V�k�:����/�P!a�B��բ�o�}��'�����u�<\���^o73�wg�~��Ʒw�F��)��Ш�{�N�a�ڗ��"��}A�ѵ�aػ0#���e~R�6CؙU����`�e��`      �      x��\Ks�F>ӿb.ڲk�O�byU�ĩ��ث�����090`�a�n��ؽm�X~�~=�x )(�U)G�H��=��[kr�'y�W�K�r��<�dG<˰�3�=3�̸����im�Y3̹e̝���n��L{�L�
)"2��y�#?���,��A5���K��.�x��@�R?�S.��g_���{��� ʸ��6v���%~w��\n�&3��}9��-3fL�=w��f'd�[�Y�N�5�A�Ї<x�X�'o�ߊ�<�x��CƇ�B�d�6t�b<)[P��b�F��q�\���*�hk� �N����jZN��B��,O.=���!j_.�B��0r�ϒ�G|$�Q�
\��|�G�ZD��n���\a��b�O���P�,N��H�<T ����)��ˀ���X��৞|���Sv�����B�����씽ɽ/���>���C.�����tnڄ���37�^�"V��0_��d>��H�:ˈ^�QQ�S���<b��4�?��M0ӹe7��s���;��-�#�6�AN$SH�R���P���-�P�t�EP��ed~�����3��x)�<�P$�©z.�N�EB e�씍/rW-�s�P� ��C|�x�SzF�����q��%A��*���Q��'�<ܗ���9;Oo����T�$��[��A^��
�r�x�����d�Ãƒ������EJn��|�X壟(e�BW�aAZ�'�v�w���z� �jY~��y�RP?��&6ۙ�-l�ss֋M��<�,�iAfK�� ���O>��-x�<*��gs��|�/�%r��`t�(�QMBn؏RdL�(��P���bDB���-q�<y�G"Z��;�ͩ2;�'�$��{rUJ���4Nȁ~Vxs�=iP�L hR���!):�������JY�-��r�0�����HG=g�hHZ8y���#������|"����;~G^����[� 	^vH�r@�fK�L	�)�q��C��6�^��K(~&>��F��0<�(�1B�s��/��pt��$�x��Y�t?�T������]�[N
��Z���r�Cs��f-ز-:��ց� 9��iM�h�ڳĊ�u �݈�P���|�R2U��r�J��V����l�d�st.������9�VX�jM���(J����
ڤK7����y��9�Y�w�$�L9P]XO]]X�.�k�ʂ�f�NP���Y�,��&�K�)�j��gX����)t#r��B��1(��=�k���oࠚ�y�i�L9�L����o�١o���ʎ��{?V��R�R���T�i�(9-��z�Vt���]��Q̢p�5<����r�;ؔ��=�dEౌ���:���3U���d�m�
��{SU�v�^�t�zLjb%x�����Dq#���'w�l�C s'��(���"�.��9�zZK�?���x�)u��]	d?s�4�E�ݠns��@��ާ����b`�}��H3#����P�3�C����3���`������(��r� i�w���ᬚ�e|=�!�� ���ã�8�S��E�{#?�yfI��;Q	�"r�)�ص�R��`�}3J�?�#�r�u�i�s��&>{n��p��Q�[f�C@,��/���2a��A�m"8e\$��!R�5D�9T!
OƔz��yH3?j�tGqc::z�2�D뛮��_�n[��Bg૲�-��{���tU����v�T�!]����nQ�ߥ�W�1��!t�?��l�{���C���
�mc�=��|!�i�NJ�x���n�i6��Minڗ�<-����"�^����l�B�i�s���p��i5L��۬]i
Q��E�!�Y���`�h�=��
��^g)$�����6����d�5k�@_�!gU�S��i�lGWO��L1�4���E��JLu?V*��-�n­�����;𦖑����F�΍�8?�����3��Q�Q�B]`�`�Y�~*�!]����$ܯ)VR��r���إ\� hS����yJ/��0��s�h~�X:Ee�I�*��^��)�ɮ���m`����k�Pr{��'?���6.���2晥�/�R$Q�ZPe+Tg�%X�I�y�1����س��	�7�R�9�2+Qs�{~�-�ZٟM@��	�����_���ϛ�P����Qx����ƙ'2]��������E��a�ڊM=F"~�K�83�2��P,�m�E�4�{��F�+:��R9�T�T���B�V/_����K��E�UoVkc�΍�~�<��<55�_�F4/����r������������f�3���p��QN�T2X�a��(;:�����Ñ��l���-�π:Ɵ!�ԇ_�<��~nο�&��z��{��n{A�X�K����N
7N
_�uP58�%	_��D*�Q�Z&O�\?#e~�cL�K+H���+��
�n�&$�iKȞ�Wk�U_GN�׭P��q����\V|ЬWL�Ay�0�2��'3�mAL{AX�6�s2�<�Vp�5z�P󎲫�i��w{���FOʓ�u~�\$g*�E���Ur��*QѠB�E99黤��'*.έ��A���Sr��Y�Iެ?�K��O�%*n�+�ٜuS�=	�)ls��/Z.)q;g��#��H�Z���nu��)�b���wg�Mg"8+`�� P��gL�ށ�h�C���\����CK�s���4�����?3���֗z�OB�MPrxT�,}�g�y��j]��̰4�f�������Lj�
��F<Z��p�De�V�`�� �C�T�:*�OMK%`�\m۬i�m�4�#�0��zpng�'ev���2:�Y���o��7Ts�T��CUDfw�y"�s*\��=Q��� ��H�\&��fm���\o+�D�/j8e�ZbEN��(�Q��j�O�{G���׵�Y���E���@�$��NN�{�T�}�G�xA��ژgj�"���	��i�+h��R�[��s���%O�d�Ba�p'?Fe���ڮ�}�@L����.a4G�� �C�g��#�0�$�C�ŶC�|�]KX�����u�n{���J����ΐc�hG{"zo���Ŵ
�k��m�V�UV�4g���XH�>1�l5��]�J�xS|��􋛋��b�J?���ƛ'�f���J�X��rWm�7V��y�+YC�Լ�qY3'/������4��+;��^m�z�ѩ�;��h�a��c���Gfv��kv�4w�&�=��G]X��,,��:�6�����LS�K90�vO-*����iUj�������JWm{�jqx��Q�h�Ә?��3NGơ֗y�����T��P���Z�� ӹ�ػ���_<i4df[U�>둙C=��U/%Uw7UO�+6Uw�W[��y*��D�������l'�Y�>@���|����X�ϧۀ��j�����+��E���{q���fD�V�%�1�C޼�ٿB0Ĉ��:F���1�jϴïBE�T۶Q��?),���^���t�eEE��>��Y*׹j]�m��I��C�{y0���f���
�V8�fc��������	�i��t߯20�n�������?���tH֌D��)��5E-��*EE�.�mO_�f�����tU�r���VBq���OIU��B�=V^3)���&2�tH o�\/�R�Q�K\�/�SՋ���eS�C��#ȡ��Hr�_T"�}|C�Ҍz����;{���ơ�����@��t������컯��p�6ڱ0�i.+����7_�:�������F�ő���BF3V��˃4Fߑ1T�1.+��a�W��tsK������>�[��Ǳ^� �����q"�Kh�~�*�q*E���m��[ �{�rEc��:�P�ɠ
���bk��1Y�0&k�RP��?p�d��n�b<�������q�}w͊0����P�K����݇����TtSN�.]�/D��>�D�@�%<hrG����M#ڟ�-rC�����, �`����h �դ�����)�RY��k�J.�+��>s��΍�Pߠ	i����
��c3�53X�^��et�=�؜`��	�؛���	6�6q�2�    �ճg��#��      �   �  x���A��0E��)\t�B�(�V��d�6@���K1$c��t1�>Q��Ѕ.u�.�y�~./k^���e]�����?�~�^������������������r:/swy�O�{?N�Ƈƽ�����/���N��{�Q�j�D��^W~����>��ЄC�����)�Jd�#�/ađQ"��F�XJFf�x�.��j��C��q�����0m����W,!B�����k�y=rĉq��&W��|KLH��F!P����f�d��>[��bxA������!�ǂ���/ޘ��%46BCI֩��S>��dJ��N:5�%����u��Sc�V�����P�wB�F�R�Fh�d��qj�.5N�k��p.�7J�����,E]F�P2���V�����w���.L檗��rj+��j���n�%��X��U�ChJ'X�m�>e�ʳ#�G����0��V�F�<�T��@�VX-���A���,��!�ʀ.&�v(�0*����k��67�H-�r񻢫Q7+�H�k� )�/Y����y�IM�"�	j��u�1i��4\r���a�N�]k�+�j8���b����U��7P��)�0j�o
� e}i��W�e���'��M6�veW��Z:D�W��6�M�(R��(��^H�(v�Oι���"      �   >  x��XMs�6=���Ԥ�$EZ�n��l�r�Qy&{�a	&	2`G��y�-��aS��e�h6��{ݍ0�<�Į�e.��p#&w�Ҷ↥�oJT�*cS���k#S����c��I�H�o��lx���<��~���y2?���<􏿻��d�x��p���~u~�+F�Or��6ג����ʅ�ؒ�89�f\�leՆ�W���<�\�O��._�\^����*v"�K+{�8��V�RT+�P׈!�wX�9X"W��:�����O����Q�9��M�r�w�*��p.���R�mYf��!ۈn^�"l�T�g��Ғg�C��cg�y|3��}g��Qg�u/�C�=����%��;Cdhl��I#r����K��|]�w[3^�g`�)����v�?�,Zn�!Wo���6���W�YڜS$ �^8�b%2��"��\�>Oq9:t|5��x�Y����z-Js�J���������>i�[�@42A���Pܑ�1�wpNb[�	QYͷ�ב$GQ�D�?��t�=��8�p��!w�p�%L
m9�e0�z�-����|z�M��1�uֽ��MpA�@ȹ!�lQ/T�"ja�٭B�z��Xf���a�y�*	o���em3gro�y��kB�-�p$m�~��/�:4> �Jhr�B�{a��3C7�z>i�������{�`R��w��5��=�v�}ZС��g�k�<�,��g�E_����RM/��,+ޘ-[מ�٦�]��{ako>}+þ�i�ٱoo�$�[IU~#�.v5�+�Tf-	{©'d�,�CaB�8�1��R;�T�E��G�����O� I,�k�n��:\�|%PTH7�l�bmdA4ىꬓ�Z����K����x;�y޸{��*ׂ��ˍ@�q���x����;��jL%�^x݃�}QT	b��i�j�T��-�V��� eN*p.6o»oʆ �7�^<<)��=῞�����u/4� �W)�:�~%/����-8����{=>@�$B�:,�X��_��'��龉�}��.fIM��n�k[�T(0�� l$Ã�?�x���?�W�x &(�E&kԧ@5=@�ظ^`UYS4�I-O�C��W8+��\�8��aߧ�D��~��C�x���+����F?P W|�����TM��q�G	���Y�;�����w�1��Z�Y�R�Z
�'�x"��/�Y�(A�Q<vM�:l��>k�8�#z8�κ�Ǐ['��b �*�#��|g�������G꿮O�g�m�����^��5��u/+p91��Z�Զ[���xx<cw�����P�K"p�.��q�Kk�yvw��5"��Ϸwg�;J�q�A��Ჳ����(����t��7Ő���]��k�#�q��K�r�Y��� �F�`��3��0��:ü.A��{O���^����ݶv�iށ�X� �ktp K�y8��p�6�u�_G�|�28���m�OOD�]�f�_2��{�nP��F9A��['t��k'�u�{�k�WMb����ޥm�4�����Fˁ���7.^#�6ky���h}�R7�m��Gd8妆]K�tk��th��~���)�58��r���x/G,~?9u[h7��ӷ�C�rSd��!�^z����H=Z��f4&�����~�8�iA/X�������w��Eu�1]�����a��t�6dFx�����2hX;�� �����B&���ٌ�g���ϩ?��W��\~I��@���{� ��A�c����H [v~`yzulyv|�}�N�Չ��s��G�F=wgD�a��6a�(6h48�i���6���<��i�      �   �   x�}�Q
�0D��S���B�A)H�ϊKX��
	��
�k�k�73��(�ɬ��H!H�Y�;�;7���oz��/�ԋe�Bf��TL�����5;��3���Y1�$	�L��>��!B=�K=^]!�	��p�@B�pE�7���-W7      �   r   x�3��LI�V��I-J��4202�50�52R0��26�2��*㇉��8���S��K2�е[c�j�1�o~
�E%�Z��c�����!��Ř�L��a5(F��� ��C%      �   U  x���Mk�0��)|�5z�n�R֥�B3v�E!j�)��l�����`��4���%?�0�rx�g�Z��D�m���w{0�0x�<N�����J%
%�Y��R�j�i�^��sb�y�Tq:_�R\�ˋqy1_~��[{��U���n-敊r%�۩g�'�㹜{k��?��>��m���Wm�J4h�J�(�H�u!��ǔ(��J�D^&\��]��˶!v�5�l '���P�"��y��]{���x	�L$���h�rp�y��snsu{�}�q�=�dR�VK�j5�2o��}���4�%ܤ��Ѷ��{"�c�b�P�������VG��v1|8�%��p�Md�k�k�~�T1�f8�'&i�/���é]�n�Qus�]��,�[�.�IN�e�/�x�+4ÑbB�F�n��p�ك����-����۽�K� �,���r���jv�����G�v���ə�.V���ͷ��=xh��P�D3\�A�r���:���H�����4�Tˣu=����J6h�B|��:gI�<�w(��)kܩ�ў2�a�Ó6��^��%���q�ζLf�Q��l/~�z�W��o5�7      �   �   x�m�Mj�0��|
] FI��.�B)���]6
1Aq,)��iH4���0ϋeK&k�v>�q�o>���?��7�碵JZ� �խ���hqU�*���p�g7��ߑ΂ 7V�<O�s�{� r#a͠�+�}�y���T���5���A׬�nHw�'�<?���O.���'_�n�k���������Lyb���
In$�"���.,ߗ.��)�.tX��6���Pּ�����UU����q      �   �   x�uб
�0�9y���*�%U�ѵXEq�PK�4���oņZᖻ���NJ�u�ƛ�Bi��:`'�}ا��7�3� C�1��*�U|3�I�L����T�)���R�C��p���J3(c�%����ky7���5z��Ӧ9�ऒ�4'����L�����'g��zM)}�Yf�      �   >  x�͔K��0��ʯ�&�I�_��]���.�6���l[�ْ�ef~~����8�N)d��9�R�3M�)�UAZ���7��x�~��g�8e�˃�FP	�,���L��㝜~.����O�pN���a&A���H��$�����3��F)m��b(H�`l(N��m(@�ʭ!��sB����i^S<��2�'�hy��[�F�zD7�И��[�ܜv���a�6 �Jr��N����L�Z��b%ް�W\�-o�Px
������|���zq�F�#�N����t�ڔ��!���8U�L�ة9S�����}��~����ι�t'!�9؞��=��҆�Dgx��;���K�u���������iA��Z�*�h���mhN���_�����H�3]R�;i:�k�)G�.X������6�t1�%�K�;�愸 b�0~��0�?�������s�J�����}��{�����_:5'�;;�=�K�V,���'�����[=���[#�	ܞ��ȍa�������J.sh6g�g�$^�ԜC�~�XŤ.�r�GID�.c��r��L&� :<Jw      �   �   x�3��,���W��/*�/J,�4202�50�5�P00�2��24���)[�[�Zp��aE\FpSs�s��2��2���"t����a7ؐ�f�Kf����� �V㌸L`��W�f��s��qqq a~F�      �      x������ � �      �   r  x���Ms�0�����)��ѧ�uKh�!i��%����������2��HX�+�E7�YWڲ��{���D���$Q��Ƹ"BI|�7���T(,�*���2ń"Y��|,���|u*/S<U��1�do>��M�әR(�2%웾��a>N��-3a��d@h���^��##uf鰉/K��1Е+N�2�|<�>��Wu�<Vz�����E�6ƹw��z�G?��X$�҆ɰr�ns?�Qr�֭���i��e�g劦�1?�XwkS�M�Џ��J�x�c6�L���lߘ��}���n�l��8q�]���䫙���4�����1?-ڟ�t1�-"<�}<[�P� ������T�e�V�zU��$�����3_��S�;*D�b�>��4�Y����Ѯ�/��8��|C��|�u~ȣ[�C�_�蒽M��!�p.�6=���vzk�z��pTy�B�����5T�+9t���ޛ�� d!�q��	no<�ߴկfilr_�+7pT�8#�m�p�R�r}��XC�x\��hz9 �=S_S,$��X�3�����S�0�S�o�̛mSr*���b~�������3�|n��\[l@���1�
<��|a-"u�@�<�qG�󻆜o����\�!F��3� �&���~�	�)�q�m.f�����N��CEU"��&�P^�(������ �7;HV�v�	�~M�����1��&����+ �Z@ ��s,����v�nRd�E�Kt8�: �J<7Tꮽ]�K@������� ����"��������!b[%��4h+PS3/M�K�H�z�_��}����n�5Jt�Y�=x�dS]A�j�L��x�ʔ[8*� ��'�ßq��2��      �   q   x�3��J,NT���+.)*�.���Å��9�S�B�3�s���|ZL8��R�JA���)6��N�+�/R *.	����)�[�[�b����� ��5M      �      x������ � �      �   r  x���Oo�0���S�4u��a�C�-͢%ciYI�K/��z��o?�d�Ɠ8$O��C�?H�I)�G|N�p����1]�8�hd�i�S��_/��$�����B�$�Q�d[�+���Z���.�����󚣯,���4���UsÞ�2���;�����"���Ӟ�iK^��7�;�Us�g=yU�S%�a(=�\�CT���4>��ˢ��JX�d�����̼7��ɲ�y�ӡ5q�w �+�@��kQAaL�zhm����a��ߪ�(>kО�:V97�a`�F���[�F�t5<K-�5+�h�y�١5g�Z֐���2���ď�l�!b��?ך{�Ň��.U]<�W�*@�P����>3K?g����.�d⇚�C`�����ΕV���`t�`o��$x�����b���H;�i7����P�h+~��4�-�V��M�}o#��fu	��6�d����ti�R����4����#�c�š��y��К�!�v s@�P*��l�#ݵ��SO�?Z&�Z3�`��ݬי�o��|4eB����ҭ�,z���jc#G\u���TVgV�䵭��c��=�y���{�P�]8�?/�����p      �     x��SMO� >ï �<��n;.����.�B��4)T���nZ�2j�<O����]�W�]I�Ԋ�m�U�J�v�ܣ�ß�F���Ԟ��ɽi�GX��lE�ؖ����<��f<��o�q����U�o.�ggѽy�?U^�W�L��,�_>D@?#���:@�O�&�rE��c.5��)�=,l�2����� ��Y�Z5'�bji��2��bj�bt�C�R��r��Au�^�^�|��ǭ�f��U#����䠆M����z�����)#      �     x����j�0F���)ֿ�}��P[�+ⵃ���;Y�^�+{vl�E��V8�,�|u�CI��rI������x���c�s�h��'?me咽��-�a+����c��+�8�
)l>N� R���Ï[S3��/�q��F���#���]$��Y�oSnvɰ�S/�^��s�_~> |�sq�3Le+�;�Ʃ�m��y*i]	���}s�3A���e��K�WU� �;��rSC(�q��\�}s\6> g�� J�Mp&��4��"lr	#l�
lz��9`aj�6a��m�oc��&��l�D)�I��6)�Y�*�0�6��0�6�w����Pl�vM!�&�6�mr :�6�A�b����nJ�#|S�'��Ӧ�4�8�� �SVfE�8��?0�T��9n��x�v��g)�i���B�6�xZ2t���̜Q�icN(�YDQR�'a�6�x�W��a$��(B�1'���,�@�T�e�E�m�	E@�a;�R��pI��b�s�
+�xdꞥ���p�\� r��      �   �  x����m�0гXL`����T��ב!�En�`� ^�Č,j�֛^���������j�7��a@�WE{���Q���u��N�u�>ϓ���%�01*F�(��O�Z'�=T�����$��o��;�jQ/q\4�p�9�P�3��Rv&eX?ǑIzDģW`�vd�`[-ލ,�=
؝]ԩ��H͘�L<P�Pc�@�$��4*ah��R�L��$1ʋO݇�glL�yQ}��6�U�w[g���~)�l>S�>�-�R}@�}B��u�y���'�Xg�X�Ω�w�ƴ��$�ъJ�Y
�y!;u!c���b��� f�����>H�Ej8�i�M:� f��~P}�a�A�l�1�����z�M�~�@ߏ*�=/�`�L�@X�@X���|�Ѓz�a���}K�:7��g���ɯW�R:d`�C����\����J�[�ʚl%���v����l%*��+V�h�+�v�����.{��-��9��n)��n؛��]>?"��"�d      �   �   x���AO�0���+���
��f����^:��RL���q�d�^:�y�����f�Ĳ����5��AA��<s?Ab�=x��3�a��$��(�_u�������Tc�c�����eE���@�Ѷ�'O�(&5^2kly0��<�ypָ���Y���3���z��6{��{E8��ڄ&O�n��ӯ�h�s���-w���`�F����ߵ�I uZWĦ/���F��� 
eϡ�}��M�矡���      �   @  x���Mo�0��ɯzn�X��Ʒ�0����u�QՎ�IN���)�?���a�Q��˔RN�(�*5�l�gZ�����C�,��mW��Y�](iזՔ�R�'���[��n�ܭ�*zH��g|�f�z�&���W�̉K��Y���q/T-�dNF������ި����kY��J�O�����e�a�6\���D.F}���b��֭��T�?���#}^��k�j]�5���hM�&�Z~Ț.N{:U�g9��Pjٓv;Ϊ�Υ&[�Z�*�Ã���S�$���ϒ�s�������Y=���B�SunNF:W�wQ�CT�K��+��9p59�{��tV�\*�]*]��ES,���4g�'��:��h͠@���2X���=#�g*&*Ԩn�k��A� G0n�W[uaF�!��G��������Ħ%>-��
�o�0	 �i�M"�Rڅ�9��|���>
9D�v�`#�lÌ*D]�dr�I���6i��Y�WR�z�������]:G�d-���Jw�tv;�;|�\W��2�]Cm'ݍт�V�סY˓(��E29�1�	��|@p�_C
���{�M�2�=����u�wo#�q�.3��7�p�{���2H9�qK���>�>�����
�`�b��hޮQ&�klF�3Z�	��!�s�s|J��0�f�O��.V0�=��ߧ�p�G,����^����'۶��[��� ��]��_��];g�
������@2B۷v5��&/F#H�������>@�ŻXc�w�������������CL�����b���R)��D��.x��\.��ġ#      �   �   x���K
�0���)z��y�\{�n�ĝ���H�FR)C&�?1�F!Fx`�ub��1q��9?�㴼��b�A��bEw�$�T41��t�2���'�2�����JF}��_�rp����l���[��y���g�L�G��!����^6�2�~;��Jm7��Ow!K�o78k�����      �   �  x����n�0���)��]+�q�]5]T�U,�q���q����s��R�dA!�C���|�"�d[��a���c�	�ˆZ"G�/���qWZ�B��X�=0&b.h�Uc�"�H�#�&��R�Ӡ��}o��Y|��	΂�(3���D�Cf��2ӋL*�f��2��hW�Jn>��oń����Q&%(AϪ^;#�ƕ������8j�t
!�ב�0�J`d��8���BnY��8ʢ#(�d�g�σ�8<:�G<�"�#��[�{�5��T��q||��/\WD'*�ԅ,�U�C6R�{��]mh|�H�Π,)̵ iP���qqK،�
�P�3��5^<=�=�)����R�Җ ��Ź2�����ʸv�3�Cڤ8�*�����Qu�)�]��ܸ{2�g�9s���O�ѩ6)�A��x�)�6��vh�"��Am�#�~�sĥ�\*�ͻd�۫rξf�k��(��������{��^K���o2�pT���C���h�O��A�ڤ8`�d���[Ui?Y�3�a�*���p̺0����}�	�=�-��D�cA�Q�ڤ(���R�Bu����]���~;m����n�SmRH�!E?ͮmq�V�Uv�J����6�{��j����o���.]�&�6���-U�O�^B��J���j������umSo�t��#�K�
m�����G������g���-�)6ﷳ���C�      �   c  x��X�r�6]�_�M��>������$V�je�dBL� �3���P�$S�"�6�Ʉ3� pϹ�>�8����*߹�Z��Eq���y��p���t��ڞ�����,��q�M�������'q����Ɨ������;+r�h�hs�?xO�Yx��t0nm��0ba�Gi2j�<�dН: ��^�\�^p�VBٜwW	-U×,�%��\��l��(�i4oD.S��Z��[fݢJ��(�oε�waUn$+D�Ղc�b��˰��hhw��W�B*��Įi�\����˒�Ff��>z�N��tnQW�d��c�Ff�m�� o.��cMƵd�����xEץX���\*��*g����k_5�;x/��%WA�E��a���^ہv�2���	(�K	l��ض�9K��V�&?��x���*�v�!
�P�
�l��E�+��-AG�9`4�&��A��&��"hn�k;�fԢ!�Z}�1���lcIk���L��ҭ������U{�����;�d,'u��F�/�f���Kw��)[���
��°���K_|[�H���v��1�����'����\E��	U.������F�Ly�p��s�_�!���*j6s�/r����Q2|%��j��Z�m\�ڿ��$/�����oh�C;X�rF�;��ւ���
v=����d_�8�E�]�8����t���2"F���A��/�?���`
�@m����'(Rr��͵B���H��U��8)W��ǿ�>hB�t]����ts�b�7��"k}��5������m�8�5�����r4H���v*l��m#��8�>~�m�h�wHp�S��2܈L�����C��]�Q:Lzm� �s�� ׫F��Jj5]��+~5�Dy1@b����]��Vu%w�5'!#���¢sI��w}�P�t����R���H�t��ȋgޖ�cP������F�:���J�6�&���p���zJ��v���"l����֣Q_S��6�b�%cdw�h핰�<�5(��悏!úeN���A5wOI Z��="8�1q$!���Na#"7V9�vT�FT�p�[$��g��x�pQ���72Wr!��n�w��ҵ/_��s�a4m˼y���[荲�;��-<Z��m��S,\b�Da����
X�<�m <-k�I�1�2[qto�	 ��v���ֲZy�|�N��O�+�����J�#�������)<bKz�&���i ��W��� %�N�%�&�=���"4�K������r�H�����ٓSM��h�������	�'���?:��N �CLop
�xㄨe�]I�{O����|��}А9X0b������Hi	�S;/T]�4���K@�,#�)���Q�o�o
�Kӈ*��4<z�|��o�;�)�4��t�o�L)L��0]�Lbw�ʗ(�ޭ��S�R����?-��rY�O��Z�<�X��8>�'�4�{m��Ŕ��__?���>�掱�2y��2��Tg;���7>^�v'�v
j��s�l*M_�m1��~���7�g�כ�����4��{M=x���G���(����@尗ʝ?���NP�tqvv�Ǒ�      �   �  x���[n� E��*���;��� ��W�v�ԏ��P�RbZ�_G�=��`�ļ-�9��N]s4s��g��w;?�(;*wJ -��
e���S dY*�%�XX�Ei�P���s,��OG��Ȳp�(��|�:��UQvm��x�g3�#�4�(��7Vd��5�2��o������H������������,��>S�be�z�U�|P��DE�v�cٌj��Hv��akv���"��g���4ckz;��6�np`�����R�"J���F<����(K�$��*���w����ʒ�T�~�h�fA}�,��#�j��翯V��X~XL�ǒ��s�e�0ƒ��m�m/)�b�y�2T��w���c)P���8��������0^�{e�x�����s/b      �      x������ � �      �   �  x��XMo�H=�_ѧՌ�� �_�i���h��LvOsi��������U7ؘqFHA�,����U�^Ux��M���a�ɏ>�S�/����y-����q�|~y�1�_Z_�oz�ਿ6�����GZ�-ٝ�ݞ�0���x�Y[�:�f�Z(�v)��b�Nk��Վ��k�8+��u�p-�"�Ӽ����+�Fl�&��"{��?�<oo�[ۗ���`�����di'�����zKx��ܮie�V�ԙ��Lk	$ܰ�E	��~���Ɠ �.�k�O��8���>.?�.��^iW���E<��hqX|r.���Ӯ�p��� �3Tv�.��E<���� �sk1f1z�zO,.<�Nf\�
��I��\�0�)I����[.�h������^�K�� ��J�%<�9[�\fr��Y
%D� ��Qݵ�ꔭy**��}F��*a׵��;���5����}�P�5[}�u_�������p�i�\I�li#�+b�6��x��9ȗ�Aw����5z/Y*6uU�@Z�q��6M��>_xZA`�������e� �?��Ӏv
5�/�žr�#P	��C~�Z�t�E^�JR��
�y=�"(��=�b2/�#�cK!�ee��^��k�<O���kO�n��&�E"-T�� 1��u�{0c#���<�ʔ��J�~��o �����m�����I1�F�R�"ܔ��� 9����R5�8V����L��F2�@l	���l;O\Y
���"�D��?.�9a��qwa�Hé��8`$R;���w��[�w��͟�C�^��B����?���o�"�Dٱ�K���"i�qw����Ϡ��K��ފ�A*r�='�M_���*�P�g�N�KJ%���/������U�v��
'�}g׆ �|Bz�NFTFų�{����ߛ�ȝ���Z�q�[����d���Lmhha�bi��`�⒫��;r�~��D0�2���s�\��t����?'w��8�.B��J��X%R�fi�д�DT��F�]ad��-7���8���ǝ5	�������ԛG�j��Lh?P���6U�fQ��(j9>XE��@�6��Q<�Q���r���H����]�˶��oz����'4N��.k~c�.�n�4{\Phs�Vf�T�݀���t��g�sk�\����-t���0���XuegPT؅",�L�áI��;Q]v*xC�*��NJ�fFe]�JǏ�sy|�>��U�t����:*���0����+�Wz�'�8
ή�9���7�V�P��3a}���|�Gm��V���A� tw�=Pi%��["J-��"�8tSu]J��j+����?b�K%S��x��[�����=��4����� �<J��Q�͹O�t�#�1��Ds8�p�KIg���]�����k� bǁw����0� D�ڮ�s���վk9��>�Y�g���#���8�(`�R�zNo�J�\�&��֪ٳmV�������kc}��Wv*m4oӼ �'N���8��]�x~�����������^>ȜzT���)0~��r�q\H�dXn�)�Z��4�p@��q�/��W��:-�Q��V��ٞvGu?�����)4I���w��N�*��}]�S����͌g5���ލ�E�?r���xh��}�ƌ����]�U�IN��vm��/..��:c�      �   b  x��W�n�8=3_��l@��xѭ��Y�H{n})G���fhI�?�Hۑ;���8��Xd�W�����Dײ��**���D |�Mt^�?�'*�����L�Q�����Y��4T����-7�ʵNE�yW�2uc~�įI��0����������OzA���7�����j{ޡÛ��u��r1��������[x_=<�w���Mu����i�[B��R��n>�HB	6�{��8��HOőy����Ӽ��ؐ�� �,!�P����F��Q1Ⱥ~|~~��H�w1���	sd#	�`�g�co���HN].���I�*�}��,z��6���`wa^�W�C�ax4��<�����|�n��8j,�d(���	��.�9U-cH�G {tI�@�z�^��槣��.��bs�����M̡�ETr���,eZV��"�ʎ�Ja2�M8�w�C1S��&j�����7��=��o��z3�c�<FN�3R+��*^>a�\gf	Bq�2|��L��u:��quˑ'�z���{��&���x���	(+�¸&xʴ� 3=�Z�5��r0�j�"W7C���%��PB��WPW7:�9xU���<m�]�IC �6�節i�� -�;�^@�(��.]��2��#c,�$S8.�?JHf����Ib�ݖ�v~I���T�:n��ӊf>-��,Y�"Nm*`*��稭W��ԋZ�/��p�ADGm��}�uY�ha��)Au-�w�C�K̑Æ�d.mM�3X�-�I�d'����o	�P�9�[��0����1	��=�r1��3�£�~|��S��M�Ѳ-��T��h��33]�� �������d�dSfg˶h�TV-�W�������Cςqt�K��|�GL!�6��-��������rХ˂�w ���'���kR�S��4��T�(ѿ��zə�rN',i�|P��j��צ�I��u�\��9f��������:[���Դ����x�֕X.�_bK�ڦ����rԪ��j���H��+��/�jgrsrU����켆ذ��4�V[�l��F�ؾZ��K���|�Ϻh�;��3�:j��ר�N�k����1���j��2�w`&eF�x�98�|�����7� F�w������;���(�Ţ�[J����N rB�����í4�����l���cr��<8Yu�V��^D���+����U�e�s�
m�nSD�zG�hYJ<��F)�����<:���mϷ����1�s�֏�^'M�)��=�@ɯ��mO��s�3�Z~}־�ρ�[���ਭx�ǁ�{$���,��~~�e��B|g�|�4s�<�7|X��>�y߃.<�q[[/t߯/..�g7P�      �   �  x��TK��0>�_1����'|�����]�v{�2,^0	��>�}��2�[�P�b������D��6<�"�L��](	Ri5��16�y�s%f��﹗�L��]<�:O�\$�L�D��TO��L.C�Y�P����HbO�s(�_Hr��Lg#c�Q��j]����DlV64����j% S���Y���4J`���jMAf:-4�so<�猏@&Ѥ*X�/�DRL}̢�05ni6stK���gLjߖ����ҩ�&�r�b<�L�}J�
�r�	h�:�S�F���qEO�
�x\�������c	��)�����'&'g��b��\\��cY�CҰ1���O�f�8u���ҫ��i��zk|��5��
}4s��>�Չ�QL�3�]��Hݣ̎:ґUa����������B(�Cw~�D~���Q�m \ ��`�v�҂�Y����6�eO�t:b1^?�-ޤ��<�'��xfZK�7�ū-a1�MIAV�W��YZ:9�Z�h��C�<���M7�۟�ا��,��T��%����G�{܇G����\vo�.ƫH���~]�m��1���c�#�!<�SBY������s*�����8�cJ['��R2�NoЃ�;2��W|���u�,;��%�}��;�      �     x��TM��0=�_�SoT���U�ê��ǽ8�nBH��*�����U+�x�{3O�(R]	�>��#L̉�s�	�|!�%��$�	?�w!�8[��D&�P�+_�Jr�B�(Eo�ǁ�lucz��9a��RIE{W:[�������'�I����*]�͔�D��\QL��B�4�I)#C�ڶ�*�(����$���"�E��;��Խ� ����@��*<)x��w"�]���A,J���������\�\E��ۃnփU���Z�}���X������.�Iԋ N�"���)U�{mW�U��+\��VV�1u�ޥw��H����R��#��I�qD3�����?���=�bh䵪L��
`g�vf�J��v袖�'�@�a,l	(r�T���V7c�A��ոW���_�O��e-rW��^8��f��T�{W��V[��5S��q�� �t���e�+�j[�%h�n���n�k,>�:aa]����L���s/t���%�ejl`l�c0��Z��v����%�g~��6:]א�`�c�ֺ0�W0F�v�4nh�/w_�'g1�~�D"�ox�!��MKeT����XS�!����1w�xNr>Eϱ�;�}���å~SC�b�O:Ie�J%�E�����w/n��c�*��Stkj�	�n�d�+Km����w?,���2���]
\Y]�~�Q9q�����p�a��@����CT�r.���7��XX�����>6����ϳ��7y��      �   �  x��W�r�6]�_���I������L\�4�ĉǏv�d�B�Ԁd<��?�˗��[W��
h���s���k]�r��F��n��r���S��q�O01��L���)s��B��?�L��l���'~����v��[c�{349�X^{5pϝ���+���8A&RF{�wUz��7sVx\����0%e���H�����-�_t`?Sј�t�skX�rST���ʩ^w�K_8��i�-Y��a������YÁ]/��+<��{
�,�t�q�"�����zb�r�2����V:;/Q���Q�r�����>[�L�!6�jJ)-�k���#Wd�!�(�B2`î-a܊U�5���U����A����aA���jрᆂ�@���
%�1<v;���2O��'m��z�=�y,ꮣ��Uh�/+@qĤ����q��޼ȗL[�t�y�}RMU�ɄYk׶J�H��dRF�����a������8`�v�څ�>YmԌ+gR�H��߭dAB�h6Z�%Z���j'��Eх`�)�1�Ķ�e�j��]��Fۉ��̯��~ϯm5�9��Q�X�f�D O� ���Ð��mYf"&e4��ЙD�<���Q懤�$�M���i�e.����Q�9�������x�Geϫ��*oZU��)x��q�A�>D��-�=�!6E@�h�؃Z;��k��]����f������-���l㐷)��H�Nٱ� ���K��z�M�/0e���׌vf��rb���3��2�����Rx���u;jΕ�L;�~H�S��t/�<�o�h�DT�������t��g�ԋ�K�~�H����hp�o�ظ�ڶ��/|fZdߘɘ������#����&-<Ɨ�m&nG�H�.��l;6`V�B޴���Y�&�ZuY
L®S$�o_���>�n�=O�������6� ��.�^Fs��u]+FU��*����F��=����[h3C���l�� l4�-�A̈́?j|1�������Y�N[���m���<�l�h�	�MՓ��zf8჌�����wp}w�Y?���z��*�K�B�-L"�0�t��n[U�*Nk�V�E�nG��:]1�Z�F�U��f��b�05����F�/��;��3/"e�.a�i4�]��������9��?�uM2p-�R7l���u�Jv%�a���RF�|xsrr�S��y      �   �   x������0�g�)�tk�%YImn�L7�	
�Ss�u]���s��Ñ�X,���~)�a�`�h<�c�ϟp*���o�g�諽��WnX'��X܁�#�Ѕ!�i$���`�=t�}_��}���P�0�I�\`�}Kc�1��,%}����ѧ���G&QVH����
K�V#�U�giV�$�v�j���{���
6���Jѷ8=;۸���x\�N�p�>J�=�e<��$���      �   �  x�}��n�0�ϓ��y���Ƅ�W��C9�2	V��[j��w ,	�ٿ|��a~����=����6gjH���Re����0�a��ψ�@�B��0��d�ј���/gW�8ǉ&�I*ӌ�B�Ig(��B��������g|�H��T_�&�0:3Z%mi���hC��ݭ�!��ѥ�oŗ�ѦJ�ŗ����`??���5��m������N��V.�^Ѕz\E^���!7~u�ͅ��w�\�
·M���o�ǁj��|Rs>R�;:�������LK�TM��²�Ԇ˘N+[�:�#�Q��1��A�V|�ߕL5{��FbҖEO�.��N�N\C���5(��i�Ǔ�����P�z����^���y{dҖ��D�O�U�
� *;�n�<��
��ټ��.B�A]�%>X�#c����`�"�e%'�ZezgK��;4˱��
Ϻ>������C��I[���������a�      �   �   x�����0�vi �c'��� ��q؏$��W$^�e�,5P��`Y�W�����d����j z� c�o*I�]�g��ȃW��qjT��U�)���d�6��G�m�_�ж )D�N�E؞��W�b9����i�j>����?�����b�r7�=Q4��6aX��A�An�S_�ᘛ6��5�%�W"Â(HQ\ͅ��Q˺K      �   #  x���͎�0����7�LK�G_�d���eV�+�����w0Ap/�BH����H�J� �F��'��sצ�A#b_|��V�WS�*#�]���DB ɐ��%�A�r2�FN��P뮴�y,J���U�0P�"�����@���=F��1���
�����մ�o�"���)�A�! �m�+��S=�1u��c,L�z%#�"�H����yrPb������\z��v?�H.���-Q�k˾���/�ֺ=9J�쥡c�mlk_O�Gh$J�u�$7��,�      �     x����q�0��]E��Y�V���XY	8+�~�}�p�o�A�KxD�9<�}K���K�H}d������Y�qmt��qmz,����pO帶8�S=���Ԏk��=��oR?������� Թ�Vy}���̃�su�G�k^�׼G1c�KҐ<B���Z����
���Z�ܪk�r�������J���\�X��Z=��*�O�=�� �c7�L��jմ�a�@�_G(Cү���W6�R9�Ku�7Tjk��Ҷ�*�s����&�>å��!��fCJ%͆�ʚ)Utw��i�N����r욪��P���B�M�=��&{Hm���RAS=��@L������*�ت��j��c�6r�$���}�M2�6CJuCHu�0�T�0�T�0�T�0�T�0�T�0�T5aH�fZ�	CjuC\Q��!��"�'fsƣ���f��Ú-q�f����6��i�p̴j8f�5�����k^��]�����fu�a�����
�[Z#rkV��`i�����"��V䖩9f�E����c�f,����f���Lш-S5b˔��2u#��,������eJGl��[�xĘ�1f�G����*��o���7}H{���k)ϷV.�wV.�.�q��a�'=����Pi��[�4�ZG4�*�S!����U�c^�c3vc�ލ�e�7�*�{��پqx�b�7�2l��L[���1������`L�ah��0�^�][U"�4%rK�"�̯�e~ŀ��=�q&G���[&Ar����b�$I���y>�� k��6      �      x������ � �      �     x��XMo�6=ӿ��"�Z߻����v�&nO�p-z��'(Ɇ�}ߐ�V+�ut`6%�μy3�-ح,T�ME#
^�i�7m�<Z�W�hu[�Y�e��E������D�r#6)������+���yo����?��mD�=Y�*^K��m�QYW�^״�;�kY����J[OD���Bj��3��9^��	?8w�؋b���"v�����%��k�<k�k��}|��,cϋ��`�]pg;~쟴�3����؉��-�C�_(o.�.��;>��8X�M.���!`��&���gL.f�~Z��@��iߍ�}�=����F��0/b���>��RP��`͋�E�N�Z��&h5��!�����tW��z��{#�{85�Ա�:a����2o�>�L(� �Rw��Kg�pw�H];f_�;������L��V�*S;e]�Q�V�^��mѴ)��l��u飬ն�H�e����ƿg�V����p���7f;����[�F�u&���i�¸Pœ)U�RtCU��P�-ksY.�������pw��r�6-9��yev�%�n�Y�
vEN���P�<����f����$6��^�OBoɗD��Ő��դi�W�Qp�`�3���D��d�~��ѵ���?�T�z�D��ߗu�U^�{��?���� N�����	�v�g�� J�q���%@Z�0���h>j���L��_+���JE��T�GZ�"���*Ծ�J��'B'6�(��W�|���iʷ�)dkha�E�6$-��肾�X����Q���#�6�U��D�0�oKN�$\C.�'n|6.�滰`7&�v�U*�� z��������r�C;ԟxl��[[��Ldw5�#ou*`��}����7�Qf{�V&%�Pߗ$7����q���+�{!mdgԯF�s�k+�5�y.202$��>�|�?0��_^^r�˼4a�&�`b��ӵ��,�]�BF)���I��˿�z��nQ!5)�K�ނ��o��NN�&�3���s�3cjȣP��KvK��T�b�s]�x���ΞJ$T�jO-�/�:�x���z�`��U�����i�Nn��5�D6�h�`!�e�F/>�Z�ͺ�5/}7�o����I�/�vs�R1��o�'Am�\6e"�7�����`[�Iآ�k���(DނgJ���	�s]�j�����x���U8�u��6��̤l\��^FM��k|y��F_"D�Ze�n�B��_	�PS5�V�ʮ�D�)I?�:�*+hO���� ����L>4.�V6�#RnH?�F��x�SC^���'�u���/�=�@%�`�ԋ��Zة��vA��c�҃'k��>�~S|�v
+t���FJ���>|S�}��� ��L���wGc�=)��@/���%0����M���K��#V&�:["+-�̂8RI�R�P3�6b�! 
�K/�Av�����w����a��hv���+�����4wX7݉T�h�t0%q����npߟ��^E����ֵ�(���Jb�v�5�RÀ]	B�
�[�k�(C�� >�1�TX�"F�7��vҟpTCH�"g :�u^��qzK�`���p���|����Le୮�,�ȍ�Qt��̗�n�K	�� ���W�G�FG�N.F�v�ė7��'��P95�����Ĝ������{�;ߕ�t���(تyI2L��d�Ăz�AW��f�.�)I�A;A�GN�φ�F�M�nSh�į�\�-N�r3cO;%w�EB&�}��&y�f�㱈t6W �ǚ��u74�7B�E��N�����kGѿ�zvv�/`��%      �   �   x�u�Mj�0�ףS�1�Y��9@6Z��	�M�ܿ�H�������7�{
Y	v��2v��y;u���;_�G���m� Ch���ڠm0z�d�D��~q�<����(3�Afi�UC�_��I++q���ՠ�%������g
\��af��Jڙ֦BXa@��tb�/N�����_�'N��y��;߻/wl�s?�xm      �   �   x�����0೙�@�yNB��,��/M�&U)�P����EzN�HRV\�����Tv�Z�M쓄�c�%�w{������,?��u����?�-x���v�[��đ5{����޾���dO[(T�~��n����i9bw���n+o�>b�Q�w0{���
���E��K�=�YҗT��JPm�~ܢc�4��Vvo��)�6����|��a���֒      �   �  x��YMs�F=�~Ş:�L��D�&;�ZQ��=�䲉��Dy(�����7���Fc���<< ��"�}����.�w���G��2�\�122Ad'��^�	AdDd-i��{/���wo��{����2˒��'�>Ns���E�J)t%D��oS��n����)]�x�|���S�y��6��M�N��2yI6�q{���PL��`�Ōkv�u"�!�&�c?l�HNH�w�,c�)����bkJ���OO�l���y�>���_ P�ԥ|?��m!zq���ͩ� XC�"5ȩ�m�O��2m��B�^�O����Y�����`w֡�E:�hl)C�~�&̘:��5�
(:25�$T`��].o�Mh�=D�eh�3�� ݐ� �o�۾���*٧ɾ� 	 Ƒ��1�Si#+J4�ȗ������p3$���m���p�#,0(C�C� mga �*�g�P@jG�~&��j��K։��00¶q�a�J�ҷ��\̊���ԙ�� Qx೷��!�U��!m��%��_�j|�,A���@�}wa��]�15�������C�2+��T���&m�[k��-�u�.K�|g��{v}�,��h�R�¿��Ey�~��n��BUp-=�p�'�Au�kwi;+ �jp�������nX� �V�͌�F ��G��j�h!kF�}o�3hf�%��C�Nw��*!@����M �fl��	�"���TMO������}��z$1�c�ma�m�+�E��D��=�n� c���On�Nr���~��+�-��pHEO�8���Ꚇb0>�N�����&�:78R�N�/����p���cm����}���9���
�?E�h
�j�,(,==��m��L���+���)�m|l�߇��h��8����f�ԭI����z�P{�=?KO@](�J����!�J�D����I.k�s�M�rWy\�v�(�#���4�`�2�����Z�+�1�G 4���x�6]�M;T�v
6K9G�󠑎� �P��0T n[��k�ʶ!"�`s���tD�al������D����U����Ō}(09k��IJc �ԧ�����.{�e.��$%MH��H��,,c�A#a��m�s�g�X50/l�g���PZ� �0w�)@�B�&]�1"K�����MR>_���Dza|����4>
y���@p��s�N'>����
��[#����u�tiO.|G�v��Ȼk�Á0��fˬ��]@|a;�@a�q����aBc @`��sQ��tA�^C�z�����Z��Šl��Y�~�E�U����"�*'(֓�Bީ=�B�[4��)4�H6ʎM�c����X�	�i~����o@�g�C3�|F����y3�����^z3=^P�)F���N������#���������i�
���S;�����n���C4��#�GS�3-���g�`��7i����tR
m8�onn�4�sE	4�a��� ��$/��1^am�=�h�����IIuM#�a>:]}B�0=	�����	�Jld�,�믚�t�[x�������[����h���W�e�t9��2���j�B5�q���*�n4�u����n�Ex��K�����sy�&���&�d�}��F�L���      �   �  x����n�@���)���`�k�����l.�1�1�5+��{�\W�dY�غ߹�d��pJ��VD�*"1I�4��E�I$i,R���e���q�9�v��I���P�7��2�[.�j4���Ȗ;�ij2�[*t�������V��\�c!�iu�0������꫈Fc�"Xe�ǰ�.���G���o�$�L��E=JH��A=-GR��*�3��_y˶%�6R]D5�4J>4)<X%��@��8z�8�/��WD�=ѓ��@F��Ufۆ��".xO��6����rY��,�[d:�S�i�T*ƽڿ�,?�S���$��{�10g^��S/~�L��pC�:@k��7�����>ݡƠF�� '���&��-�92��dm@���grUq>�~��� �8�E���Zu�a�UҫL|�#�'B6.�(����5T���h+9�c�-mZ��»W�f��g{��I|�������C�[wAÝ�\�O=v��\�&�4([ۺ�C'i${�A���.�	�h�6�4om�_��2�՞w\Ӭ*�vXQ�ϥ>m_	,7������L�Œ�ҵo�I��%���l;`��WdF� ���n��輐w��mT*ST��p��v|��e�8N}^=� 꼅��צּ��eA5A�|
.Z�gsW��?��Wd!�0�k�5{??��pQw�޵!�������$�b      �     x��U�k�0v��{�h!�L����fM0�_}9��Qe�F�)��w��6��n��:8�N��ǝ�[1/�%l�A�Һ���C�CF
kA�֨)���%B�T��)��p�.*�n�]�	/ӶV^r��iX�R,c2���N(��/gX`	+���
5���-��-�v����<�E�8��`f;`{��D�g=��߻��I`}�D��sBV�LC�0#X�R�D���X��&�1�\����S��d!�(Kq�v:2�7�o�ʦ/��}��P
྆`�AIf���1�ܨx�P�j��k%���WݞVp�L�����w�mXH���9�ob�Gj)7��T���N�f�k�;\T��
�ʚ>��L��V���'\�	�����z���9�uX]�2�퓩+(yv���oc�9�(;ǥC� ����[&�:���[:����ne>[b��)�u M���j�~�k�FN�^�;:��i� ^�!����$'��!��L�3
�N����4v����w�N�t��~��0{��Z�2k��!��2��4�'8��i*J9���M�Ed�1�nW�Tm6�vK���R��MO)rX���ʠ�L�G�4�mS��uə5��F�w26�c%Ԑ� 1�D�Y�7j�d"�8x��!�C�˨Q�t���!A�4g}OS�#]��
I�w�9�'��0Gs<h�D��sm������>�H���r=�}����06*���ނ'���8�|�a:��<
쓱Q������p�l�%=�'cc�=|�L&? ��k�      �   �  x��W�N�@}����M�\x�]�dv�����4�2-� M���
p�[�K��&$N
8�ԩ�.�n.�?O�����_Ɣ��� ��؏���z�&���A ]�Bn�"Wm�[�IB����� ��Hn2I01Ih#a�D@­���1����`&c��vb�`�c.SL�I}{��a3D0>�[�7)�;��-uevO�@q���MS��N��� ���M:��tn)�3���3(NT61h���l�O�����=<>G����ļ�h-�TY�[���l�&�h���C�4�$�$u�I+T*��$:�)��lO����8�_��皗��BeH$ai�󂓬�^�Z����2��S9�y";��""��V�ɜkL�z9ID���&G6Q s�Fhq�Q �rx,��6�N�A�i����3�o�-G�3of�P*
�[4<)�$�ZIM�J�1�KBh�n�߃� �*H)
^IdYC�`�`E���d�KV
�&�"%�2��޶�z�%����g9�,W��g��N�����	Xq'�jH�k��1h�T�W�ł�R��_�}!2ӕa�21��Ü��ӳ��M��#�[�Ⱦ�(=�Q�
�+�tEZC���Rc3&�
���[b:#�|�Y`�Yń�A/*@�j�u�L)��eB�Z9r2�<�N�6@Y)�V���~L���%���{J�V�8�A�&~�C�`8j
=t>l�&�8�j,Lwt��������+re��ju�g4�������G��X�T�H���v�^^ud��0ug�M���8�M����ɤ����U���w�Q溒F�(^�/܏ٙ�<�N�b�*>o)�����4��li��Ӥ�槭�q���{i=��쥁xG�5f���{ig�����i��{溗�y�֘�y>0��^ǰ���8ޥw���?zW�      �   "  x���K���E�ի�d0~�-B+�D@�@�a�`x�N2��wnN�Id�&#n>2X�������}���S??���������O����>�U��O��?����o��������zk��O{ּ��QN,�/������	�,�L��vd�qK;(9d,r���&"c��'��{�����\dl��B��H��O(�
��k�R!�"cO��h:��i�J�A��)��\!�#㕺�
�g�ҕ�ǵ
���|��:J�t�B�i���$z�Jgƞ�*&� c�Z+��A	DI��\!�xd�)!����gƞ�U�LP�$jZR�A��F~3��M0��kjR��T�f��IM���M-��y�z.�XT��8S����&5y�ʌ==��dj}36դ�+j=�ɡ��('5j�[��%��cV���ӒM&�nƦ���"m�b�f,�I��Xoƚ���1��f�iI�&3�6�8bM��?�A�9�I]��"�&��ZPgؐ�h�Km5�t	k�\j�x�=��-�F�1�p.by$�Ma^����N���d���Y��5pfIL�T���ī��Ӧ5��<3cS��i.kx]�����(7 ���,����A�|�2cOk@д"C�Z�d����X�Ԙc�rN��A3��M�݌M�If�u��E�A�9�$��Z�0cOk@�dfc��qmJf%yo���4Ph��o�!T:�Jo�!36��,��~�fƢҀ��z���jBS�UW�7 d2�^u�[R�=B��h�f,*IMs<7cMMj��r3���&��C�|������A;L�]Nƽ$5i�U�kjR�ǜ�~����&36��������όE%�I3:3�Ԥ&�\���ӓ�Ls�3cSM�uΜ����X��5�*�5GIj��JGy�x��F��u���GM�u�Ӹ��*3�F��b��U<JR�g^���%5�̼��Q����0_�/�M�s|60�F͎�5%��s cOKj2�߮C�[jT��1j;��W�0�&��Xo`�S�E���F�G&T5��8�r�520a�y�����F��lN.���&�3W��;X���NvT��R��-%�����T�\m���wb��M*3���C�k��ΣL
T&L%��c���T�7�L�ބ���M*S%��J-���
��v`�T��<�Z�7�jx�Ȝ�̈́��7���ʷ�6����\��0��O4s�f�SӛDf.�L�zz��̥(o��o�m*�^M:2a*�Mf�S��r�7���M*S����5�7s �cSv`ӛ<�{BIo�S[����7��\Z�ujzo� 68���A��F�9�����F�i|n&D-�Qe2wӯ���ޛ9����20a��3'w�rCIo����Zz��.�]/�X�{3��x�uL�rz��T����.��F�)��# ��F�)�̈́���6����V73a��M��f&<%�Q4/�̄��7�����P���{���ܛ�*�MsDNQ��M�yRd&D=�Ie*���2׶!�yu�F�\�L�Jz�g^(�	OMo���t.��HR�\�L�Zz��xX)^����3'���u3EfR�7���7�̴�zZ����\�`�23a*�Mc�:)�$�L㕙��&�)x��Iے��������d�Tқ<2��M����&3���������ݒƻԑ	SNo���S7&I4�ȏL�Zz�
�Mm��5��i�[��#����I�Qf&<%�Q�	QKoTmȄ�����L�~�zC&L9�ѳ#���(:�	QKoR�����Q��RF&L9��c��ݺII"gN-�/ݾK�*�L�jz�ю
��ݞ�}J�D89ٛԍJ����}�Uf~�|�mU��4�_�}Γʄ��7y2���JdB�ӛT�P�����k��cO12a*�M��Lxjz,��M��L�Zzo���#���{jz�( ��ޤ2�>η]˽'�����Ȅ��7y"2������7�2�j�ݓڿ:�+����	SIo�8d�S��cQOoRydBU��0y<]�0��FOBƞ�k�����FՆL���������{]�����	W�0�K�<3+��]�1\�2ᪿ�{Sq�ߠx��?2aʿe���Lx�2H��	��f�6dBU���+ϙFƦ�E��D��(3W���ȷ*���P�Z���~����00a��J�IȄ'�*},Z[�H�"���޶�~]ܕF�{]�p�F�:��	NG�Ʉ��8yVd���(ڑ	Q�qRȄ�v��P��ͯ�ow�O&L�G�G&<�GQD&D�G3��]��Σ|��{2a�]8z�y�\���KmȄ�u�ڑ���_�p˵���`2a�]8z2�)]8��	Q��Qu �څ��:w��ߐ	S����LxJ����.�T�4iL�Zz�_�
z��	SIo�d���(�Ȅ��7�VdBU��-�<,����dB��E;2!�u�L��'���2� �o���y��܆ף��0�"��T�D2!�k��t ��W
\~AƮ���^`���Ǚ>2�r�R$JȄ��J�iE&L��4}R�1�Rc��L�R��Ȅh���ش�J�+!��Uj>�W���P�R���&�d��z��d���Y��]�S0���N�VdB��cӐ��ڐ	WO��^���#���$
Ȅ�%�Ǧ!����k��,�qm���P�D�X��L�0�N.�L�z�Q�ޯ$.}w�Ʉ�&:�"2!j���iHtr%d��}���j�\��O&T5�I����h���iHtr�Ȅ�%�[î_�/>�P�DGюL�j���@&L=���	WKt��a�&vdBU�sQMt4yd���SWh���=���Tt�P�DGQB&D5�Ѵ"����ڐ	WK�!����xp32�*�N�� ��蟛z���!C�������� +�      �   9  x���Mn�0���0�gƿt�	z$��)DV=|ML	� R#��[���iƃ?��n��ݎА>!+��&v�����
����yկ� 9m�e5���5���M~m8� �V�S99"���g���ұ����6 ����{ճ�[��x�ׄ2���d6�R�u������w�uNoT�91:��8S k�;( ;2�z�l�Tb�4
��
���
"��H�`$�]a��9��+�PE�q�4[�t
Q�]����ʯl��E�i�3���w�������C�[ж�eL�|Ea��9� ۶i�_,�"�      �      x������ � �      u      x������ � �      �     x����j�0D�گ���VR$��[���s)�:�*JH~�Nh�ڒ%�if�1�H������?/!���ڃv>ڐ $���kd�f�e�٨h�W᫖����
��[�\��-�'�5�c�M�x���૔�	�\�?��k�-+J�De��U�KL�ʔ�O��[��q�L�����Y-��%����[�]�?a(�L;�	�e�$v!ģ�[�����V
��t�_��4-���V8j���_�٧5ȥH���� ����:      �   �  x���[��8D�ի�X��G/bV���cXt�i`�2�C`�z*v)ʲo���ֵ�˺}_���[��������~����>zBF���!db����/E��k�K(��6�
H�����P�xB��	�Y�* �3[��~?��
��(���Qxъ�S��|���po­w��՚�"
wEn�(ܗ�^p����6���+�����I
�')8������v�ѸzL2tRxҢ���;e�{��sI��\Rx���(R�ܗ�6^.�9��vxʡ�Iᮈ�m����I
�~Q��O���?�%��Z�C|R�,���()5��{Z��Q+K�(��E�=-
����@x/��O�����ߖ�s9?�����"��9�Y�������kcP�پl����,�<��T����~�p�O���A1�x���)n
\����>��/��&x�L+Б̛��	�]�:�w�KG�/��M�\�_ϵ�K���$x#��I	��g�!���)�uR���q�E`Ӕ��ŪG8':�{�,��^>�M[����M[/��"7-wN0c�z����>�=>s)|�R�ڕ�g�]�E
��v!�S)��11��T
��S)��W(��RxO��Ja=�Y�_Sa=M��4�S�z�y�
�i*������|�ϫTxOC�'w*��#�S)��RxO��n��J�=��{*��4V:?7R�=��{*��4V:?CS�=��{*��4V:?�R�=�s���I�{*��T
���X��T
��S)���}�����-����6�4	�#XS%��i{�gv*^����T�x�5?�S�b����N�w�~<��~7���������zz����C�~��*~-��\==�)��|��s_Dᾈ�}��r�*(����V����]l�g4s7\A�o~f<Mw������|Z����x����E^/��z�Z���"
__D�+
�]O�D���3g�u"��()����3J
�(�3:��D�}��Gz1˟�Rr-�9 )x����^�#O�+(�v�|�QA�m�����׺�o9*(��f�-�����|�RA�������{::��*)�GT7�'-
O:z�����E�I��W�+߂TPx�W�M��ण�;���ओ��N
�������\��I�+�V(�����}��"
�E���H�G���D�I�3��gj��K
�����w7��Z�<J
�G{~USA���uN����by���H���D��'�g$
�H>D�3 R�|��g�(�vE����5����zI
����z=������z~]UA���X�+�

��5�����z��X�/I�;�5J����I�+
�]Qx�jw�3�g��g$
��h���{�h����>D�'s6~�.�cwAx�]��	��珏��ᔓ6      �   ,  x����mc1��U��,�GQr���ױ�h :�[ � >=@�R�r��W�WI�}&�,�#��������׿�Gn�,�O���7c�0�1&�aL_��1��ox����\1g.�%��ia�=#��Ԕ��~�o0��pƧ4�ؿ)�'.���H�ksJ�;ŔŕzcIwZ���bZS��bK�8'Z����s�4vZT����{�Q�y�c����&��ǴYX�i�[.�+�t,K��12����N��e��y��!���ѐyl�cL�Ǝ^�q����8UE|̔�+p�*���	��qU�c�hȉG�ݐqc�)8�[T��=h�P�W�9O�#�gO���L�P���*Ō�4�YV�;���b��}����UU�W\�UU�7�"o�����O�z��h�Ա,��v��/�9d
����~49�(��o���ɾ��B�_��9N!K�}�<�������i"c;M���P{�B{>;�h���)D�vh���}7=��X���g��O!2֡�z�ړ�)D�:4V�M{�9��X���xz9T6��}$S$-4%.��|L������x<�^��}      y      x������ � �      �      x������ � �      �      x������ � �      �   �
  x��ZKs�8>ӿ���e� >tK&�[;Nf]�s�*l�#�T�t����h $4c��3����@�_7�y��_�����o2�ai���e�L�Y��b'kR�WB�O�?���vJN�~|<�_�3��m�k�Z��;�CD��*Rf���M���?��I?�[Ȋ].c V�2�2Dg�n�^UQ�D�qbOܚ���l/#���2���DT��p�/�A�ƾK�'	v/	4��)�떯�[�.#��w,�#�Y��UkԻ<�1 �`���`�2:%P&H��1�6��~�=�˓2��N�:�����޶c{蓡�3��$O��Oָ�����R���b�+Q$Bq�Ƞ̳]�F���	Rf�k�~���:���AD�tQ)J��_I,9�bN��&eF�hy��a��z�O��2� ��RfOޫ��}����q~ʒ/��	�a@��l9^�&�נ^�?�������W����L�B.!B"eFU}q�,E.ߒ��.F�H$�ʬ���J�jj���]up�[Up�]a?����Easz�m���zh�fh��|y�?���B @�`4J+RfC��v�b�W+����v?v���O,�S;)t����aR8�:^�_�<�U%��W��:��o�q1�#J�G�n(���R\�2��������%�9�:���ɢ�.��K �o��)�PYe�y���/�
�]��yY�X@(�j�M��tBD	rlTFPfY��Q���s��w
�u1�K&%:x������$��:���j����&ƺB�Èb�&�w�$�%
�K~��I����v��F%<P�p~\��7,���
M���L�|b6�lĜl�]
uI ؉ˡ6l�,J65TuRf���ֺ��[�`Q��W,ѓٽ�w~Pg� ]24�{J��<���U�h���ܯ�[_��1C�DK�2���g� A�S�Y~B^# �2�ԳZ����I��
J��ك�bz�t�jz��16��v�I�Ƙ�f!��5�^��o4��Ʊ��ͤ��W��k��
��U���&��,]w��/Dn�D3-�[��6�
L�uS�@�r.Ȗ7�V�Z%J&2/.�������:�Z����L(px2-V#��^͋�8� U}��е�̢���jdW���ԗt�Dјņ02�/�^�E�12��.�i���d�Yʋ�%1Pa��ӓYGv'�
6$�8��T��b�a3�"!'��e��.���l�@"F��Qרl�7��K��*Of�&{5'�&A��X��k�Q���'l.�ђԣ%�*��wuV��#�G��ߞ��E+̃}�?�'��"���N�p�3?�ۙ�����po��n�N[�P��*yꏏ�u�u�4���ٷq���'5*(���OӠ�l��kǮ���h�}��<�������c�|����<�E}��gɹ��ΝxJ�;]��;�L��9��X�YcV�{���s�h8�6�O,9��^}"�J���Uhtsl�P��	����y���Y�,*I�)4$�ͽ���K�	����
���e3n!�g�-C
�6ݢd;�B̵(4�Zf�j������U��~W�-Q"HU�r��uC��֟��_�Ì�gˤ�ۉ��c���b�����38���μ�+�~9n@�V�u��M������h���m�}��y��o���*�aWj���K!ejdB�zP����J��W�T�j2�1�ڏ��,�a�ʃ-�l�]��l?n��e�2Â�=�)��:���;��=�h��Rd�=�Ә��s�Iޝꞟ�t)�e�P���֚�G:�����]�N���R7�(����-���٘�^N	��W��U!F�ЪI��83�4A�8��A~}�އ2�'�,�a"�eK<�(�a�Zf�X�6X��%�<C���\�I�w�T�d�S{P�����Gx����~�oW'�He���Y����m��@���|at��b�$�Q床�b�W���3�3�����͠fz���C{?�ᇁ>�Eb���}X���ࡊr�)+i�U�7Q��?��j־�N�I���e-�F��pʸE��E�7Y�Y��z�I��Թ���:Ts?3��a:�H���y6������G�/`��>�%�}ݛ���_�,�Ps�5��1��[�M��#�������{�-ؕƾ�13��c�(\�o�4��\�Y0�yrk�G�V�C���?(�j��s���0G���>\�/l�i� e��p!m���2i���犂�-��k�H�5�?x��4জ�x��	��:��U�
����r#�Z5|�ʬ��z)] �A��\deݣ�L��?�����ul�εO�_����V��퍣j,p&h7Ej��^��i����g�i��B�0�3���d��D���%K��U@T5�ma}�說?�>�`^�+��~,�?������.m�z���e���LI���`/���u�kl=�x'y��n+d�.�t�N�xH����L�������2v�z5�[�<�I��M�c<b�>am��:@,C����W�P�%��M��:����`�yJ��a�=(���5癭��-��N���ۛp{��~ R��C�\��ʪ_�o[G�w�1<<5��buBfp9���z�+윂qR��׫Jv�|U��9��
o}wE���Y)�����������`��\���S����ql��KO�~��F͢��E���k���`8���X>g[�;�5����Ǹ�u|e/�I�:HP�:��[��kF�l��1�2/��8�_��r��U�|��?����v$��      }   �   x����
� ���0��j�DO08��hM2<#z�$f,%K?��(�B�\�ƣ7BOto�I�bqU�e�mN���E\����y�)�k��nc�=��a4hg f���A%���Xg&���z�8,�J���(��!>���O�)�䪉����0@p^��ރ�ht%Su��L�t+����5      �      x������ � �          �  x�Ŗێ�H�����˽��]E����QAir>d�pR

AE9<�`�=���I&=�@ YaU���_��Wm�c�E��|!Mϲ�0�C���b-q���_��)��S8���j���/�L����T�e�Z���d�����8�~�����1����7������q�'ߪz��Z�϶�Րo��PeU�d��5;�"�)��¿Fb�� �+úS��ʑ,�,�x�j1��[>�ai�]S�Q뙒���0�o����V�|�)3e�pT:h�7��/f)��^���	�!B4@hvg�K}�l�������1� Hvsi��rγ��n���Q������%�*�H�b��Ò��CO �03]K=+$1U �Љ�x%	��-����7IJrK<坕�'?�-�Н�2ۖH6�go�U�r���%�ɹ~�f�p�����~��[�+�Q������vd�Ёꊿ�0�w��!ɘ;�܎5s{<�As��6:�J���pBo"�{���x��]KL�y"�[R�W���:��S����2��l��7"��51��[�����H���L��i>��7g��E���{��T�b�ҁ)��m��g5r�J�O����23"ȋ�QZ�%�AZ�ĸ�T��B�m�6r�d^U�4��	�;�X��p���h���5[4���s��M&d���"�#+��z��gG�>Y�5I�4z����S4�|{�X��ۄ�"}'�}���U��@
M�����><�Gʿ�����W�.\����� @�.�0���q�멮^�F-!2��-�}�=]��9�k\��h(�]cO�N�q���3j�ӗwe��0ȉ���c���Ep�܎��[n@)���P�&T�E��?}A���=����r��E�$�.�W���v�X̱��Z�@m��x�
�*p�7�f�;a�x������m ���-.�eA�ڵ���r>iA����?D"w]f�P�������B�J��R�Yz�X6����6r��&:�*ڃ�*hͽ�U�[d�}HA�)B��^�����KT
d{�s|2[�\'}���˻�v�t葭fe�I	�b�i�LTm��s�r(��6�4���.�{+��b��A/�X��u���l� xpw���j~'J�ף3ݬVl�4�1�Yi�
��W9�`m�9X��ݐ��?��_����? ����            x������ � �         �  x���[o�P���W����pY੠.�����������~�6�nCj2���2'�e2�'ѡJzZ�ӭ@A[<�� J�[�2�OL�>}��(�Ţ�-ŉ��t#Nb��^s�:�Ū��I^�̀����?`�pBK�ȩ w����`��'��6u�~�䦡i�S�I=�zi�		}��r2.����3�Y�:�T���їa����F�d� p*���w����wՅ[�N��Hm�1שּׂt��{XWv�<7�$�ƣ�/���Y��A/MO��U�*@'��כ'~>��d:R�sikyn7���ڒ)Yd�;7]7�HqS�h�xc��S�;��wMEm�����k�W?�;%M~�,�:����|�U��خG�M�zR��8�<��a��B���O��aP�# ��x�;��Ȃ�L��cx�l�9�d���-fG�W�����M93I�c���0GӨ����$(���*_˲���         �   x����� D�a�,��|5�����((%"��*�,>N�|>$H(�������<Ԓ��*G	�p��i1¨���~�?�{�z�VG���qc�+d��K9���0���A���-r*�Y��tC���&��s�<b�o�j�     