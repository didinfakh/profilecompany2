PGDMP      )                |         
   hk_rms_dev    16.2    16.0 	   C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    29179 
   hk_rms_dev    DATABASE     �   CREATE DATABASE hk_rms_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE hk_rms_dev;
                postgres    false            �            1259    29246    sys_failed_job    TABLE     )  CREATE TABLE public.sys_failed_job (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 "   DROP TABLE public.sys_failed_job;
       public         heap    postgres    false            �            1259    29245    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    227            G           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.sys_failed_job.id;
          public          postgres    false    226            �            1259    29229    sys_job    TABLE     �   CREATE TABLE public.sys_job (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.sys_job;
       public         heap    postgres    false            �            1259    29228    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    224            H           0    0    jobs_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.sys_job.id;
          public          postgres    false    223            �            1259    29181    sys_migration    TABLE     �   CREATE TABLE public.sys_migration (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
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
       public          postgres    false    216            I           0    0    migrations_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.sys_migration.id;
          public          postgres    false    215            �            1259    31184    mt_risk_dampak    TABLE     �  CREATE TABLE public.mt_risk_dampak (
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
    deleted_at timestamp without time zone
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
       public          postgres    false    243            J           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mt_risk_dampak_id_dampak_seq OWNED BY public.mt_risk_dampak.id_dampak;
          public          postgres    false    242            �            1259    31196    mt_risk_kemungkinan    TABLE     >  CREATE TABLE public.mt_risk_kemungkinan (
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
    deleted_at timestamp without time zone
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
       public          postgres    false    245            K           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_risk_kemungkinan.id_kemungkinan;
          public          postgres    false    244            �            1259    31252    mt_risk_kriteria_dampak    TABLE       CREATE TABLE public.mt_risk_kriteria_dampak (
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
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.mt_risk_kriteria_dampak;
       public         heap    postgres    false            �            1259    31266    mt_risk_kriteria_dampak_detail    TABLE     �  CREATE TABLE public.mt_risk_kriteria_dampak_detail (
    id_kriteria_dampak bigint NOT NULL,
    id_dampak bigint NOT NULL,
    keterangan character varying(400) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone
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
       public          postgres    false    251            L           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_risk_kriteria_dampak.id_kriteria_dampak;
          public          postgres    false    250            �            1259    31282    mt_risk_matrix    TABLE     �  CREATE TABLE public.mt_risk_matrix (
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
    deleted_at timestamp without time zone
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
    deleted_at timestamp without time zone
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
       public          postgres    false    255            M           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq OWNED BY public.mt_risk_perlakuan.id_perluakuan;
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
    deleted_at timestamp without time zone
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
       public          postgres    false    266            N           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq OWNED BY public.mt_risk_sikap_terhadap_risiko.id_sikap_terhadap_risiko;
          public          postgres    false    265                       1259    31850    mt_risk_taksonomi    TABLE     ,  CREATE TABLE public.mt_risk_taksonomi (
    id_taksonomi bigint NOT NULL,
    kode character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    id_taksonomi_area bigint,
    is_regulasi smallint,
    penjelasan character varying(1000),
    jenis character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.mt_risk_taksonomi;
       public         heap    postgres    false                       1259    31836    mt_risk_taksonomi_area    TABLE       CREATE TABLE public.mt_risk_taksonomi_area (
    id_taksonomi_area bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(200) NOT NULL,
    id_taksonomi_objective bigint,
    keterangan text,
    jenis character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone
);
 *   DROP TABLE public.mt_risk_taksonomi_area;
       public         heap    postgres    false                       1259    31835 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq;
       public          postgres    false    262            O           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq OWNED BY public.mt_risk_taksonomi_area.id_taksonomi_area;
          public          postgres    false    261                       1259    31849 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq;
       public          postgres    false    264            P           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq OWNED BY public.mt_risk_taksonomi.id_taksonomi;
          public          postgres    false    263                       1259    31829    mt_risk_taksonomi_objective    TABLE     �  CREATE TABLE public.mt_risk_taksonomi_objective (
    id_taksonomi_objective bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(200) NOT NULL,
    jenis character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone
);
 /   DROP TABLE public.mt_risk_taksonomi_objective;
       public         heap    postgres    false                       1259    31828 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq;
       public          postgres    false    260            Q           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq OWNED BY public.mt_risk_taksonomi_objective.id_taksonomi_objective;
          public          postgres    false    259            �            1259    31219    mt_risk_tingkat    TABLE     1  CREATE TABLE public.mt_risk_tingkat (
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
    deleted_at timestamp without time zone
);
 #   DROP TABLE public.mt_risk_tingkat;
       public         heap    postgres    false                       1259    31998    mt_risk_tingkat_agregasi_risiko    TABLE     '  CREATE TABLE public.mt_risk_tingkat_agregasi_risiko (
    id_tingkat_agregasi_risiko integer NOT NULL,
    nama character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by_desc character varying(50) NOT NULL,
    updated_by_desc character varying(50) NOT NULL,
    deleted_by_desc character varying(50) NOT NULL,
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
       public          postgres    false    279            R           0    0 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq OWNED BY public.mt_risk_tingkat_agregasi_risiko.id_tingkat_agregasi_risiko;
          public          postgres    false    278            �            1259    31218    mt_risk_tingkat_id_tingkat_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_id_tingkat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mt_risk_tingkat_id_tingkat_seq;
       public          postgres    false    247            S           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mt_risk_tingkat_id_tingkat_seq OWNED BY public.mt_risk_tingkat.id_tingkat;
          public          postgres    false    246                        1259    31762    mt_risk_tingkat_perlakuan    TABLE     t   CREATE TABLE public.mt_risk_tingkat_perlakuan (
    id_tingkat bigint NOT NULL,
    id_perlakuan bigint NOT NULL
);
 -   DROP TABLE public.mt_risk_tingkat_perlakuan;
       public         heap    postgres    false                       1259    32009    mt_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.mt_sasaran_id_sasaran_seq;
       public          postgres    false    281            T           0    0    mt_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.mt_sasaran_id_sasaran_seq OWNED BY public.mt_risk_sasaran.id_sasaran;
          public          postgres    false    280                       1259    31787    mt_sdm_jabatan    TABLE     �  CREATE TABLE public.mt_sdm_jabatan (
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
    deleted_at timestamp without time zone
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
       public          postgres    false    258            U           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq OWNED BY public.mt_sdm_jabatan.id_jabatan;
          public          postgres    false    257            �            1259    31233    mt_sdm_pegawai    TABLE     -  CREATE TABLE public.mt_sdm_pegawai (
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
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.mt_sdm_pegawai;
       public         heap    postgres    false            �            1259    31243    mt_sdm_unit    TABLE     �  CREATE TABLE public.mt_sdm_unit (
    table_code character varying(18) NOT NULL,
    table_desc character varying(100) NOT NULL,
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
    deleted_at timestamp without time zone
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
    created_by_desc character varying(50) NOT NULL,
    updated_by_desc character varying(50) NOT NULL
);
 '   DROP TABLE public.mt_status_pengajuan;
       public         heap    postgres    false                       1259    31944 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq;
       public          postgres    false    275            V           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq OWNED BY public.mt_status_pengajuan.id_status_pengajuan;
          public          postgres    false    274                       1259    31923    risk_capacity_limit    TABLE     �  CREATE TABLE public.risk_capacity_limit (
    id_capacity_limit bigint NOT NULL,
    tahun integer NOT NULL,
    id_unit character varying(18) NOT NULL,
    kapasitas_risiko numeric(15,2) NOT NULL,
    persentase_toleran numeric(5,2) NOT NULL,
    ebitda numeric(15,2) NOT NULL,
    risk_limit numeric(5,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    total_realisasi_eksposur_risiko_residual numeric(15,2),
    id_register bigint
);
 '   DROP TABLE public.risk_capacity_limit;
       public         heap    postgres    false                       1259    31922 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq;
       public          postgres    false    273            W           0    0 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_capacity_limit_id_capacity_limit_seq OWNED BY public.risk_capacity_limit.id_capacity_limit;
          public          postgres    false    272                       1259    31874    risk_metrik_strategi_risiko    TABLE     �  CREATE TABLE public.risk_metrik_strategi_risiko (
    id_metrik_strategi_risiko bigint NOT NULL,
    id_taksonomi_area bigint NOT NULL,
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
    id_unit character varying(18),
    id_register bigint
);
 /   DROP TABLE public.risk_metrik_strategi_risiko;
       public         heap    postgres    false                       1259    31873 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq;
       public          postgres    false    268            X           0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq OWNED BY public.risk_metrik_strategi_risiko.id_metrik_strategi_risiko;
          public          postgres    false    267                       1259    31952    risk_register    TABLE     y  CREATE TABLE public.risk_register (
    id_register bigint NOT NULL,
    nama character varying(300) NOT NULL,
    scope character varying(4000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by_desc character varying(50) NOT NULL,
    updated_by_desc character varying(50) NOT NULL,
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
    deleted_by_desc character varying(50)
);
 !   DROP TABLE public.risk_register;
       public         heap    postgres    false                       1259    31951    risk_register_id_register_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_register_id_register_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_register_id_register_seq;
       public          postgres    false    277            Y           0    0    risk_register_id_register_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_register_id_register_seq OWNED BY public.risk_register.id_register;
          public          postgres    false    276                       1259    31898    risk_sasaran    TABLE     p  CREATE TABLE public.risk_sasaran (
    id_sasaran bigint NOT NULL,
    nama character varying(1000) NOT NULL,
    hasil_yang_diharapkan character varying(1000) NOT NULL,
    nilai_risiko character varying(1000) NOT NULL,
    nilai_limit character varying(1000),
    is_accept integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    deleted_at timestamp without time zone,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    id_unit character varying(18),
    id_register bigint
);
     DROP TABLE public.risk_sasaran;
       public         heap    postgres    false                       1259    31897    risk_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_sasaran_id_sasaran_seq;
       public          postgres    false    270            Z           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_sasaran_id_sasaran_seq OWNED BY public.risk_sasaran.id_sasaran;
          public          postgres    false    269                       1259    31907    risk_sasaran_strategi    TABLE     t   CREATE TABLE public.risk_sasaran_strategi (
    id_sasaran bigint NOT NULL,
    strategi character varying(1000)
);
 )   DROP TABLE public.risk_sasaran_strategi;
       public         heap    postgres    false            �            1259    30886 
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
    deleted_at timestamp without time zone
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
       public          postgres    false    231            [           0    0    sys_action_id_action_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sys_action_id_action_seq OWNED BY public.sys_action.id_action;
          public          postgres    false    230            �            1259    29214 	   sys_cache    TABLE     �   CREATE TABLE public.sys_cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.sys_cache;
       public         heap    postgres    false            �            1259    29221    sys_cache_lock    TABLE     �   CREATE TABLE public.sys_cache_lock (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
 "   DROP TABLE public.sys_cache_lock;
       public         heap    postgres    false            �            1259    30898 	   sys_group    TABLE     n  CREATE TABLE public.sys_group (
    id_group integer NOT NULL,
    nama character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    deleted_at timestamp without time zone
);
    DROP TABLE public.sys_group;
       public         heap    postgres    false            �            1259    30937    sys_group_action    TABLE     [   CREATE TABLE public.sys_group_action (
    id_group_menu integer,
    id_action integer
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
       public          postgres    false    233            \           0    0    sys_group_id_group_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sys_group_id_group_seq OWNED BY public.sys_group.id_group;
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
    deleted_at timestamp without time zone
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
       public          postgres    false    239            ]           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.sys_group_menu_id_group_menu_seq OWNED BY public.sys_group_menu.id_group_menu;
          public          postgres    false    238            �            1259    29238    sys_job_batch    TABLE     f  CREATE TABLE public.sys_job_batch (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
 !   DROP TABLE public.sys_job_batch;
       public         heap    postgres    false            �            1259    30914    sys_log    TABLE     8  CREATE TABLE public.sys_log (
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
    deleted_at timestamp without time zone
);
    DROP TABLE public.sys_log;
       public         heap    postgres    false            �            1259    30913    sys_log_id_log_seq    SEQUENCE     {   CREATE SEQUENCE public.sys_log_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sys_log_id_log_seq;
       public          postgres    false    237            ^           0    0    sys_log_id_log_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sys_log_id_log_seq OWNED BY public.sys_log.id_log;
          public          postgres    false    236            �            1259    30879    sys_menu    TABLE     x  CREATE TABLE public.sys_menu (
    id_menu integer NOT NULL,
    id_parent_menu integer,
    nama character varying(100),
    url character varying(300),
    sort integer,
    icon character varying(20),
    is_show smallint DEFAULT 1,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp without time zone
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
       public          postgres    false    229            _           0    0    sys_menu_id_menu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_id_menu_seq OWNED BY public.sys_menu.id_menu;
          public          postgres    false    228            �            1259    29198    sys_password_reset_token    TABLE     �   CREATE TABLE public.sys_password_reset_token (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 ,   DROP TABLE public.sys_password_reset_token;
       public         heap    postgres    false            �            1259    29205    sys_session    TABLE     �   CREATE TABLE public.sys_session (
    id character varying(255) NOT NULL,
    id_user bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sys_session;
       public         heap    postgres    false            �            1259    30905    sys_setting    TABLE     �   CREATE TABLE public.sys_setting (
    id_setting integer NOT NULL,
    nama character varying(100),
    isi character varying(500)
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
       public          postgres    false    235            `           0    0    sys_setting_id_setting_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_setting_id_setting_seq OWNED BY public.sys_setting.id_setting;
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
    deleted_at timestamp without time zone
);
    DROP TABLE public.sys_user;
       public         heap    postgres    false            �            1259    30951    sys_user_group    TABLE     P   CREATE TABLE public.sys_user_group (
    id_user bigint,
    id_group bigint
);
 "   DROP TABLE public.sys_user_group;
       public         heap    postgres    false            �            1259    29187    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            a           0    0    users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_id_seq OWNED BY public.sys_user.id_user;
          public          postgres    false    217            �           2604    31187    mt_risk_dampak id_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_risk_dampak_id_dampak_seq'::regclass);
 G   ALTER TABLE public.mt_risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    31199 "   mt_risk_kemungkinan id_kemungkinan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_risk_kemungkinan_id_kemungkinan_seq'::regclass);
 Q   ALTER TABLE public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan DROP DEFAULT;
       public          postgres    false    245    244    245            �           2604    31255 *   mt_risk_kriteria_dampak id_kriteria_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak DROP DEFAULT;
       public          postgres    false    250    251    251            �           2604    31757    mt_risk_perlakuan id_perluakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_perlakuan ALTER COLUMN id_perluakuan SET DEFAULT nextval('public.mt_risk_perlakuan_id_perluakuan_seq'::regclass);
 N   ALTER TABLE public.mt_risk_perlakuan ALTER COLUMN id_perluakuan DROP DEFAULT;
       public          postgres    false    254    255    255            �           2604    32013    mt_risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.mt_sasaran_id_sasaran_seq'::regclass);
 I   ALTER TABLE public.mt_risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    280    281    281            �           2604    31869 6   mt_risk_sikap_terhadap_risiko id_sikap_terhadap_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko SET DEFAULT nextval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq'::regclass);
 e   ALTER TABLE public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko DROP DEFAULT;
       public          postgres    false    266    265    266            �           2604    31853    mt_risk_taksonomi id_taksonomi    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi ALTER COLUMN id_taksonomi SET DEFAULT nextval('public.mt_risk_taksonomi_id_taksonomi_seq'::regclass);
 M   ALTER TABLE public.mt_risk_taksonomi ALTER COLUMN id_taksonomi DROP DEFAULT;
       public          postgres    false    263    264    264            �           2604    31839 (   mt_risk_taksonomi_area id_taksonomi_area    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area SET DEFAULT nextval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq'::regclass);
 W   ALTER TABLE public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area DROP DEFAULT;
       public          postgres    false    262    261    262            �           2604    31832 2   mt_risk_taksonomi_objective id_taksonomi_objective    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective SET DEFAULT nextval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq'::regclass);
 a   ALTER TABLE public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective DROP DEFAULT;
       public          postgres    false    259    260    260            �           2604    31222    mt_risk_tingkat id_tingkat    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_risk_tingkat_id_tingkat_seq'::regclass);
 I   ALTER TABLE public.mt_risk_tingkat ALTER COLUMN id_tingkat DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    32001 :   mt_risk_tingkat_agregasi_risiko id_tingkat_agregasi_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko SET DEFAULT nextval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq'::regclass);
 i   ALTER TABLE public.mt_risk_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko DROP DEFAULT;
       public          postgres    false    279    278    279            �           2604    31790    mt_sdm_jabatan id_jabatan    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.mt_sdm_jabatan_id_jabatan_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_jabatan ALTER COLUMN id_jabatan DROP DEFAULT;
       public          postgres    false    257    258    258            �           2604    31948 '   mt_status_pengajuan id_status_pengajuan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan SET DEFAULT nextval('public.mt_status_pengajuan_id_status_pengajuan_seq'::regclass);
 V   ALTER TABLE public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan DROP DEFAULT;
       public          postgres    false    275    274    275            �           2604    31926 %   risk_capacity_limit id_capacity_limit    DEFAULT     �   ALTER TABLE ONLY public.risk_capacity_limit ALTER COLUMN id_capacity_limit SET DEFAULT nextval('public.risk_capacity_limit_id_capacity_limit_seq'::regclass);
 T   ALTER TABLE public.risk_capacity_limit ALTER COLUMN id_capacity_limit DROP DEFAULT;
       public          postgres    false    273    272    273            �           2604    31877 5   risk_metrik_strategi_risiko id_metrik_strategi_risiko    DEFAULT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko SET DEFAULT nextval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq'::regclass);
 d   ALTER TABLE public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko DROP DEFAULT;
       public          postgres    false    267    268    268            �           2604    31955    risk_register id_register    DEFAULT     �   ALTER TABLE ONLY public.risk_register ALTER COLUMN id_register SET DEFAULT nextval('public.risk_register_id_register_seq'::regclass);
 H   ALTER TABLE public.risk_register ALTER COLUMN id_register DROP DEFAULT;
       public          postgres    false    277    276    277            �           2604    31901    risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.risk_sasaran_id_sasaran_seq'::regclass);
 F   ALTER TABLE public.risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    269    270    270            �           2604    30889    sys_action id_action    DEFAULT     |   ALTER TABLE ONLY public.sys_action ALTER COLUMN id_action SET DEFAULT nextval('public.sys_action_id_action_seq'::regclass);
 C   ALTER TABLE public.sys_action ALTER COLUMN id_action DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    29249    sys_failed_job id    DEFAULT     s   ALTER TABLE ONLY public.sys_failed_job ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 @   ALTER TABLE public.sys_failed_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    30901    sys_group id_group    DEFAULT     x   ALTER TABLE ONLY public.sys_group ALTER COLUMN id_group SET DEFAULT nextval('public.sys_group_id_group_seq'::regclass);
 A   ALTER TABLE public.sys_group ALTER COLUMN id_group DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    30924    sys_group_menu id_group_menu    DEFAULT     �   ALTER TABLE ONLY public.sys_group_menu ALTER COLUMN id_group_menu SET DEFAULT nextval('public.sys_group_menu_id_group_menu_seq'::regclass);
 K   ALTER TABLE public.sys_group_menu ALTER COLUMN id_group_menu DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    29232 
   sys_job id    DEFAULT     e   ALTER TABLE ONLY public.sys_job ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 9   ALTER TABLE public.sys_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    30917    sys_log id_log    DEFAULT     p   ALTER TABLE ONLY public.sys_log ALTER COLUMN id_log SET DEFAULT nextval('public.sys_log_id_log_seq'::regclass);
 =   ALTER TABLE public.sys_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    30882    sys_menu id_menu    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.sys_menu_id_menu_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    29184    sys_migration id    DEFAULT     q   ALTER TABLE ONLY public.sys_migration ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 ?   ALTER TABLE public.sys_migration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    30908    sys_setting id_setting    DEFAULT     �   ALTER TABLE ONLY public.sys_setting ALTER COLUMN id_setting SET DEFAULT nextval('public.sys_setting_id_setting_seq'::regclass);
 E   ALTER TABLE public.sys_setting ALTER COLUMN id_setting DROP DEFAULT;
       public          postgres    false    235    234    235            �           2604    29191    sys_user id_user    DEFAULT     l   ALTER TABLE ONLY public.sys_user ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    217    218    218                      0    31184    mt_risk_dampak 
   TABLE DATA           �   COPY public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    243   !�                0    31196    mt_risk_kemungkinan 
   TABLE DATA           F  COPY public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    245   >�      "          0    31252    mt_risk_kriteria_dampak 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    251   [�      #          0    31266    mt_risk_kriteria_dampak_detail 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    252   x�      $          0    31282    mt_risk_matrix 
   TABLE DATA           �   COPY public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    253   ��      &          0    31754    mt_risk_perlakuan 
   TABLE DATA           �   COPY public.mt_risk_perlakuan (id_perluakuan, nama, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    255   ��      @          0    32010    mt_risk_sasaran 
   TABLE DATA           �   COPY public.mt_risk_sasaran (id_sasaran, nama, created_at, updated_at, created_by, updated_by, deleted_by, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc) FROM stdin;
    public          postgres    false    281   ό      1          0    31866    mt_risk_sikap_terhadap_risiko 
   TABLE DATA           �   COPY public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    266   �      /          0    31850    mt_risk_taksonomi 
   TABLE DATA           �   COPY public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    264   	�      -          0    31836    mt_risk_taksonomi_area 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    262   &�      +          0    31829    mt_risk_taksonomi_objective 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    260   C�                0    31219    mt_risk_tingkat 
   TABLE DATA           �   COPY public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    247   `�      >          0    31998    mt_risk_tingkat_agregasi_risiko 
   TABLE DATA           �   COPY public.mt_risk_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, deleted_by_desc, created_by, updated_by, deleted_by, id_tingkat_agregasi_risiko_parent) FROM stdin;
    public          postgres    false    279   }�      '          0    31762    mt_risk_tingkat_perlakuan 
   TABLE DATA           M   COPY public.mt_risk_tingkat_perlakuan (id_tingkat, id_perlakuan) FROM stdin;
    public          postgres    false    256   ��      )          0    31787    mt_sdm_jabatan 
   TABLE DATA             COPY public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    258   ��                0    31233    mt_sdm_pegawai 
   TABLE DATA           �   COPY public.mt_sdm_pegawai (nid, email, position_id, nama_lengkap, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    248   ԍ                 0    31243    mt_sdm_unit 
   TABLE DATA           �   COPY public.mt_sdm_unit (table_code, table_desc, is_aktif, kode_distrik, id_mig_dep, kode_lama, id_subunitkerja, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    249   �      :          0    31945    mt_status_pengajuan 
   TABLE DATA           �   COPY public.mt_status_pengajuan (id_status_pengajuan, nama, created_at, updated_at, deleted_at, created_by, updated_by, created_by_desc, updated_by_desc) FROM stdin;
    public          postgres    false    275   �      8          0    31923    risk_capacity_limit 
   TABLE DATA           !  COPY public.risk_capacity_limit (id_capacity_limit, tahun, id_unit, kapasitas_risiko, persentase_toleran, ebitda, risk_limit, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, total_realisasi_eksposur_risiko_residual, id_register) FROM stdin;
    public          postgres    false    273   +�      3          0    31874    risk_metrik_strategi_risiko 
   TABLE DATA           C  COPY public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_taksonomi_area, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_unit, id_register) FROM stdin;
    public          postgres    false    268   H�      <          0    31952    risk_register 
   TABLE DATA           O  COPY public.risk_register (id_register, nama, scope, created_at, updated_at, deleted_at, created_by_desc, updated_by_desc, created_by, updated_by, id_kajian_risiko, id_unit, id_parent_register, navigasi, id_tingkat_agregasi_risiko, is_kegiatan, kode, id_status_pengajuan, id_owner, nama_owner, deleted_by, deleted_by_desc) FROM stdin;
    public          postgres    false    277   e�      5          0    31898    risk_sasaran 
   TABLE DATA           �   COPY public.risk_sasaran (id_sasaran, nama, hasil_yang_diharapkan, nilai_risiko, nilai_limit, is_accept, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc, id_unit, id_register) FROM stdin;
    public          postgres    false    270   ��      6          0    31907    risk_sasaran_strategi 
   TABLE DATA           E   COPY public.risk_sasaran_strategi (id_sasaran, strategi) FROM stdin;
    public          postgres    false    271   ��                0    30886 
   sys_action 
   TABLE DATA           �   COPY public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    231   ��                0    29214 	   sys_cache 
   TABLE DATA           ;   COPY public.sys_cache (key, value, expiration) FROM stdin;
    public          postgres    false    221   ˔                0    29221    sys_cache_lock 
   TABLE DATA           @   COPY public.sys_cache_lock (key, owner, expiration) FROM stdin;
    public          postgres    false    222   �      
          0    29246    sys_failed_job 
   TABLE DATA           d   COPY public.sys_failed_job (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    227   (�                0    30898 	   sys_group 
   TABLE DATA           �   COPY public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    233   E�                0    30937    sys_group_action 
   TABLE DATA           D   COPY public.sys_group_action (id_group_menu, id_action) FROM stdin;
    public          postgres    false    240   ��                0    30921    sys_group_menu 
   TABLE DATA           �   COPY public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    239   Θ                0    29229    sys_job 
   TABLE DATA           f   COPY public.sys_job (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    224   &�                0    29238    sys_job_batch 
   TABLE DATA           �   COPY public.sys_job_batch (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    225   C�                0    30914    sys_log 
   TABLE DATA           �   COPY public.sys_log (page, activity, ip, activity_time, user_desc, action, table_name, id_log, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    237   `�                0    30879    sys_menu 
   TABLE DATA              COPY public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    229   }�      �          0    29181    sys_migration 
   TABLE DATA           =   COPY public.sys_migration (id, migration, batch) FROM stdin;
    public          postgres    false    216   �                0    29198    sys_password_reset_token 
   TABLE DATA           L   COPY public.sys_password_reset_token (email, token, created_at) FROM stdin;
    public          postgres    false    219   ϡ                0    29205    sys_session 
   TABLE DATA           b   COPY public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    220   �                0    30905    sys_setting 
   TABLE DATA           <   COPY public.sys_setting (id_setting, nama, isi) FROM stdin;
    public          postgres    false    235   m�                0    29188    sys_user 
   TABLE DATA           �   COPY public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt, deleted_at) FROM stdin;
    public          postgres    false    218   ��                0    30951    sys_user_group 
   TABLE DATA           ;   COPY public.sys_user_group (id_user, id_group) FROM stdin;
    public          postgres    false    241   m�      b           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    226            c           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    223            d           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          postgres    false    215            e           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.mt_risk_dampak_id_dampak_seq', 1, false);
          public          postgres    false    242            f           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.mt_risk_kemungkinan_id_kemungkinan_seq', 1, false);
          public          postgres    false    244            g           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq', 1, false);
          public          postgres    false    250            h           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.mt_risk_perlakuan_id_perluakuan_seq', 1, false);
          public          postgres    false    254            i           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq', 1, false);
          public          postgres    false    265            j           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq', 1, false);
          public          postgres    false    261            k           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_risk_taksonomi_id_taksonomi_seq', 1, false);
          public          postgres    false    263            l           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq', 1, false);
          public          postgres    false    259            m           0    0 >   mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE SET     m   SELECT pg_catalog.setval('public.mt_risk_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq', 1, false);
          public          postgres    false    278            n           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mt_risk_tingkat_id_tingkat_seq', 1, false);
          public          postgres    false    246            o           0    0    mt_sasaran_id_sasaran_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.mt_sasaran_id_sasaran_seq', 1, false);
          public          postgres    false    280            p           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_sdm_jabatan_id_jabatan_seq', 1, false);
          public          postgres    false    257            q           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_status_pengajuan_id_status_pengajuan_seq', 1, false);
          public          postgres    false    274            r           0    0 )   risk_capacity_limit_id_capacity_limit_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.risk_capacity_limit_id_capacity_limit_seq', 1, false);
          public          postgres    false    272            s           0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq', 1, false);
          public          postgres    false    267            t           0    0    risk_register_id_register_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_register_id_register_seq', 1, false);
          public          postgres    false    276            u           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.risk_sasaran_id_sasaran_seq', 1, false);
          public          postgres    false    269            v           0    0    sys_action_id_action_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sys_action_id_action_seq', 163, true);
          public          postgres    false    230            w           0    0    sys_group_id_group_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_group_id_group_seq', 9, true);
          public          postgres    false    232            x           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 145, true);
          public          postgres    false    238            y           0    0    sys_log_id_log_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_log_id_log_seq', 12211, true);
          public          postgres    false    236            z           0    0    sys_menu_id_menu_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 78, true);
          public          postgres    false    228            {           0    0    sys_setting_id_setting_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);
          public          postgres    false    234            |           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    217                       2606    29227    sys_cache_lock cache_locks_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_cache_lock
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 I   ALTER TABLE ONLY public.sys_cache_lock DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    222                       2606    29220    sys_cache cache_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sys_cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.sys_cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    221                       2606    29254    sys_failed_job failed_jobs_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    227                       2606    29256 &   sys_failed_job failed_jobs_uuid_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 P   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    227            <           2606    31834 0   mt_risk_taksonomi_objective idx_18d8a35225719b65 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective
    ADD CONSTRAINT idx_18d8a35225719b65 PRIMARY KEY (id_taksonomi_objective);
 Z   ALTER TABLE ONLY public.mt_risk_taksonomi_objective DROP CONSTRAINT idx_18d8a35225719b65;
       public            postgres    false    260            :           2606    31792 #   mt_sdm_jabatan idx_1e38228f1edb51f5 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT idx_1e38228f1edb51f5 PRIMARY KEY (id_jabatan);
 M   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT idx_1e38228f1edb51f5;
       public            postgres    false    258            J           2606    31950 (   mt_status_pengajuan idx_38d4e01f5bd43ed6 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_status_pengajuan
    ADD CONSTRAINT idx_38d4e01f5bd43ed6 PRIMARY KEY (id_status_pengajuan);
 R   ALTER TABLE ONLY public.mt_status_pengajuan DROP CONSTRAINT idx_38d4e01f5bd43ed6;
       public            postgres    false    275            N           2606    32003 4   mt_risk_tingkat_agregasi_risiko idx_6d38b409db81e919 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko
    ADD CONSTRAINT idx_6d38b409db81e919 PRIMARY KEY (id_tingkat_agregasi_risiko);
 ^   ALTER TABLE ONLY public.mt_risk_tingkat_agregasi_risiko DROP CONSTRAINT idx_6d38b409db81e919;
       public            postgres    false    279            @           2606    31857 &   mt_risk_taksonomi idx_ae01f0becb598a2e 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT idx_ae01f0becb598a2e PRIMARY KEY (id_taksonomi);
 P   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT idx_ae01f0becb598a2e;
       public            postgres    false    264            L           2606    31961 "   risk_register idx_c3ae979ce28d717c 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT idx_c3ae979ce28d717c PRIMARY KEY (id_register);
 L   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT idx_c3ae979ce28d717c;
       public            postgres    false    277            >           2606    31843 +   mt_risk_taksonomi_area idx_efeea3ec186756aa 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT idx_efeea3ec186756aa PRIMARY KEY (id_taksonomi_area);
 U   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT idx_efeea3ec186756aa;
       public            postgres    false    262                       2606    29244    sys_job_batch job_batches_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_job_batch
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.sys_job_batch DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    225                       2606    29236    sys_job jobs_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sys_job DROP CONSTRAINT jobs_pkey;
       public            postgres    false    224                       2606    29186    sys_migration migrations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sys_migration
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.sys_migration DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            &           2606    31194 "   mt_risk_dampak mt_risk_dampak_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_risk_dampak
    ADD CONSTRAINT mt_risk_dampak_pkey PRIMARY KEY (id_dampak);
 L   ALTER TABLE ONLY public.mt_risk_dampak DROP CONSTRAINT mt_risk_dampak_pkey;
       public            postgres    false    243            (           2606    31209 ,   mt_risk_kemungkinan mt_risk_kemungkinan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.mt_risk_kemungkinan
    ADD CONSTRAINT mt_risk_kemungkinan_pkey PRIMARY KEY (id_kemungkinan);
 V   ALTER TABLE ONLY public.mt_risk_kemungkinan DROP CONSTRAINT mt_risk_kemungkinan_pkey;
       public            postgres    false    245            2           2606    31271 B   mt_risk_kriteria_dampak_detail mt_risk_kriteria_dampak_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT mt_risk_kriteria_dampak_detail_pkey PRIMARY KEY (id_kriteria_dampak, id_dampak);
 l   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT mt_risk_kriteria_dampak_detail_pkey;
       public            postgres    false    252    252            0           2606    31260 4   mt_risk_kriteria_dampak mt_risk_kriteria_dampak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT mt_risk_kriteria_dampak_pkey PRIMARY KEY (id_kriteria_dampak);
 ^   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT mt_risk_kriteria_dampak_pkey;
       public            postgres    false    251            4           2606    31287 "   mt_risk_matrix mt_risk_matrix_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT mt_risk_matrix_pkey PRIMARY KEY (id_dampak, id_kemungkinan);
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT mt_risk_matrix_pkey;
       public            postgres    false    253    253            6           2606    31761 (   mt_risk_perlakuan mt_risk_perlakuan_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.mt_risk_perlakuan
    ADD CONSTRAINT mt_risk_perlakuan_pkey PRIMARY KEY (id_perluakuan);
 R   ALTER TABLE ONLY public.mt_risk_perlakuan DROP CONSTRAINT mt_risk_perlakuan_pkey;
       public            postgres    false    255            B           2606    31871 @   mt_risk_sikap_terhadap_risiko mt_risk_sikap_terhadap_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko
    ADD CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey PRIMARY KEY (id_sikap_terhadap_risiko);
 j   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko DROP CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey;
       public            postgres    false    266            8           2606    31766 8   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_pkey PRIMARY KEY (id_tingkat, id_perlakuan);
 b   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_pkey;
       public            postgres    false    256    256            *           2606    31232 $   mt_risk_tingkat mt_risk_tingkat_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_tingkat
    ADD CONSTRAINT mt_risk_tingkat_pkey PRIMARY KEY (id_tingkat);
 N   ALTER TABLE ONLY public.mt_risk_tingkat DROP CONSTRAINT mt_risk_tingkat_pkey;
       public            postgres    false    247            ,           2606    31242 "   mt_sdm_pegawai mt_sdm_pegawai_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT mt_sdm_pegawai_pkey PRIMARY KEY (nid);
 L   ALTER TABLE ONLY public.mt_sdm_pegawai DROP CONSTRAINT mt_sdm_pegawai_pkey;
       public            postgres    false    248            .           2606    31250    mt_sdm_unit mt_sdm_unit_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_pkey PRIMARY KEY (table_code);
 F   ALTER TABLE ONLY public.mt_sdm_unit DROP CONSTRAINT mt_sdm_unit_pkey;
       public            postgres    false    249                       2606    29204 3   sys_password_reset_token password_reset_tokens_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sys_password_reset_token
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 ]   ALTER TABLE ONLY public.sys_password_reset_token DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    219            H           2606    31928 ,   risk_capacity_limit risk_capacity_limit_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_pkey PRIMARY KEY (id_capacity_limit);
 V   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit_pkey;
       public            postgres    false    273            D           2606    31881 <   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_pkey PRIMARY KEY (id_metrik_strategi_risiko);
 f   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_pkey;
       public            postgres    false    268            F           2606    31906    risk_sasaran risk_sasaran_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_pkey PRIMARY KEY (id_sasaran);
 H   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_pkey;
       public            postgres    false    270            
           2606    29211    sys_session sessions_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_session
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.sys_session DROP CONSTRAINT sessions_pkey;
       public            postgres    false    220                       2606    30891    sys_action sys_action_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT sys_action_pk PRIMARY KEY (id_action);
 B   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT sys_action_pk;
       public            postgres    false    231            $           2606    30926     sys_group_menu sys_group_menu_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT sys_group_menu_pk PRIMARY KEY (id_group_menu);
 J   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT sys_group_menu_pk;
       public            postgres    false    239                       2606    30903    sys_group sys_group_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sys_group
    ADD CONSTRAINT sys_group_pk PRIMARY KEY (id_group);
 @   ALTER TABLE ONLY public.sys_group DROP CONSTRAINT sys_group_pk;
       public            postgres    false    233            "           2606    31182    sys_log sys_log_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id_log);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public            postgres    false    237                       2606    30884    sys_menu sys_menu_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pk PRIMARY KEY (id_menu);
 >   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pk;
       public            postgres    false    229                        2606    30912    sys_setting sys_setting_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.sys_setting
    ADD CONSTRAINT sys_setting_pk PRIMARY KEY (id_setting);
 D   ALTER TABLE ONLY public.sys_setting DROP CONSTRAINT sys_setting_pk;
       public            postgres    false    235                       2606    29197    sys_user users_email_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 E   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_email_unique;
       public            postgres    false    218                       2606    29195    sys_user users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_pkey;
       public            postgres    false    218                       1259    29237    jobs_queue_index    INDEX     E   CREATE INDEX jobs_queue_index ON public.sys_job USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    224                       1259    29213    sessions_last_activity_index    INDEX     ]   CREATE INDEX sessions_last_activity_index ON public.sys_session USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    220                       1259    29212    sessions_user_id_index    INDEX     Q   CREATE INDEX sessions_user_id_index ON public.sys_session USING btree (id_user);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    220            O           2606    30892    sys_action aksi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT aksi_fk1 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 =   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT aksi_fk1;
       public          postgres    false    229    4890    231            j           2606    31962 !   risk_register fk_388ab7f7f4fd9818    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_388ab7f7f4fd9818 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_388ab7f7f4fd9818;
       public          postgres    false    277    4938    275            W           2606    31272 2   mt_risk_kriteria_dampak_detail fk_41ba39047b02c6e5    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_41ba39047b02c6e5 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_41ba39047b02c6e5;
       public          postgres    false    252    4912    251            X           2606    31277 2   mt_risk_kriteria_dampak_detail fk_4d57df3881e291e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_4d57df3881e291e2 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_4d57df3881e291e2;
       public          postgres    false    4902    252    243            k           2606    31967 !   risk_register fk_65f431cf37d7f015    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_65f431cf37d7f015 FOREIGN KEY (id_parent_register) REFERENCES public.risk_register(id_register);
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_65f431cf37d7f015;
       public          postgres    false    277    277    4940            `           2606    31858 %   mt_risk_taksonomi fk_726c58c036e9bcdd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT fk_726c58c036e9bcdd FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 O   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT fk_726c58c036e9bcdd;
       public          postgres    false    264    262    4926            l           2606    31972 !   risk_register fk_9bca8419236912b5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_9bca8419236912b5 FOREIGN KEY (id_owner) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_9bca8419236912b5;
       public          postgres    false    258    277    4922            Y           2606    31288 "   mt_risk_matrix fk_a4669bbd55458901    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_a4669bbd55458901 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_a4669bbd55458901;
       public          postgres    false    253    245    4904            _           2606    31844 *   mt_risk_taksonomi_area fk_a9d39025b9658c1d    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT fk_a9d39025b9658c1d FOREIGN KEY (id_taksonomi_objective) REFERENCES public.mt_risk_taksonomi_objective(id_taksonomi_objective);
 T   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT fk_a9d39025b9658c1d;
       public          postgres    false    260    262    4924            ^           2606    31793 "   mt_sdm_jabatan fk_b743dfd89358fc4e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_b743dfd89358fc4e FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_b743dfd89358fc4e;
       public          postgres    false    258    249    4910            Z           2606    31293 "   mt_risk_matrix fk_d414e4107f6c8462    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_d414e4107f6c8462 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_d414e4107f6c8462;
       public          postgres    false    4902    253    243            [           2606    31298 "   mt_risk_matrix fk_e3066883e2e9bb72    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_e3066883e2e9bb72 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_e3066883e2e9bb72;
       public          postgres    false    4906    253    247            m           2606    31977 !   risk_register fk_e839a323c85d81e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT fk_e839a323c85d81e2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT fk_e839a323c85d81e2;
       public          postgres    false    249    277    4910            V           2606    31261 +   mt_risk_kriteria_dampak fk_f9422fdc528daf94    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT fk_f9422fdc528daf94 FOREIGN KEY (id_induk) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 U   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT fk_f9422fdc528daf94;
       public          postgres    false    251    251    4912            R           2606    30940 !   sys_group_action group_action_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk1 FOREIGN KEY (id_group_menu) REFERENCES public.sys_group_menu(id_group_menu) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk1;
       public          postgres    false    4900    239    240            S           2606    30945 !   sys_group_action group_action_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk2 FOREIGN KEY (id_action) REFERENCES public.sys_action(id_action) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk2;
       public          postgres    false    240    4892    231            P           2606    30927    sys_group_menu group_menu_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk1 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk1;
       public          postgres    false    4894    233    239            Q           2606    30932    sys_group_menu group_menu_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk2 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk2;
       public          postgres    false    239    229    4890            \           2606    31767 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk1 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk1;
       public          postgres    false    256    4906    247            ]           2606    31772 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk2 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perluakuan) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk2;
       public          postgres    false    256    4918    255            h           2606    31929 '   risk_capacity_limit risk_capacity_limit    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit;
       public          postgres    false    273    249    4910            i           2606    31982 +   risk_capacity_limit risk_capacity_limit_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_capacity_limit
    ADD CONSTRAINT risk_capacity_limit_fk1 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public.risk_capacity_limit DROP CONSTRAINT risk_capacity_limit_fk1;
       public          postgres    false    4940    277    273            a           2606    31882 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk1 FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk1;
       public          postgres    false    262    268    4926            b           2606    31887 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk2 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk2;
       public          postgres    false    4928    268    264            c           2606    31892 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk3 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk3;
       public          postgres    false    268    249    4910            d           2606    31987 ;   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_fk4 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 e   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_fk4;
       public          postgres    false    268    277    4940            n           2606    32004    risk_register risk_register_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_register
    ADD CONSTRAINT risk_register_fk1 FOREIGN KEY (id_tingkat_agregasi_risiko) REFERENCES public.mt_risk_tingkat_agregasi_risiko(id_tingkat_agregasi_risiko) ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.risk_register DROP CONSTRAINT risk_register_fk1;
       public          postgres    false    279    277    4942            e           2606    31917    risk_sasaran risk_sasaran_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_fk1 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_fk1;
       public          postgres    false    4910    270    249            f           2606    31992    risk_sasaran risk_sasaran_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT risk_sasaran_fk2 FOREIGN KEY (id_register) REFERENCES public.risk_register(id_register) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT risk_sasaran_fk2;
       public          postgres    false    277    4940    270            g           2606    31912 /   risk_sasaran_strategi risk_sasaran_strategi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_strategi
    ADD CONSTRAINT risk_sasaran_strategi_fk1 FOREIGN KEY (id_sasaran) REFERENCES public.risk_sasaran(id_sasaran) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.risk_sasaran_strategi DROP CONSTRAINT risk_sasaran_strategi_fk1;
       public          postgres    false    271    270    4934            T           2606    30954 !   sys_user_group sys_user_group_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk1 FOREIGN KEY (id_user) REFERENCES public.sys_user(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk1;
       public          postgres    false    241    4869    218            U           2606    30959 !   sys_user_group sys_user_group_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk2;
       public          postgres    false    233    4894    241                  x������ � �            x������ � �      "      x������ � �      #      x������ � �      $      x������ � �      &      x������ � �      @      x������ � �      1      x������ � �      /      x������ � �      -      x������ � �      +      x������ � �            x������ � �      >      x������ � �      '      x������ � �      )      x������ � �            x������ � �             x������ � �      :      x������ � �      8      x������ � �      3      x������ � �      <      x������ � �      5      x������ � �      6      x������ � �         �  x�u�K��6EǮU��_}��$@ՠ� �d�q���=�k���x(Y����ϯ����/����_�|��z�y�_���:���������;?�>�~�i=��������t������X��ҏ%e;��2ɇ���"�yȘ) ��D���:c?�3e�Q��I�c�G�)��J�3�^	]1S�lTd�)c�(/����&S��*A�7�t?-�@���¬18SF��2��#$��Z%���=���l�ʬ0ₙ2���� �#�V	D��e�]ϖ)a�� T�X5�4�/G4�)� �Jyf
�$���̔p�3eLc�:�g��Ƅ��*qf
�$�z�eJ��I��)c�wB=�y��ь� [�
���1�`��̔0��sǙ)c�$]�c�i��"�1`���Ѝ���3S�4&2�OVh�<����}���՘#S���B�s#i�L�YL�#���b!F̄�^Ld욥c��.�=#�&�2Fk��Ë#��QZk" ��XS�ޚN��WM�fk#h_�L�5�.=��n�"�a� ���+�s$�b�L	�0GF�Lu�Ů:��12E��6�}Y�a�Δ0sd�z��2�a^l��cf�h�9l^����	�)a�Ȱ�*�Wu�0�XOx���0' ��ou�q�jY���u��3e���6S�#�e��9��J��ÜV�J��sbX5+UsSOݴ٦qf���$����0�I��3S�eLbXO��d�Mcn:|��ڠ��nL�
���1�`WF?m�1���2�1��ϋK�e���$���e
�$�ֲeJ��I�f˔1�Y�	9����ь� �-�ލ��e�ǟ}V��?�0fU���$-SD3&l5*<��ݘH��n��1�a}BO��0f��������__n�"�1�a��nL$�)a���	#,C�5��_���<��2c4g����-3B�&"f���DH�� C�5������͛H�03B'"lI4xX�9	lU<��e�����Kw'
��o�B�$�����eO�Xo�Sa��x۱#3F�'��1J�n�p� V��՘
�]�^��n�1�C�`��MN%�]ܙ�(A8SH���<��7��ݢ@��gf�aQBXo��!.��z#��D�Ӣv��y���1�E����Ea��`A/��JZ��â�������Y��3%�nQD؅Tz���Eb�Q��֐�EW��+Ldŉ4�"�f��,�Ea�gf�iQ��Wz���EW����#�-3F�(��6�k�[��m�4-J�nm�<,���/O���͢H�z��r�("��;m�<-�+�dXt�^J����͢D�{���[��-3Ĵ(B�_Zf�iQ�3H&p"ݢD�Y�E%�.u�qY� V� ?̈́��h�]�o�h�1�E��m�2#��4�7�7F1o�� Ӣv��<R��wFH���]�"��"��eQ�X�Ej���h�UL.���[�F��&��xqD�ei�!.��J���������9<�0         0  x����n� ����X�.�OzɃT�X0�%��ҟS�ĸq\��,@������>��C<vBKF��b�v>�l�k�AG�a�ޟ��C�D��ǇY7�&Z��"�Ҿ�6�~�V���R�'=f&�����F_ϧu4�!t�5��#u����!��O��"��ѳ��`9S����؁���I9�st#0�i��H��Y�{�"e����r�A�aH��.�P���V�F�\f5N�:#'����8�b;FT�C��`����z#m�j�r��E>�q�|
�PG��ZhQ/�U����7��2S��m��@�/            x������ � �      
      x������ � �         �   x���1� ��"hel�[.�d��%C[)��U2#�<��O��ny����;��������^��R�a)��5�J�zQ%�p5�2g��H恜!�e�פ(ƞ|�a�Ie�I�}�sr���h��K=��C�9*�M�e"���&Y�2��[���|��� ���.         �  x�5��q!��!q����p�O?O���V�1���&���oF�b�c�y`|�?E7h��f�e�a��2�4i�f~�'�v�/����_������_v`���%�/�峣��{0�Yf����.OyK�M̊S���}3`���%�&��<;ɾ�Q�2K�-��Sޒ}�'.G%�0'��\�.ه9�p�<�>�iE9�,ї����)o��Ĝv/G%����a��3��4�ls�9�̩L�j��f0�2�x��V0��*_��7���q�����m`.�V�v�7�9���;�����8&z�7�y����2����z
�����l����O`�-W/�I���e�\���Zt1L���В�e�9�\<�h�Zn1M��[sZ��Z-[-��-G�,���Z�YL�-OK,��ܻ7X�2Jli�o)�r+q��f�a��R�M���ߟ���s��         H  x��ձm�0F��<EH@�4)y�Lp���.\���F� ��_���m�o����~��m��{��?[k����n��������~���hz�������>g�����_>��R���Kݟ�/u�����9�J���+ݯ㯮�~��t����9�J���+�_�t������A�?}�����y�|�������_ޭy'�~�I>�Kͻ�r�ܖ�w'��.�;����ϑ�k�N>m�zw�$9G]�C]�h;�RV7P�������ԕ�f��d�u˲����duu%��+Y�@]���JV�v%�k�;�O�|3��<�f�y��m�� �ë�            x������ � �            x������ � �            x������ � �         �  x��XK��H>ӿ�Sn��_�p��쮔�Fy�"Y=cf���d�﷪16tc,�������UBD�>L~x$�~K��ǉʅΓ&�d�k�������}���]��6�v�9�3�[���K�K�s�<YS[#���:F��v����I�+R��1�8^�90��*�*�*$�=�`B.б�w�0�x$��׶h�9����-������@�+���:�0&���J�S`{���GcB]�{��@����y�D��|:���Ɣ������T��Ѕ)����Ӛ�T��sט�x����l���HD��C�y��î���H�F^�� |�����4��NƙJ�DLh 9��d�>v�7�*?��@�+�*<��b��J[�^>�֖5f�ƶ妼|
��H��C�0��
�o�?
�Y:�(��k��m�����(a{yN�.%�z�RK�a�S�o��5��N�f�~o^UjMb�*�B�δ���i�����D���tD��#K D��9�]���o;�f��j����8�!u�~o����K�;t�U�J��j��wc���M��
������^g�A�ˁ@��X���A����y�$b��Y'o1�Ս����ͬ�yB-HB[�3h-.�F�bp����׳S�����|�r���"�?�z�g�5��ԩ�c��Ly��a�0�*<q���J�����}��qn[�^g����Z7�i}1�)��?���(���9tF��%�O�ciB��'w�/	W�p<���;c)'��b�b�$� Ƥ�V��?��Nr%|�,�A�!�d2��3t�5Ac
U*(�1�=�?M}<DO��Ao����T��@#��ذG�����лf��[��c���9���5��EithlՅ�s��]#�:v���bEȉeϗ&����o��J|
�[��!j� )d��P�|��x��Ĉ��y��I�}��v�����}c�_��;�����澮�64J:?{�h�hy�w�S� FP�X*�-�4�,���@Di��S(�kcy�0�R���9
1�*Ե��tG����:[=E���z��$��]�S�V��sM�g[�C��h��<7j��;}E��TN�Ί�@��U�/�����[_N7|��N'{��mv2���}�|sc��'���9X[�@���E�9������H��U}iL;-Ir�����$��U5�B�;v����p��0�0��y��R�u�aL���. ���!�L*���>E��C�)�$>6�#�p��R��l�XS)4Y�q���xI�����t[��8S��Z��Ŵ���%��j1�&�k|�=�`�p�2EX�$��!�x����IW40��6�_����^֑�^c<�B�N9��.�U>Ew�0=b�mG���L�VC� oo������Jb���E�i��v��W�{}84L�MQ�6��O�TX��L��?���pE�5������+������Nb(ŵV��/:��X"�~yN��Å�+���ٛJx�����uAF�Ӕ3C$��2ZG�uv_�lE�贿�ĭ�` �:_�p��u��
2����j��xY��L���=���0�1���[f�e��^g8�d�53}i�قΫǐ����X<��������=���~��/��gZ�mӞ���K��=�����$�      �   �   x���K� ��u�0f�U�]L&�����`����>0�(!���a�*QѸߋ�g���^(�f�B�^A5Ak�gX�����5˅U�QW�%�x֑͓���a���T��1a���eN���d�����u>���%9�L�0�oF��|K����5�U��\�|�~�� ^vb�m            x������ � �         q  x�͕Q��:���Wx���8��J6{!� ZX�����@)��(��/s��$�f�&9�^4y�/m�����4)b�\�RVx��~�ͺ_α���{��2r���F@�S0[L�T����^�0�R?�O�0~La&��t3��d�4,�xW�/�8���ɷ�����	+�t��IY���[]�/ �S�mM���V�S2
q�ۗ��4�m�"İeq��'�к.\jv�2���Ѕ��Q}𗐈��+$!��D����w�����w=��U]�����6C�y���?b�y����|D3��"�|qK�ܦ�Y*����9s BI���~"���qb���jgY�
�������M�Cie��2�_���6��G�-8��׾�jf�P���CX�y���UO��J6�'C� ��X%EHx^�������J������'׬1ĺB_�Q�GL��I�	$�� �� ��X4��.���(���XB"�<��{���41L6x� G����$ճ�E4�0�m�\ �:��e���WR���㤷�|/� ��&�2%���œ*lC�<N���峇D\�1B��A.�����%K�i��x��W]�s�ޏ��>#���z���%'�hu�r����%D3p��;*si.9�Yx�O�x������\N�|&�/�ܓ�J�V�)#�!5+;O�=	�᰻Ԃ!�u?�t��u)���]��K����9��.oϘ�<�JH�#Ul(�2-d�f�f7��=B��n�XS4�2A�m��wk'��1��<@S_�G���?�/�$�PS��c�m�gb���?��f�k'�������5�f_�_�0k<E�2�#�JWg�ol91�&��p�����k�C&Y�l�C�o��Κ�)�����x<�[�$            x������ � �         �   x�u���0 D��+8p۲D=�I��[� .�R�P	����`2�d&3�C`qK�������A�zT���G,��;h���\�a��Ծ$���kR�Įp�JG���r���IF�"u0���x�1�f-d���Y��;�]=m��Ax�%��5�A���3��ف����xI(�Oj��w*�Xȹ�>σj)�����G?�ZX���m����tEQ^w�Z�            x�3�4����� ]     