PGDMP  1    9                |         
   hk_rms_dev    16.2    16.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    29179 
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
       public          postgres    false    227            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.sys_failed_job.id;
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
       public          postgres    false    224            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.sys_job.id;
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
       public          postgres    false    216            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.sys_migration.id;
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
       public          postgres    false    243            �           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mt_risk_dampak_id_dampak_seq OWNED BY public.mt_risk_dampak.id_dampak;
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
       public          postgres    false    245            �           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_risk_kemungkinan.id_kemungkinan;
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
       public          postgres    false    251            �           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_risk_kriteria_dampak.id_kriteria_dampak;
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
       public          postgres    false    255            �           0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.mt_risk_perlakuan_id_perluakuan_seq OWNED BY public.mt_risk_perlakuan.id_perluakuan;
          public          postgres    false    254            
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
       public          postgres    false    266            �           0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq OWNED BY public.mt_risk_sikap_terhadap_risiko.id_sikap_terhadap_risiko;
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
       public          postgres    false    262            �           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq OWNED BY public.mt_risk_taksonomi_area.id_taksonomi_area;
          public          postgres    false    261                       1259    31849 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq;
       public          postgres    false    264                        0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq OWNED BY public.mt_risk_taksonomi.id_taksonomi;
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
       public          postgres    false    260                       0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq OWNED BY public.mt_risk_taksonomi_objective.id_taksonomi_objective;
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
       public         heap    postgres    false            �            1259    31218    mt_risk_tingkat_id_tingkat_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_id_tingkat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mt_risk_tingkat_id_tingkat_seq;
       public          postgres    false    247                       0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mt_risk_tingkat_id_tingkat_seq OWNED BY public.mt_risk_tingkat.id_tingkat;
          public          postgres    false    246                        1259    31762    mt_risk_tingkat_perlakuan    TABLE     t   CREATE TABLE public.mt_risk_tingkat_perlakuan (
    id_tingkat bigint NOT NULL,
    id_perlakuan bigint NOT NULL
);
 -   DROP TABLE public.mt_risk_tingkat_perlakuan;
       public         heap    postgres    false                       1259    31787    mt_sdm_jabatan    TABLE     �  CREATE TABLE public.mt_sdm_jabatan (
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
       public          postgres    false    258                       0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq OWNED BY public.mt_sdm_jabatan.id_jabatan;
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
       public         heap    postgres    false                       1259    31874    risk_metrik_strategi_risiko    TABLE     �  CREATE TABLE public.risk_metrik_strategi_risiko (
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
    modified_by_desc character varying(200)
);
 /   DROP TABLE public.risk_metrik_strategi_risiko;
       public         heap    postgres    false                       1259    31873 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq;
       public          postgres    false    268                       0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq OWNED BY public.risk_metrik_strategi_risiko.id_metrik_strategi_risiko;
          public          postgres    false    267            �            1259    30886 
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
       public          postgres    false    231                       0    0    sys_action_id_action_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sys_action_id_action_seq OWNED BY public.sys_action.id_action;
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
       public          postgres    false    233                       0    0    sys_group_id_group_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sys_group_id_group_seq OWNED BY public.sys_group.id_group;
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
       public          postgres    false    239                       0    0     sys_group_menu_id_group_menu_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.sys_group_menu_id_group_menu_seq OWNED BY public.sys_group_menu.id_group_menu;
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
       public          postgres    false    237                       0    0    sys_log_id_log_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sys_log_id_log_seq OWNED BY public.sys_log.id_log;
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
       public          postgres    false    229            	           0    0    sys_menu_id_menu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_id_menu_seq OWNED BY public.sys_menu.id_menu;
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
       public          postgres    false    235            
           0    0    sys_setting_id_setting_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_setting_id_setting_seq OWNED BY public.sys_setting.id_setting;
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
       public          postgres    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_id_seq OWNED BY public.sys_user.id_user;
          public          postgres    false    217            �           2604    31187    mt_risk_dampak id_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_risk_dampak_id_dampak_seq'::regclass);
 G   ALTER TABLE public.mt_risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    31199 "   mt_risk_kemungkinan id_kemungkinan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_risk_kemungkinan_id_kemungkinan_seq'::regclass);
 Q   ALTER TABLE public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    31255 *   mt_risk_kriteria_dampak id_kriteria_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak DROP DEFAULT;
       public          postgres    false    250    251    251            �           2604    31757    mt_risk_perlakuan id_perluakuan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_perlakuan ALTER COLUMN id_perluakuan SET DEFAULT nextval('public.mt_risk_perlakuan_id_perluakuan_seq'::regclass);
 N   ALTER TABLE public.mt_risk_perlakuan ALTER COLUMN id_perluakuan DROP DEFAULT;
       public          postgres    false    255    254    255            �           2604    31869 6   mt_risk_sikap_terhadap_risiko id_sikap_terhadap_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko SET DEFAULT nextval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq'::regclass);
 e   ALTER TABLE public.mt_risk_sikap_terhadap_risiko ALTER COLUMN id_sikap_terhadap_risiko DROP DEFAULT;
       public          postgres    false    265    266    266            �           2604    31853    mt_risk_taksonomi id_taksonomi    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi ALTER COLUMN id_taksonomi SET DEFAULT nextval('public.mt_risk_taksonomi_id_taksonomi_seq'::regclass);
 M   ALTER TABLE public.mt_risk_taksonomi ALTER COLUMN id_taksonomi DROP DEFAULT;
       public          postgres    false    263    264    264            �           2604    31839 (   mt_risk_taksonomi_area id_taksonomi_area    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area SET DEFAULT nextval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq'::regclass);
 W   ALTER TABLE public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area DROP DEFAULT;
       public          postgres    false    261    262    262            �           2604    31832 2   mt_risk_taksonomi_objective id_taksonomi_objective    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective SET DEFAULT nextval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq'::regclass);
 a   ALTER TABLE public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective DROP DEFAULT;
       public          postgres    false    259    260    260            �           2604    31222    mt_risk_tingkat id_tingkat    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_risk_tingkat_id_tingkat_seq'::regclass);
 I   ALTER TABLE public.mt_risk_tingkat ALTER COLUMN id_tingkat DROP DEFAULT;
       public          postgres    false    247    246    247            �           2604    31790    mt_sdm_jabatan id_jabatan    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.mt_sdm_jabatan_id_jabatan_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_jabatan ALTER COLUMN id_jabatan DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    31877 5   risk_metrik_strategi_risiko id_metrik_strategi_risiko    DEFAULT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko SET DEFAULT nextval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq'::regclass);
 d   ALTER TABLE public.risk_metrik_strategi_risiko ALTER COLUMN id_metrik_strategi_risiko DROP DEFAULT;
       public          postgres    false    267    268    268            �           2604    30889    sys_action id_action    DEFAULT     |   ALTER TABLE ONLY public.sys_action ALTER COLUMN id_action SET DEFAULT nextval('public.sys_action_id_action_seq'::regclass);
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
       public          postgres    false    224    223    224            �           2604    30917    sys_log id_log    DEFAULT     p   ALTER TABLE ONLY public.sys_log ALTER COLUMN id_log SET DEFAULT nextval('public.sys_log_id_log_seq'::regclass);
 =   ALTER TABLE public.sys_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    30882    sys_menu id_menu    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.sys_menu_id_menu_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    29184    sys_migration id    DEFAULT     q   ALTER TABLE ONLY public.sys_migration ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 ?   ALTER TABLE public.sys_migration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    30908    sys_setting id_setting    DEFAULT     �   ALTER TABLE ONLY public.sys_setting ALTER COLUMN id_setting SET DEFAULT nextval('public.sys_setting_id_setting_seq'::regclass);
 E   ALTER TABLE public.sys_setting ALTER COLUMN id_setting DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    29191    sys_user id_user    DEFAULT     l   ALTER TABLE ONLY public.sys_user ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    31184    mt_risk_dampak 
   TABLE DATA           �   COPY public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, kode, rating, mulai, sampai, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    243   %.      �          0    31196    mt_risk_kemungkinan 
   TABLE DATA           F  COPY public.mt_risk_kemungkinan (id_kemungkinan, nama, kemungkinan_terjadi, created_at, updated_at, created_by, modified_by, frekuensi_kejadian, kode, rating, persentase, kemungkinan_terjadi_tahunan, frekuensi_kejadian_transaksi, persentase_mulai, persentase_sampai, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    245   B.      �          0    31252    mt_risk_kriteria_dampak 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    251   _.      �          0    31266    mt_risk_kriteria_dampak_detail 
   TABLE DATA           �   COPY public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    252   |.      �          0    31282    mt_risk_matrix 
   TABLE DATA           �   COPY public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    253   �.      �          0    31754    mt_risk_perlakuan 
   TABLE DATA           �   COPY public.mt_risk_perlakuan (id_perluakuan, nama, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    255   �.      �          0    31866    mt_risk_sikap_terhadap_risiko 
   TABLE DATA           �   COPY public.mt_risk_sikap_terhadap_risiko (id_sikap_terhadap_risiko, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    266   �.      �          0    31850    mt_risk_taksonomi 
   TABLE DATA           �   COPY public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    264   �.      �          0    31836    mt_risk_taksonomi_area 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, keterangan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    262   /      �          0    31829    mt_risk_taksonomi_objective 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    260   */      �          0    31219    mt_risk_tingkat 
   TABLE DATA           �   COPY public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, jenis, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    247   G/      �          0    31762    mt_risk_tingkat_perlakuan 
   TABLE DATA           M   COPY public.mt_risk_tingkat_perlakuan (id_tingkat, id_perlakuan) FROM stdin;
    public          postgres    false    256   d/      �          0    31787    mt_sdm_jabatan 
   TABLE DATA             COPY public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, urutan, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    258   �/      �          0    31233    mt_sdm_pegawai 
   TABLE DATA           �   COPY public.mt_sdm_pegawai (nid, email, position_id, nama_lengkap, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    248   �/      �          0    31243    mt_sdm_unit 
   TABLE DATA           �   COPY public.mt_sdm_unit (table_code, table_desc, is_aktif, kode_distrik, id_mig_dep, kode_lama, id_subunitkerja, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    249   �/      �          0    31874    risk_metrik_strategi_risiko 
   TABLE DATA           -  COPY public.risk_metrik_strategi_risiko (id_metrik_strategi_risiko, id_taksonomi_area, id_taksonomi, risk_appetite_statement, id_sikap_terhadap_risiko, paramater, satuan_ukuran, nilai_batasan, created_at, updated_at, created_by, modified_by, deleted_at, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    268   �/      �          0    30886 
   sys_action 
   TABLE DATA           �   COPY public.sys_action (id_action, nama, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    231   �/      �          0    29214 	   sys_cache 
   TABLE DATA           ;   COPY public.sys_cache (key, value, expiration) FROM stdin;
    public          postgres    false    221   �3      �          0    29221    sys_cache_lock 
   TABLE DATA           @   COPY public.sys_cache_lock (key, owner, expiration) FROM stdin;
    public          postgres    false    222   �4      �          0    29246    sys_failed_job 
   TABLE DATA           d   COPY public.sys_failed_job (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    227   �4      �          0    30898 	   sys_group 
   TABLE DATA           �   COPY public.sys_group (id_group, nama, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    233   5      �          0    30937    sys_group_action 
   TABLE DATA           D   COPY public.sys_group_action (id_group_menu, id_action) FROM stdin;
    public          postgres    false    240   �5      �          0    30921    sys_group_menu 
   TABLE DATA           �   COPY public.sys_group_menu (id_group_menu, id_group, id_menu, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    239   �5      �          0    29229    sys_job 
   TABLE DATA           f   COPY public.sys_job (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    224   6      �          0    29238    sys_job_batch 
   TABLE DATA           �   COPY public.sys_job_batch (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    225   96      �          0    30914    sys_log 
   TABLE DATA           �   COPY public.sys_log (page, activity, ip, activity_time, user_desc, action, table_name, id_log, created_at, updated_at, created_by, modified_by, created_by_desc, modified_by_desc, deleted_at) FROM stdin;
    public          postgres    false    237   V6      �          0    30879    sys_menu 
   TABLE DATA              COPY public.sys_menu (id_menu, id_parent_menu, nama, url, sort, icon, is_show, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    229   s6      �          0    29181    sys_migration 
   TABLE DATA           =   COPY public.sys_migration (id, migration, batch) FROM stdin;
    public          postgres    false    216   +;      �          0    29198    sys_password_reset_token 
   TABLE DATA           L   COPY public.sys_password_reset_token (email, token, created_at) FROM stdin;
    public          postgres    false    219   �;      �          0    29205    sys_session 
   TABLE DATA           b   COPY public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    220   <      �          0    30905    sys_setting 
   TABLE DATA           <   COPY public.sys_setting (id_setting, nama, isi) FROM stdin;
    public          postgres    false    235   z=      �          0    29188    sys_user 
   TABLE DATA           �   COPY public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt, deleted_at) FROM stdin;
    public          postgres    false    218   �=      �          0    30951    sys_user_group 
   TABLE DATA           ;   COPY public.sys_user_group (id_user, id_group) FROM stdin;
    public          postgres    false    241   z>                 0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    226                       0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    223                       0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          postgres    false    215                       0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.mt_risk_dampak_id_dampak_seq', 1, false);
          public          postgres    false    242                       0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.mt_risk_kemungkinan_id_kemungkinan_seq', 1, false);
          public          postgres    false    244                       0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq', 1, false);
          public          postgres    false    250                       0    0 #   mt_risk_perlakuan_id_perluakuan_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.mt_risk_perlakuan_id_perluakuan_seq', 1, false);
          public          postgres    false    254                       0    0 :   mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('public.mt_risk_sikap_terhadap_risiko_id_sikap_terhadap_risiko_seq', 1, false);
          public          postgres    false    265                       0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq', 1, false);
          public          postgres    false    261                       0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_risk_taksonomi_id_taksonomi_seq', 1, false);
          public          postgres    false    263                       0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq', 1, false);
          public          postgres    false    259                       0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mt_risk_tingkat_id_tingkat_seq', 1, false);
          public          postgres    false    246                       0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_sdm_jabatan_id_jabatan_seq', 1, false);
          public          postgres    false    257                       0    0 9   risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.risk_metrik_strategi_risiko_id_metrik_strategi_risiko_seq', 1, false);
          public          postgres    false    267                       0    0    sys_action_id_action_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sys_action_id_action_seq', 95, true);
          public          postgres    false    230                       0    0    sys_group_id_group_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_group_id_group_seq', 9, true);
          public          postgres    false    232                       0    0     sys_group_menu_id_group_menu_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 12, true);
          public          postgres    false    238                       0    0    sys_log_id_log_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sys_log_id_log_seq', 12211, true);
          public          postgres    false    236                       0    0    sys_menu_id_menu_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 61, true);
          public          postgres    false    228                       0    0    sys_setting_id_setting_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);
          public          postgres    false    234                        0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    217            �           2606    29227    sys_cache_lock cache_locks_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_cache_lock
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 I   ALTER TABLE ONLY public.sys_cache_lock DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    222            �           2606    29220    sys_cache cache_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sys_cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.sys_cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    221            �           2606    29254    sys_failed_job failed_jobs_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    227            �           2606    29256 &   sys_failed_job failed_jobs_uuid_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public.sys_failed_job
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 P   ALTER TABLE ONLY public.sys_failed_job DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    227                       2606    31834 0   mt_risk_taksonomi_objective idx_18d8a35225719b65 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective
    ADD CONSTRAINT idx_18d8a35225719b65 PRIMARY KEY (id_taksonomi_objective);
 Z   ALTER TABLE ONLY public.mt_risk_taksonomi_objective DROP CONSTRAINT idx_18d8a35225719b65;
       public            postgres    false    260                       2606    31792 #   mt_sdm_jabatan idx_1e38228f1edb51f5 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT idx_1e38228f1edb51f5 PRIMARY KEY (id_jabatan);
 M   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT idx_1e38228f1edb51f5;
       public            postgres    false    258                       2606    31857 &   mt_risk_taksonomi idx_ae01f0becb598a2e 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT idx_ae01f0becb598a2e PRIMARY KEY (id_taksonomi);
 P   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT idx_ae01f0becb598a2e;
       public            postgres    false    264                       2606    31843 +   mt_risk_taksonomi_area idx_efeea3ec186756aa 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT idx_efeea3ec186756aa PRIMARY KEY (id_taksonomi_area);
 U   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT idx_efeea3ec186756aa;
       public            postgres    false    262            �           2606    29244    sys_job_batch job_batches_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_job_batch
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.sys_job_batch DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    225            �           2606    29236    sys_job jobs_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sys_job DROP CONSTRAINT jobs_pkey;
       public            postgres    false    224            �           2606    29186    sys_migration migrations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sys_migration
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.sys_migration DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            �           2606    31194 "   mt_risk_dampak mt_risk_dampak_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_risk_dampak
    ADD CONSTRAINT mt_risk_dampak_pkey PRIMARY KEY (id_dampak);
 L   ALTER TABLE ONLY public.mt_risk_dampak DROP CONSTRAINT mt_risk_dampak_pkey;
       public            postgres    false    243            �           2606    31209 ,   mt_risk_kemungkinan mt_risk_kemungkinan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.mt_risk_kemungkinan
    ADD CONSTRAINT mt_risk_kemungkinan_pkey PRIMARY KEY (id_kemungkinan);
 V   ALTER TABLE ONLY public.mt_risk_kemungkinan DROP CONSTRAINT mt_risk_kemungkinan_pkey;
       public            postgres    false    245                       2606    31271 B   mt_risk_kriteria_dampak_detail mt_risk_kriteria_dampak_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT mt_risk_kriteria_dampak_detail_pkey PRIMARY KEY (id_kriteria_dampak, id_dampak);
 l   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT mt_risk_kriteria_dampak_detail_pkey;
       public            postgres    false    252    252                       2606    31260 4   mt_risk_kriteria_dampak mt_risk_kriteria_dampak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT mt_risk_kriteria_dampak_pkey PRIMARY KEY (id_kriteria_dampak);
 ^   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT mt_risk_kriteria_dampak_pkey;
       public            postgres    false    251            	           2606    31287 "   mt_risk_matrix mt_risk_matrix_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT mt_risk_matrix_pkey PRIMARY KEY (id_dampak, id_kemungkinan);
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT mt_risk_matrix_pkey;
       public            postgres    false    253    253                       2606    31761 (   mt_risk_perlakuan mt_risk_perlakuan_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.mt_risk_perlakuan
    ADD CONSTRAINT mt_risk_perlakuan_pkey PRIMARY KEY (id_perluakuan);
 R   ALTER TABLE ONLY public.mt_risk_perlakuan DROP CONSTRAINT mt_risk_perlakuan_pkey;
       public            postgres    false    255                       2606    31871 @   mt_risk_sikap_terhadap_risiko mt_risk_sikap_terhadap_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko
    ADD CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey PRIMARY KEY (id_sikap_terhadap_risiko);
 j   ALTER TABLE ONLY public.mt_risk_sikap_terhadap_risiko DROP CONSTRAINT mt_risk_sikap_terhadap_risiko_pkey;
       public            postgres    false    266                       2606    31766 8   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_pkey PRIMARY KEY (id_tingkat, id_perlakuan);
 b   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_pkey;
       public            postgres    false    256    256            �           2606    31232 $   mt_risk_tingkat mt_risk_tingkat_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_tingkat
    ADD CONSTRAINT mt_risk_tingkat_pkey PRIMARY KEY (id_tingkat);
 N   ALTER TABLE ONLY public.mt_risk_tingkat DROP CONSTRAINT mt_risk_tingkat_pkey;
       public            postgres    false    247                       2606    31242 "   mt_sdm_pegawai mt_sdm_pegawai_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT mt_sdm_pegawai_pkey PRIMARY KEY (nid);
 L   ALTER TABLE ONLY public.mt_sdm_pegawai DROP CONSTRAINT mt_sdm_pegawai_pkey;
       public            postgres    false    248                       2606    31250    mt_sdm_unit mt_sdm_unit_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT mt_sdm_unit_pkey PRIMARY KEY (table_code);
 F   ALTER TABLE ONLY public.mt_sdm_unit DROP CONSTRAINT mt_sdm_unit_pkey;
       public            postgres    false    249            �           2606    29204 3   sys_password_reset_token password_reset_tokens_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sys_password_reset_token
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 ]   ALTER TABLE ONLY public.sys_password_reset_token DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    219                       2606    31881 <   risk_metrik_strategi_risiko risk_metrik_strategi_risiko_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_metrik_strategi_risiko
    ADD CONSTRAINT risk_metrik_strategi_risiko_pkey PRIMARY KEY (id_metrik_strategi_risiko);
 f   ALTER TABLE ONLY public.risk_metrik_strategi_risiko DROP CONSTRAINT risk_metrik_strategi_risiko_pkey;
       public            postgres    false    268            �           2606    29211    sys_session sessions_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_session
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.sys_session DROP CONSTRAINT sessions_pkey;
       public            postgres    false    220            �           2606    30891    sys_action sys_action_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT sys_action_pk PRIMARY KEY (id_action);
 B   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT sys_action_pk;
       public            postgres    false    231            �           2606    30926     sys_group_menu sys_group_menu_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT sys_group_menu_pk PRIMARY KEY (id_group_menu);
 J   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT sys_group_menu_pk;
       public            postgres    false    239            �           2606    30903    sys_group sys_group_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sys_group
    ADD CONSTRAINT sys_group_pk PRIMARY KEY (id_group);
 @   ALTER TABLE ONLY public.sys_group DROP CONSTRAINT sys_group_pk;
       public            postgres    false    233            �           2606    31182    sys_log sys_log_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id_log);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public            postgres    false    237            �           2606    30884    sys_menu sys_menu_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pk PRIMARY KEY (id_menu);
 >   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pk;
       public            postgres    false    229            �           2606    30912    sys_setting sys_setting_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.sys_setting
    ADD CONSTRAINT sys_setting_pk PRIMARY KEY (id_setting);
 D   ALTER TABLE ONLY public.sys_setting DROP CONSTRAINT sys_setting_pk;
       public            postgres    false    235            �           2606    29197    sys_user users_email_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 E   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_email_unique;
       public            postgres    false    218            �           2606    29195    sys_user users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           1259    29237    jobs_queue_index    INDEX     E   CREATE INDEX jobs_queue_index ON public.sys_job USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    224            �           1259    29213    sessions_last_activity_index    INDEX     ]   CREATE INDEX sessions_last_activity_index ON public.sys_session USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    220            �           1259    29212    sessions_user_id_index    INDEX     Q   CREATE INDEX sessions_user_id_index ON public.sys_session USING btree (id_user);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    220                       2606    30892    sys_action aksi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT aksi_fk1 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 =   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT aksi_fk1;
       public          postgres    false    229    4847    231            "           2606    31272 2   mt_risk_kriteria_dampak_detail fk_41ba39047b02c6e5    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_41ba39047b02c6e5 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_41ba39047b02c6e5;
       public          postgres    false    251    252    4869            #           2606    31277 2   mt_risk_kriteria_dampak_detail fk_4d57df3881e291e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_4d57df3881e291e2 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_4d57df3881e291e2;
       public          postgres    false    4859    243    252            +           2606    31858 %   mt_risk_taksonomi fk_726c58c036e9bcdd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT fk_726c58c036e9bcdd FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 O   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT fk_726c58c036e9bcdd;
       public          postgres    false    262    4883    264            $           2606    31288 "   mt_risk_matrix fk_a4669bbd55458901    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_a4669bbd55458901 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_a4669bbd55458901;
       public          postgres    false    253    245    4861            *           2606    31844 *   mt_risk_taksonomi_area fk_a9d39025b9658c1d    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT fk_a9d39025b9658c1d FOREIGN KEY (id_taksonomi_objective) REFERENCES public.mt_risk_taksonomi_objective(id_taksonomi_objective);
 T   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT fk_a9d39025b9658c1d;
       public          postgres    false    260    262    4881            )           2606    31793 "   mt_sdm_jabatan fk_b743dfd89358fc4e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_b743dfd89358fc4e FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_b743dfd89358fc4e;
       public          postgres    false    258    249    4867            %           2606    31293 "   mt_risk_matrix fk_d414e4107f6c8462    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_d414e4107f6c8462 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_d414e4107f6c8462;
       public          postgres    false    243    4859    253            &           2606    31298 "   mt_risk_matrix fk_e3066883e2e9bb72    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_e3066883e2e9bb72 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_e3066883e2e9bb72;
       public          postgres    false    247    253    4863            !           2606    31261 +   mt_risk_kriteria_dampak fk_f9422fdc528daf94    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT fk_f9422fdc528daf94 FOREIGN KEY (id_induk) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 U   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT fk_f9422fdc528daf94;
       public          postgres    false    251    251    4869                       2606    30940 !   sys_group_action group_action_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk1 FOREIGN KEY (id_group_menu) REFERENCES public.sys_group_menu(id_group_menu) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk1;
       public          postgres    false    239    240    4857                       2606    30945 !   sys_group_action group_action_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk2 FOREIGN KEY (id_action) REFERENCES public.sys_action(id_action) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk2;
       public          postgres    false    231    4849    240                       2606    30927    sys_group_menu group_menu_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk1 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk1;
       public          postgres    false    233    239    4851                       2606    30932    sys_group_menu group_menu_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk2 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk2;
       public          postgres    false    229    239    4847            '           2606    31767 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk1 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk1;
       public          postgres    false    256    247    4863            (           2606    31772 7   mt_risk_tingkat_perlakuan mt_risk_tingkat_perlakuan_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan
    ADD CONSTRAINT mt_risk_tingkat_perlakuan_fk2 FOREIGN KEY (id_perlakuan) REFERENCES public.mt_risk_perlakuan(id_perluakuan) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.mt_risk_tingkat_perlakuan DROP CONSTRAINT mt_risk_tingkat_perlakuan_fk2;
       public          postgres    false    4875    256    255                       2606    30954 !   sys_user_group sys_user_group_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk1 FOREIGN KEY (id_user) REFERENCES public.sys_user(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk1;
       public          postgres    false    241    218    4826                        2606    30959 !   sys_user_group sys_user_group_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk2;
       public          postgres    false    4851    233    241            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�u�K��0D��)r�����C��	`/��E���2�O�7.Qd�Ym:���<�o�������x�~~<�����ʏ���������b�����q���W/���z���N�m]��}y}�%ռװ�&��D��s@M�- 	5��H$l�)a�guYPSFN|�t��Z׀�"�9A �P�4����Y��8PS�>��_���B��q�4xGM��ҝ ���Д��`M�p���j��)"�`M==��^���<� ƺ���2�������9A�5�0D��iJ8�� 7�s3��t�s]�i��	��l�Fb�y�4%��I���2fb:�ԅ5E�Ą��9�4��$��iJ8��ͦ)c$�?	�F�MS�%&�n؍�	�t4M	31�Უi���B:ouq�h�",1��W��	�ڛ�����pu�Ai���������&���u����:5n�)bofz@�!�����$º�&�׺���8T�uqŝ�5#�!�2Fi���ggF����4 �Ȯ(r/MOH��&M	�4���LS�(ͬ�ŗ�j�i��f� ]G���	��)a6sdԄQF3�n�I���a�n^	��f�֔0�92�~4M��g7�󚀚"��#��+CQ��̑��f3G���uUf3����D��G�͜ `�����fN�2;/����5e�f�S�-�4E�fN ge+��̉�,���̉��,��LL��q��M�i��I 7��)`$&\�7M	gb���7�}&��w(��j�I �CMS�HL"���F����`M31���Ň�i��I ��4��$�zi���$��i�2Fb̈́��>:4EXb"@O�i8zb"�y���s��D�s3����Y4�R�?ILS�%&�n��=1���m�fb"��	���~���Z��4      �   4  x��S�j�0<�c��Z=�K>��������S?����]T��s�;�N�v1�}�#�dT�(�i��V��t����{~Js>Ҷ�6�� �V����Н
��y"У悫�3�/i��x�[BgF������h����*9�dn;r��,=g�2K�Hd9� �0$�D	�?"`I��юx��-L],g�`Q��7;PQr4)Gp��a��=�x��,LMN�:#'����8�b;FT�C�]���9Ox�۽���t��M��~�z�0U��ZhQ/�U���&����*�˚�\��K�4�/��#      �      x������ � �      �      x������ � �      �   �   x���1�0Eg|
.�ʉm����,��0��(�Wa�AD�����O����?�o]��w��qH�>v���x�Y 	�O5�v�j��j��xMvh`$��C�)8C��F#eX��S�T��r��N��A.����".i�tE�}Z���p��Oӝ��2�      �   %   x�3�4�2�4bc 6�2�|# �ȏ���� S�a      �      x�3�4�?L�e�0�.���� c��      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x��XKo�F>s~O���'%��r3 0�leQI����Ҳ$�Т��~�~3;�[d��/UW�U����۪�c�K��e������LgF���U�n!b��-i�Ǫo����.n��.��d��8Cfch���b�Ε�uM��_JX��p�1���>���n�[陫g���`͘K��0Q7Ǭ{�V;z���C:�)�B�@�ī�F�\�$_�8��a;�ƞ��� a�tf��׮n��Gz ��m�oF�G�.��00�����|�f1B�({��ep̖�W8�.�3���(�J��sm�1���(�%lI~�V-�@��cx!X���9��g�5���.E�LCX#�J��,�a~Go����o���cEHQ6��u�X�G*�]���y��E��+�.0"+H������2c���O4j�x��a�E٬��`X���v<d�����#ނܭ����=)D�֢X^4	�"�s��ħSOkc�]TOv�b�&N)�f+k���Ζ�R�D-���ա�;��ؒ���á�Q϶��m�tqJq�����f�(r�b[o�=6z
��y�ΐ|dԸ
������(,&�03$�����U��o��]g��'���w�p�e�z5�}��V������Ŵ��؆F�)��Þ��[:밉U�FQd���a!�NN�v�j�:ơ��j@ru4j�I��`�[�+8|Hy�Y�$|�k���q�ꓐ�_��j��Xfݸ:�kqf���q��������c�q.Ϝh^޷�L�=!�KP#�����mlp���ƾncu!��v�=��%b�c�I4�	�������Ƃ�E��6H7������'v�q]�b��~�}�o�4���SB'$��	C���I�Fr��(G��cS����ñ�ǆ"b��.	%�P7a�q��,wV�0�X�<�&�P(9�GN��<�h�1��EY��)~�E�<6��ˊ7l*��3a0���t�O�D1zfy�ւŕ�oF�"���c����X �p�Ä���1����^
A�c,k���A��g։7j�`v�b*���'aP̦u2-�	��lZ/ܯ5��	}���8���
��@�X5���+ܵ	=��cx%!�7'SB�p���
�wXl�F��s�
�'����G0�Y����� ��W�N      �   �   x���K� ��u�0f�U�]L&�����`����>0�(!���a�*QѸߋ�g���^(�f�B�^A5Ak�gX�����5˅U�QW�%�x֑͓���a���T��1a���eN���d�����u>���%9�L�0�oF��|K����5�U��\�|�~�� ^vb�m      �      x������ � �      �   d  x�-�Q��0 ���W�qM.�(G��=��Ww�
�8
T�Ǣ�_����I��dҬr׷Ƚ�h����w/���U���4��2��<l"��D&��k�u��1!x:�s�_��H M�����F�9XCW�|+ǅc��E��v-����m	hyj�9�U_zU.�L�x˪�"�+F"z�ϣ�MB6�s<v�ܸ'�C��RX!�Z���S��qю[aL�����/`�&*m�cX�s�}�1�a��[}�%�+����O9�}1p�##L�2W{kӌ5o����wϢǇ�z���T�ˣ��D�t��6��#iB����Dl3�����p�8���5�[�[-ab��"�,�=�c�f��#c��      �      x������ � �      �   �   x�u���0 D��+8p۲D=�I��[� .�R�P	����`2�d&3�C`qK�������A�zT���G,��;h���\�a��Ծ$���kR�Įp�JG���r���IF�"u0���x�1�f-d���Y��;�]=m��Ax�%��5�A���3��ف����xI(�Oj��w*�Xȹ�>σj)�����G?�ZX���m����tEQ^w�Z�      �      x�3�4����� ]     