PGDMP      *    
            |            hk_rms    16.2    16.0 �   r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    26010    hk_rms    DATABASE     }   CREATE DATABASE hk_rms WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE hk_rms;
                postgres    false            �            1259    26012    comp_kebutuhan    TABLE     �  CREATE TABLE public.comp_kebutuhan (
    id_comp_kebutuhan integer NOT NULL,
    nama text,
    id_interval bigint,
    id_dokumen integer,
    is_file integer,
    url text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(100),
    modified_by_desc character varying(100),
    mapping text
);
 "   DROP TABLE public.comp_kebutuhan;
       public         heap    postgres    false            �            1259    26011 $   comp_kebutuhan_id_comp_kebutuhan_seq    SEQUENCE     �   CREATE SEQUENCE public.comp_kebutuhan_id_comp_kebutuhan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.comp_kebutuhan_id_comp_kebutuhan_seq;
       public          postgres    false    216            v           0    0 $   comp_kebutuhan_id_comp_kebutuhan_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.comp_kebutuhan_id_comp_kebutuhan_seq OWNED BY public.comp_kebutuhan.id_comp_kebutuhan;
          public          postgres    false    215            �            1259    26023    comp_penilaian    TABLE     �  CREATE TABLE public.comp_penilaian (
    id_comp_penilaian integer NOT NULL,
    id_comp_kebutuhan integer,
    periode_label character varying(45),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(100),
    modified_by_desc character varying(100),
    id_status_penilaian integer,
    keterangan text,
    id_jabatan_pereview bigint,
    nama_jabatan_pereview character varying(200),
    id_pereview integer,
    nama_pereview character varying(200),
    tahun character varying(4),
    id_unit character varying(20)
);
 "   DROP TABLE public.comp_penilaian;
       public         heap    postgres    false            �            1259    26036    comp_penilaian_files    TABLE     ^  CREATE TABLE public.comp_penilaian_files (
    id_comp_penilaian_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_comp_penilaian integer,
    jenis character varying(20) DEFAULT 'file'::character varying,
    url text
);
 (   DROP TABLE public.comp_penilaian_files;
       public         heap    postgres    false            �            1259    26035 0   comp_penilaian_files_id_comp_penilaian_files_seq    SEQUENCE     �   CREATE SEQUENCE public.comp_penilaian_files_id_comp_penilaian_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.comp_penilaian_files_id_comp_penilaian_files_seq;
       public          postgres    false    220            w           0    0 0   comp_penilaian_files_id_comp_penilaian_files_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.comp_penilaian_files_id_comp_penilaian_files_seq OWNED BY public.comp_penilaian_files.id_comp_penilaian_files;
          public          postgres    false    219            �            1259    26022 $   comp_penilaian_id_comp_penilaian_seq    SEQUENCE     �   CREATE SEQUENCE public.comp_penilaian_id_comp_penilaian_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.comp_penilaian_id_comp_penilaian_seq;
       public          postgres    false    218            x           0    0 $   comp_penilaian_id_comp_penilaian_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.comp_penilaian_id_comp_penilaian_seq OWNED BY public.comp_penilaian.id_comp_penilaian;
          public          postgres    false    217            �            1259    26047    contents    TABLE     �  CREATE TABLE public.contents (
    id_contents integer NOT NULL,
    contents text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    page character varying(200),
    title character varying(200),
    tgl_mulai_aktif date,
    tgl_akhir_aktif date
);
    DROP TABLE public.contents;
       public         heap    postgres    false            �            1259    26046    contents_id_contents_seq    SEQUENCE     �   CREATE SEQUENCE public.contents_id_contents_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contents_id_contents_seq;
       public          postgres    false    222            y           0    0    contents_id_contents_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contents_id_contents_seq OWNED BY public.contents.id_contents;
          public          postgres    false    221            �            1259    26056    dokumen    TABLE     J  CREATE TABLE public.dokumen (
    id_dokumen integer NOT NULL,
    is_aktif smallint DEFAULT 1,
    is_approved smallint,
    nomor_dokumen character varying(45),
    nama character varying(500),
    id_jenis_dokumen integer,
    tgl_upload date,
    tgl_disahkan date,
    id_diupload_oleh integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    keterangan text,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    file_url character varying(500),
    id_mig integer,
    id_unit character varying(10),
    id_jabatan bigint,
    id_kategori integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false            �            1259    26068    dokumen_files    TABLE     t  CREATE TABLE public.dokumen_files (
    id_dokumen_files bigint NOT NULL,
    client_name character varying(500),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_dokumen integer,
    jenis character varying(20) DEFAULT 'file'::character varying,
    url text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    id_dokumen_versi integer,
    folder_name character varying(500)
);
 !   DROP TABLE public.dokumen_files;
       public         heap    postgres    false            �            1259    26067 "   dokumen_files_id_dokumen_files_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_files_id_dokumen_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.dokumen_files_id_dokumen_files_seq;
       public          postgres    false    226            z           0    0 "   dokumen_files_id_dokumen_files_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.dokumen_files_id_dokumen_files_seq OWNED BY public.dokumen_files.id_dokumen_files;
          public          postgres    false    225            �            1259    26055    dokumen_id_dokumen_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_id_dokumen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.dokumen_id_dokumen_seq;
       public          postgres    false    224            {           0    0    dokumen_id_dokumen_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.dokumen_id_dokumen_seq OWNED BY public.dokumen.id_dokumen;
          public          postgres    false    223            �            1259    26077    dokumen_jabatan    TABLE     s   CREATE TABLE public.dokumen_jabatan (
    id_dokumen integer NOT NULL,
    id_jabatan bigint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.dokumen_jabatan;
       public         heap    postgres    false            �            1259    26081    dokumen_kriteria    TABLE     u   CREATE TABLE public.dokumen_kriteria (
    id_dokumen integer NOT NULL,
    id_kriteria bigint DEFAULT 0 NOT NULL
);
 $   DROP TABLE public.dokumen_kriteria;
       public         heap    postgres    false            �            1259    26085    dokumen_unit    TABLE     r   CREATE TABLE public.dokumen_unit (
    id_unit character varying(18) NOT NULL,
    id_dokumen integer NOT NULL
);
     DROP TABLE public.dokumen_unit;
       public         heap    postgres    false            �            1259    26092    dokumen_versi    TABLE     �  CREATE TABLE public.dokumen_versi (
    id_dokumen_versi bigint NOT NULL,
    id_dokumen integer,
    status character varying(50),
    catatan_revisi text,
    catatan_ajuan text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 !   DROP TABLE public.dokumen_versi;
       public         heap    postgres    false            �            1259    26091 "   dokumen_versi_id_dokumen_versi_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_versi_id_dokumen_versi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.dokumen_versi_id_dokumen_versi_seq;
       public          postgres    false    231            |           0    0 "   dokumen_versi_id_dokumen_versi_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.dokumen_versi_id_dokumen_versi_seq OWNED BY public.dokumen_versi.id_dokumen_versi;
          public          postgres    false    230            �            1259    26101    kpi    TABLE     W  CREATE TABLE public.kpi (
    id_kpi bigint NOT NULL,
    id_parent bigint,
    kode character varying(45),
    nama character varying(225),
    is_bersama integer DEFAULT 0,
    is_direktorat integer DEFAULT 0,
    is_korporat integer DEFAULT 0,
    is_nilai_akhir integer DEFAULT 0,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    jenis_realisasi character varying(45),
    id_mig integer,
    urutan integer
);
    DROP TABLE public.kpi;
       public         heap    postgres    false            �            1259    26114 
   kpi_config    TABLE     I  CREATE TABLE public.kpi_config (
    tahun character varying(4) NOT NULL,
    is_bersama integer,
    is_direktorat integer,
    is_korporat integer,
    jenis_realisasi character varying(45),
    id_kpi bigint NOT NULL,
    jenis_realisasi_direktorat character varying(45),
    jenis_realisasi_korporat character varying(45)
);
    DROP TABLE public.kpi_config;
       public         heap    postgres    false            �            1259    26100    kpi_id_kpi_seq    SEQUENCE     w   CREATE SEQUENCE public.kpi_id_kpi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.kpi_id_kpi_seq;
       public          postgres    false    233            }           0    0    kpi_id_kpi_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.kpi_id_kpi_seq OWNED BY public.kpi.id_kpi;
          public          postgres    false    232            �            1259    26121    kpi_individu    TABLE       CREATE TABLE public.kpi_individu (
    id_kpi integer NOT NULL,
    target character varying(100),
    pegawai character varying(100) DEFAULT '0'::character varying,
    id_pegawai integer,
    kategori character varying(50),
    id_kategori integer,
    is_setuju integer DEFAULT 1
);
     DROP TABLE public.kpi_individu;
       public         heap    postgres    false            �            1259    26120    kpi_individu_id_kpi_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_individu_id_kpi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.kpi_individu_id_kpi_seq;
       public          postgres    false    236            ~           0    0    kpi_individu_id_kpi_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.kpi_individu_id_kpi_seq OWNED BY public.kpi_individu.id_kpi;
          public          postgres    false    235            �            1259    26130 
   kpi_target    TABLE     �  CREATE TABLE public.kpi_target (
    id_kpi_target bigint NOT NULL,
    id_dit_bid character varying(20),
    id_subbid character varying(20),
    id_kpi bigint,
    satuan character varying(225),
    bobot double precision,
    bobot1 double precision,
    polarisasi character varying(100),
    target double precision,
    analisa text,
    tahun character varying(5),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    id_unit character varying(18),
    evaluasi text,
    total_realisasi double precision,
    realisasi_bobot character varying(45),
    persen_realisasi character varying(45),
    max_month integer,
    is_pic integer DEFAULT 0,
    bobot2 double precision,
    jenis character varying(45),
    definisi bytea,
    tujuan bytea,
    formula bytea
);
    DROP TABLE public.kpi_target;
       public         heap    postgres    false            �            1259    26144    kpi_target_evaluasi    TABLE     j  CREATE TABLE public.kpi_target_evaluasi (
    id_kpi_target_evaluasi bigint NOT NULL,
    id_kpi_target bigint,
    evaluasi text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 '   DROP TABLE public.kpi_target_evaluasi;
       public         heap    postgres    false            �            1259    26143 .   kpi_target_evaluasi_id_kpi_target_evaluasi_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_target_evaluasi_id_kpi_target_evaluasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.kpi_target_evaluasi_id_kpi_target_evaluasi_seq;
       public          postgres    false    240                       0    0 .   kpi_target_evaluasi_id_kpi_target_evaluasi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.kpi_target_evaluasi_id_kpi_target_evaluasi_seq OWNED BY public.kpi_target_evaluasi.id_kpi_target_evaluasi;
          public          postgres    false    239            �            1259    26154    kpi_target_files    TABLE     *  CREATE TABLE public.kpi_target_files (
    id_kpi_target_files integer NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    jenis_file character varying(45),
    id_kpi_target integer
);
 $   DROP TABLE public.kpi_target_files;
       public         heap    postgres    false            �            1259    26153 (   kpi_target_files_id_kpi_target_files_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_target_files_id_kpi_target_files_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.kpi_target_files_id_kpi_target_files_seq;
       public          postgres    false    242            �           0    0 (   kpi_target_files_id_kpi_target_files_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.kpi_target_files_id_kpi_target_files_seq OWNED BY public.kpi_target_files.id_kpi_target_files;
          public          postgres    false    241            �            1259    26129    kpi_target_id_kpi_target_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_target_id_kpi_target_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.kpi_target_id_kpi_target_seq;
       public          postgres    false    238            �           0    0    kpi_target_id_kpi_target_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.kpi_target_id_kpi_target_seq OWNED BY public.kpi_target.id_kpi_target;
          public          postgres    false    237            �            1259    26163    kpi_target_realisasi    TABLE     �  CREATE TABLE public.kpi_target_realisasi (
    id_kpi_target_realisasi bigint NOT NULL,
    id_kpi_target bigint,
    bulan character(2),
    nilai double precision,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    prosentase double precision
);
 (   DROP TABLE public.kpi_target_realisasi;
       public         heap    postgres    false            �            1259    26162 0   kpi_target_realisasi_id_kpi_target_realisasi_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_target_realisasi_id_kpi_target_realisasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.kpi_target_realisasi_id_kpi_target_realisasi_seq;
       public          postgres    false    244            �           0    0 0   kpi_target_realisasi_id_kpi_target_realisasi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.kpi_target_realisasi_id_kpi_target_realisasi_seq OWNED BY public.kpi_target_realisasi.id_kpi_target_realisasi;
          public          postgres    false    243            �            1259    26171    lost_incident    TABLE     �  CREATE TABLE public.lost_incident (
    id_lost_incident bigint NOT NULL,
    nama_kejadian character varying(200),
    pelaku character varying(200),
    kronologi character varying(4000),
    penyebab character varying(4000),
    dampak character varying(4000),
    waktu date,
    nilai_kerugian double precision,
    id_risiko bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    is_progress character varying(1),
    lokasi character varying(1000)
);
 !   DROP TABLE public.lost_incident;
       public         heap    postgres    false            �            1259    26180    lost_incident_files    TABLE     L  CREATE TABLE public.lost_incident_files (
    id_lost_incident_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_lost_incident bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 '   DROP TABLE public.lost_incident_files;
       public         heap    postgres    false            �            1259    26179 .   lost_incident_files_id_lost_incident_files_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_incident_files_id_lost_incident_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.lost_incident_files_id_lost_incident_files_seq;
       public          postgres    false    248            �           0    0 .   lost_incident_files_id_lost_incident_files_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.lost_incident_files_id_lost_incident_files_seq OWNED BY public.lost_incident_files.id_lost_incident_files;
          public          postgres    false    247            �            1259    26188    lost_incident_follow_up    TABLE     �  CREATE TABLE public.lost_incident_follow_up (
    id_follow_up bigint NOT NULL,
    aktifitas_pengendalian character varying(4000),
    biaya double precision,
    deadline date,
    is_segabai_tindakan_mitigasi character varying(1),
    is_sebagain_prosedur_control character varying(1),
    id_history_fu_terakhir bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    id_lost_incident bigint,
    id_dit_bid character varying(20),
    progress double precision
);
 +   DROP TABLE public.lost_incident_follow_up;
       public         heap    postgres    false            �            1259    26187 (   lost_incident_follow_up_id_follow_up_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_incident_follow_up_id_follow_up_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.lost_incident_follow_up_id_follow_up_seq;
       public          postgres    false    250            �           0    0 (   lost_incident_follow_up_id_follow_up_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.lost_incident_follow_up_id_follow_up_seq OWNED BY public.lost_incident_follow_up.id_follow_up;
          public          postgres    false    249            �            1259    26197    lost_incident_fu_files    TABLE     G  CREATE TABLE public.lost_incident_fu_files (
    id_follow_up_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_follow_up bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 *   DROP TABLE public.lost_incident_fu_files;
       public         heap    postgres    false            �            1259    26196 -   lost_incident_fu_files_id_follow_up_files_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_incident_fu_files_id_follow_up_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.lost_incident_fu_files_id_follow_up_files_seq;
       public          postgres    false    252            �           0    0 -   lost_incident_fu_files_id_follow_up_files_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.lost_incident_fu_files_id_follow_up_files_seq OWNED BY public.lost_incident_fu_files.id_follow_up_files;
          public          postgres    false    251            �            1259    26205    lost_incident_fu_p_files    TABLE     N  CREATE TABLE public.lost_incident_fu_p_files (
    id_follow_up_p_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_fu_progress bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 ,   DROP TABLE public.lost_incident_fu_p_files;
       public         heap    postgres    false            �            1259    26204 1   lost_incident_fu_p_files_id_follow_up_p_files_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_incident_fu_p_files_id_follow_up_p_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.lost_incident_fu_p_files_id_follow_up_p_files_seq;
       public          postgres    false    254            �           0    0 1   lost_incident_fu_p_files_id_follow_up_p_files_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.lost_incident_fu_p_files_id_follow_up_p_files_seq OWNED BY public.lost_incident_fu_p_files.id_follow_up_p_files;
          public          postgres    false    253                        1259    26215    lost_incident_fu_progress    TABLE     �  CREATE TABLE public.lost_incident_fu_progress (
    id_fu_progress bigint NOT NULL,
    progress double precision,
    hambatan_kendala character varying(4000),
    id_follow_up bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 -   DROP TABLE public.lost_incident_fu_progress;
       public         heap    postgres    false            �            1259    26214 ,   lost_incident_fu_progress_id_fu_progress_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_incident_fu_progress_id_fu_progress_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.lost_incident_fu_progress_id_fu_progress_seq;
       public          postgres    false    256            �           0    0 ,   lost_incident_fu_progress_id_fu_progress_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.lost_incident_fu_progress_id_fu_progress_seq OWNED BY public.lost_incident_fu_progress.id_fu_progress;
          public          postgres    false    255            �            1259    26170 "   lost_incident_id_lost_incident_seq    SEQUENCE     �   CREATE SEQUENCE public.lost_incident_id_lost_incident_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.lost_incident_id_lost_incident_seq;
       public          postgres    false    246            �           0    0 "   lost_incident_id_lost_incident_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.lost_incident_id_lost_incident_seq OWNED BY public.lost_incident.id_lost_incident;
          public          postgres    false    245                       1259    26224    mt_aspek_lingkungan    TABLE     �  CREATE TABLE public.mt_aspek_lingkungan (
    id_aspek_lingkungan integer NOT NULL,
    kode character(10) NOT NULL,
    nama character varying(50) NOT NULL,
    keterangan character(200) NOT NULL,
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 '   DROP TABLE public.mt_aspek_lingkungan;
       public         heap    postgres    false                       1259    26223 +   mt_aspek_lingkungan_id_aspek_lingkungan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_aspek_lingkungan_id_aspek_lingkungan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_aspek_lingkungan_id_aspek_lingkungan_seq;
       public          postgres    false    258            �           0    0 +   mt_aspek_lingkungan_id_aspek_lingkungan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_aspek_lingkungan_id_aspek_lingkungan_seq OWNED BY public.mt_aspek_lingkungan.id_aspek_lingkungan;
          public          postgres    false    257                       1259    26233    mt_bidang_pemeriksaan    TABLE     �  CREATE TABLE public.mt_bidang_pemeriksaan (
    id_bidang_pemeriksaan integer NOT NULL,
    nama character varying(200) NOT NULL,
    jenis character varying(45) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 )   DROP TABLE public.mt_bidang_pemeriksaan;
       public         heap    postgres    false                       1259    26232 /   mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq;
       public          postgres    false    260            �           0    0 /   mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq OWNED BY public.mt_bidang_pemeriksaan.id_bidang_pemeriksaan;
          public          postgres    false    259                       1259    26242    mt_interval    TABLE     *  CREATE TABLE public.mt_interval (
    id_interval bigint NOT NULL,
    nama character varying(200) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    konversi_bulan integer,
    jenis integer
);
    DROP TABLE public.mt_interval;
       public         heap    postgres    false                       1259    26241    mt_interval_id_interval_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_interval_id_interval_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.mt_interval_id_interval_seq;
       public          postgres    false    262            �           0    0    mt_interval_id_interval_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.mt_interval_id_interval_seq OWNED BY public.mt_interval.id_interval;
          public          postgres    false    261                       1259    26249    mt_jenis_audit_eksternal    TABLE     �   CREATE TABLE public.mt_jenis_audit_eksternal (
    id_jenis_audit_eksternal integer NOT NULL,
    nama character varying(200) NOT NULL
);
 ,   DROP TABLE public.mt_jenis_audit_eksternal;
       public         heap    postgres    false                       1259    26248 5   mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE public.mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq;
       public          postgres    false    264            �           0    0 5   mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq OWNED BY public.mt_jenis_audit_eksternal.id_jenis_audit_eksternal;
          public          postgres    false    263            
           1259    26256    mt_jenis_dokumen    TABLE     �   CREATE TABLE public.mt_jenis_dokumen (
    id_jenis_dokumen integer NOT NULL,
    is_ppd integer,
    nama character varying(45)
);
 $   DROP TABLE public.mt_jenis_dokumen;
       public         heap    postgres    false            	           1259    26255 %   mt_jenis_dokumen_id_jenis_dokumen_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_jenis_dokumen_id_jenis_dokumen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.mt_jenis_dokumen_id_jenis_dokumen_seq;
       public          postgres    false    266            �           0    0 %   mt_jenis_dokumen_id_jenis_dokumen_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.mt_jenis_dokumen_id_jenis_dokumen_seq OWNED BY public.mt_jenis_dokumen.id_jenis_dokumen;
          public          postgres    false    265                       1259    26263    mt_jenis_rtm    TABLE     �  CREATE TABLE public.mt_jenis_rtm (
    id_jenis_rtm integer NOT NULL,
    id_jenis_rtm_parent integer,
    jenis_masalah character varying(200) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
     DROP TABLE public.mt_jenis_rtm;
       public         heap    postgres    false                       1259    26262    mt_jenis_rtm_id_jenis_rtm_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_jenis_rtm_id_jenis_rtm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_jenis_rtm_id_jenis_rtm_seq;
       public          postgres    false    268            �           0    0    mt_jenis_rtm_id_jenis_rtm_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_jenis_rtm_id_jenis_rtm_seq OWNED BY public.mt_jenis_rtm.id_jenis_rtm;
          public          postgres    false    267                       1259    26272    mt_kategori    TABLE     �   CREATE TABLE public.mt_kategori (
    id_kategori integer NOT NULL,
    id_kategori_parent integer,
    nama character varying(200),
    is_aktif character(1),
    id_kategori_jenis integer,
    id_interval bigint,
    prosentase real
);
    DROP TABLE public.mt_kategori;
       public         heap    postgres    false                       1259    26271    mt_kategori_id_kategori_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_kategori_id_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.mt_kategori_id_kategori_seq;
       public          postgres    false    270            �           0    0    mt_kategori_id_kategori_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.mt_kategori_id_kategori_seq OWNED BY public.mt_kategori.id_kategori;
          public          postgres    false    269                       1259    26281    mt_kategori_jenis    TABLE     �   CREATE TABLE public.mt_kategori_jenis (
    id_kategori_jenis integer NOT NULL,
    nama character varying(45),
    is_aktif character(1)
);
 %   DROP TABLE public.mt_kategori_jenis;
       public         heap    postgres    false                       1259    26280 '   mt_kategori_jenis_id_kategori_jenis_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_kategori_jenis_id_kategori_jenis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.mt_kategori_jenis_id_kategori_jenis_seq;
       public          postgres    false    272            �           0    0 '   mt_kategori_jenis_id_kategori_jenis_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.mt_kategori_jenis_id_kategori_jenis_seq OWNED BY public.mt_kategori_jenis.id_kategori_jenis;
          public          postgres    false    271                       1259    26288    mt_kategori_kpi_individu    TABLE     �   CREATE TABLE public.mt_kategori_kpi_individu (
    id_kategori integer NOT NULL,
    nama character varying(200) DEFAULT '0'::character varying NOT NULL
);
 ,   DROP TABLE public.mt_kategori_kpi_individu;
       public         heap    postgres    false                       1259    26287 (   mt_kategori_kpi_individu_id_kategori_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_kategori_kpi_individu_id_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.mt_kategori_kpi_individu_id_kategori_seq;
       public          postgres    false    274            �           0    0 (   mt_kategori_kpi_individu_id_kategori_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.mt_kategori_kpi_individu_id_kategori_seq OWNED BY public.mt_kategori_kpi_individu.id_kategori;
          public          postgres    false    273                       1259    26296    mt_kriteria    TABLE     t  CREATE TABLE public.mt_kriteria (
    id_kriteria integer NOT NULL,
    id_kategori integer,
    kode character varying(20),
    nama character varying(2000),
    is_upload character(1),
    id_kriteria_parent integer,
    is_aktif character(1),
    id_interval integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    bobot real,
    tahun integer,
    id_unit character varying(18),
    id_kriteria_before integer,
    id_kriteria_parent1 integer,
    d integer,
    k integer,
    w integer,
    o integer,
    kode_lvl character(10),
    nama_lvl character varying(200),
    keterangan character varying(2000),
    keterangan1 character varying(2000),
    keterangan2 character varying(2000)
);
    DROP TABLE public.mt_kriteria;
       public         heap    postgres    false                       1259    26295    mt_kriteria_id_kriteria_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_kriteria_id_kriteria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.mt_kriteria_id_kriteria_seq;
       public          postgres    false    276            �           0    0    mt_kriteria_id_kriteria_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.mt_kriteria_id_kriteria_seq OWNED BY public.mt_kriteria.id_kriteria;
          public          postgres    false    275                       1259    26305    mt_kriteria_link    TABLE     ]   CREATE TABLE public.mt_kriteria_link (
    id_kriteria1 integer,
    id_kriteria2 integer
);
 $   DROP TABLE public.mt_kriteria_link;
       public         heap    postgres    false                       1259    26310    mt_maturity    TABLE     �   CREATE TABLE public.mt_maturity (
    tahun double precision NOT NULL,
    target double precision,
    realisasi double precision
);
    DROP TABLE public.mt_maturity;
       public         heap    postgres    false                       1259    26316    mt_message_template    TABLE     l  CREATE TABLE public.mt_message_template (
    id_message integer NOT NULL,
    msg character varying(4000) NOT NULL,
    is_user integer,
    created_date time(6) without time zone,
    modfied_date time(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 '   DROP TABLE public.mt_message_template;
       public         heap    postgres    false                       1259    26315 "   mt_message_template_id_message_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_message_template_id_message_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_message_template_id_message_seq;
       public          postgres    false    280            �           0    0 "   mt_message_template_id_message_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_message_template_id_message_seq OWNED BY public.mt_message_template.id_message;
          public          postgres    false    279                       1259    26325    mt_opp_dampak    TABLE     �  CREATE TABLE public.mt_opp_dampak (
    id_dampak bigint NOT NULL,
    nama character varying(300) NOT NULL,
    keterangan character varying(4000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    kode character varying(20) NOT NULL,
    rating double precision,
    mulai double precision,
    sampai double precision
);
 !   DROP TABLE public.mt_opp_dampak;
       public         heap    postgres    false                       1259    26324    mt_opp_dampak_id_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_opp_dampak_id_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.mt_opp_dampak_id_dampak_seq;
       public          postgres    false    282            �           0    0    mt_opp_dampak_id_dampak_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.mt_opp_dampak_id_dampak_seq OWNED BY public.mt_opp_dampak.id_dampak;
          public          postgres    false    281                       1259    26334    mt_opp_kelayakan    TABLE     u   CREATE TABLE public.mt_opp_kelayakan (
    id_kelayakan integer NOT NULL,
    nama character varying(45) NOT NULL
);
 $   DROP TABLE public.mt_opp_kelayakan;
       public         heap    postgres    false                       1259    26333 !   mt_opp_kelayakan_id_kelayakan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_opp_kelayakan_id_kelayakan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.mt_opp_kelayakan_id_kelayakan_seq;
       public          postgres    false    284            �           0    0 !   mt_opp_kelayakan_id_kelayakan_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.mt_opp_kelayakan_id_kelayakan_seq OWNED BY public.mt_opp_kelayakan.id_kelayakan;
          public          postgres    false    283                       1259    26341    mt_opp_kemungkinan    TABLE       CREATE TABLE public.mt_opp_kemungkinan (
    id_kemungkinan bigint NOT NULL,
    nama character varying(300) NOT NULL,
    deskripsi_kualitatif character varying(4000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    probabilitas character varying(50),
    insiden_sebelumnya character varying(4000),
    kode character varying(20) NOT NULL,
    rating double precision,
    mulai double precision,
    sampai double precision
);
 &   DROP TABLE public.mt_opp_kemungkinan;
       public         heap    postgres    false                       1259    26340 %   mt_opp_kemungkinan_id_kemungkinan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_opp_kemungkinan_id_kemungkinan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.mt_opp_kemungkinan_id_kemungkinan_seq;
       public          postgres    false    286            �           0    0 %   mt_opp_kemungkinan_id_kemungkinan_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.mt_opp_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_opp_kemungkinan.id_kemungkinan;
          public          postgres    false    285                        1259    26350    mt_opp_kriteria_dampak    TABLE     �   CREATE TABLE public.mt_opp_kriteria_dampak (
    id_kriteria_dampak bigint NOT NULL,
    nama character varying(200),
    id_induk bigint,
    kode character varying(20)
);
 *   DROP TABLE public.mt_opp_kriteria_dampak;
       public         heap    postgres    false            !           1259    26357    mt_opp_kriteria_dampak_detail    TABLE     �   CREATE TABLE public.mt_opp_kriteria_dampak_detail (
    id_kriteria_dampak bigint NOT NULL,
    id_dampak bigint NOT NULL,
    keterangan character varying(400)
);
 1   DROP TABLE public.mt_opp_kriteria_dampak_detail;
       public         heap    postgres    false                       1259    26349 -   mt_opp_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_opp_kriteria_dampak_id_kriteria_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.mt_opp_kriteria_dampak_id_kriteria_dampak_seq;
       public          postgres    false    288            �           0    0 -   mt_opp_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.mt_opp_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_opp_kriteria_dampak.id_kriteria_dampak;
          public          postgres    false    287            "           1259    26363    mt_opp_matrix    TABLE     �   CREATE TABLE public.mt_opp_matrix (
    id_dampak bigint NOT NULL,
    id_kemungkinan bigint NOT NULL,
    id_tingkat bigint,
    css character varying(200)
);
 !   DROP TABLE public.mt_opp_matrix;
       public         heap    postgres    false            $           1259    26371    mt_opp_tingkat    TABLE     �   CREATE TABLE public.mt_opp_tingkat (
    id_tingkat bigint NOT NULL,
    nama character varying(20),
    warna character varying(20),
    penanganan character varying(4000)
);
 "   DROP TABLE public.mt_opp_tingkat;
       public         heap    postgres    false            #           1259    26370    mt_opp_tingkat_id_tingkat_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_opp_tingkat_id_tingkat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_opp_tingkat_id_tingkat_seq;
       public          postgres    false    292            �           0    0    mt_opp_tingkat_id_tingkat_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_opp_tingkat_id_tingkat_seq OWNED BY public.mt_opp_tingkat.id_tingkat;
          public          postgres    false    291            &           1259    26380    mt_pb_kategori    TABLE     �   CREATE TABLE public.mt_pb_kategori (
    id_kategori bigint NOT NULL,
    nama character varying(200) NOT NULL,
    tgl_mulai_efektif timestamp without time zone,
    tgl_akhir_efektif timestamp without time zone,
    kode character varying(20)
);
 "   DROP TABLE public.mt_pb_kategori;
       public         heap    postgres    false            %           1259    26379    mt_pb_kategori_id_kategori_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_pb_kategori_id_kategori_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mt_pb_kategori_id_kategori_seq;
       public          postgres    false    294            �           0    0    mt_pb_kategori_id_kategori_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mt_pb_kategori_id_kategori_seq OWNED BY public.mt_pb_kategori.id_kategori;
          public          postgres    false    293            (           1259    26387    mt_pb_kelompok_proses    TABLE       CREATE TABLE public.mt_pb_kelompok_proses (
    id_kelompok_proses bigint NOT NULL,
    nama character varying(200) NOT NULL,
    tgl_mulai_efektif timestamp without time zone,
    tgl_akhir_efektif timestamp without time zone,
    kode character varying(20),
    id_kategori bigint
);
 )   DROP TABLE public.mt_pb_kelompok_proses;
       public         heap    postgres    false            '           1259    26386 ,   mt_pb_kelompok_proses_id_kelompok_proses_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_pb_kelompok_proses_id_kelompok_proses_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.mt_pb_kelompok_proses_id_kelompok_proses_seq;
       public          postgres    false    296            �           0    0 ,   mt_pb_kelompok_proses_id_kelompok_proses_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.mt_pb_kelompok_proses_id_kelompok_proses_seq OWNED BY public.mt_pb_kelompok_proses.id_kelompok_proses;
          public          postgres    false    295            *           1259    26395    mt_pb_nama_proses    TABLE       CREATE TABLE public.mt_pb_nama_proses (
    id_nama_proses bigint NOT NULL,
    nama character varying(200) NOT NULL,
    tgl_mulai_efektif timestamp without time zone,
    tgl_akhir_efektif timestamp without time zone,
    kode character varying(20),
    id_kelompok_proses bigint
);
 %   DROP TABLE public.mt_pb_nama_proses;
       public         heap    postgres    false            )           1259    26394 $   mt_pb_nama_proses_id_nama_proses_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_pb_nama_proses_id_nama_proses_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.mt_pb_nama_proses_id_nama_proses_seq;
       public          postgres    false    298            �           0    0 $   mt_pb_nama_proses_id_nama_proses_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.mt_pb_nama_proses_id_nama_proses_seq OWNED BY public.mt_pb_nama_proses.id_nama_proses;
          public          postgres    false    297            ,           1259    26403    mt_pemeriksaan_checklist    TABLE     �  CREATE TABLE public.mt_pemeriksaan_checklist (
    id_checklist integer NOT NULL,
    nama character varying(500),
    id_checklist_parent integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    jenis character varying(50)
);
 ,   DROP TABLE public.mt_pemeriksaan_checklist;
       public         heap    postgres    false            +           1259    26402 )   mt_pemeriksaan_checklist_id_checklist_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_pemeriksaan_checklist_id_checklist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.mt_pemeriksaan_checklist_id_checklist_seq;
       public          postgres    false    300            �           0    0 )   mt_pemeriksaan_checklist_id_checklist_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.mt_pemeriksaan_checklist_id_checklist_seq OWNED BY public.mt_pemeriksaan_checklist.id_checklist;
          public          postgres    false    299            .           1259    26413    mt_pemeriksaan_jenis_akomodasi    TABLE     }   CREATE TABLE public.mt_pemeriksaan_jenis_akomodasi (
    id_jenis integer NOT NULL,
    nama_jenis character varying(200)
);
 2   DROP TABLE public.mt_pemeriksaan_jenis_akomodasi;
       public         heap    postgres    false            -           1259    26412 +   mt_pemeriksaan_jenis_akomodasi_id_jenis_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_pemeriksaan_jenis_akomodasi_id_jenis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_pemeriksaan_jenis_akomodasi_id_jenis_seq;
       public          postgres    false    302            �           0    0 +   mt_pemeriksaan_jenis_akomodasi_id_jenis_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_pemeriksaan_jenis_akomodasi_id_jenis_seq OWNED BY public.mt_pemeriksaan_jenis_akomodasi.id_jenis;
          public          postgres    false    301            0           1259    26420    mt_pemeriksaan_kka    TABLE       CREATE TABLE public.mt_pemeriksaan_kka (
    id_kka integer NOT NULL,
    nomor_kka character varying(45),
    nama character varying(500),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    keterangan text,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision
);
 &   DROP TABLE public.mt_pemeriksaan_kka;
       public         heap    postgres    false            /           1259    26419    mt_pemeriksaan_kka_id_kka_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_pemeriksaan_kka_id_kka_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_pemeriksaan_kka_id_kka_seq;
       public          postgres    false    304            �           0    0    mt_pemeriksaan_kka_id_kka_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_pemeriksaan_kka_id_kka_seq OWNED BY public.mt_pemeriksaan_kka.id_kka;
          public          postgres    false    303            2           1259    26429    mt_periode_tw    TABLE     +  CREATE TABLE public.mt_periode_tw (
    id_periode_tw bigint NOT NULL,
    nama character varying(100) NOT NULL,
    bulan_mulai character varying(2) NOT NULL,
    bulan_akhir character varying(2) NOT NULL,
    tgl_bulan_le_mulai character varying(7),
    tgl_bulan_le_akhir character varying(7)
);
 !   DROP TABLE public.mt_periode_tw;
       public         heap    postgres    false            1           1259    26428    mt_periode_tw_id_periode_tw_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_periode_tw_id_periode_tw_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.mt_periode_tw_id_periode_tw_seq;
       public          postgres    false    306            �           0    0    mt_periode_tw_id_periode_tw_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.mt_periode_tw_id_periode_tw_seq OWNED BY public.mt_periode_tw.id_periode_tw;
          public          postgres    false    305            4           1259    26436    mt_ppd    TABLE     e   CREATE TABLE public.mt_ppd (
    id_ppd integer NOT NULL,
    nama character varying(45) NOT NULL
);
    DROP TABLE public.mt_ppd;
       public         heap    postgres    false            3           1259    26435    mt_ppd_id_ppd_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_ppd_id_ppd_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.mt_ppd_id_ppd_seq;
       public          postgres    false    308            �           0    0    mt_ppd_id_ppd_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.mt_ppd_id_ppd_seq OWNED BY public.mt_ppd.id_ppd;
          public          postgres    false    307            5           1259    26442    mt_prioritas    TABLE     �  CREATE TABLE public.mt_prioritas (
    id_prioritas integer NOT NULL,
    nama character varying(50),
    warna character varying(50),
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    keterangan text
);
     DROP TABLE public.mt_prioritas;
       public         heap    postgres    false            7           1259    26450    mt_rating_spi    TABLE     m   CREATE TABLE public.mt_rating_spi (
    id_rating integer NOT NULL,
    nama_rating character varying(50)
);
 !   DROP TABLE public.mt_rating_spi;
       public         heap    postgres    false            6           1259    26449    mt_rating_spi_id_rating_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_rating_spi_id_rating_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.mt_rating_spi_id_rating_seq;
       public          postgres    false    311            �           0    0    mt_rating_spi_id_rating_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.mt_rating_spi_id_rating_seq OWNED BY public.mt_rating_spi.id_rating;
          public          postgres    false    310            9           1259    26457    mt_risk_dampak    TABLE     �  CREATE TABLE public.mt_risk_dampak (
    id_dampak bigint NOT NULL,
    nama character varying(300) NOT NULL,
    keterangan character varying(4000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    kode character varying(20) NOT NULL,
    rating double precision,
    mulai double precision,
    sampai double precision,
    nama_peluang character varying(300),
    ketarangan_peluang character varying(4000)
);
 "   DROP TABLE public.mt_risk_dampak;
       public         heap    postgres    false            8           1259    26456    mt_risk_dampak_id_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_dampak_id_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.mt_risk_dampak_id_dampak_seq;
       public          postgres    false    313            �           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mt_risk_dampak_id_dampak_seq OWNED BY public.mt_risk_dampak.id_dampak;
          public          postgres    false    312            ;           1259    26466    mt_risk_efektif_m    TABLE       CREATE TABLE public.mt_risk_efektif_m (
    id_efektif_m bigint NOT NULL,
    nama character varying(200) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint
);
 %   DROP TABLE public.mt_risk_efektif_m;
       public         heap    postgres    false            <           1259    26472    mt_risk_efektif_m_bobot    TABLE     �   CREATE TABLE public.mt_risk_efektif_m_bobot (
    id_efektif_m bigint,
    id_efektif_m_jawaban bigint,
    bobot double precision,
    rekomendasi character varying(2000)
);
 +   DROP TABLE public.mt_risk_efektif_m_bobot;
       public         heap    postgres    false            :           1259    26465 "   mt_risk_efektif_m_id_efektif_m_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektif_m_id_efektif_m_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_risk_efektif_m_id_efektif_m_seq;
       public          postgres    false    315            �           0    0 "   mt_risk_efektif_m_id_efektif_m_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_risk_efektif_m_id_efektif_m_seq OWNED BY public.mt_risk_efektif_m.id_efektif_m;
          public          postgres    false    314            >           1259    26480    mt_risk_efektif_m_jawaban    TABLE     �   CREATE TABLE public.mt_risk_efektif_m_jawaban (
    id_efektif_m_jawaban bigint NOT NULL,
    nama character varying(200) NOT NULL
);
 -   DROP TABLE public.mt_risk_efektif_m_jawaban;
       public         heap    postgres    false            =           1259    26479 2   mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq;
       public          postgres    false    318            �           0    0 2   mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq OWNED BY public.mt_risk_efektif_m_jawaban.id_efektif_m_jawaban;
          public          postgres    false    317            @           1259    26487    mt_risk_efektif_m_pengukuran    TABLE       CREATE TABLE public.mt_risk_efektif_m_pengukuran (
    id_pengukuran bigint NOT NULL,
    skor_bawah double precision NOT NULL,
    skor_atas double precision,
    efektifitas_mitigasi character varying(100) NOT NULL,
    diskripsi_kriteria character varying(500) NOT NULL
);
 0   DROP TABLE public.mt_risk_efektif_m_pengukuran;
       public         heap    postgres    false            ?           1259    26486 .   mt_risk_efektif_m_pengukuran_id_pengukuran_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektif_m_pengukuran_id_pengukuran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_efektif_m_pengukuran_id_pengukuran_seq;
       public          postgres    false    320            �           0    0 .   mt_risk_efektif_m_pengukuran_id_pengukuran_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_efektif_m_pengukuran_id_pengukuran_seq OWNED BY public.mt_risk_efektif_m_pengukuran.id_pengukuran;
          public          postgres    false    319            B           1259    26496    mt_risk_efektifitas    TABLE     �  CREATE TABLE public.mt_risk_efektifitas (
    id_efektifitas bigint NOT NULL,
    nama character varying(200) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    need_lampiran character varying(1) DEFAULT '0'::character varying,
    need_explanation character varying(1) DEFAULT '0'::character varying
);
 '   DROP TABLE public.mt_risk_efektifitas;
       public         heap    postgres    false            C           1259    26504    mt_risk_efektifitas_bobot    TABLE     �   CREATE TABLE public.mt_risk_efektifitas_bobot (
    id_efektifitas bigint,
    id_efektifitas_jawaban bigint,
    bobot double precision
);
 -   DROP TABLE public.mt_risk_efektifitas_bobot;
       public         heap    postgres    false            A           1259    26495 &   mt_risk_efektifitas_id_efektifitas_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektifitas_id_efektifitas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.mt_risk_efektifitas_id_efektifitas_seq;
       public          postgres    false    322            �           0    0 &   mt_risk_efektifitas_id_efektifitas_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.mt_risk_efektifitas_id_efektifitas_seq OWNED BY public.mt_risk_efektifitas.id_efektifitas;
          public          postgres    false    321            E           1259    26510    mt_risk_efektifitas_jawaban    TABLE     �   CREATE TABLE public.mt_risk_efektifitas_jawaban (
    id_efektifitas_jawaban bigint NOT NULL,
    nama character varying(200) NOT NULL
);
 /   DROP TABLE public.mt_risk_efektifitas_jawaban;
       public         heap    postgres    false            D           1259    26509 6   mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq;
       public          postgres    false    325            �           0    0 6   mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq OWNED BY public.mt_risk_efektifitas_jawaban.id_efektifitas_jawaban;
          public          postgres    false    324            G           1259    26517    mt_risk_efektifitas_pengukuran    TABLE     @  CREATE TABLE public.mt_risk_efektifitas_pengukuran (
    id_pengukuran bigint NOT NULL,
    skor_bawah double precision,
    skor_atas double precision,
    efektifitas character varying(100),
    diskripsi_kriteria character varying(500),
    faktor_terhadap_risiko double precision,
    warna character varying(20)
);
 2   DROP TABLE public.mt_risk_efektifitas_pengukuran;
       public         heap    postgres    false            F           1259    26516 0   mt_risk_efektifitas_pengukuran_id_pengukuran_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_efektifitas_pengukuran_id_pengukuran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.mt_risk_efektifitas_pengukuran_id_pengukuran_seq;
       public          postgres    false    327            �           0    0 0   mt_risk_efektifitas_pengukuran_id_pengukuran_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_efektifitas_pengukuran_id_pengukuran_seq OWNED BY public.mt_risk_efektifitas_pengukuran.id_pengukuran;
          public          postgres    false    326            I           1259    26526    mt_risk_kemungkinan    TABLE     �  CREATE TABLE public.mt_risk_kemungkinan (
    id_kemungkinan bigint NOT NULL,
    nama character varying(300) NOT NULL,
    deskripsi_kualitatif character varying(4000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    probabilitas character varying(50),
    insiden_sebelumnya character varying(4000),
    kode character varying(20) NOT NULL,
    rating double precision,
    mulai double precision,
    sampai double precision,
    probabilitas_non_rutin character varying(50),
    nama_non_rutin character varying(300),
    deskripsi_kualitatif_non_rutin character varying(4000)
);
 '   DROP TABLE public.mt_risk_kemungkinan;
       public         heap    postgres    false            H           1259    26525 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq;
       public          postgres    false    329            �           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.mt_risk_kemungkinan_id_kemungkinan_seq OWNED BY public.mt_risk_kemungkinan.id_kemungkinan;
          public          postgres    false    328            K           1259    26535    mt_risk_kriteria_dampak    TABLE     �   CREATE TABLE public.mt_risk_kriteria_dampak (
    id_kriteria_dampak bigint NOT NULL,
    nama character varying(200),
    id_induk bigint,
    kode character varying(20),
    rutin_non_rutin character varying(20)
);
 +   DROP TABLE public.mt_risk_kriteria_dampak;
       public         heap    postgres    false            L           1259    26542    mt_risk_kriteria_dampak_detail    TABLE     �   CREATE TABLE public.mt_risk_kriteria_dampak_detail (
    id_kriteria_dampak bigint NOT NULL,
    id_dampak bigint NOT NULL,
    keterangan character varying(400)
);
 2   DROP TABLE public.mt_risk_kriteria_dampak_detail;
       public         heap    postgres    false            J           1259    26534 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq;
       public          postgres    false    331            �           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq OWNED BY public.mt_risk_kriteria_dampak.id_kriteria_dampak;
          public          postgres    false    330            M           1259    26548    mt_risk_matrix    TABLE     �   CREATE TABLE public.mt_risk_matrix (
    id_dampak bigint NOT NULL,
    id_kemungkinan bigint NOT NULL,
    id_tingkat bigint,
    css character varying(200)
);
 "   DROP TABLE public.mt_risk_matrix;
       public         heap    postgres    false            O           1259    26556    mt_risk_taksonomi    TABLE       CREATE TABLE public.mt_risk_taksonomi (
    id_taksonomi bigint NOT NULL,
    kode character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    id_taksonomi_area bigint,
    is_regulasi smallint,
    penjelasan character varying(1000),
    is_aktif smallint
);
 %   DROP TABLE public.mt_risk_taksonomi;
       public         heap    postgres    false            P           1259    26565    mt_risk_taksonomi_appetite    TABLE     �   CREATE TABLE public.mt_risk_taksonomi_appetite (
    id_taksonomi bigint NOT NULL,
    tahun double precision NOT NULL,
    id_kemungkinan bigint NOT NULL,
    id_dampak bigint NOT NULL,
    id_taksonomi_area bigint
);
 .   DROP TABLE public.mt_risk_taksonomi_appetite;
       public         heap    postgres    false            R           1259    26572    mt_risk_taksonomi_area    TABLE     g  CREATE TABLE public.mt_risk_taksonomi_area (
    id_taksonomi_area bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(200) NOT NULL,
    id_taksonomi_objective bigint,
    tgl_mulai_efektif timestamp without time zone,
    tgl_akhir_efektif timestamp without time zone,
    keterangan text,
    jenis character varying(50)
);
 *   DROP TABLE public.mt_risk_taksonomi_area;
       public         heap    postgres    false            Q           1259    26571 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq;
       public          postgres    false    338            �           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.mt_risk_taksonomi_area_id_taksonomi_area_seq OWNED BY public.mt_risk_taksonomi_area.id_taksonomi_area;
          public          postgres    false    337            N           1259    26555 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq;
       public          postgres    false    335            �           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mt_risk_taksonomi_id_taksonomi_seq OWNED BY public.mt_risk_taksonomi.id_taksonomi;
          public          postgres    false    334            T           1259    26582    mt_risk_taksonomi_objective    TABLE     M  CREATE TABLE public.mt_risk_taksonomi_objective (
    id_taksonomi_objective bigint NOT NULL,
    kode character varying(5) NOT NULL,
    nama character varying(200) NOT NULL,
    tgl_mulai_efektif timestamp without time zone,
    tgl_akhir_efektif timestamp without time zone,
    id_mig integer,
    jenis character varying(50)
);
 /   DROP TABLE public.mt_risk_taksonomi_objective;
       public         heap    postgres    false            S           1259    26581 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq;
       public          postgres    false    340            �           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq OWNED BY public.mt_risk_taksonomi_objective.id_taksonomi_objective;
          public          postgres    false    339            V           1259    26589    mt_risk_tingkat    TABLE     2  CREATE TABLE public.mt_risk_tingkat (
    id_tingkat bigint NOT NULL,
    nama character varying(20),
    warna character varying(20),
    penanganan character varying(4000),
    nama_peluang character varying(20),
    warna_peluang character varying(20),
    penanganan_peluang character varying(4000)
);
 #   DROP TABLE public.mt_risk_tingkat;
       public         heap    postgres    false            U           1259    26588    mt_risk_tingkat_id_tingkat_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_risk_tingkat_id_tingkat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mt_risk_tingkat_id_tingkat_seq;
       public          postgres    false    342            �           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mt_risk_tingkat_id_tingkat_seq OWNED BY public.mt_risk_tingkat.id_tingkat;
          public          postgres    false    341            W           1259    26597    mt_sdm_dit_bid    TABLE     �   CREATE TABLE public.mt_sdm_dit_bid (
    code character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    is_aktif character varying(1) DEFAULT '1'::character varying
);
 "   DROP TABLE public.mt_sdm_dit_bid;
       public         heap    postgres    false            Y           1259    26604    mt_sdm_jabatan    TABLE     �  CREATE TABLE public.mt_sdm_jabatan (
    id_jabatan bigint NOT NULL,
    nama character varying(200) NOT NULL,
    id_unit character varying(18),
    position_id character varying(20),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    tgl_mulai_efektif date,
    tgl_akhir_efektif date,
    id_jabatan_parent bigint,
    superior_id character varying(20),
    id_kategori character varying(20),
    id_jenjang character varying(20),
    id_tipe_unit character varying(20),
    id_dit_bid character varying(20),
    id_subbid character varying(20),
    urutan double precision,
    id_sdm_level integer
);
 "   DROP TABLE public.mt_sdm_jabatan;
       public         heap    postgres    false            X           1259    26603    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq;
       public          postgres    false    345            �           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_jabatan_id_jabatan_seq OWNED BY public.mt_sdm_jabatan.id_jabatan;
          public          postgres    false    344            Z           1259    26617    mt_sdm_jenjang    TABLE     �   CREATE TABLE public.mt_sdm_jenjang (
    code character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    is_aktif character varying(1) DEFAULT '1'::character varying
);
 "   DROP TABLE public.mt_sdm_jenjang;
       public         heap    postgres    false            [           1259    26623    mt_sdm_kategori    TABLE     �   CREATE TABLE public.mt_sdm_kategori (
    code character varying(20) NOT NULL,
    nama character varying(200),
    is_aktif character varying(1)
);
 #   DROP TABLE public.mt_sdm_kategori;
       public         heap    postgres    false            ]           1259    26629    mt_sdm_level    TABLE     �   CREATE TABLE public.mt_sdm_level (
    id_sdm_level integer NOT NULL,
    level integer,
    nama character varying(100),
    is_aktif integer
);
     DROP TABLE public.mt_sdm_level;
       public         heap    postgres    false            \           1259    26628    mt_sdm_level_id_sdm_level_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_level_id_sdm_level_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.mt_sdm_level_id_sdm_level_seq;
       public          postgres    false    349            �           0    0    mt_sdm_level_id_sdm_level_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.mt_sdm_level_id_sdm_level_seq OWNED BY public.mt_sdm_level.id_sdm_level;
          public          postgres    false    348            ^           1259    26635    mt_sdm_pegawai    TABLE     �   CREATE TABLE public.mt_sdm_pegawai (
    nid character varying(10) NOT NULL,
    email character varying(500),
    position_id character varying(10),
    nama_lengkap character varying(500)
);
 "   DROP TABLE public.mt_sdm_pegawai;
       public         heap    postgres    false            `           1259    26643    mt_sdm_struktur    TABLE     '  CREATE TABLE public.mt_sdm_struktur (
    id_struktur bigint NOT NULL,
    kode character varying(18) NOT NULL,
    nama character varying(200) NOT NULL,
    tgl_mulai_efektif date,
    tgl_akhir_efektif timestamp without time zone,
    id_struktur_parent bigint,
    urutan double precision
);
 #   DROP TABLE public.mt_sdm_struktur;
       public         heap    postgres    false            a           1259    26651    mt_sdm_struktur_history    TABLE     z   CREATE TABLE public.mt_sdm_struktur_history (
    id_struktur bigint NOT NULL,
    id_struktur_history bigint NOT NULL
);
 +   DROP TABLE public.mt_sdm_struktur_history;
       public         heap    postgres    false            _           1259    26642    mt_sdm_struktur_id_struktur_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_struktur_id_struktur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.mt_sdm_struktur_id_struktur_seq;
       public          postgres    false    352            �           0    0    mt_sdm_struktur_id_struktur_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.mt_sdm_struktur_id_struktur_seq OWNED BY public.mt_sdm_struktur.id_struktur;
          public          postgres    false    351            c           1259    26658    mt_sdm_sub_unit    TABLE     �   CREATE TABLE public.mt_sdm_sub_unit (
    id_sub_unit bigint NOT NULL,
    id_unit character varying(18),
    nama character varying(200)
);
 #   DROP TABLE public.mt_sdm_sub_unit;
       public         heap    postgres    false            b           1259    26657    mt_sdm_sub_unit_id_sub_unit_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_sdm_sub_unit_id_sub_unit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.mt_sdm_sub_unit_id_sub_unit_seq;
       public          postgres    false    355            �           0    0    mt_sdm_sub_unit_id_sub_unit_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.mt_sdm_sub_unit_id_sub_unit_seq OWNED BY public.mt_sdm_sub_unit.id_sub_unit;
          public          postgres    false    354            d           1259    26665    mt_sdm_subbid    TABLE     �   CREATE TABLE public.mt_sdm_subbid (
    code character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    is_aktif character varying(1)
);
 !   DROP TABLE public.mt_sdm_subbid;
       public         heap    postgres    false            e           1259    26670    mt_sdm_tipe_unit    TABLE     �   CREATE TABLE public.mt_sdm_tipe_unit (
    code character varying(20) NOT NULL,
    nama character varying(200) NOT NULL,
    is_aktif character varying(1) DEFAULT '1'::character varying
);
 $   DROP TABLE public.mt_sdm_tipe_unit;
       public         heap    postgres    false            f           1259    26676    mt_sdm_unit    TABLE     O  CREATE TABLE public.mt_sdm_unit (
    table_code character varying(18) NOT NULL,
    table_desc character varying(100) NOT NULL,
    is_aktif character varying(1) DEFAULT '1'::character varying NOT NULL,
    kode_distrik character varying(2),
    id_mig_dep integer,
    kode_lama character varying(45),
    id_subunitkerja integer
);
    DROP TABLE public.mt_sdm_unit;
       public         heap    postgres    false            g           1259    26682    mt_stakeholder    TABLE     {  CREATE TABLE public.mt_stakeholder (
    id_stakeholder bigint NOT NULL,
    nama text NOT NULL,
    kepentingan text NOT NULL,
    created_date time(6) without time zone,
    modfied_date time(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    id_owner_sso bigint
);
 "   DROP TABLE public.mt_stakeholder;
       public         heap    postgres    false            i           1259    26690    mt_status_pemeriksaan    TABLE       CREATE TABLE public.mt_status_pemeriksaan (
    id_status_pemeriksaan bigint NOT NULL,
    nama character varying(50) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint
);
 )   DROP TABLE public.mt_status_pemeriksaan;
       public         heap    postgres    false            h           1259    26689 /   mt_status_pemeriksaan_id_status_pemeriksaan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pemeriksaan_id_status_pemeriksaan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.mt_status_pemeriksaan_id_status_pemeriksaan_seq;
       public          postgres    false    361            �           0    0 /   mt_status_pemeriksaan_id_status_pemeriksaan_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_status_pemeriksaan_id_status_pemeriksaan_seq OWNED BY public.mt_status_pemeriksaan.id_status_pemeriksaan;
          public          postgres    false    360            k           1259    26697    mt_status_pengajuan    TABLE     
  CREATE TABLE public.mt_status_pengajuan (
    id_status_pengajuan bigint NOT NULL,
    nama character varying(50) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint
);
 '   DROP TABLE public.mt_status_pengajuan;
       public         heap    postgres    false            j           1259    26696 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq;
       public          postgres    false    363            �           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_status_pengajuan_id_status_pengajuan_seq OWNED BY public.mt_status_pengajuan.id_status_pengajuan;
          public          postgres    false    362            m           1259    26704    mt_status_penilaian    TABLE     ^  CREATE TABLE public.mt_status_penilaian (
    id_status_penilaian integer NOT NULL,
    nama character varying(100),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(100),
    modified_by_desc character varying(100)
);
 '   DROP TABLE public.mt_status_penilaian;
       public         heap    postgres    false            l           1259    26703 +   mt_status_penilaian_id_status_penilaian_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_penilaian_id_status_penilaian_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.mt_status_penilaian_id_status_penilaian_seq;
       public          postgres    false    365            �           0    0 +   mt_status_penilaian_id_status_penilaian_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.mt_status_penilaian_id_status_penilaian_seq OWNED BY public.mt_status_penilaian.id_status_penilaian;
          public          postgres    false    364            o           1259    26711    mt_status_progress    TABLE     )  CREATE TABLE public.mt_status_progress (
    id_status_progress bigint NOT NULL,
    nama character varying(20) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    prosentase double precision
);
 &   DROP TABLE public.mt_status_progress;
       public         heap    postgres    false            n           1259    26710 )   mt_status_progress_id_status_progress_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_status_progress_id_status_progress_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.mt_status_progress_id_status_progress_seq;
       public          postgres    false    367            �           0    0 )   mt_status_progress_id_status_progress_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.mt_status_progress_id_status_progress_seq OWNED BY public.mt_status_progress.id_status_progress;
          public          postgres    false    366            q           1259    26718    mt_target_kpi    TABLE     �   CREATE TABLE public.mt_target_kpi (
    id_target integer NOT NULL,
    target character varying(250) DEFAULT '0'::character varying NOT NULL
);
 !   DROP TABLE public.mt_target_kpi;
       public         heap    postgres    false            p           1259    26717    mt_target_kpi_id_target_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_target_kpi_id_target_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.mt_target_kpi_id_target_seq;
       public          postgres    false    369            �           0    0    mt_target_kpi_id_target_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.mt_target_kpi_id_target_seq OWNED BY public.mt_target_kpi.id_target;
          public          postgres    false    368            s           1259    26726    mt_tingkat_agregasi_risiko    TABLE     �   CREATE TABLE public.mt_tingkat_agregasi_risiko (
    id_tingkat_agregasi_risiko integer NOT NULL,
    nama character varying(100) NOT NULL,
    id_tingkat_agregasi_risiko_parent integer
);
 .   DROP TABLE public.mt_tingkat_agregasi_risiko;
       public         heap    postgres    false            r           1259    26725 9   mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE public.mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq;
       public          postgres    false    371            �           0    0 9   mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq OWNED BY public.mt_tingkat_agregasi_risiko.id_tingkat_agregasi_risiko;
          public          postgres    false    370            u           1259    26734    opp_kolom_laporan    TABLE     �   CREATE TABLE public.opp_kolom_laporan (
    id_kolom_laporan integer NOT NULL,
    nama character varying(45),
    kolom text,
    judul text
);
 %   DROP TABLE public.opp_kolom_laporan;
       public         heap    postgres    false            t           1259    26733 &   opp_kolom_laporan_id_kolom_laporan_seq    SEQUENCE     �   CREATE SEQUENCE public.opp_kolom_laporan_id_kolom_laporan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.opp_kolom_laporan_id_kolom_laporan_seq;
       public          postgres    false    373            �           0    0 &   opp_kolom_laporan_id_kolom_laporan_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.opp_kolom_laporan_id_kolom_laporan_seq OWNED BY public.opp_kolom_laporan.id_kolom_laporan;
          public          postgres    false    372            v           1259    26742    opp_log    TABLE     �   CREATE TABLE public.opp_log (
    id_peluang bigint,
    deskripsi character varying(4000),
    created_by bigint,
    group_id bigint,
    id_scorecard bigint,
    activity_time timestamp without time zone,
    user_name character varying(200)
);
    DROP TABLE public.opp_log;
       public         heap    postgres    false            x           1259    26751    opp_peluang    TABLE     �  CREATE TABLE public.opp_peluang (
    id_peluang bigint NOT NULL,
    nomor character varying(50) NOT NULL,
    nama character varying(2000) NOT NULL,
    deskripsi text,
    inheren_dampak bigint,
    inheren_kemungkinan bigint,
    control_dampak_penurunan bigint,
    control_kemungkinan_penurunan bigint,
    penyebab text,
    dampak text NOT NULL,
    id_scorecard bigint NOT NULL,
    id_status_pengajuan bigint,
    id_kegiatan bigint,
    residual_target_dampak bigint,
    residual_target_kemungkinan bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    residual_dampak_evaluasi bigint,
    residual_kemungkinan_evaluasi bigint,
    current_opp bigint,
    id_sasaran bigint,
    current_opp_dampak bigint,
    current_opp_kemungkinan bigint,
    id_kriteria_dampak bigint,
    progress_capaian_kinerja text,
    hambatan_kendala text,
    penyesuaian_tindakan_mitigasi text,
    progress_capaian_sasaran text,
    status_peluang character varying(1) DEFAULT '1'::character varying,
    status_keterangan text,
    is_lock character varying(1) DEFAULT '0'::character varying,
    tgl_peluang date,
    id_peluang_sebelum bigint,
    tgl_close date,
    nomor_asli character varying(50),
    id_kriteria_kemungkinan bigint,
    urutan double precision,
    id_aktifitas bigint,
    nama_aktifitas text,
    kode_aktifitas character varying(20),
    rekomendasi_keterangan text,
    rekomendasi_is_verified character varying(1) DEFAULT '0'::character varying,
    rekomendasi_nid character varying(10),
    rekomendasi_date timestamp without time zone,
    rekomendasi_jabatan bigint,
    rekomendasi_group character varying(20),
    review_nid character varying(10),
    review_date timestamp without time zone,
    review_jabatan bigint,
    id_jabatan bigint,
    review_group character varying(20),
    review_is_verified character varying(1) DEFAULT '0'::character varying,
    no bigint,
    review_kepatuhan text,
    id_taksonomi bigint,
    id_kategori bigint,
    sub_tahapan_kegiatan text,
    id_fraud_kategori bigint,
    id_fraud_jenis bigint,
    skor_inheren_dampak double precision,
    skor_inheren_kemungkinan double precision,
    skor_control_dampak double precision,
    skor_control_kemungkinan double precision,
    skor_target_dampak double precision,
    skor_target_kemungkinan double precision,
    skor_current_dampak double precision,
    skor_current_kemungkinan double precision,
    regulasi character varying(500),
    id_peluang_parent bigint,
    nama_kegiatan character varying(500),
    id_peluang_parent_lain smallint,
    red_flag character varying(1000),
    id_kpi bigint,
    sasaran text,
    id_taksonomi_area bigint,
    pengendalian_peluang_berjalan text,
    target_penyelesaian date,
    anggaran_biaya double precision,
    is_evaluasi_mitigasi integer DEFAULT 0,
    is_evaluasi_peluang integer DEFAULT 0,
    is_kerangka_acuan_kerja integer DEFAULT 0,
    id_mig integer,
    ab text
);
    DROP TABLE public.opp_peluang;
       public         heap    postgres    false            z           1259    26788    opp_peluang_files    TABLE     >  CREATE TABLE public.opp_peluang_files (
    id_peluang_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_peluang bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 %   DROP TABLE public.opp_peluang_files;
       public         heap    postgres    false            y           1259    26787 &   opp_peluang_files_id_peluang_files_seq    SEQUENCE     �   CREATE SEQUENCE public.opp_peluang_files_id_peluang_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.opp_peluang_files_id_peluang_files_seq;
       public          postgres    false    378            �           0    0 &   opp_peluang_files_id_peluang_files_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.opp_peluang_files_id_peluang_files_seq OWNED BY public.opp_peluang_files.id_peluang_files;
          public          postgres    false    377            w           1259    26750    opp_peluang_id_peluang_seq    SEQUENCE     �   CREATE SEQUENCE public.opp_peluang_id_peluang_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.opp_peluang_id_peluang_seq;
       public          postgres    false    376            �           0    0    opp_peluang_id_peluang_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.opp_peluang_id_peluang_seq OWNED BY public.opp_peluang.id_peluang;
          public          postgres    false    375            {           1259    26796    opp_peluang_kelayakan    TABLE     q   CREATE TABLE public.opp_peluang_kelayakan (
    id_peluang bigint NOT NULL,
    id_kelayakan integer NOT NULL
);
 )   DROP TABLE public.opp_peluang_kelayakan;
       public         heap    postgres    false            |           1259    26802    opp_peluang_unit    TABLE     n   CREATE TABLE public.opp_peluang_unit (
    id_peluang_unit bigint NOT NULL,
    id_peluang bigint NOT NULL
);
 $   DROP TABLE public.opp_peluang_unit;
       public         heap    postgres    false            ~           1259    26808    opp_scorecard    TABLE     a  CREATE TABLE public.opp_scorecard (
    id_scorecard bigint NOT NULL,
    nama character varying(300) NOT NULL,
    scope character varying(4000),
    id_visi_misi bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    id_kajian_risiko bigint,
    id_unit character varying(18),
    tgl_mulai_efektif date,
    tgl_akhir_efektif timestamp without time zone,
    owner bigint,
    id_struktur bigint,
    id_parent_scorecard bigint,
    navigasi character varying(1) DEFAULT '0'::character varying,
    open_evaluasi character varying(1) DEFAULT '0'::character varying,
    id_nama_proses bigint,
    is_info character varying(1) DEFAULT '0'::character varying,
    template_laporan character varying(1000),
    proses character varying(1000),
    id_tingkat_agregasi_risiko bigint,
    id_temp bigint,
    is_kegiatan character varying(1) DEFAULT '0'::character varying,
    kode character varying(20),
    id_status_pengajuan bigint,
    is_evaluasi_mitigasi integer DEFAULT 0,
    is_evaluasi_peluang integer DEFAULT 0
);
 !   DROP TABLE public.opp_scorecard;
       public         heap    postgres    false            �           1259    26825    opp_scorecard_files    TABLE     F  CREATE TABLE public.opp_scorecard_files (
    id_scorecard_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_scorecard bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 '   DROP TABLE public.opp_scorecard_files;
       public         heap    postgres    false                       1259    26824 *   opp_scorecard_files_id_scorecard_files_seq    SEQUENCE     �   CREATE SEQUENCE public.opp_scorecard_files_id_scorecard_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.opp_scorecard_files_id_scorecard_files_seq;
       public          postgres    false    384            �           0    0 *   opp_scorecard_files_id_scorecard_files_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.opp_scorecard_files_id_scorecard_files_seq OWNED BY public.opp_scorecard_files.id_scorecard_files;
          public          postgres    false    383            }           1259    26807    opp_scorecard_id_scorecard_seq    SEQUENCE     �   CREATE SEQUENCE public.opp_scorecard_id_scorecard_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.opp_scorecard_id_scorecard_seq;
       public          postgres    false    382            �           0    0    opp_scorecard_id_scorecard_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.opp_scorecard_id_scorecard_seq OWNED BY public.opp_scorecard.id_scorecard;
          public          postgres    false    381            �           1259    26835    opp_scorecard_user    TABLE     [   CREATE TABLE public.opp_scorecard_user (
    id_scorecard bigint,
    id_jabatan bigint
);
 &   DROP TABLE public.opp_scorecard_user;
       public         heap    postgres    false            �           1259    26840    opp_scorecard_view    TABLE     m   CREATE TABLE public.opp_scorecard_view (
    id_jabatan bigint NOT NULL,
    id_scorecard bigint NOT NULL
);
 &   DROP TABLE public.opp_scorecard_view;
       public         heap    postgres    false            �           1259    26847    pemeriksaan    TABLE     �  CREATE TABLE public.pemeriksaan (
    id_pemeriksaan bigint NOT NULL,
    id_unit character varying(18),
    nama character varying(200),
    lokasi character varying(500),
    tgl_mulai date,
    tgl_selesai date,
    id_jabatan_penyesusun bigint,
    id_jabatan_pereview bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    jabatan_penyesusun character varying(200),
    nama_jabatan_penyusun character varying(200),
    jabatan_pereview character varying(200),
    nama_jabatan_pereview character varying(200),
    keterangan text,
    jenis character varying(45),
    tujuan text,
    kriteria_audit text,
    objeklainnya character varying(200),
    pemeriksaancol character varying(45),
    id_subbid character varying(20),
    id_jenis_audit_eksternal integer,
    id_status bigint,
    nomor_stp character varying(45),
    id_spn integer,
    id_penyusun integer,
    id_pereview integer,
    nama_penyusun character varying(200),
    nama_pereview character varying(200),
    tanggal_sptp date,
    user_id bigint,
    nama_user character varying(200),
    id_penanggung_jawab integer,
    nama_penanggung_jawab character varying(200),
    nama_jabatan_penanggung_jawab character varying(200),
    id_sasaran integer,
    nama_sasaran character varying(200)
);
    DROP TABLE public.pemeriksaan;
       public         heap    postgres    false            �           1259    26863    pemeriksaan_anggaran_biaya    TABLE     E  CREATE TABLE public.pemeriksaan_anggaran_biaya (
    id_pemeriksaan_anggaran_biaya integer NOT NULL,
    id_pemeriksaan_detail integer,
    id_pemeriksaan integer,
    nama character varying(200),
    anggaran double precision,
    nilai_realisasi double precision,
    id_jenis integer,
    nama_jenis character varying(50),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    tanggal_surat date
);
 .   DROP TABLE public.pemeriksaan_anggaran_biaya;
       public         heap    postgres    false            �           1259    26862 <   pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq;
       public          postgres    false    390            �           0    0 <   pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq OWNED BY public.pemeriksaan_anggaran_biaya.id_pemeriksaan_anggaran_biaya;
          public          postgres    false    389            �           1259    26872    pemeriksaan_checklist    TABLE     (  CREATE TABLE public.pemeriksaan_checklist (
    id_pemeriksaan_checklist integer NOT NULL,
    id_pemeriksaan integer DEFAULT 0 NOT NULL,
    id_checklist integer DEFAULT 0 NOT NULL,
    is_oke integer DEFAULT 0 NOT NULL,
    penyelesaian integer DEFAULT 0 NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    jenis character varying(50),
    keterangan text
);
 )   DROP TABLE public.pemeriksaan_checklist;
       public         heap    postgres    false            �           1259    26871 2   pemeriksaan_checklist_id_pemeriksaan_checklist_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_checklist_id_pemeriksaan_checklist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.pemeriksaan_checklist_id_pemeriksaan_checklist_seq;
       public          postgres    false    392            �           0    0 2   pemeriksaan_checklist_id_pemeriksaan_checklist_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_checklist_id_pemeriksaan_checklist_seq OWNED BY public.pemeriksaan_checklist.id_pemeriksaan_checklist;
          public          postgres    false    391            �           1259    26885    pemeriksaan_detail    TABLE     �  CREATE TABLE public.pemeriksaan_detail (
    id_pemeriksaan_detail bigint NOT NULL,
    uraian character varying(200),
    detail_uraian text,
    rencana date,
    realisasi date,
    catatan text,
    id_pemeriksaan bigint,
    klausul text,
    referensi text,
    id_dokumen integer,
    id_jabatan integer,
    id_kka integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    anggaran double precision,
    realisasi_anggaran double precision,
    user_id bigint,
    nama_user character varying(200),
    nama_jabatan character varying(200)
);
 &   DROP TABLE public.pemeriksaan_detail;
       public         heap    postgres    false            �           1259    26884 ,   pemeriksaan_detail_id_pemeriksaan_detail_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_detail_id_pemeriksaan_detail_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.pemeriksaan_detail_id_pemeriksaan_detail_seq;
       public          postgres    false    394            �           0    0 ,   pemeriksaan_detail_id_pemeriksaan_detail_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.pemeriksaan_detail_id_pemeriksaan_detail_seq OWNED BY public.pemeriksaan_detail.id_pemeriksaan_detail;
          public          postgres    false    393            �           1259    26896    pemeriksaan_dokumen_eksternal    TABLE     ;  CREATE TABLE public.pemeriksaan_dokumen_eksternal (
    id_dokumen_aksternal integer NOT NULL,
    nomor_dokumen character varying(45),
    nama character varying(500),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    keterangan text,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision
);
 1   DROP TABLE public.pemeriksaan_dokumen_eksternal;
       public         heap    postgres    false            �           1259    26895 6   pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq;
       public          postgres    false    396            �           0    0 6   pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq OWNED BY public.pemeriksaan_dokumen_eksternal.id_dokumen_aksternal;
          public          postgres    false    395            �           1259    26846    pemeriksaan_id_pemeriksaan_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_id_pemeriksaan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pemeriksaan_id_pemeriksaan_seq;
       public          postgres    false    388            �           0    0    pemeriksaan_id_pemeriksaan_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pemeriksaan_id_pemeriksaan_seq OWNED BY public.pemeriksaan.id_pemeriksaan;
          public          postgres    false    387            �           1259    26905    pemeriksaan_peminjaman    TABLE     ~  CREATE TABLE public.pemeriksaan_peminjaman (
    id_pemeriksaan_peminjaman bigint NOT NULL,
    id_pemeriksaan bigint,
    jenis_dokumen_yang_dipinjam character varying(100),
    nomor_berkas character varying(100),
    nama_peminjam character varying(200),
    maksud_dan_keperluan character varying(500),
    tgl_peminjaman date,
    tgl_pengembalian date,
    keterangan text
);
 *   DROP TABLE public.pemeriksaan_peminjaman;
       public         heap    postgres    false            �           1259    26904 4   pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq;
       public          postgres    false    398            �           0    0 4   pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq OWNED BY public.pemeriksaan_peminjaman.id_pemeriksaan_peminjaman;
          public          postgres    false    397            �           1259    26915    pemeriksaan_review_supervisi    TABLE       CREATE TABLE public.pemeriksaan_review_supervisi (
    id_review_supervisi integer NOT NULL,
    permsalahan character varying(2000) NOT NULL,
    id_kka integer NOT NULL,
    penyelesaian character varying(2000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    is_persetujuan integer,
    id_pemeriksaan integer,
    id_pemeriksaan_detail integer
);
 0   DROP TABLE public.pemeriksaan_review_supervisi;
       public         heap    postgres    false            �           1259    26914 4   pemeriksaan_review_supervisi_id_review_supervisi_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_review_supervisi_id_review_supervisi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.pemeriksaan_review_supervisi_id_review_supervisi_seq;
       public          postgres    false    400            �           0    0 4   pemeriksaan_review_supervisi_id_review_supervisi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_review_supervisi_id_review_supervisi_seq OWNED BY public.pemeriksaan_review_supervisi.id_review_supervisi;
          public          postgres    false    399            �           1259    26924    pemeriksaan_spn    TABLE     �  CREATE TABLE public.pemeriksaan_spn (
    id_spn integer NOT NULL,
    nomor_surat character varying(45) NOT NULL,
    periode_pemeriksaan_mulai date NOT NULL,
    periode_pemeriksaan_selesai date NOT NULL,
    deskripsi text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    tanggal_surat date
);
 #   DROP TABLE public.pemeriksaan_spn;
       public         heap    postgres    false            �           1259    26923    pemeriksaan_spn_id_spn_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_spn_id_spn_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pemeriksaan_spn_id_spn_seq;
       public          postgres    false    402            �           0    0    pemeriksaan_spn_id_spn_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.pemeriksaan_spn_id_spn_seq OWNED BY public.pemeriksaan_spn.id_spn;
          public          postgres    false    401            �           1259    26933    pemeriksaan_spn_petugas    TABLE       CREATE TABLE public.pemeriksaan_spn_petugas (
    id_petugas integer NOT NULL,
    user_id bigint,
    nama character varying(200),
    nama_jabatan character varying(200),
    peran character varying(45),
    id_jabatan integer,
    id_spn integer,
    nipp character varying(200)
);
 +   DROP TABLE public.pemeriksaan_spn_petugas;
       public         heap    postgres    false            �           1259    26932 &   pemeriksaan_spn_petugas_id_petugas_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_spn_petugas_id_petugas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.pemeriksaan_spn_petugas_id_petugas_seq;
       public          postgres    false    404            �           0    0 &   pemeriksaan_spn_petugas_id_petugas_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.pemeriksaan_spn_petugas_id_petugas_seq OWNED BY public.pemeriksaan_spn_petugas.id_petugas;
          public          postgres    false    403            �           1259    26942    pemeriksaan_temuan    TABLE        CREATE TABLE public.pemeriksaan_temuan (
    id_pemeriksaan_temuan bigint NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    judul_temuan text,
    kondisi bytea,
    kriteria bytea,
    sebab bytea,
    akibat bytea,
    rekomendasi bytea,
    saran bytea,
    id_pemeriksaan bigint,
    id_pemeriksaan_detail bigint,
    tgl_klarifikasi date,
    id_jabatan_auditor bigint,
    jabatan_auditor character varying(100),
    nama_jabatan_auditor character varying(100),
    id_jabatan_auditee bigint,
    jabatan_auditee character varying(100),
    nama_jabatan_auditee character varying(100),
    rincian_tindak_lanjut bytea,
    hasil_evaluasi character varying(50),
    tmt date,
    id_dokumen integer,
    klausul bytea,
    jenis_temuan character varying(45),
    rencana_tindakan_perbaikan bytea,
    target_penyelesaian date,
    referensi bytea,
    status character varying(100),
    id_periode_tw bigint,
    tahun character varying(4),
    is_disetujui character varying(1),
    kondisi1 bytea,
    id_bidang_pemeriksaan integer,
    id_bidang character varying(20),
    nama_bidang character varying(400)
);
 &   DROP TABLE public.pemeriksaan_temuan;
       public         heap    postgres    false            �           1259    26957    pemeriksaan_temuan_diskusi    TABLE     �  CREATE TABLE public.pemeriksaan_temuan_diskusi (
    id_pemeriksaan_temuan_diskusi integer NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    keterangan text,
    id_pemeriksaan_temuan bigint
);
 .   DROP TABLE public.pemeriksaan_temuan_diskusi;
       public         heap    postgres    false            �           1259    26956 <   pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq;
       public          postgres    false    408            �           0    0 <   pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq OWNED BY public.pemeriksaan_temuan_diskusi.id_pemeriksaan_temuan_diskusi;
          public          postgres    false    407            �           1259    26967    pemeriksaan_temuan_files    TABLE     ]  CREATE TABLE public.pemeriksaan_temuan_files (
    id_pemeriksaan_temuan_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_pemeriksaan_temuan bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 ,   DROP TABLE public.pemeriksaan_temuan_files;
       public         heap    postgres    false            �           1259    26966 8   pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq;
       public          postgres    false    410            �           0    0 8   pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq OWNED BY public.pemeriksaan_temuan_files.id_pemeriksaan_temuan_files;
          public          postgres    false    409            �           1259    26941 ,   pemeriksaan_temuan_id_pemeriksaan_temuan_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_temuan_id_pemeriksaan_temuan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.pemeriksaan_temuan_id_pemeriksaan_temuan_seq;
       public          postgres    false    406            �           0    0 ,   pemeriksaan_temuan_id_pemeriksaan_temuan_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.pemeriksaan_temuan_id_pemeriksaan_temuan_seq OWNED BY public.pemeriksaan_temuan.id_pemeriksaan_temuan;
          public          postgres    false    405            �           1259    26978    pemeriksaan_temuan_saran    TABLE     �   CREATE TABLE public.pemeriksaan_temuan_saran (
    id_pemeriksaan_temuan_saran bigint NOT NULL,
    id_pemeriksaan_temuan bigint,
    deskripsi bytea
);
 ,   DROP TABLE public.pemeriksaan_temuan_saran;
       public         heap    postgres    false            �           1259    26977 8   pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq;
       public          postgres    false    412            �           0    0 8   pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq OWNED BY public.pemeriksaan_temuan_saran.id_pemeriksaan_temuan_saran;
          public          postgres    false    411            �           1259    26988    pemeriksaan_tim    TABLE     &  CREATE TABLE public.pemeriksaan_tim (
    id_pemeriksaan_tim integer NOT NULL,
    user_id bigint,
    nama character varying(200),
    nama_jabatan character varying(200),
    peran character varying(45),
    id_bidang_pemeriksaan integer,
    id_jabatan integer,
    id_pemeriksaan bigint
);
 #   DROP TABLE public.pemeriksaan_tim;
       public         heap    postgres    false            �           1259    26987 &   pemeriksaan_tim_id_pemeriksaan_tim_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_tim_id_pemeriksaan_tim_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.pemeriksaan_tim_id_pemeriksaan_tim_seq;
       public          postgres    false    414            �           0    0 &   pemeriksaan_tim_id_pemeriksaan_tim_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.pemeriksaan_tim_id_pemeriksaan_tim_seq OWNED BY public.pemeriksaan_tim.id_pemeriksaan_tim;
          public          postgres    false    413            �           1259    26996    pemeriksaan_tindak_lanjut    TABLE       CREATE TABLE public.pemeriksaan_tindak_lanjut (
    id_pemeriksaan_tindak_lanjut bigint NOT NULL,
    id_pemeriksaan_temuan bigint,
    id_periode_tw bigint,
    rincian_tindak_lanjut bytea,
    hasil_evaluasi character varying(50),
    status integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    kesimpulan text,
    tahun character varying(4)
);
 -   DROP TABLE public.pemeriksaan_tindak_lanjut;
       public         heap    postgres    false            �           1259    27007    pemeriksaan_tindak_lanjut_files    TABLE     r  CREATE TABLE public.pemeriksaan_tindak_lanjut_files (
    id_pemeriksaan_tindak_lanjut_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_pemeriksaan_tindak_lanjut bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 3   DROP TABLE public.pemeriksaan_tindak_lanjut_files;
       public         heap    postgres    false            �           1259    27006 ?   pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq;
       public          postgres    false    418            �           0    0 ?   pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq OWNED BY public.pemeriksaan_tindak_lanjut_files.id_pemeriksaan_tindak_lanjut_files;
          public          postgres    false    417            �           1259    26995 :   pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq    SEQUENCE     �   CREATE SEQUENCE public.pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public.pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq;
       public          postgres    false    416            �           0    0 :   pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq OWNED BY public.pemeriksaan_tindak_lanjut.id_pemeriksaan_tindak_lanjut;
          public          postgres    false    415            �           1259    27017    pemeriksaan_tindak_lanjut_saran    TABLE     �   CREATE TABLE public.pemeriksaan_tindak_lanjut_saran (
    id_pemeriksaan_tindak_lanjut bigint NOT NULL,
    id_pemeriksaan_temuan_saran bigint NOT NULL,
    rincian_tindak_lanjut bytea
);
 3   DROP TABLE public.pemeriksaan_tindak_lanjut_saran;
       public         heap    postgres    false            �           1259    27025 	   penilaian    TABLE     \  CREATE TABLE public.penilaian (
    id_penilaian integer NOT NULL,
    tgl date,
    status integer,
    id_penilaian_periode integer,
    tgl_label character varying(50),
    rekomendasi text,
    nama_dokumen text,
    sumber_dokumen text,
    pemilik_dokumen text,
    tgl_review date,
    id_dokumen integer,
    id_penilaian_detail integer
);
    DROP TABLE public.penilaian;
       public         heap    postgres    false            �           1259    27036    penilaian_detail    TABLE     �  CREATE TABLE public.penilaian_detail (
    id_penilaian_detail integer NOT NULL,
    id_penilaian integer,
    jenis character varying(45),
    skor real,
    tgl date,
    simpulan text,
    saran text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 $   DROP TABLE public.penilaian_detail;
       public         heap    postgres    false            �           1259    27035 (   penilaian_detail_id_penilaian_detail_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_detail_id_penilaian_detail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.penilaian_detail_id_penilaian_detail_seq;
       public          postgres    false    423            �           0    0 (   penilaian_detail_id_penilaian_detail_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.penilaian_detail_id_penilaian_detail_seq OWNED BY public.penilaian_detail.id_penilaian_detail;
          public          postgres    false    422            �           1259    27045    penilaian_dokumen    TABLE     b   CREATE TABLE public.penilaian_dokumen (
    id_penilaian integer,
    id_dokumen_versi integer
);
 %   DROP TABLE public.penilaian_dokumen;
       public         heap    postgres    false            �           1259    27049    penilaian_files    TABLE     B  CREATE TABLE public.penilaian_files (
    id_penilaian_files integer NOT NULL,
    client_name character varying(100),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_penilaian integer,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 #   DROP TABLE public.penilaian_files;
       public         heap    postgres    false            �           1259    27048 &   penilaian_files_id_penilaian_files_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_files_id_penilaian_files_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.penilaian_files_id_penilaian_files_seq;
       public          postgres    false    426            �           0    0 &   penilaian_files_id_penilaian_files_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.penilaian_files_id_penilaian_files_seq OWNED BY public.penilaian_files.id_penilaian_files;
          public          postgres    false    425            �           1259    27024    penilaian_id_penilaian_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_id_penilaian_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.penilaian_id_penilaian_seq;
       public          postgres    false    421            �           0    0    penilaian_id_penilaian_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.penilaian_id_penilaian_seq OWNED BY public.penilaian.id_penilaian;
          public          postgres    false    420            �           1259    27058    penilaian_komentar    TABLE     �  CREATE TABLE public.penilaian_komentar (
    id_penilaian_komentar integer NOT NULL,
    id_penilaian integer,
    komentar character varying(2000),
    nama character varying(20),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 &   DROP TABLE public.penilaian_komentar;
       public         heap    postgres    false            �           1259    27057 ,   penilaian_komentar_id_penilaian_komentar_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_komentar_id_penilaian_komentar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.penilaian_komentar_id_penilaian_komentar_seq;
       public          postgres    false    428            �           0    0 ,   penilaian_komentar_id_penilaian_komentar_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.penilaian_komentar_id_penilaian_komentar_seq OWNED BY public.penilaian_komentar.id_penilaian_komentar;
          public          postgres    false    427            �           1259    27067    penilaian_link    TABLE     �   CREATE TABLE public.penilaian_link (
    id_penilaian_periode1 integer NOT NULL,
    id_kriteria1 integer,
    id_penilaian_periode2 integer NOT NULL,
    id_kriteria2 integer,
    id_penilaian1 integer NOT NULL,
    id_penilaian2 integer NOT NULL
);
 "   DROP TABLE public.penilaian_link;
       public         heap    postgres    false            �           1259    27071    penilaian_periode    TABLE     ,  CREATE TABLE public.penilaian_periode (
    id_penilaian_periode integer NOT NULL,
    tgl_penilaian date,
    id_kriteria integer,
    id_unit_bak character varying(15),
    id_interval bigint,
    is_aktif character(1),
    nilai_target real,
    tgl_next date,
    id_penilaian_session integer
);
 %   DROP TABLE public.penilaian_periode;
       public         heap    postgres    false            �           1259    27070 *   penilaian_periode_id_penilaian_periode_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_periode_id_penilaian_periode_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.penilaian_periode_id_penilaian_periode_seq;
       public          postgres    false    431            �           0    0 *   penilaian_periode_id_penilaian_periode_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.penilaian_periode_id_penilaian_periode_seq OWNED BY public.penilaian_periode.id_penilaian_periode;
          public          postgres    false    430            �           1259    27081    penilaian_quisioner    TABLE     1  CREATE TABLE public.penilaian_quisioner (
    id_penilaian_quisioner integer NOT NULL,
    id_jabatan integer,
    id_quisioner integer,
    id_quisioner_parent integer,
    pertanyaan text,
    jenis_jawaban character varying(20),
    jawaban text,
    id_penilaian_session integer,
    nilai integer
);
 '   DROP TABLE public.penilaian_quisioner;
       public         heap    postgres    false            �           1259    27080 .   penilaian_quisioner_id_penilaian_quisioner_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_quisioner_id_penilaian_quisioner_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.penilaian_quisioner_id_penilaian_quisioner_seq;
       public          postgres    false    433            �           0    0 .   penilaian_quisioner_id_penilaian_quisioner_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.penilaian_quisioner_id_penilaian_quisioner_seq OWNED BY public.penilaian_quisioner.id_penilaian_quisioner;
          public          postgres    false    432            �           1259    27090    penilaian_session    TABLE     �  CREATE TABLE public.penilaian_session (
    id_penilaian_session integer NOT NULL,
    nama character varying(500),
    tgl date,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    page_ctrl character varying(200),
    id_kategori integer,
    target_lvl character(5),
    jenis_assessment_gcg integer DEFAULT 0
);
 %   DROP TABLE public.penilaian_session;
       public         heap    postgres    false            �           1259    27089 *   penilaian_session_id_penilaian_session_seq    SEQUENCE     �   CREATE SEQUENCE public.penilaian_session_id_penilaian_session_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.penilaian_session_id_penilaian_session_seq;
       public          postgres    false    435            �           0    0 *   penilaian_session_id_penilaian_session_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.penilaian_session_id_penilaian_session_seq OWNED BY public.penilaian_session.id_penilaian_session;
          public          postgres    false    434            �           1259    27100    public_sys_action    TABLE     �   CREATE TABLE public.public_sys_action (
    action_id bigint NOT NULL,
    menu_id bigint,
    name character varying(50),
    type character varying(1),
    visible character varying(1) DEFAULT '1'::character varying
);
 %   DROP TABLE public.public_sys_action;
       public         heap    postgres    false            �           1259    27099    public_sys_action_action_id_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_action_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.public_sys_action_action_id_seq;
       public          postgres    false    437            �           0    0    public_sys_action_action_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.public_sys_action_action_id_seq OWNED BY public.public_sys_action.action_id;
          public          postgres    false    436            �           1259    27109    public_sys_group    TABLE     �   CREATE TABLE public.public_sys_group (
    group_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    visible character varying(1) DEFAULT '1'::character varying
);
 $   DROP TABLE public.public_sys_group;
       public         heap    postgres    false            �           1259    27116    public_sys_group_action    TABLE     r   CREATE TABLE public.public_sys_group_action (
    group_menu_id bigint NOT NULL,
    action_id bigint NOT NULL
);
 +   DROP TABLE public.public_sys_group_action;
       public         heap    postgres    false            �           1259    27108    public_sys_group_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_group_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.public_sys_group_group_id_seq;
       public          postgres    false    439            �           0    0    public_sys_group_group_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.public_sys_group_group_id_seq OWNED BY public.public_sys_group.group_id;
          public          postgres    false    438            �           1259    27123    public_sys_group_menu    TABLE     z   CREATE TABLE public.public_sys_group_menu (
    group_menu_id bigint NOT NULL,
    group_id bigint,
    menu_id bigint
);
 )   DROP TABLE public.public_sys_group_menu;
       public         heap    postgres    false            �           1259    27122 '   public_sys_group_menu_group_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_group_menu_group_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.public_sys_group_menu_group_menu_id_seq;
       public          postgres    false    442            �           0    0 '   public_sys_group_menu_group_menu_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.public_sys_group_menu_group_menu_id_seq OWNED BY public.public_sys_group_menu.group_menu_id;
          public          postgres    false    441            �           1259    27131    public_sys_log    TABLE       CREATE TABLE public.public_sys_log (
    page character varying(100),
    activity character varying(4000),
    ip character varying(30),
    activity_time timestamp without time zone,
    user_id bigint,
    action character varying(100),
    user_name character varying(200)
);
 "   DROP TABLE public.public_sys_log;
       public         heap    postgres    false            �           1259    27138    public_sys_menu    TABLE     _  CREATE TABLE public.public_sys_menu (
    menu_id bigint NOT NULL,
    parent_id bigint,
    label character varying(100) NOT NULL,
    iconcls character varying(50),
    url character varying(100),
    visible character varying(1) DEFAULT '1'::character varying,
    state character varying(10) DEFAULT 'close'::character varying,
    sort bigint
);
 #   DROP TABLE public.public_sys_menu;
       public         heap    postgres    false            �           1259    27137    public_sys_menu_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.public_sys_menu_menu_id_seq;
       public          postgres    false    445            �           0    0    public_sys_menu_menu_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.public_sys_menu_menu_id_seq OWNED BY public.public_sys_menu.menu_id;
          public          postgres    false    444            �           1259    27148    public_sys_message    TABLE     >  CREATE TABLE public.public_sys_message (
    id_message integer NOT NULL,
    msg character varying(4000) NOT NULL,
    topik character varying(1000) NOT NULL,
    status integer,
    id_message_parent integer DEFAULT 0,
    id_user integer NOT NULL,
    jabatan character varying(200) NOT NULL,
    id_jabatan integer NOT NULL,
    is_aktif character varying(1),
    is_user integer,
    "time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_read character varying(1) DEFAULT '0'::character varying,
    nama character varying(200),
    created_date time(6) without time zone,
    modfied_date time(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    is_lanjutan integer DEFAULT 0,
    rating integer
);
 &   DROP TABLE public.public_sys_message;
       public         heap    postgres    false            �           1259    27160    public_sys_message_files    TABLE       CREATE TABLE public.public_sys_message_files (
    id_message_files integer DEFAULT 0 NOT NULL,
    file_name character varying(1000),
    file_type character varying(200),
    file_size double precision,
    client_name character varying(1000),
    jenis_file character varying(100),
    id_message integer,
    created_date time(6) without time zone,
    modfied_date time(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 ,   DROP TABLE public.public_sys_message_files;
       public         heap    postgres    false            �           1259    27147 !   public_sys_message_id_message_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_message_id_message_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.public_sys_message_id_message_seq;
       public          postgres    false    447            �           0    0 !   public_sys_message_id_message_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.public_sys_message_id_message_seq OWNED BY public.public_sys_message.id_message;
          public          postgres    false    446            �           1259    27167    public_sys_notification    TABLE       CREATE TABLE public.public_sys_notification (
    id_notification bigint NOT NULL,
    isi character varying(4000),
    id_user bigint,
    id_jabatan bigint,
    url character varying(1000),
    is_open character varying(1),
    jenis character varying(20)
);
 +   DROP TABLE public.public_sys_notification;
       public         heap    postgres    false            �           1259    27166 +   public_sys_notification_id_notification_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_notification_id_notification_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.public_sys_notification_id_notification_seq;
       public          postgres    false    450            �           0    0 +   public_sys_notification_id_notification_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.public_sys_notification_id_notification_seq OWNED BY public.public_sys_notification.id_notification;
          public          postgres    false    449            �           1259    27178    public_sys_setting    TABLE     �   CREATE TABLE public.public_sys_setting (
    id_public_sys_setting bigint NOT NULL,
    nama character varying(100) NOT NULL,
    is_show bigint,
    isi character varying(1000),
    keterangan character varying(1000)
);
 &   DROP TABLE public.public_sys_setting;
       public         heap    postgres    false            �           1259    27177 ,   public_sys_setting_id_public_sys_setting_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_setting_id_public_sys_setting_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.public_sys_setting_id_public_sys_setting_seq;
       public          postgres    false    452            �           0    0 ,   public_sys_setting_id_public_sys_setting_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.public_sys_setting_id_public_sys_setting_seq OWNED BY public.public_sys_setting.id_public_sys_setting;
          public          postgres    false    451            �           1259    27187    public_sys_user    TABLE     q  CREATE TABLE public.public_sys_user (
    user_id bigint NOT NULL,
    username character varying(100),
    group_id bigint,
    name character varying(200),
    last_ip character varying(30),
    last_login timestamp without time zone,
    is_active character varying(1) DEFAULT '1'::character varying,
    password character varying(100),
    nid character varying(10),
    id_jabatan bigint,
    is_notification character varying(1) DEFAULT '1'::character varying,
    email character varying(200),
    is_manual character varying(1) DEFAULT '1'::character varying,
    tgl_mulai_aktif date,
    tgl_selesai_aktif date
);
 #   DROP TABLE public.public_sys_user;
       public         heap    postgres    false            �           1259    27200    public_sys_user_group    TABLE     �   CREATE TABLE public.public_sys_user_group (
    user_id bigint NOT NULL,
    group_id bigint NOT NULL,
    id_jabatan bigint NOT NULL
);
 )   DROP TABLE public.public_sys_user_group;
       public         heap    postgres    false            �           1259    27186    public_sys_user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.public_sys_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.public_sys_user_user_id_seq;
       public          postgres    false    454            �           0    0    public_sys_user_user_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.public_sys_user_user_id_seq OWNED BY public.public_sys_user.user_id;
          public          postgres    false    453            �           1259    27208 	   quisioner    TABLE     �   CREATE TABLE public.quisioner (
    id_quisioner integer NOT NULL,
    pertanyaan text,
    jenis_jawaban character varying(20),
    id_kategori integer,
    id_quisioner_parent integer
);
    DROP TABLE public.quisioner;
       public         heap    postgres    false            �           1259    27207    quisioner_id_quisioner_seq    SEQUENCE     �   CREATE SEQUENCE public.quisioner_id_quisioner_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.quisioner_id_quisioner_seq;
       public          postgres    false    457            �           0    0    quisioner_id_quisioner_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.quisioner_id_quisioner_seq OWNED BY public.quisioner.id_quisioner;
          public          postgres    false    456            �           1259    27216    quisioner_jabatan    TABLE     x   CREATE TABLE public.quisioner_jabatan (
    id_jabatan integer DEFAULT 0 NOT NULL,
    id_quisioner integer NOT NULL
);
 %   DROP TABLE public.quisioner_jabatan;
       public         heap    postgres    false            �           1259    27220    quisioner_kriteria    TABLE     y   CREATE TABLE public.quisioner_kriteria (
    id_quisioner integer NOT NULL,
    id_kriteria bigint DEFAULT 0 NOT NULL
);
 &   DROP TABLE public.quisioner_kriteria;
       public         heap    postgres    false            �           1259    27224    quisioner_pemeriksaan    TABLE     c   CREATE TABLE public.quisioner_pemeriksaan (
    id_pemeriksaan integer,
    id_quisioner bigint
);
 )   DROP TABLE public.quisioner_pemeriksaan;
       public         heap    postgres    false            �           1259    27227    quisioner_tahun    TABLE     b   CREATE TABLE public.quisioner_tahun (
    tahun character varying(50),
    id_quisioner bigint
);
 #   DROP TABLE public.quisioner_tahun;
       public         heap    postgres    false            �           1259    27231    risk_control    TABLE     &  CREATE TABLE public.risk_control (
    id_control bigint NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    is_efektif smallint DEFAULT 0 NOT NULL,
    id_interval bigint,
    remark text,
    id_risiko bigint,
    id_control_parent bigint,
    menurunkan_dampak_kemungkinan character varying(3) DEFAULT 'k'::character varying,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    id_mitigasi_sumber bigint,
    is_lock character varying(1) DEFAULT '0'::character varying,
    id_control_sebelum bigint,
    review_kepatuhan text,
    review_nid character varying(10),
    review_date timestamp without time zone,
    rekomendasi_keterangan character varying(2000),
    rekomendasi_is_verified character varying(1) DEFAULT '0'::character varying,
    rekomendasi_nid character varying(10),
    rekomendasi_date timestamp without time zone,
    rekomendasi_jabatan bigint,
    rekomendasi_group character varying(20),
    review_jabatan bigint,
    id_jabatan bigint,
    review_group character varying(20),
    review_is_verified character varying(1) DEFAULT '0'::character varying,
    no double precision,
    id_pengukuran bigint,
    id_dokumen integer,
    efektifitas text,
    status_progress double precision
);
     DROP TABLE public.risk_control;
       public         heap    postgres    false            �           1259    27252    risk_control_efektifitas    TABLE     _  CREATE TABLE public.risk_control_efektifitas (
    id_control bigint NOT NULL,
    id_efektifitas bigint NOT NULL,
    is_iya smallint DEFAULT 0,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    keterangan character varying(4000),
    id_jawaban bigint
);
 ,   DROP TABLE public.risk_control_efektifitas;
       public         heap    postgres    false            �           1259    27262    risk_control_efektifitas_files    TABLE     s  CREATE TABLE public.risk_control_efektifitas_files (
    id_control_efektifitas_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_control bigint,
    id_efektifitas bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 2   DROP TABLE public.risk_control_efektifitas_files;
       public         heap    postgres    false            �           1259    27261 ?   risk_control_efektifitas_files_id_control_efektifitas_files_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_control_efektifitas_files_id_control_efektifitas_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.risk_control_efektifitas_files_id_control_efektifitas_files_seq;
       public          postgres    false    466            �           0    0 ?   risk_control_efektifitas_files_id_control_efektifitas_files_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_control_efektifitas_files_id_control_efektifitas_files_seq OWNED BY public.risk_control_efektifitas_files.id_control_efektifitas_files;
          public          postgres    false    465            �           1259    27230    risk_control_id_control_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_control_id_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_control_id_control_seq;
       public          postgres    false    463            �           0    0    risk_control_id_control_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_control_id_control_seq OWNED BY public.risk_control.id_control;
          public          postgres    false    462            �           1259    27273    risk_control_risiko    TABLE     Y   CREATE TABLE public.risk_control_risiko (
    id_risiko bigint,
    id_control bigint
);
 '   DROP TABLE public.risk_control_risiko;
       public         heap    postgres    false            �           1259    27279    risk_dampak    TABLE     T  CREATE TABLE public.risk_dampak (
    id_risk_dampak bigint NOT NULL,
    nama character varying(500),
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
    DROP TABLE public.risk_dampak;
       public         heap    postgres    false            �           1259    27278    risk_dampak_id_risk_dampak_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_dampak_id_risk_dampak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.risk_dampak_id_risk_dampak_seq;
       public          postgres    false    469            �           0    0    risk_dampak_id_risk_dampak_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.risk_dampak_id_risk_dampak_seq OWNED BY public.risk_dampak.id_risk_dampak;
          public          postgres    false    468            �           1259    27287    risk_dampak_risiko    TABLE     n   CREATE TABLE public.risk_dampak_risiko (
    id_risiko bigint NOT NULL,
    id_risk_dampak bigint NOT NULL
);
 &   DROP TABLE public.risk_dampak_risiko;
       public         heap    postgres    false            �           1259    27293    risk_high_info    TABLE     �   CREATE TABLE public.risk_high_info (
    id_risiko bigint NOT NULL,
    keterangan character varying(4000),
    created_date date
);
 "   DROP TABLE public.risk_high_info;
       public         heap    postgres    false            �           1259    27292    risk_high_info_id_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_high_info_id_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.risk_high_info_id_risiko_seq;
       public          postgres    false    472            �           0    0    risk_high_info_id_risiko_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.risk_high_info_id_risiko_seq OWNED BY public.risk_high_info.id_risiko;
          public          postgres    false    471            �           1259    27301    risk_integrasi_internal    TABLE     i   CREATE TABLE public.risk_integrasi_internal (
    id_risiko bigint,
    id_unit character varying(18)
);
 +   DROP TABLE public.risk_integrasi_internal;
       public         heap    postgres    false            �           1259    27307    risk_kegiatan    TABLE     e  CREATE TABLE public.risk_kegiatan (
    id_kegiatan bigint NOT NULL,
    nama character varying(1000) NOT NULL,
    deskripsi character varying(4000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    id_sasaran bigint,
    id_parent_kegiatan bigint,
    kpi_deskripsi character varying(400),
    kpi character varying(200),
    owner bigint,
    id_risk_taksonomi_objective bigint,
    id_scorecard bigint,
    tujuan_kegiatan text,
    keselarasan character varying(15),
    target_sasaran character varying(2000)
);
 !   DROP TABLE public.risk_kegiatan;
       public         heap    postgres    false            �           1259    27306    risk_kegiatan_id_kegiatan_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_kegiatan_id_kegiatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_kegiatan_id_kegiatan_seq;
       public          postgres    false    475            �           0    0    risk_kegiatan_id_kegiatan_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_kegiatan_id_kegiatan_seq OWNED BY public.risk_kegiatan.id_kegiatan;
          public          postgres    false    474            �           1259    27315    risk_kegiatan_kpi    TABLE     g   CREATE TABLE public.risk_kegiatan_kpi (
    id_kegiatan bigint NOT NULL,
    id_kpi bigint NOT NULL
);
 %   DROP TABLE public.risk_kegiatan_kpi;
       public         heap    postgres    false            �           1259    27322    risk_kesimpulan    TABLE       CREATE TABLE public.risk_kesimpulan (
    id_kajian_risiko bigint,
    created_date timestamp without time zone,
    keterangan character varying(4000),
    id_scorecard bigint,
    tahun double precision NOT NULL,
    status character varying(20),
    id_kesimpulan bigint NOT NULL
);
 #   DROP TABLE public.risk_kesimpulan;
       public         heap    postgres    false            �           1259    27321 !   risk_kesimpulan_id_kesimpulan_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_kesimpulan_id_kesimpulan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.risk_kesimpulan_id_kesimpulan_seq;
       public          postgres    false    478            �           0    0 !   risk_kesimpulan_id_kesimpulan_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.risk_kesimpulan_id_kesimpulan_seq OWNED BY public.risk_kesimpulan.id_kesimpulan;
          public          postgres    false    477            �           1259    27331    risk_kolom_laporan    TABLE     �   CREATE TABLE public.risk_kolom_laporan (
    id_kolom_laporan integer NOT NULL,
    nama character varying(45),
    kolom text,
    judul character varying(500)
);
 &   DROP TABLE public.risk_kolom_laporan;
       public         heap    postgres    false            �           1259    27330 '   risk_kolom_laporan_id_kolom_laporan_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_kolom_laporan_id_kolom_laporan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.risk_kolom_laporan_id_kolom_laporan_seq;
       public          postgres    false    480            �           0    0 '   risk_kolom_laporan_id_kolom_laporan_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.risk_kolom_laporan_id_kolom_laporan_seq OWNED BY public.risk_kolom_laporan.id_kolom_laporan;
          public          postgres    false    479            �           1259    27339    risk_konteks    TABLE     G  CREATE TABLE public.risk_konteks (
    id_konteks bigint NOT NULL,
    nama character varying(4000) NOT NULL,
    deskripsi character varying(4000) NOT NULL,
    strength character varying(4000),
    weakness character varying(4000),
    opportunity text,
    threat text,
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    konteks_internal text,
    konteks_eksternal text,
    tgl_mulai_efektif date,
    tgl_akhir_efektif timestamp(6) without time zone,
    id_owner_sso bigint
);
     DROP TABLE public.risk_konteks;
       public         heap    postgres    false            �           1259    27346    risk_konteks_stakeholder    TABLE     u   CREATE TABLE public.risk_konteks_stakeholder (
    id_stakeholder bigint NOT NULL,
    id_konteks bigint NOT NULL
);
 ,   DROP TABLE public.risk_konteks_stakeholder;
       public         heap    postgres    false            �           1259    27353    risk_kpi    TABLE     ^   CREATE TABLE public.risk_kpi (
    id_kpi bigint NOT NULL,
    nama character varying(300)
);
    DROP TABLE public.risk_kpi;
       public         heap    postgres    false            �           1259    27352    risk_kpi_id_kpi_seq    SEQUENCE     |   CREATE SEQUENCE public.risk_kpi_id_kpi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_kpi_id_kpi_seq;
       public          postgres    false    484            �           0    0    risk_kpi_id_kpi_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_kpi_id_kpi_seq OWNED BY public.risk_kpi.id_kpi;
          public          postgres    false    483            �           1259    27360    risk_kri    TABLE     c  CREATE TABLE public.risk_kri (
    id_kri bigint NOT NULL,
    nama character varying(500) NOT NULL,
    id_risiko bigint NOT NULL,
    satuan character varying(50),
    target_mulai double precision,
    target_sampai double precision,
    keterangan character varying(4000),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    polaritas character varying(1),
    batas_bawah double precision,
    batas_atas double precision
);
    DROP TABLE public.risk_kri;
       public         heap    postgres    false            �           1259    27370    risk_kri_hasil    TABLE     =  CREATE TABLE public.risk_kri_hasil (
    id_kri_hasil bigint NOT NULL,
    nilai double precision,
    id_kri bigint,
    id_periode_tw bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    target_mulai double precision,
    target_sampai double precision,
    batas_atas double precision,
    batas_bawah double precision,
    tahun double precision,
    bulan character varying(2)
);
 "   DROP TABLE public.risk_kri_hasil;
       public         heap    postgres    false            �           1259    27369    risk_kri_hasil_id_kri_hasil_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_kri_hasil_id_kri_hasil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.risk_kri_hasil_id_kri_hasil_seq;
       public          postgres    false    488            �           0    0    risk_kri_hasil_id_kri_hasil_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.risk_kri_hasil_id_kri_hasil_seq OWNED BY public.risk_kri_hasil.id_kri_hasil;
          public          postgres    false    487            �           1259    27359    risk_kri_id_kri_seq    SEQUENCE     |   CREATE SEQUENCE public.risk_kri_id_kri_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_kri_id_kri_seq;
       public          postgres    false    486            �           0    0    risk_kri_id_kri_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_kri_id_kri_seq OWNED BY public.risk_kri.id_kri;
          public          postgres    false    485            �           1259    27378    risk_log    TABLE     �   CREATE TABLE public.risk_log (
    id_risiko bigint,
    deskripsi character varying(4000),
    created_by bigint,
    group_id bigint,
    id_scorecard bigint,
    activity_time timestamp without time zone,
    user_name character varying(200)
);
    DROP TABLE public.risk_log;
       public         heap    postgres    false            �           1259    27387    risk_mitigasi    TABLE     T  CREATE TABLE public.risk_mitigasi (
    id_mitigasi bigint NOT NULL,
    nama text NOT NULL,
    deskripsi text,
    start_date date,
    dead_line date,
    end_date date,
    id_risiko bigint,
    id_status_progress bigint,
    menurunkan_dampak_kemungkinan character varying(3) DEFAULT 'd'::character varying NOT NULL,
    biaya numeric(20,2),
    revenue numeric(20,2),
    is_efektif double precision DEFAULT 0,
    progress_capaian_kinerja character varying(200),
    hambatan_kendala character varying(4000),
    penyesuaian_tindakan_mitigasi text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    cba double precision,
    is_control character varying(1) DEFAULT '0'::character varying,
    penanggung_jawab bigint,
    status_konfirmasi character varying(1) DEFAULT '0'::character varying,
    is_lock character varying(1) DEFAULT '0'::character varying,
    id_mitigasi_sebelum bigint,
    rekomendasi_keterangan character varying(2000),
    rekomendasi_is_verified character varying(1) DEFAULT '0'::character varying,
    rekomendasi_nid character varying(10),
    rekomendasi_date timestamp without time zone,
    rekomendasi_jabatan bigint,
    rekomendasi_group character varying(20),
    review_nid character varying(10),
    review_date timestamp without time zone,
    id_jabatan bigint,
    review_jabatan bigint,
    review_group character varying(20),
    review_is_verified character varying(1) DEFAULT '0'::character varying,
    no double precision,
    review_kepatuhan character varying(2000),
    interdependent_delegasi bigint,
    status_progress double precision,
    id_pengukuran bigint,
    remark text,
    program_kerja text,
    rencana double precision,
    realisasi double precision,
    devisiasi double precision,
    satuan character varying(45),
    anggaran text,
    rab text,
    target_penyelesaian text,
    tujuan text,
    integrasi_eksternal text,
    id_prioritas integer,
    nomor character varying(50),
    sasaran text,
    start_date_realisasi date,
    end_date_realisasi date
);
 !   DROP TABLE public.risk_mitigasi;
       public         heap    postgres    false            �           1259    27408    risk_mitigasi_efektif    TABLE     �   CREATE TABLE public.risk_mitigasi_efektif (
    id_mitigasi_efektif bigint NOT NULL,
    id_mitigasi bigint,
    id_pengukuran bigint,
    created_date date,
    id_periode_tw bigint,
    tahun double precision
);
 )   DROP TABLE public.risk_mitigasi_efektif;
       public         heap    postgres    false            �           1259    27407 -   risk_mitigasi_efektif_id_mitigasi_efektif_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_mitigasi_efektif_id_mitigasi_efektif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.risk_mitigasi_efektif_id_mitigasi_efektif_seq;
       public          postgres    false    493            �           0    0 -   risk_mitigasi_efektif_id_mitigasi_efektif_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.risk_mitigasi_efektif_id_mitigasi_efektif_seq OWNED BY public.risk_mitigasi_efektif.id_mitigasi_efektif;
          public          postgres    false    492            �           1259    27417    risk_mitigasi_efektif_m    TABLE     P  CREATE TABLE public.risk_mitigasi_efektif_m (
    id_mitigasi_efektif bigint NOT NULL,
    id_efektif_m bigint NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    keterangan character varying(4000),
    id_efektif_m_jawaban bigint
);
 +   DROP TABLE public.risk_mitigasi_efektif_m;
       public         heap    postgres    false            �           1259    27427    risk_mitigasi_files    TABLE     e  CREATE TABLE public.risk_mitigasi_files (
    id_mitigasi_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_mitigasi bigint,
    jenis character varying(20) DEFAULT 'file'::character varying,
    id_mitigasi_progress bigint
);
 '   DROP TABLE public.risk_mitigasi_files;
       public         heap    postgres    false            �           1259    27426 )   risk_mitigasi_files_id_mitigasi_files_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_mitigasi_files_id_mitigasi_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_mitigasi_files_id_mitigasi_files_seq;
       public          postgres    false    496            �           0    0 )   risk_mitigasi_files_id_mitigasi_files_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_mitigasi_files_id_mitigasi_files_seq OWNED BY public.risk_mitigasi_files.id_mitigasi_files;
          public          postgres    false    495            �           1259    27386    risk_mitigasi_id_mitigasi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_mitigasi_id_mitigasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.risk_mitigasi_id_mitigasi_seq;
       public          postgres    false    491            �           0    0    risk_mitigasi_id_mitigasi_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.risk_mitigasi_id_mitigasi_seq OWNED BY public.risk_mitigasi.id_mitigasi;
          public          postgres    false    490            �           1259    27437     risk_mitigasi_integrasi_internal    TABLE     t   CREATE TABLE public.risk_mitigasi_integrasi_internal (
    id_risiko bigint,
    id_subbid character varying(20)
);
 4   DROP TABLE public.risk_mitigasi_integrasi_internal;
       public         heap    postgres    false            �           1259    27441    risk_mitigasi_program    TABLE     $  CREATE TABLE public.risk_mitigasi_program (
    id_mitigasi_program bigint NOT NULL,
    nama text NOT NULL,
    start_date date,
    end_date date,
    id_mitigasi bigint NOT NULL,
    biaya numeric(20,2),
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    penanggung_jawab bigint,
    no double precision,
    id_risiko bigint,
    penanganan_pencegahan character varying(50),
    tgl_penyelesaiaan date,
    sumber_daya character varying(500)
);
 )   DROP TABLE public.risk_mitigasi_program;
       public         heap    postgres    false            �           1259    27450    risk_mitigasi_program_evaluasi    TABLE     P  CREATE TABLE public.risk_mitigasi_program_evaluasi (
    id_mitigasi_program_evaluasi bigint NOT NULL,
    progress numeric(5,2),
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    id_mitigasi_program bigint,
    id_periode_tw bigint
);
 2   DROP TABLE public.risk_mitigasi_program_evaluasi;
       public         heap    postgres    false            �           1259    27457    risk_mitigasi_progress    TABLE     x  CREATE TABLE public.risk_mitigasi_progress (
    id_mitigasi_progress bigint NOT NULL,
    status_progress double precision,
    id_periode_tw bigint,
    id_mitigasi bigint,
    create_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    tahun integer,
    remark text,
    status_mitigasi character varying(20),
    bulan character varying(50),
    id_risiko bigint,
    start_date_realisasi date,
    end_date_realisasi date,
    id_pengukuran integer
);
 *   DROP TABLE public.risk_mitigasi_progress;
       public         heap    postgres    false            �           1259    27456 /   risk_mitigasi_progress_id_mitigasi_progress_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_mitigasi_progress_id_mitigasi_progress_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.risk_mitigasi_progress_id_mitigasi_progress_seq;
       public          postgres    false    501            �           0    0 /   risk_mitigasi_progress_id_mitigasi_progress_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.risk_mitigasi_progress_id_mitigasi_progress_seq OWNED BY public.risk_mitigasi_progress.id_mitigasi_progress;
          public          postgres    false    500            �           1259    27468    risk_mitigasi_risiko    TABLE     �   CREATE TABLE public.risk_mitigasi_risiko (
    id_risiko bigint,
    id_mitigasi bigint,
    keterangan character varying(2000)
);
 (   DROP TABLE public.risk_mitigasi_risiko;
       public         heap    postgres    false            �           1259    27476    risk_msg    TABLE     ^   CREATE TABLE public.risk_msg (
    id_msg bigint NOT NULL,
    msg character varying(4000)
);
    DROP TABLE public.risk_msg;
       public         heap    postgres    false            �           1259    27475    risk_msg_id_msg_seq    SEQUENCE     |   CREATE SEQUENCE public.risk_msg_id_msg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_msg_id_msg_seq;
       public          postgres    false    504            �           0    0    risk_msg_id_msg_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_msg_id_msg_seq OWNED BY public.risk_msg.id_msg;
          public          postgres    false    503            �           1259    27484    risk_msg_penerima    TABLE     �   CREATE TABLE public.risk_msg_penerima (
    id_msg bigint NOT NULL,
    is_read character varying(1) DEFAULT '0'::character varying,
    id_user bigint NOT NULL
);
 %   DROP TABLE public.risk_msg_penerima;
       public         heap    postgres    false            �           1259    27491    risk_penyebab    TABLE     X  CREATE TABLE public.risk_penyebab (
    id_risk_penyebab bigint NOT NULL,
    nama character varying(500),
    created_date timestamp(6) without time zone,
    modified_date timestamp(6) without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 !   DROP TABLE public.risk_penyebab;
       public         heap    postgres    false            �           1259    27490 "   risk_penyebab_id_risk_penyebab_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_penyebab_id_risk_penyebab_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.risk_penyebab_id_risk_penyebab_seq;
       public          postgres    false    507            �           0    0 "   risk_penyebab_id_risk_penyebab_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.risk_penyebab_id_risk_penyebab_seq OWNED BY public.risk_penyebab.id_risk_penyebab;
          public          postgres    false    506            �           1259    27500    risk_review    TABLE     0  CREATE TABLE public.risk_review (
    id_review bigint NOT NULL,
    review character varying(4000) NOT NULL,
    id_risiko bigint NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    group_id bigint
);
    DROP TABLE public.risk_review;
       public         heap    postgres    false            �           1259    27499    risk_review_id_review_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_review_id_review_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.risk_review_id_review_seq;
       public          postgres    false    509            �           0    0    risk_review_id_review_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.risk_review_id_review_seq OWNED BY public.risk_review.id_review;
          public          postgres    false    508            �           1259    27511    risk_risiko    TABLE     �  CREATE TABLE public.risk_risiko (
    id_risiko bigint NOT NULL,
    nomor character varying(50) NOT NULL,
    nama character varying(2000) NOT NULL,
    deskripsi text,
    inheren_dampak bigint,
    inheren_kemungkinan bigint,
    control_dampak_penurunan bigint,
    control_kemungkinan_penurunan bigint,
    penyebab text,
    dampak text,
    id_scorecard bigint NOT NULL,
    id_status_pengajuan bigint,
    id_kegiatan bigint,
    residual_target_dampak bigint,
    residual_target_kemungkinan bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    residual_dampak_evaluasi bigint,
    residual_kemungkinan_evaluasi bigint,
    current_risk bigint,
    id_sasaran bigint,
    current_risk_dampak bigint,
    current_risk_kemungkinan bigint,
    id_kriteria_dampak bigint,
    progress_capaian_kinerja text,
    hambatan_kendala text,
    penyesuaian_tindakan_mitigasi text,
    progress_capaian_sasaran text,
    status_risiko character varying(1) DEFAULT '1'::character varying,
    status_keterangan character varying(2000),
    is_lock character varying(1) DEFAULT '0'::character varying,
    tgl_risiko date,
    id_risiko_sebelum bigint,
    tgl_close date,
    nomor_asli character varying(50),
    id_kriteria_kemungkinan bigint,
    urutan double precision,
    id_aktifitas bigint,
    nama_aktifitas character varying(2000),
    kode_aktifitas character varying(20),
    rekomendasi_keterangan character varying(2000),
    rekomendasi_is_verified character varying(1) DEFAULT '0'::character varying,
    rekomendasi_nid character varying(10),
    rekomendasi_date timestamp without time zone,
    rekomendasi_jabatan bigint,
    rekomendasi_group character varying(20),
    review_nid character varying(10),
    review_date timestamp without time zone,
    review_jabatan bigint,
    id_jabatan bigint,
    review_group character varying(20),
    review_is_verified character varying(1) DEFAULT '0'::character varying,
    no bigint,
    review_kepatuhan character varying(2000),
    id_taksonomi bigint,
    id_kategori bigint,
    sub_tahapan_kegiatan character varying(1000),
    id_fraud_kategori bigint,
    id_fraud_jenis bigint,
    skor_inheren_dampak double precision,
    skor_inheren_kemungkinan double precision,
    skor_control_dampak double precision,
    skor_control_kemungkinan double precision,
    skor_target_dampak double precision,
    skor_target_kemungkinan double precision,
    skor_current_dampak double precision,
    skor_current_kemungkinan double precision,
    regulasi character varying(500),
    id_risiko_parent bigint,
    nama_kegiatan character varying(500),
    id_risiko_parent_lain smallint,
    red_flag character varying(1000),
    id_kpi bigint,
    sasaran text,
    id_taksonomi_area bigint,
    pengendalian_risiko_berjalan text,
    target_penyelesaian text,
    anggaran_biaya double precision,
    id_interval_anggaran bigint,
    dampak_kuantitatif_inheren double precision,
    dampak_kuantitatif_current double precision,
    dampak_kuantitatif_residual double precision,
    hasil_mitigasi_terhadap_sasaran text,
    is_monitoring_rmtik integer,
    is_monitoring_p2k3 integer,
    is_monitoring_fkap integer,
    ket_monitoring_rmtik text,
    ket_monitoring_p2k3 text,
    ket_monitoring_fkap text,
    is_evaluasi_mitigasi integer DEFAULT 0,
    is_evaluasi_risiko integer DEFAULT 0,
    id_mig integer,
    id_taksonomi_objective bigint,
    kuantifikasi text,
    hasil_thdp_perusahaan text,
    is_capability integer,
    is_accept integer,
    benefit_potential text,
    dampak_kuantitatif_target double precision,
    id_owner_sso bigint,
    is_rutin smallint,
    is_opp_inherent smallint,
    is_opp_current smallint,
    is_opp_target smallint,
    is_opp_evaluasi smallint,
    is_signifikan_inherent smallint,
    is_signifikan_current smallint,
    is_signifikan_evaluasi smallint,
    id_aspek_lingkungan integer,
    id_risk_penyebab bigint,
    id_risk_dampak bigint,
    integrasi_eksternal text,
    id_prioritas integer,
    id_kategori_proyek integer,
    id_proyek_terkait bigint,
    proyek_terkait character varying(500),
    response character varying(100),
    selera_dampak integer,
    selera_kemungkinan integer
);
    DROP TABLE public.risk_risiko;
       public         heap    postgres    false                       1259    27551    risk_risiko_current    TABLE     �  CREATE TABLE public.risk_risiko_current (
    id_risiko bigint NOT NULL,
    id_kemungkinan bigint,
    id_dampak bigint,
    skor_kemungkinan double precision,
    skor_dampak double precision,
    id_risiko_current bigint NOT NULL,
    id_periode_tw bigint,
    progress_capaian_kinerja character varying(500),
    progress_capaian_sasaran character varying(500),
    penyesuaian_tindakan_mitigasi character varying(500),
    hambatan_kendala character varying(500),
    tahun double precision,
    is_opp smallint,
    is_signifikan smallint,
    bulan character varying(2),
    hasil_mitigasi_terhadap_sasaran character varying(500)
);
 '   DROP TABLE public.risk_risiko_current;
       public         heap    postgres    false                        1259    27550 )   risk_risiko_current_id_risiko_current_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_risiko_current_id_risiko_current_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.risk_risiko_current_id_risiko_current_seq;
       public          postgres    false    513            �           0    0 )   risk_risiko_current_id_risiko_current_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.risk_risiko_current_id_risiko_current_seq OWNED BY public.risk_risiko_current.id_risiko_current;
          public          postgres    false    512                       1259    27563    risk_risiko_dampak    TABLE     \   CREATE TABLE public.risk_risiko_dampak (
    id_risiko bigint,
    id_risk_dampak bigint
);
 &   DROP TABLE public.risk_risiko_dampak;
       public         heap    postgres    false                       1259    27569    risk_risiko_files    TABLE     <  CREATE TABLE public.risk_risiko_files (
    id_risiko_files bigint NOT NULL,
    client_name character varying(100),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_risiko bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 %   DROP TABLE public.risk_risiko_files;
       public         heap    postgres    false                       1259    27568 %   risk_risiko_files_id_risiko_files_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_risiko_files_id_risiko_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.risk_risiko_files_id_risiko_files_seq;
       public          postgres    false    516            �           0    0 %   risk_risiko_files_id_risiko_files_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.risk_risiko_files_id_risiko_files_seq OWNED BY public.risk_risiko_files.id_risiko_files;
          public          postgres    false    515                       1259    27577    risk_risiko_history    TABLE     k  CREATE TABLE public.risk_risiko_history (
    id_risiko bigint NOT NULL,
    tgl_close timestamp without time zone NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    jenis_close character varying(1) DEFAULT '2'::character varying NOT NULL,
    content text
);
 '   DROP TABLE public.risk_risiko_history;
       public         heap    postgres    false            �           1259    27510    risk_risiko_id_risiko_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_risiko_id_risiko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.risk_risiko_id_risiko_seq;
       public          postgres    false    511            �           0    0    risk_risiko_id_risiko_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.risk_risiko_id_risiko_seq OWNED BY public.risk_risiko.id_risiko;
          public          postgres    false    510                       1259    27585    risk_risiko_kpi    TABLE     c   CREATE TABLE public.risk_risiko_kpi (
    id_risiko bigint NOT NULL,
    id_kpi bigint NOT NULL
);
 #   DROP TABLE public.risk_risiko_kpi;
       public         heap    postgres    false                       1259    27591    risk_risiko_penyebab    TABLE     `   CREATE TABLE public.risk_risiko_penyebab (
    id_risiko bigint,
    id_risk_penyebab bigint
);
 (   DROP TABLE public.risk_risiko_penyebab;
       public         heap    postgres    false                       1259    27596    risk_risiko_proyek_terkait    TABLE     t   CREATE TABLE public.risk_risiko_proyek_terkait (
    id_risiko bigint NOT NULL,
    id_scorecard bigint NOT NULL
);
 .   DROP TABLE public.risk_risiko_proyek_terkait;
       public         heap    postgres    false            	           1259    27601    risk_risiko_unit    TABLE     l   CREATE TABLE public.risk_risiko_unit (
    id_risiko_unit bigint NOT NULL,
    id_risiko bigint NOT NULL
);
 $   DROP TABLE public.risk_risiko_unit;
       public         heap    postgres    false                       1259    27608    risk_sasaran    TABLE       CREATE TABLE public.risk_sasaran (
    id_sasaran bigint NOT NULL,
    nama character varying(200) NOT NULL,
    id_sasaran_parent bigint,
    kpi_deskripsi character varying(4000),
    kpi character varying(200),
    kelompok character varying(2),
    kategori character varying(5),
    kode character varying(20),
    tgl_mulai_efektif date,
    tgl_akhir_efektif date,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    is_kegiatan character varying(1) DEFAULT '0'::character varying
);
     DROP TABLE public.risk_sasaran;
       public         heap    postgres    false            
           1259    27607    risk_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_sasaran_id_sasaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.risk_sasaran_id_sasaran_seq;
       public          postgres    false    523            �           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.risk_sasaran_id_sasaran_seq OWNED BY public.risk_sasaran.id_sasaran;
          public          postgres    false    522                       1259    27618    risk_sasaran_kpi    TABLE     e   CREATE TABLE public.risk_sasaran_kpi (
    id_sasaran bigint NOT NULL,
    id_kpi bigint NOT NULL
);
 $   DROP TABLE public.risk_sasaran_kpi;
       public         heap    postgres    false                       1259    27624    risk_sasaran_pic    TABLE     i   CREATE TABLE public.risk_sasaran_pic (
    id_sasaran bigint NOT NULL,
    id_jabatan bigint NOT NULL
);
 $   DROP TABLE public.risk_sasaran_pic;
       public         heap    postgres    false                       1259    27631    risk_scorecard    TABLE     �  CREATE TABLE public.risk_scorecard (
    id_scorecard bigint NOT NULL,
    nama character varying(300) NOT NULL,
    scope character varying(4000),
    id_visi_misi bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    id_kajian_risiko bigint,
    id_unit character varying(18),
    tgl_mulai_efektif date,
    tgl_akhir_efektif timestamp without time zone,
    owner bigint,
    id_struktur bigint,
    id_parent_scorecard bigint,
    navigasi character varying(1) DEFAULT '0'::character varying,
    open_evaluasi character varying(1) DEFAULT '0'::character varying,
    id_nama_proses bigint,
    is_info character varying(1) DEFAULT '0'::character varying,
    template_laporan character varying(1000),
    proses character varying(1000),
    id_tingkat_agregasi_risiko bigint,
    id_temp bigint,
    is_kegiatan character varying(1) DEFAULT '0'::character varying,
    kode character varying(20),
    id_status_pengajuan bigint,
    is_evaluasi_mitigasi integer DEFAULT 0,
    is_evaluasi_risiko integer DEFAULT 0,
    id_konteks bigint,
    rutin_non_rutin character varying(20),
    jenis_proyek character varying(200),
    id_sasaran_proyek integer,
    biaya_proyek integer,
    tgl_mulai date,
    tgl_selesai date,
    nama_user character varying(100),
    id_user bigint,
    nama_jabatan_user character varying(100),
    id_jabatan_user bigint,
    nama_owner character varying(100),
    id_owner bigint,
    nama_jabatan_owner character varying(100),
    id_jabatan_owner bigint,
    nama_upmr character varying(100),
    id_upmr bigint,
    nama_jabatan_upmr character varying(100),
    id_jabatan_upmr bigint
);
 "   DROP TABLE public.risk_scorecard;
       public         heap    postgres    false                       1259    27653    risk_scorecard_files    TABLE     G  CREATE TABLE public.risk_scorecard_files (
    id_scorecard_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_scorecard bigint,
    jenis character varying(20) DEFAULT 'file'::character varying
);
 (   DROP TABLE public.risk_scorecard_files;
       public         heap    postgres    false                       1259    27652 +   risk_scorecard_files_id_scorecard_files_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_scorecard_files_id_scorecard_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.risk_scorecard_files_id_scorecard_files_seq;
       public          postgres    false    529            �           0    0 +   risk_scorecard_files_id_scorecard_files_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.risk_scorecard_files_id_scorecard_files_seq OWNED BY public.risk_scorecard_files.id_scorecard_files;
          public          postgres    false    528                       1259    27630    risk_scorecard_id_scorecard_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_scorecard_id_scorecard_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.risk_scorecard_id_scorecard_seq;
       public          postgres    false    527            �           0    0    risk_scorecard_id_scorecard_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.risk_scorecard_id_scorecard_seq OWNED BY public.risk_scorecard.id_scorecard;
          public          postgres    false    526                       1259    27663    risk_scorecard_user    TABLE     n   CREATE TABLE public.risk_scorecard_user (
    id_scorecard bigint NOT NULL,
    id_jabatan bigint NOT NULL
);
 '   DROP TABLE public.risk_scorecard_user;
       public         heap    postgres    false                       1259    27669    risk_scorecard_view    TABLE     n   CREATE TABLE public.risk_scorecard_view (
    id_jabatan bigint NOT NULL,
    id_scorecard bigint NOT NULL
);
 '   DROP TABLE public.risk_scorecard_view;
       public         heap    postgres    false                       1259    27676    risk_strategi_map    TABLE     �   CREATE TABLE public.risk_strategi_map (
    id_strategi_map bigint NOT NULL,
    tgl_mulai_efektif date,
    tgl_akhir_efektif date
);
 %   DROP TABLE public.risk_strategi_map;
       public         heap    postgres    false                       1259    27675 %   risk_strategi_map_id_strategi_map_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_strategi_map_id_strategi_map_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.risk_strategi_map_id_strategi_map_seq;
       public          postgres    false    533            �           0    0 %   risk_strategi_map_id_strategi_map_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.risk_strategi_map_id_strategi_map_seq OWNED BY public.risk_strategi_map.id_strategi_map;
          public          postgres    false    532                       1259    27683 	   risk_task    TABLE     �  CREATE TABLE public.risk_task (
    id_task bigint NOT NULL,
    page character varying(100),
    dari character varying(10),
    deskripsi character varying(2000),
    id_scorecard bigint,
    id_risiko bigint,
    id_control bigint,
    id_mitigasi bigint,
    id_kegiatan bigint,
    id_status_pengajuan bigint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    group_id bigint,
    status character varying(1) DEFAULT '0'::character varying,
    untuk bigint,
    is_pending character varying(1) DEFAULT '0'::character varying,
    url character varying(1000),
    id_scorecard_peluang bigint,
    id_pemeriksaan bigint
);
    DROP TABLE public.risk_task;
       public         heap    postgres    false                       1259    27682    risk_task_id_task_seq    SEQUENCE     ~   CREATE SEQUENCE public.risk_task_id_task_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.risk_task_id_task_seq;
       public          postgres    false    535            �           0    0    risk_task_id_task_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.risk_task_id_task_seq OWNED BY public.risk_task.id_task;
          public          postgres    false    534                       1259    27702    risk_var    TABLE     �   CREATE TABLE public.risk_var (
    id_risiko bigint NOT NULL,
    tahun character varying(4) NOT NULL,
    target double precision,
    realisasi double precision,
    jenis character varying(45)
);
    DROP TABLE public.risk_var;
       public         heap    postgres    false                       1259    27708    risk_visi_misi    TABLE     $  CREATE TABLE public.risk_visi_misi (
    id_visi_misi bigint NOT NULL,
    visi character varying(4000) NOT NULL,
    misi character varying(4000) NOT NULL,
    strength character varying(4000),
    weakness character varying(4000),
    opportunity text,
    threat text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    konteks_internal text,
    konteks_eksternal text,
    tgl_mulai_efektif date,
    tgl_akhir_efektif timestamp without time zone
);
 "   DROP TABLE public.risk_visi_misi;
       public         heap    postgres    false                       1259    27707    risk_visi_misi_id_visi_misi_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_visi_misi_id_visi_misi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.risk_visi_misi_id_visi_misi_seq;
       public          postgres    false    538            �           0    0    risk_visi_misi_id_visi_misi_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.risk_visi_misi_id_visi_misi_seq OWNED BY public.risk_visi_misi.id_visi_misi;
          public          postgres    false    537                       1259    27717    rtm    TABLE     x  CREATE TABLE public.rtm (
    id_rtm integer NOT NULL,
    rtm_ke integer,
    tingkat character varying(45),
    rkt bigint,
    tahun integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
    DROP TABLE public.rtm;
       public         heap    postgres    false                       1259    27725 	   rtm_files    TABLE     1  CREATE TABLE public.rtm_files (
    id_rtm_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_rtm integer,
    jenis character varying(20) DEFAULT 'file'::character varying
);
    DROP TABLE public.rtm_files;
       public         heap    postgres    false                       1259    27724    rtm_files_id_rtm_files_seq    SEQUENCE     �   CREATE SEQUENCE public.rtm_files_id_rtm_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.rtm_files_id_rtm_files_seq;
       public          postgres    false    542            �           0    0    rtm_files_id_rtm_files_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.rtm_files_id_rtm_files_seq OWNED BY public.rtm_files.id_rtm_files;
          public          postgres    false    541                       1259    27716    rtm_id_rtm_seq    SEQUENCE     �   CREATE SEQUENCE public.rtm_id_rtm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rtm_id_rtm_seq;
       public          postgres    false    540            �           0    0    rtm_id_rtm_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.rtm_id_rtm_seq OWNED BY public.rtm.id_rtm;
          public          postgres    false    539                        1259    27736    rtm_progress    TABLE     �  CREATE TABLE public.rtm_progress (
    id_rtm_progress integer NOT NULL,
    target real,
    realisasi real,
    competitor real,
    tahun integer,
    id_rtm_uraian integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
     DROP TABLE public.rtm_progress;
       public         heap    postgres    false                       1259    27735     rtm_progress_id_rtm_progress_seq    SEQUENCE     �   CREATE SEQUENCE public.rtm_progress_id_rtm_progress_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.rtm_progress_id_rtm_progress_seq;
       public          postgres    false    544            �           0    0     rtm_progress_id_rtm_progress_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.rtm_progress_id_rtm_progress_seq OWNED BY public.rtm_progress.id_rtm_progress;
          public          postgres    false    543            "           1259    27744 
   rtm_uraian    TABLE     �  CREATE TABLE public.rtm_uraian (
    id_rtm_uraian integer NOT NULL,
    uraian bytea,
    analisis bytea,
    uraian_rencana bytea,
    uraian_target bytea,
    keterangan_pic bytea,
    status integer,
    tindak_lanjut bytea,
    tindak_lanjut_rencana_penyelesaian bytea,
    tindak_lanjut_realisasi_penyelesaian bytea,
    id_jenis_rtm integer,
    id_jenis_rtm_parent integer,
    is_risalah smallint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    is_tindak_lanjut smallint DEFAULT 0,
    is_grafik smallint,
    modified_by_desc character varying(200)
);
    DROP TABLE public.rtm_uraian;
       public         heap    postgres    false            $           1259    27756    rtm_uraian_files    TABLE     �  CREATE TABLE public.rtm_uraian_files (
    id_rtm_uraian_files bigint NOT NULL,
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    id_rtm_uraian integer,
    jenis character varying(20) DEFAULT 'file'::character varying,
    rtm_uraian_filescol character varying(45),
    id_rtm integer
);
 $   DROP TABLE public.rtm_uraian_files;
       public         heap    postgres    false            #           1259    27755 (   rtm_uraian_files_id_rtm_uraian_files_seq    SEQUENCE     �   CREATE SEQUENCE public.rtm_uraian_files_id_rtm_uraian_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.rtm_uraian_files_id_rtm_uraian_files_seq;
       public          postgres    false    548            �           0    0 (   rtm_uraian_files_id_rtm_uraian_files_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.rtm_uraian_files_id_rtm_uraian_files_seq OWNED BY public.rtm_uraian_files.id_rtm_uraian_files;
          public          postgres    false    547            !           1259    27743    rtm_uraian_id_rtm_uraian_seq    SEQUENCE     �   CREATE SEQUENCE public.rtm_uraian_id_rtm_uraian_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.rtm_uraian_id_rtm_uraian_seq;
       public          postgres    false    546            �           0    0    rtm_uraian_id_rtm_uraian_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.rtm_uraian_id_rtm_uraian_seq OWNED BY public.rtm_uraian.id_rtm_uraian;
          public          postgres    false    545            %           1259    27767    rtm_uraian_link    TABLE     �  CREATE TABLE public.rtm_uraian_link (
    id_rtm_uraian integer NOT NULL,
    id_rtm integer NOT NULL,
    status integer,
    tindak_lanjut bytea,
    tindak_lanjut_rencana_penyelesaian bytea,
    tindak_lanjut_realisasi_penyelesaian bytea,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 #   DROP TABLE public.rtm_uraian_link;
       public         heap    postgres    false            &           1259    27775    rtm_urian_unit    TABLE     w   CREATE TABLE public.rtm_urian_unit (
    id_unit character varying(18) NOT NULL,
    id_rtm_uraian integer NOT NULL
);
 "   DROP TABLE public.rtm_urian_unit;
       public         heap    postgres    false            (           1259    27782    spi_audit_evaluasi    TABLE     i  CREATE TABLE public.spi_audit_evaluasi (
    id_audit_evaluasi integer NOT NULL,
    tanggal date,
    nomor character varying(50),
    lampiran character varying(200),
    hal character varying(200),
    simpulan text,
    saran text,
    dasar_tugas text,
    dasar_evaluasi text,
    cakupan_evaluasi text,
    informasi_umum text,
    hasil_evaluasi text,
    id_manajer integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 &   DROP TABLE public.spi_audit_evaluasi;
       public         heap    postgres    false            '           1259    27781 (   spi_audit_evaluasi_id_audit_evaluasi_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_audit_evaluasi_id_audit_evaluasi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.spi_audit_evaluasi_id_audit_evaluasi_seq;
       public          postgres    false    552            �           0    0 (   spi_audit_evaluasi_id_audit_evaluasi_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.spi_audit_evaluasi_id_audit_evaluasi_seq OWNED BY public.spi_audit_evaluasi.id_audit_evaluasi;
          public          postgres    false    551            *           1259    27791    spi_hasil_monitoring    TABLE     X  CREATE TABLE public.spi_hasil_monitoring (
    id_monitoring integer NOT NULL,
    kepada character varying(100),
    dari character varying(100),
    tanggal date,
    nomor character varying(100),
    perihal character varying(100),
    dasar_tugas text,
    dasar_hukum text,
    data_fakta text,
    pembahasan text,
    kesimpulan text,
    id_penyusun integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by integer,
    modified_by integer,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 (   DROP TABLE public.spi_hasil_monitoring;
       public         heap    postgres    false            )           1259    27790 &   spi_hasil_monitoring_id_monitoring_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_hasil_monitoring_id_monitoring_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.spi_hasil_monitoring_id_monitoring_seq;
       public          postgres    false    554            �           0    0 &   spi_hasil_monitoring_id_monitoring_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.spi_hasil_monitoring_id_monitoring_seq OWNED BY public.spi_hasil_monitoring.id_monitoring;
          public          postgres    false    553            ,           1259    27800    spi_library    TABLE     �  CREATE TABLE public.spi_library (
    id_dokumen integer NOT NULL,
    nomor_dokumen character varying(100),
    tanggal_dokumen date,
    judul_dokumen character varying(100),
    id_kategori_dokumen character varying(50),
    kategori_dokumen character varying(100),
    sumber_dokumen character varying(100),
    uraian_dokumen character varying(500),
    id_file character varying(20)
);
    DROP TABLE public.spi_library;
       public         heap    postgres    false            .           1259    27809    spi_library_files    TABLE     2  CREATE TABLE public.spi_library_files (
    id_dokumen_files bigint NOT NULL,
    client_name character varying(500),
    file_name character varying(100),
    file_type character varying(100),
    file_size double precision,
    id_dokumen integer,
    jenis character varying(20) DEFAULT 'file'::character varying,
    url text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200)
);
 %   DROP TABLE public.spi_library_files;
       public         heap    postgres    false            -           1259    27808 &   spi_library_files_id_dokumen_files_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_library_files_id_dokumen_files_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.spi_library_files_id_dokumen_files_seq;
       public          postgres    false    558            �           0    0 &   spi_library_files_id_dokumen_files_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.spi_library_files_id_dokumen_files_seq OWNED BY public.spi_library_files.id_dokumen_files;
          public          postgres    false    557            +           1259    27799    spi_library_id_dokumen_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_library_id_dokumen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.spi_library_id_dokumen_seq;
       public          postgres    false    556                        0    0    spi_library_id_dokumen_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.spi_library_id_dokumen_seq OWNED BY public.spi_library.id_dokumen;
          public          postgres    false    555            0           1259    27819    spi_notulen    TABLE     �  CREATE TABLE public.spi_notulen (
    id_notulen integer NOT NULL,
    nama_rapat character varying(200),
    tanggal_rapat date,
    waktu_rapat character varying(50),
    tempat_rapat character varying(50),
    acara character varying(200),
    pimpinan_rapat character varying(200),
    notulis character varying(200),
    id_peserta_rapat integer,
    kegiatan_rapat character varying(200),
    pembukaan text,
    pembahasan text,
    penutup text,
    kesimpulan text,
    created_date timestamp without time zone,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    id_jabatan_notulis integer
);
    DROP TABLE public.spi_notulen;
       public         heap    postgres    false            2           1259    27828    spi_notulen_acara    TABLE     �   CREATE TABLE public.spi_notulen_acara (
    id_acara integer NOT NULL,
    id_notulen integer,
    acara character varying(200)
);
 %   DROP TABLE public.spi_notulen_acara;
       public         heap    postgres    false            1           1259    27827    spi_notulen_acara_id_acara_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_notulen_acara_id_acara_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.spi_notulen_acara_id_acara_seq;
       public          postgres    false    562                       0    0    spi_notulen_acara_id_acara_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.spi_notulen_acara_id_acara_seq OWNED BY public.spi_notulen_acara.id_acara;
          public          postgres    false    561            /           1259    27818    spi_notulen_id_notulen_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_notulen_id_notulen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.spi_notulen_id_notulen_seq;
       public          postgres    false    560                       0    0    spi_notulen_id_notulen_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.spi_notulen_id_notulen_seq OWNED BY public.spi_notulen.id_notulen;
          public          postgres    false    559            4           1259    27835    spi_notulen_peserta    TABLE     �   CREATE TABLE public.spi_notulen_peserta (
    id_peserta integer NOT NULL,
    nama character varying(200),
    id_notulen integer
);
 '   DROP TABLE public.spi_notulen_peserta;
       public         heap    postgres    false            3           1259    27834 "   spi_notulen_peserta_id_peserta_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_notulen_peserta_id_peserta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.spi_notulen_peserta_id_peserta_seq;
       public          postgres    false    564                       0    0 "   spi_notulen_peserta_id_peserta_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.spi_notulen_peserta_id_peserta_seq OWNED BY public.spi_notulen_peserta.id_peserta;
          public          postgres    false    563            6           1259    27842    spi_program_audit    TABLE     �  CREATE TABLE public.spi_program_audit (
    id_program_audit integer NOT NULL,
    nama_audit character varying(200),
    id_risiko integer DEFAULT 0,
    sarana_kendaraan character varying(200),
    sarana_lainnya character varying(200),
    dana_sppd double precision,
    dana_lainnya double precision,
    lain_lain text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    jenis_audit character varying(200),
    frekuensi_audit character varying(200),
    minggu_mulai character varying(50),
    minggu_selesai character varying(50),
    tahun integer,
    id_jabatan_penyesusun bigint,
    id_jabatan_pereview bigint,
    jabatan_penyesusun character varying(200),
    nama_jabatan_penyusun character varying(200),
    jabatan_pereview character varying(200),
    nama_jabatan_pereview character varying(200),
    nama_penyusun character varying(200),
    nama_pereview character varying(200),
    id_penanggung_jawab integer,
    nama_penanggung_jawab character varying(200),
    nama_jabatan_penanggung_jawab character varying(200),
    id_penyusun integer,
    id_pereview integer
);
 %   DROP TABLE public.spi_program_audit;
       public         heap    postgres    false            5           1259    27841 &   spi_program_audit_id_program_audit_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_program_audit_id_program_audit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.spi_program_audit_id_program_audit_seq;
       public          postgres    false    566                       0    0 &   spi_program_audit_id_program_audit_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.spi_program_audit_id_program_audit_seq OWNED BY public.spi_program_audit.id_program_audit;
          public          postgres    false    565            7           1259    27851    spi_program_audit_jabatan    TABLE     �   CREATE TABLE public.spi_program_audit_jabatan (
    id_program_audit integer,
    id_jabatan integer,
    nama character varying(200),
    nama_jabatan character varying(200),
    peran character varying(45),
    user_id integer
);
 -   DROP TABLE public.spi_program_audit_jabatan;
       public         heap    postgres    false            9           1259    27855    spi_program_audit_tahun    TABLE     �   CREATE TABLE public.spi_program_audit_tahun (
    id_program_audit integer NOT NULL,
    nama_audit character varying(50),
    id_risk_risiko integer,
    frekuensi_audit character varying(50),
    jenis_audit character varying(50)
);
 +   DROP TABLE public.spi_program_audit_tahun;
       public         heap    postgres    false            8           1259    27854 ,   spi_program_audit_tahun_id_program_audit_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_program_audit_tahun_id_program_audit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.spi_program_audit_tahun_id_program_audit_seq;
       public          postgres    false    569                       0    0 ,   spi_program_audit_tahun_id_program_audit_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.spi_program_audit_tahun_id_program_audit_seq OWNED BY public.spi_program_audit_tahun.id_program_audit;
          public          postgres    false    568            ;           1259    27862    spi_rekap_consulting    TABLE     �  CREATE TABLE public.spi_rekap_consulting (
    id_konsultasi integer NOT NULL,
    id_msg integer,
    tanggal date,
    jabatan character varying(100),
    waktu_mulai character varying(50),
    waktu_selesai character varying(50),
    contact_person character varying(100),
    nomor_telpon character varying(50),
    uraian_layanan text,
    pendapat_spi text,
    dokumen_disampaikan character varying(100),
    pengawas character varying(100),
    keterangan text,
    rating character varying(50),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    id_unit_kerja integer
);
 (   DROP TABLE public.spi_rekap_consulting;
       public         heap    postgres    false            :           1259    27861 &   spi_rekap_consulting_id_konsultasi_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_rekap_consulting_id_konsultasi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.spi_rekap_consulting_id_konsultasi_seq;
       public          postgres    false    571                       0    0 &   spi_rekap_consulting_id_konsultasi_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.spi_rekap_consulting_id_konsultasi_seq OWNED BY public.spi_rekap_consulting.id_konsultasi;
          public          postgres    false    570            =           1259    27871    spi_rka    TABLE     �   CREATE TABLE public.spi_rka (
    id_rka integer NOT NULL,
    id_kpi integer,
    polaritas_minimal character varying(50),
    polaritas_maksimal character varying(50),
    nialai integer,
    satuan integer,
    tahun integer
);
    DROP TABLE public.spi_rka;
       public         heap    postgres    false            <           1259    27870    spi_rka_id_rka_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_rka_id_rka_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.spi_rka_id_rka_seq;
       public          postgres    false    573                       0    0    spi_rka_id_rka_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.spi_rka_id_rka_seq OWNED BY public.spi_rka.id_rka;
          public          postgres    false    572            ?           1259    27878    spi_sasaran    TABLE     �  CREATE TABLE public.spi_sasaran (
    id_sasaran integer NOT NULL,
    sasaran character varying(200),
    id_jabatan integer,
    misi character varying(2000),
    keterangan text,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    tahun integer
);
    DROP TABLE public.spi_sasaran;
       public         heap    postgres    false            >           1259    27877    spi_sasaran_id_sasaran_seq    SEQUENCE     �   CREATE SEQUENCE public.spi_sasaran_id_sasaran_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.spi_sasaran_id_sasaran_seq;
       public          postgres    false    575                       0    0    spi_sasaran_id_sasaran_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.spi_sasaran_id_sasaran_seq OWNED BY public.spi_sasaran.id_sasaran;
          public          postgres    false    574            @           1259    27886    temp_pegawai    TABLE     �  CREATE TABLE public.temp_pegawai (
    id_jabatan integer,
    nama_jabatan character varying(200),
    nik character varying(45),
    nama character varying(300),
    nama_unitkerja character varying(200),
    nama_sub_unitkerja character varying(200),
    nama_bidang character varying(200),
    nama_subbidang character varying(200),
    seksi character varying(200),
    id_unitkerja integer,
    id_subunitkerja integer,
    id_bidang integer,
    id_subbidang integer,
    id_seksi integer
);
     DROP TABLE public.temp_pegawai;
       public         heap    postgres    false            B           1259    27892    template    TABLE     ?  CREATE TABLE public.template (
    id_template integer NOT NULL,
    no_template character varying(45),
    nama character varying(200),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    created_by bigint,
    modified_by bigint,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    client_name character varying(1000),
    file_name character varying(1000),
    file_type character varying(100),
    file_size double precision,
    file_url character varying(500),
    id_mig integer
);
    DROP TABLE public.template;
       public         heap    postgres    false            A           1259    27891    template_id_template_seq    SEQUENCE     �   CREATE SEQUENCE public.template_id_template_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.template_id_template_seq;
       public          postgres    false    578            	           0    0    template_id_template_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.template_id_template_seq OWNED BY public.template.id_template;
          public          postgres    false    577            C           1259    27900    tr_kategori_arsip_spi    TABLE     w   CREATE TABLE public.tr_kategori_arsip_spi (
    id integer NOT NULL,
    nama_kategori_arsip character varying(255)
);
 )   DROP TABLE public.tr_kategori_arsip_spi;
       public         heap    postgres    false                       2604    26015     comp_kebutuhan id_comp_kebutuhan    DEFAULT     �   ALTER TABLE ONLY public.comp_kebutuhan ALTER COLUMN id_comp_kebutuhan SET DEFAULT nextval('public.comp_kebutuhan_id_comp_kebutuhan_seq'::regclass);
 O   ALTER TABLE public.comp_kebutuhan ALTER COLUMN id_comp_kebutuhan DROP DEFAULT;
       public          postgres    false    216    215    216                       2604    26026     comp_penilaian id_comp_penilaian    DEFAULT     �   ALTER TABLE ONLY public.comp_penilaian ALTER COLUMN id_comp_penilaian SET DEFAULT nextval('public.comp_penilaian_id_comp_penilaian_seq'::regclass);
 O   ALTER TABLE public.comp_penilaian ALTER COLUMN id_comp_penilaian DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    26039 ,   comp_penilaian_files id_comp_penilaian_files    DEFAULT     �   ALTER TABLE ONLY public.comp_penilaian_files ALTER COLUMN id_comp_penilaian_files SET DEFAULT nextval('public.comp_penilaian_files_id_comp_penilaian_files_seq'::regclass);
 [   ALTER TABLE public.comp_penilaian_files ALTER COLUMN id_comp_penilaian_files DROP DEFAULT;
       public          postgres    false    219    220    220                       2604    26050    contents id_contents    DEFAULT     |   ALTER TABLE ONLY public.contents ALTER COLUMN id_contents SET DEFAULT nextval('public.contents_id_contents_seq'::regclass);
 C   ALTER TABLE public.contents ALTER COLUMN id_contents DROP DEFAULT;
       public          postgres    false    222    221    222                       2604    26059    dokumen id_dokumen    DEFAULT     x   ALTER TABLE ONLY public.dokumen ALTER COLUMN id_dokumen SET DEFAULT nextval('public.dokumen_id_dokumen_seq'::regclass);
 A   ALTER TABLE public.dokumen ALTER COLUMN id_dokumen DROP DEFAULT;
       public          postgres    false    223    224    224                       2604    26071    dokumen_files id_dokumen_files    DEFAULT     �   ALTER TABLE ONLY public.dokumen_files ALTER COLUMN id_dokumen_files SET DEFAULT nextval('public.dokumen_files_id_dokumen_files_seq'::regclass);
 M   ALTER TABLE public.dokumen_files ALTER COLUMN id_dokumen_files DROP DEFAULT;
       public          postgres    false    225    226    226                       2604    26095    dokumen_versi id_dokumen_versi    DEFAULT     �   ALTER TABLE ONLY public.dokumen_versi ALTER COLUMN id_dokumen_versi SET DEFAULT nextval('public.dokumen_versi_id_dokumen_versi_seq'::regclass);
 M   ALTER TABLE public.dokumen_versi ALTER COLUMN id_dokumen_versi DROP DEFAULT;
       public          postgres    false    231    230    231                       2604    26104 
   kpi id_kpi    DEFAULT     h   ALTER TABLE ONLY public.kpi ALTER COLUMN id_kpi SET DEFAULT nextval('public.kpi_id_kpi_seq'::regclass);
 9   ALTER TABLE public.kpi ALTER COLUMN id_kpi DROP DEFAULT;
       public          postgres    false    233    232    233                       2604    26124    kpi_individu id_kpi    DEFAULT     z   ALTER TABLE ONLY public.kpi_individu ALTER COLUMN id_kpi SET DEFAULT nextval('public.kpi_individu_id_kpi_seq'::regclass);
 B   ALTER TABLE public.kpi_individu ALTER COLUMN id_kpi DROP DEFAULT;
       public          postgres    false    235    236    236            !           2604    26133    kpi_target id_kpi_target    DEFAULT     �   ALTER TABLE ONLY public.kpi_target ALTER COLUMN id_kpi_target SET DEFAULT nextval('public.kpi_target_id_kpi_target_seq'::regclass);
 G   ALTER TABLE public.kpi_target ALTER COLUMN id_kpi_target DROP DEFAULT;
       public          postgres    false    237    238    238            #           2604    26147 *   kpi_target_evaluasi id_kpi_target_evaluasi    DEFAULT     �   ALTER TABLE ONLY public.kpi_target_evaluasi ALTER COLUMN id_kpi_target_evaluasi SET DEFAULT nextval('public.kpi_target_evaluasi_id_kpi_target_evaluasi_seq'::regclass);
 Y   ALTER TABLE public.kpi_target_evaluasi ALTER COLUMN id_kpi_target_evaluasi DROP DEFAULT;
       public          postgres    false    239    240    240            $           2604    26157 $   kpi_target_files id_kpi_target_files    DEFAULT     �   ALTER TABLE ONLY public.kpi_target_files ALTER COLUMN id_kpi_target_files SET DEFAULT nextval('public.kpi_target_files_id_kpi_target_files_seq'::regclass);
 S   ALTER TABLE public.kpi_target_files ALTER COLUMN id_kpi_target_files DROP DEFAULT;
       public          postgres    false    241    242    242            %           2604    26166 ,   kpi_target_realisasi id_kpi_target_realisasi    DEFAULT     �   ALTER TABLE ONLY public.kpi_target_realisasi ALTER COLUMN id_kpi_target_realisasi SET DEFAULT nextval('public.kpi_target_realisasi_id_kpi_target_realisasi_seq'::regclass);
 [   ALTER TABLE public.kpi_target_realisasi ALTER COLUMN id_kpi_target_realisasi DROP DEFAULT;
       public          postgres    false    243    244    244            &           2604    26174    lost_incident id_lost_incident    DEFAULT     �   ALTER TABLE ONLY public.lost_incident ALTER COLUMN id_lost_incident SET DEFAULT nextval('public.lost_incident_id_lost_incident_seq'::regclass);
 M   ALTER TABLE public.lost_incident ALTER COLUMN id_lost_incident DROP DEFAULT;
       public          postgres    false    245    246    246            '           2604    26183 *   lost_incident_files id_lost_incident_files    DEFAULT     �   ALTER TABLE ONLY public.lost_incident_files ALTER COLUMN id_lost_incident_files SET DEFAULT nextval('public.lost_incident_files_id_lost_incident_files_seq'::regclass);
 Y   ALTER TABLE public.lost_incident_files ALTER COLUMN id_lost_incident_files DROP DEFAULT;
       public          postgres    false    247    248    248            )           2604    26191 $   lost_incident_follow_up id_follow_up    DEFAULT     �   ALTER TABLE ONLY public.lost_incident_follow_up ALTER COLUMN id_follow_up SET DEFAULT nextval('public.lost_incident_follow_up_id_follow_up_seq'::regclass);
 S   ALTER TABLE public.lost_incident_follow_up ALTER COLUMN id_follow_up DROP DEFAULT;
       public          postgres    false    249    250    250            *           2604    26200 )   lost_incident_fu_files id_follow_up_files    DEFAULT     �   ALTER TABLE ONLY public.lost_incident_fu_files ALTER COLUMN id_follow_up_files SET DEFAULT nextval('public.lost_incident_fu_files_id_follow_up_files_seq'::regclass);
 X   ALTER TABLE public.lost_incident_fu_files ALTER COLUMN id_follow_up_files DROP DEFAULT;
       public          postgres    false    251    252    252            ,           2604    26208 -   lost_incident_fu_p_files id_follow_up_p_files    DEFAULT     �   ALTER TABLE ONLY public.lost_incident_fu_p_files ALTER COLUMN id_follow_up_p_files SET DEFAULT nextval('public.lost_incident_fu_p_files_id_follow_up_p_files_seq'::regclass);
 \   ALTER TABLE public.lost_incident_fu_p_files ALTER COLUMN id_follow_up_p_files DROP DEFAULT;
       public          postgres    false    253    254    254            .           2604    26218 (   lost_incident_fu_progress id_fu_progress    DEFAULT     �   ALTER TABLE ONLY public.lost_incident_fu_progress ALTER COLUMN id_fu_progress SET DEFAULT nextval('public.lost_incident_fu_progress_id_fu_progress_seq'::regclass);
 W   ALTER TABLE public.lost_incident_fu_progress ALTER COLUMN id_fu_progress DROP DEFAULT;
       public          postgres    false    255    256    256            /           2604    26227 '   mt_aspek_lingkungan id_aspek_lingkungan    DEFAULT     �   ALTER TABLE ONLY public.mt_aspek_lingkungan ALTER COLUMN id_aspek_lingkungan SET DEFAULT nextval('public.mt_aspek_lingkungan_id_aspek_lingkungan_seq'::regclass);
 V   ALTER TABLE public.mt_aspek_lingkungan ALTER COLUMN id_aspek_lingkungan DROP DEFAULT;
       public          postgres    false    257    258    258            0           2604    26236 +   mt_bidang_pemeriksaan id_bidang_pemeriksaan    DEFAULT     �   ALTER TABLE ONLY public.mt_bidang_pemeriksaan ALTER COLUMN id_bidang_pemeriksaan SET DEFAULT nextval('public.mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq'::regclass);
 Z   ALTER TABLE public.mt_bidang_pemeriksaan ALTER COLUMN id_bidang_pemeriksaan DROP DEFAULT;
       public          postgres    false    259    260    260            1           2604    26245    mt_interval id_interval    DEFAULT     �   ALTER TABLE ONLY public.mt_interval ALTER COLUMN id_interval SET DEFAULT nextval('public.mt_interval_id_interval_seq'::regclass);
 F   ALTER TABLE public.mt_interval ALTER COLUMN id_interval DROP DEFAULT;
       public          postgres    false    262    261    262            2           2604    26252 1   mt_jenis_audit_eksternal id_jenis_audit_eksternal    DEFAULT     �   ALTER TABLE ONLY public.mt_jenis_audit_eksternal ALTER COLUMN id_jenis_audit_eksternal SET DEFAULT nextval('public.mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq'::regclass);
 `   ALTER TABLE public.mt_jenis_audit_eksternal ALTER COLUMN id_jenis_audit_eksternal DROP DEFAULT;
       public          postgres    false    263    264    264            3           2604    26259 !   mt_jenis_dokumen id_jenis_dokumen    DEFAULT     �   ALTER TABLE ONLY public.mt_jenis_dokumen ALTER COLUMN id_jenis_dokumen SET DEFAULT nextval('public.mt_jenis_dokumen_id_jenis_dokumen_seq'::regclass);
 P   ALTER TABLE public.mt_jenis_dokumen ALTER COLUMN id_jenis_dokumen DROP DEFAULT;
       public          postgres    false    266    265    266            4           2604    26266    mt_jenis_rtm id_jenis_rtm    DEFAULT     �   ALTER TABLE ONLY public.mt_jenis_rtm ALTER COLUMN id_jenis_rtm SET DEFAULT nextval('public.mt_jenis_rtm_id_jenis_rtm_seq'::regclass);
 H   ALTER TABLE public.mt_jenis_rtm ALTER COLUMN id_jenis_rtm DROP DEFAULT;
       public          postgres    false    267    268    268            5           2604    26275    mt_kategori id_kategori    DEFAULT     �   ALTER TABLE ONLY public.mt_kategori ALTER COLUMN id_kategori SET DEFAULT nextval('public.mt_kategori_id_kategori_seq'::regclass);
 F   ALTER TABLE public.mt_kategori ALTER COLUMN id_kategori DROP DEFAULT;
       public          postgres    false    269    270    270            6           2604    26284 #   mt_kategori_jenis id_kategori_jenis    DEFAULT     �   ALTER TABLE ONLY public.mt_kategori_jenis ALTER COLUMN id_kategori_jenis SET DEFAULT nextval('public.mt_kategori_jenis_id_kategori_jenis_seq'::regclass);
 R   ALTER TABLE public.mt_kategori_jenis ALTER COLUMN id_kategori_jenis DROP DEFAULT;
       public          postgres    false    272    271    272            7           2604    26291 $   mt_kategori_kpi_individu id_kategori    DEFAULT     �   ALTER TABLE ONLY public.mt_kategori_kpi_individu ALTER COLUMN id_kategori SET DEFAULT nextval('public.mt_kategori_kpi_individu_id_kategori_seq'::regclass);
 S   ALTER TABLE public.mt_kategori_kpi_individu ALTER COLUMN id_kategori DROP DEFAULT;
       public          postgres    false    274    273    274            9           2604    26299    mt_kriteria id_kriteria    DEFAULT     �   ALTER TABLE ONLY public.mt_kriteria ALTER COLUMN id_kriteria SET DEFAULT nextval('public.mt_kriteria_id_kriteria_seq'::regclass);
 F   ALTER TABLE public.mt_kriteria ALTER COLUMN id_kriteria DROP DEFAULT;
       public          postgres    false    275    276    276            :           2604    26319    mt_message_template id_message    DEFAULT     �   ALTER TABLE ONLY public.mt_message_template ALTER COLUMN id_message SET DEFAULT nextval('public.mt_message_template_id_message_seq'::regclass);
 M   ALTER TABLE public.mt_message_template ALTER COLUMN id_message DROP DEFAULT;
       public          postgres    false    280    279    280            ;           2604    26328    mt_opp_dampak id_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_opp_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_opp_dampak_id_dampak_seq'::regclass);
 F   ALTER TABLE public.mt_opp_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    281    282    282            <           2604    26337    mt_opp_kelayakan id_kelayakan    DEFAULT     �   ALTER TABLE ONLY public.mt_opp_kelayakan ALTER COLUMN id_kelayakan SET DEFAULT nextval('public.mt_opp_kelayakan_id_kelayakan_seq'::regclass);
 L   ALTER TABLE public.mt_opp_kelayakan ALTER COLUMN id_kelayakan DROP DEFAULT;
       public          postgres    false    284    283    284            =           2604    26344 !   mt_opp_kemungkinan id_kemungkinan    DEFAULT     �   ALTER TABLE ONLY public.mt_opp_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_opp_kemungkinan_id_kemungkinan_seq'::regclass);
 P   ALTER TABLE public.mt_opp_kemungkinan ALTER COLUMN id_kemungkinan DROP DEFAULT;
       public          postgres    false    286    285    286            >           2604    26353 )   mt_opp_kriteria_dampak id_kriteria_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_opp_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_opp_kriteria_dampak_id_kriteria_dampak_seq'::regclass);
 X   ALTER TABLE public.mt_opp_kriteria_dampak ALTER COLUMN id_kriteria_dampak DROP DEFAULT;
       public          postgres    false    288    287    288            ?           2604    26374    mt_opp_tingkat id_tingkat    DEFAULT     �   ALTER TABLE ONLY public.mt_opp_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_opp_tingkat_id_tingkat_seq'::regclass);
 H   ALTER TABLE public.mt_opp_tingkat ALTER COLUMN id_tingkat DROP DEFAULT;
       public          postgres    false    292    291    292            @           2604    26383    mt_pb_kategori id_kategori    DEFAULT     �   ALTER TABLE ONLY public.mt_pb_kategori ALTER COLUMN id_kategori SET DEFAULT nextval('public.mt_pb_kategori_id_kategori_seq'::regclass);
 I   ALTER TABLE public.mt_pb_kategori ALTER COLUMN id_kategori DROP DEFAULT;
       public          postgres    false    293    294    294            A           2604    26390 (   mt_pb_kelompok_proses id_kelompok_proses    DEFAULT     �   ALTER TABLE ONLY public.mt_pb_kelompok_proses ALTER COLUMN id_kelompok_proses SET DEFAULT nextval('public.mt_pb_kelompok_proses_id_kelompok_proses_seq'::regclass);
 W   ALTER TABLE public.mt_pb_kelompok_proses ALTER COLUMN id_kelompok_proses DROP DEFAULT;
       public          postgres    false    295    296    296            B           2604    26398     mt_pb_nama_proses id_nama_proses    DEFAULT     �   ALTER TABLE ONLY public.mt_pb_nama_proses ALTER COLUMN id_nama_proses SET DEFAULT nextval('public.mt_pb_nama_proses_id_nama_proses_seq'::regclass);
 O   ALTER TABLE public.mt_pb_nama_proses ALTER COLUMN id_nama_proses DROP DEFAULT;
       public          postgres    false    298    297    298            C           2604    26406 %   mt_pemeriksaan_checklist id_checklist    DEFAULT     �   ALTER TABLE ONLY public.mt_pemeriksaan_checklist ALTER COLUMN id_checklist SET DEFAULT nextval('public.mt_pemeriksaan_checklist_id_checklist_seq'::regclass);
 T   ALTER TABLE public.mt_pemeriksaan_checklist ALTER COLUMN id_checklist DROP DEFAULT;
       public          postgres    false    300    299    300            D           2604    26416 '   mt_pemeriksaan_jenis_akomodasi id_jenis    DEFAULT     �   ALTER TABLE ONLY public.mt_pemeriksaan_jenis_akomodasi ALTER COLUMN id_jenis SET DEFAULT nextval('public.mt_pemeriksaan_jenis_akomodasi_id_jenis_seq'::regclass);
 V   ALTER TABLE public.mt_pemeriksaan_jenis_akomodasi ALTER COLUMN id_jenis DROP DEFAULT;
       public          postgres    false    301    302    302            E           2604    26423    mt_pemeriksaan_kka id_kka    DEFAULT     �   ALTER TABLE ONLY public.mt_pemeriksaan_kka ALTER COLUMN id_kka SET DEFAULT nextval('public.mt_pemeriksaan_kka_id_kka_seq'::regclass);
 H   ALTER TABLE public.mt_pemeriksaan_kka ALTER COLUMN id_kka DROP DEFAULT;
       public          postgres    false    304    303    304            F           2604    26432    mt_periode_tw id_periode_tw    DEFAULT     �   ALTER TABLE ONLY public.mt_periode_tw ALTER COLUMN id_periode_tw SET DEFAULT nextval('public.mt_periode_tw_id_periode_tw_seq'::regclass);
 J   ALTER TABLE public.mt_periode_tw ALTER COLUMN id_periode_tw DROP DEFAULT;
       public          postgres    false    306    305    306            G           2604    26439    mt_ppd id_ppd    DEFAULT     n   ALTER TABLE ONLY public.mt_ppd ALTER COLUMN id_ppd SET DEFAULT nextval('public.mt_ppd_id_ppd_seq'::regclass);
 <   ALTER TABLE public.mt_ppd ALTER COLUMN id_ppd DROP DEFAULT;
       public          postgres    false    307    308    308            H           2604    26453    mt_rating_spi id_rating    DEFAULT     �   ALTER TABLE ONLY public.mt_rating_spi ALTER COLUMN id_rating SET DEFAULT nextval('public.mt_rating_spi_id_rating_seq'::regclass);
 F   ALTER TABLE public.mt_rating_spi ALTER COLUMN id_rating DROP DEFAULT;
       public          postgres    false    310    311    311            I           2604    26460    mt_risk_dampak id_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_dampak ALTER COLUMN id_dampak SET DEFAULT nextval('public.mt_risk_dampak_id_dampak_seq'::regclass);
 G   ALTER TABLE public.mt_risk_dampak ALTER COLUMN id_dampak DROP DEFAULT;
       public          postgres    false    312    313    313            J           2604    26469    mt_risk_efektif_m id_efektif_m    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektif_m ALTER COLUMN id_efektif_m SET DEFAULT nextval('public.mt_risk_efektif_m_id_efektif_m_seq'::regclass);
 M   ALTER TABLE public.mt_risk_efektif_m ALTER COLUMN id_efektif_m DROP DEFAULT;
       public          postgres    false    315    314    315            K           2604    26483 .   mt_risk_efektif_m_jawaban id_efektif_m_jawaban    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektif_m_jawaban ALTER COLUMN id_efektif_m_jawaban SET DEFAULT nextval('public.mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq'::regclass);
 ]   ALTER TABLE public.mt_risk_efektif_m_jawaban ALTER COLUMN id_efektif_m_jawaban DROP DEFAULT;
       public          postgres    false    318    317    318            L           2604    26490 *   mt_risk_efektif_m_pengukuran id_pengukuran    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektif_m_pengukuran ALTER COLUMN id_pengukuran SET DEFAULT nextval('public.mt_risk_efektif_m_pengukuran_id_pengukuran_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_efektif_m_pengukuran ALTER COLUMN id_pengukuran DROP DEFAULT;
       public          postgres    false    320    319    320            M           2604    26499 "   mt_risk_efektifitas id_efektifitas    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektifitas ALTER COLUMN id_efektifitas SET DEFAULT nextval('public.mt_risk_efektifitas_id_efektifitas_seq'::regclass);
 Q   ALTER TABLE public.mt_risk_efektifitas ALTER COLUMN id_efektifitas DROP DEFAULT;
       public          postgres    false    321    322    322            P           2604    26513 2   mt_risk_efektifitas_jawaban id_efektifitas_jawaban    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_jawaban ALTER COLUMN id_efektifitas_jawaban SET DEFAULT nextval('public.mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq'::regclass);
 a   ALTER TABLE public.mt_risk_efektifitas_jawaban ALTER COLUMN id_efektifitas_jawaban DROP DEFAULT;
       public          postgres    false    324    325    325            Q           2604    26520 ,   mt_risk_efektifitas_pengukuran id_pengukuran    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_pengukuran ALTER COLUMN id_pengukuran SET DEFAULT nextval('public.mt_risk_efektifitas_pengukuran_id_pengukuran_seq'::regclass);
 [   ALTER TABLE public.mt_risk_efektifitas_pengukuran ALTER COLUMN id_pengukuran DROP DEFAULT;
       public          postgres    false    326    327    327            R           2604    26529 "   mt_risk_kemungkinan id_kemungkinan    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan SET DEFAULT nextval('public.mt_risk_kemungkinan_id_kemungkinan_seq'::regclass);
 Q   ALTER TABLE public.mt_risk_kemungkinan ALTER COLUMN id_kemungkinan DROP DEFAULT;
       public          postgres    false    328    329    329            S           2604    26538 *   mt_risk_kriteria_dampak id_kriteria_dampak    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak SET DEFAULT nextval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq'::regclass);
 Y   ALTER TABLE public.mt_risk_kriteria_dampak ALTER COLUMN id_kriteria_dampak DROP DEFAULT;
       public          postgres    false    330    331    331            T           2604    26559    mt_risk_taksonomi id_taksonomi    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi ALTER COLUMN id_taksonomi SET DEFAULT nextval('public.mt_risk_taksonomi_id_taksonomi_seq'::regclass);
 M   ALTER TABLE public.mt_risk_taksonomi ALTER COLUMN id_taksonomi DROP DEFAULT;
       public          postgres    false    335    334    335            U           2604    26575 (   mt_risk_taksonomi_area id_taksonomi_area    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area SET DEFAULT nextval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq'::regclass);
 W   ALTER TABLE public.mt_risk_taksonomi_area ALTER COLUMN id_taksonomi_area DROP DEFAULT;
       public          postgres    false    337    338    338            V           2604    26585 2   mt_risk_taksonomi_objective id_taksonomi_objective    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective SET DEFAULT nextval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq'::regclass);
 a   ALTER TABLE public.mt_risk_taksonomi_objective ALTER COLUMN id_taksonomi_objective DROP DEFAULT;
       public          postgres    false    340    339    340            W           2604    26592    mt_risk_tingkat id_tingkat    DEFAULT     �   ALTER TABLE ONLY public.mt_risk_tingkat ALTER COLUMN id_tingkat SET DEFAULT nextval('public.mt_risk_tingkat_id_tingkat_seq'::regclass);
 I   ALTER TABLE public.mt_risk_tingkat ALTER COLUMN id_tingkat DROP DEFAULT;
       public          postgres    false    341    342    342            Y           2604    26607    mt_sdm_jabatan id_jabatan    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_jabatan ALTER COLUMN id_jabatan SET DEFAULT nextval('public.mt_sdm_jabatan_id_jabatan_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_jabatan ALTER COLUMN id_jabatan DROP DEFAULT;
       public          postgres    false    344    345    345            [           2604    26632    mt_sdm_level id_sdm_level    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_level ALTER COLUMN id_sdm_level SET DEFAULT nextval('public.mt_sdm_level_id_sdm_level_seq'::regclass);
 H   ALTER TABLE public.mt_sdm_level ALTER COLUMN id_sdm_level DROP DEFAULT;
       public          postgres    false    349    348    349            \           2604    26646    mt_sdm_struktur id_struktur    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_struktur ALTER COLUMN id_struktur SET DEFAULT nextval('public.mt_sdm_struktur_id_struktur_seq'::regclass);
 J   ALTER TABLE public.mt_sdm_struktur ALTER COLUMN id_struktur DROP DEFAULT;
       public          postgres    false    351    352    352            ]           2604    26661    mt_sdm_sub_unit id_sub_unit    DEFAULT     �   ALTER TABLE ONLY public.mt_sdm_sub_unit ALTER COLUMN id_sub_unit SET DEFAULT nextval('public.mt_sdm_sub_unit_id_sub_unit_seq'::regclass);
 J   ALTER TABLE public.mt_sdm_sub_unit ALTER COLUMN id_sub_unit DROP DEFAULT;
       public          postgres    false    355    354    355            `           2604    26693 +   mt_status_pemeriksaan id_status_pemeriksaan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pemeriksaan ALTER COLUMN id_status_pemeriksaan SET DEFAULT nextval('public.mt_status_pemeriksaan_id_status_pemeriksaan_seq'::regclass);
 Z   ALTER TABLE public.mt_status_pemeriksaan ALTER COLUMN id_status_pemeriksaan DROP DEFAULT;
       public          postgres    false    361    360    361            a           2604    26700 '   mt_status_pengajuan id_status_pengajuan    DEFAULT     �   ALTER TABLE ONLY public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan SET DEFAULT nextval('public.mt_status_pengajuan_id_status_pengajuan_seq'::regclass);
 V   ALTER TABLE public.mt_status_pengajuan ALTER COLUMN id_status_pengajuan DROP DEFAULT;
       public          postgres    false    363    362    363            b           2604    26707 '   mt_status_penilaian id_status_penilaian    DEFAULT     �   ALTER TABLE ONLY public.mt_status_penilaian ALTER COLUMN id_status_penilaian SET DEFAULT nextval('public.mt_status_penilaian_id_status_penilaian_seq'::regclass);
 V   ALTER TABLE public.mt_status_penilaian ALTER COLUMN id_status_penilaian DROP DEFAULT;
       public          postgres    false    364    365    365            c           2604    26714 %   mt_status_progress id_status_progress    DEFAULT     �   ALTER TABLE ONLY public.mt_status_progress ALTER COLUMN id_status_progress SET DEFAULT nextval('public.mt_status_progress_id_status_progress_seq'::regclass);
 T   ALTER TABLE public.mt_status_progress ALTER COLUMN id_status_progress DROP DEFAULT;
       public          postgres    false    366    367    367            d           2604    26721    mt_target_kpi id_target    DEFAULT     �   ALTER TABLE ONLY public.mt_target_kpi ALTER COLUMN id_target SET DEFAULT nextval('public.mt_target_kpi_id_target_seq'::regclass);
 F   ALTER TABLE public.mt_target_kpi ALTER COLUMN id_target DROP DEFAULT;
       public          postgres    false    369    368    369            f           2604    26729 5   mt_tingkat_agregasi_risiko id_tingkat_agregasi_risiko    DEFAULT     �   ALTER TABLE ONLY public.mt_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko SET DEFAULT nextval('public.mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq'::regclass);
 d   ALTER TABLE public.mt_tingkat_agregasi_risiko ALTER COLUMN id_tingkat_agregasi_risiko DROP DEFAULT;
       public          postgres    false    371    370    371            g           2604    26737 "   opp_kolom_laporan id_kolom_laporan    DEFAULT     �   ALTER TABLE ONLY public.opp_kolom_laporan ALTER COLUMN id_kolom_laporan SET DEFAULT nextval('public.opp_kolom_laporan_id_kolom_laporan_seq'::regclass);
 Q   ALTER TABLE public.opp_kolom_laporan ALTER COLUMN id_kolom_laporan DROP DEFAULT;
       public          postgres    false    372    373    373            h           2604    26754    opp_peluang id_peluang    DEFAULT     �   ALTER TABLE ONLY public.opp_peluang ALTER COLUMN id_peluang SET DEFAULT nextval('public.opp_peluang_id_peluang_seq'::regclass);
 E   ALTER TABLE public.opp_peluang ALTER COLUMN id_peluang DROP DEFAULT;
       public          postgres    false    376    375    376            p           2604    26791 "   opp_peluang_files id_peluang_files    DEFAULT     �   ALTER TABLE ONLY public.opp_peluang_files ALTER COLUMN id_peluang_files SET DEFAULT nextval('public.opp_peluang_files_id_peluang_files_seq'::regclass);
 Q   ALTER TABLE public.opp_peluang_files ALTER COLUMN id_peluang_files DROP DEFAULT;
       public          postgres    false    377    378    378            r           2604    26811    opp_scorecard id_scorecard    DEFAULT     �   ALTER TABLE ONLY public.opp_scorecard ALTER COLUMN id_scorecard SET DEFAULT nextval('public.opp_scorecard_id_scorecard_seq'::regclass);
 I   ALTER TABLE public.opp_scorecard ALTER COLUMN id_scorecard DROP DEFAULT;
       public          postgres    false    382    381    382            y           2604    26828 &   opp_scorecard_files id_scorecard_files    DEFAULT     �   ALTER TABLE ONLY public.opp_scorecard_files ALTER COLUMN id_scorecard_files SET DEFAULT nextval('public.opp_scorecard_files_id_scorecard_files_seq'::regclass);
 U   ALTER TABLE public.opp_scorecard_files ALTER COLUMN id_scorecard_files DROP DEFAULT;
       public          postgres    false    383    384    384            {           2604    26850    pemeriksaan id_pemeriksaan    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan ALTER COLUMN id_pemeriksaan SET DEFAULT nextval('public.pemeriksaan_id_pemeriksaan_seq'::regclass);
 I   ALTER TABLE public.pemeriksaan ALTER COLUMN id_pemeriksaan DROP DEFAULT;
       public          postgres    false    387    388    388            |           2604    26866 8   pemeriksaan_anggaran_biaya id_pemeriksaan_anggaran_biaya    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_anggaran_biaya ALTER COLUMN id_pemeriksaan_anggaran_biaya SET DEFAULT nextval('public.pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq'::regclass);
 g   ALTER TABLE public.pemeriksaan_anggaran_biaya ALTER COLUMN id_pemeriksaan_anggaran_biaya DROP DEFAULT;
       public          postgres    false    389    390    390            }           2604    26875 .   pemeriksaan_checklist id_pemeriksaan_checklist    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_checklist ALTER COLUMN id_pemeriksaan_checklist SET DEFAULT nextval('public.pemeriksaan_checklist_id_pemeriksaan_checklist_seq'::regclass);
 ]   ALTER TABLE public.pemeriksaan_checklist ALTER COLUMN id_pemeriksaan_checklist DROP DEFAULT;
       public          postgres    false    391    392    392            �           2604    26888 (   pemeriksaan_detail id_pemeriksaan_detail    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_detail ALTER COLUMN id_pemeriksaan_detail SET DEFAULT nextval('public.pemeriksaan_detail_id_pemeriksaan_detail_seq'::regclass);
 W   ALTER TABLE public.pemeriksaan_detail ALTER COLUMN id_pemeriksaan_detail DROP DEFAULT;
       public          postgres    false    393    394    394            �           2604    26899 2   pemeriksaan_dokumen_eksternal id_dokumen_aksternal    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_dokumen_eksternal ALTER COLUMN id_dokumen_aksternal SET DEFAULT nextval('public.pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq'::regclass);
 a   ALTER TABLE public.pemeriksaan_dokumen_eksternal ALTER COLUMN id_dokumen_aksternal DROP DEFAULT;
       public          postgres    false    395    396    396            �           2604    26908 0   pemeriksaan_peminjaman id_pemeriksaan_peminjaman    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_peminjaman ALTER COLUMN id_pemeriksaan_peminjaman SET DEFAULT nextval('public.pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq'::regclass);
 _   ALTER TABLE public.pemeriksaan_peminjaman ALTER COLUMN id_pemeriksaan_peminjaman DROP DEFAULT;
       public          postgres    false    397    398    398            �           2604    26918 0   pemeriksaan_review_supervisi id_review_supervisi    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_review_supervisi ALTER COLUMN id_review_supervisi SET DEFAULT nextval('public.pemeriksaan_review_supervisi_id_review_supervisi_seq'::regclass);
 _   ALTER TABLE public.pemeriksaan_review_supervisi ALTER COLUMN id_review_supervisi DROP DEFAULT;
       public          postgres    false    399    400    400            �           2604    26927    pemeriksaan_spn id_spn    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_spn ALTER COLUMN id_spn SET DEFAULT nextval('public.pemeriksaan_spn_id_spn_seq'::regclass);
 E   ALTER TABLE public.pemeriksaan_spn ALTER COLUMN id_spn DROP DEFAULT;
       public          postgres    false    402    401    402            �           2604    26936 "   pemeriksaan_spn_petugas id_petugas    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_spn_petugas ALTER COLUMN id_petugas SET DEFAULT nextval('public.pemeriksaan_spn_petugas_id_petugas_seq'::regclass);
 Q   ALTER TABLE public.pemeriksaan_spn_petugas ALTER COLUMN id_petugas DROP DEFAULT;
       public          postgres    false    403    404    404            �           2604    26945 (   pemeriksaan_temuan id_pemeriksaan_temuan    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_temuan ALTER COLUMN id_pemeriksaan_temuan SET DEFAULT nextval('public.pemeriksaan_temuan_id_pemeriksaan_temuan_seq'::regclass);
 W   ALTER TABLE public.pemeriksaan_temuan ALTER COLUMN id_pemeriksaan_temuan DROP DEFAULT;
       public          postgres    false    405    406    406            �           2604    26960 8   pemeriksaan_temuan_diskusi id_pemeriksaan_temuan_diskusi    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_diskusi ALTER COLUMN id_pemeriksaan_temuan_diskusi SET DEFAULT nextval('public.pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq'::regclass);
 g   ALTER TABLE public.pemeriksaan_temuan_diskusi ALTER COLUMN id_pemeriksaan_temuan_diskusi DROP DEFAULT;
       public          postgres    false    408    407    408            �           2604    26970 4   pemeriksaan_temuan_files id_pemeriksaan_temuan_files    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_files ALTER COLUMN id_pemeriksaan_temuan_files SET DEFAULT nextval('public.pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq'::regclass);
 c   ALTER TABLE public.pemeriksaan_temuan_files ALTER COLUMN id_pemeriksaan_temuan_files DROP DEFAULT;
       public          postgres    false    410    409    410            �           2604    26981 4   pemeriksaan_temuan_saran id_pemeriksaan_temuan_saran    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_saran ALTER COLUMN id_pemeriksaan_temuan_saran SET DEFAULT nextval('public.pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq'::regclass);
 c   ALTER TABLE public.pemeriksaan_temuan_saran ALTER COLUMN id_pemeriksaan_temuan_saran DROP DEFAULT;
       public          postgres    false    411    412    412            �           2604    26991 "   pemeriksaan_tim id_pemeriksaan_tim    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_tim ALTER COLUMN id_pemeriksaan_tim SET DEFAULT nextval('public.pemeriksaan_tim_id_pemeriksaan_tim_seq'::regclass);
 Q   ALTER TABLE public.pemeriksaan_tim ALTER COLUMN id_pemeriksaan_tim DROP DEFAULT;
       public          postgres    false    414    413    414            �           2604    26999 6   pemeriksaan_tindak_lanjut id_pemeriksaan_tindak_lanjut    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut ALTER COLUMN id_pemeriksaan_tindak_lanjut SET DEFAULT nextval('public.pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq'::regclass);
 e   ALTER TABLE public.pemeriksaan_tindak_lanjut ALTER COLUMN id_pemeriksaan_tindak_lanjut DROP DEFAULT;
       public          postgres    false    416    415    416            �           2604    27010 B   pemeriksaan_tindak_lanjut_files id_pemeriksaan_tindak_lanjut_files    DEFAULT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_files ALTER COLUMN id_pemeriksaan_tindak_lanjut_files SET DEFAULT nextval('public.pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq'::regclass);
 q   ALTER TABLE public.pemeriksaan_tindak_lanjut_files ALTER COLUMN id_pemeriksaan_tindak_lanjut_files DROP DEFAULT;
       public          postgres    false    417    418    418            �           2604    27028    penilaian id_penilaian    DEFAULT     �   ALTER TABLE ONLY public.penilaian ALTER COLUMN id_penilaian SET DEFAULT nextval('public.penilaian_id_penilaian_seq'::regclass);
 E   ALTER TABLE public.penilaian ALTER COLUMN id_penilaian DROP DEFAULT;
       public          postgres    false    420    421    421            �           2604    27039 $   penilaian_detail id_penilaian_detail    DEFAULT     �   ALTER TABLE ONLY public.penilaian_detail ALTER COLUMN id_penilaian_detail SET DEFAULT nextval('public.penilaian_detail_id_penilaian_detail_seq'::regclass);
 S   ALTER TABLE public.penilaian_detail ALTER COLUMN id_penilaian_detail DROP DEFAULT;
       public          postgres    false    423    422    423            �           2604    27052 "   penilaian_files id_penilaian_files    DEFAULT     �   ALTER TABLE ONLY public.penilaian_files ALTER COLUMN id_penilaian_files SET DEFAULT nextval('public.penilaian_files_id_penilaian_files_seq'::regclass);
 Q   ALTER TABLE public.penilaian_files ALTER COLUMN id_penilaian_files DROP DEFAULT;
       public          postgres    false    425    426    426            �           2604    27061 (   penilaian_komentar id_penilaian_komentar    DEFAULT     �   ALTER TABLE ONLY public.penilaian_komentar ALTER COLUMN id_penilaian_komentar SET DEFAULT nextval('public.penilaian_komentar_id_penilaian_komentar_seq'::regclass);
 W   ALTER TABLE public.penilaian_komentar ALTER COLUMN id_penilaian_komentar DROP DEFAULT;
       public          postgres    false    427    428    428            �           2604    27074 &   penilaian_periode id_penilaian_periode    DEFAULT     �   ALTER TABLE ONLY public.penilaian_periode ALTER COLUMN id_penilaian_periode SET DEFAULT nextval('public.penilaian_periode_id_penilaian_periode_seq'::regclass);
 U   ALTER TABLE public.penilaian_periode ALTER COLUMN id_penilaian_periode DROP DEFAULT;
       public          postgres    false    431    430    431            �           2604    27084 *   penilaian_quisioner id_penilaian_quisioner    DEFAULT     �   ALTER TABLE ONLY public.penilaian_quisioner ALTER COLUMN id_penilaian_quisioner SET DEFAULT nextval('public.penilaian_quisioner_id_penilaian_quisioner_seq'::regclass);
 Y   ALTER TABLE public.penilaian_quisioner ALTER COLUMN id_penilaian_quisioner DROP DEFAULT;
       public          postgres    false    432    433    433            �           2604    27093 &   penilaian_session id_penilaian_session    DEFAULT     �   ALTER TABLE ONLY public.penilaian_session ALTER COLUMN id_penilaian_session SET DEFAULT nextval('public.penilaian_session_id_penilaian_session_seq'::regclass);
 U   ALTER TABLE public.penilaian_session ALTER COLUMN id_penilaian_session DROP DEFAULT;
       public          postgres    false    434    435    435            �           2604    27103    public_sys_action action_id    DEFAULT     �   ALTER TABLE ONLY public.public_sys_action ALTER COLUMN action_id SET DEFAULT nextval('public.public_sys_action_action_id_seq'::regclass);
 J   ALTER TABLE public.public_sys_action ALTER COLUMN action_id DROP DEFAULT;
       public          postgres    false    437    436    437            �           2604    27112    public_sys_group group_id    DEFAULT     �   ALTER TABLE ONLY public.public_sys_group ALTER COLUMN group_id SET DEFAULT nextval('public.public_sys_group_group_id_seq'::regclass);
 H   ALTER TABLE public.public_sys_group ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    439    438    439            �           2604    27126 #   public_sys_group_menu group_menu_id    DEFAULT     �   ALTER TABLE ONLY public.public_sys_group_menu ALTER COLUMN group_menu_id SET DEFAULT nextval('public.public_sys_group_menu_group_menu_id_seq'::regclass);
 R   ALTER TABLE public.public_sys_group_menu ALTER COLUMN group_menu_id DROP DEFAULT;
       public          postgres    false    441    442    442            �           2604    27141    public_sys_menu menu_id    DEFAULT     �   ALTER TABLE ONLY public.public_sys_menu ALTER COLUMN menu_id SET DEFAULT nextval('public.public_sys_menu_menu_id_seq'::regclass);
 F   ALTER TABLE public.public_sys_menu ALTER COLUMN menu_id DROP DEFAULT;
       public          postgres    false    445    444    445            �           2604    27151    public_sys_message id_message    DEFAULT     �   ALTER TABLE ONLY public.public_sys_message ALTER COLUMN id_message SET DEFAULT nextval('public.public_sys_message_id_message_seq'::regclass);
 L   ALTER TABLE public.public_sys_message ALTER COLUMN id_message DROP DEFAULT;
       public          postgres    false    447    446    447            �           2604    27170 '   public_sys_notification id_notification    DEFAULT     �   ALTER TABLE ONLY public.public_sys_notification ALTER COLUMN id_notification SET DEFAULT nextval('public.public_sys_notification_id_notification_seq'::regclass);
 V   ALTER TABLE public.public_sys_notification ALTER COLUMN id_notification DROP DEFAULT;
       public          postgres    false    450    449    450            �           2604    27181 (   public_sys_setting id_public_sys_setting    DEFAULT     �   ALTER TABLE ONLY public.public_sys_setting ALTER COLUMN id_public_sys_setting SET DEFAULT nextval('public.public_sys_setting_id_public_sys_setting_seq'::regclass);
 W   ALTER TABLE public.public_sys_setting ALTER COLUMN id_public_sys_setting DROP DEFAULT;
       public          postgres    false    451    452    452            �           2604    27190    public_sys_user user_id    DEFAULT     �   ALTER TABLE ONLY public.public_sys_user ALTER COLUMN user_id SET DEFAULT nextval('public.public_sys_user_user_id_seq'::regclass);
 F   ALTER TABLE public.public_sys_user ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    453    454    454            �           2604    27211    quisioner id_quisioner    DEFAULT     �   ALTER TABLE ONLY public.quisioner ALTER COLUMN id_quisioner SET DEFAULT nextval('public.quisioner_id_quisioner_seq'::regclass);
 E   ALTER TABLE public.quisioner ALTER COLUMN id_quisioner DROP DEFAULT;
       public          postgres    false    457    456    457            �           2604    27234    risk_control id_control    DEFAULT     �   ALTER TABLE ONLY public.risk_control ALTER COLUMN id_control SET DEFAULT nextval('public.risk_control_id_control_seq'::regclass);
 F   ALTER TABLE public.risk_control ALTER COLUMN id_control DROP DEFAULT;
       public          postgres    false    462    463    463            �           2604    27265 ;   risk_control_efektifitas_files id_control_efektifitas_files    DEFAULT     �   ALTER TABLE ONLY public.risk_control_efektifitas_files ALTER COLUMN id_control_efektifitas_files SET DEFAULT nextval('public.risk_control_efektifitas_files_id_control_efektifitas_files_seq'::regclass);
 j   ALTER TABLE public.risk_control_efektifitas_files ALTER COLUMN id_control_efektifitas_files DROP DEFAULT;
       public          postgres    false    466    465    466            �           2604    27282    risk_dampak id_risk_dampak    DEFAULT     �   ALTER TABLE ONLY public.risk_dampak ALTER COLUMN id_risk_dampak SET DEFAULT nextval('public.risk_dampak_id_risk_dampak_seq'::regclass);
 I   ALTER TABLE public.risk_dampak ALTER COLUMN id_risk_dampak DROP DEFAULT;
       public          postgres    false    468    469    469            �           2604    27296    risk_high_info id_risiko    DEFAULT     �   ALTER TABLE ONLY public.risk_high_info ALTER COLUMN id_risiko SET DEFAULT nextval('public.risk_high_info_id_risiko_seq'::regclass);
 G   ALTER TABLE public.risk_high_info ALTER COLUMN id_risiko DROP DEFAULT;
       public          postgres    false    471    472    472            �           2604    27310    risk_kegiatan id_kegiatan    DEFAULT     �   ALTER TABLE ONLY public.risk_kegiatan ALTER COLUMN id_kegiatan SET DEFAULT nextval('public.risk_kegiatan_id_kegiatan_seq'::regclass);
 H   ALTER TABLE public.risk_kegiatan ALTER COLUMN id_kegiatan DROP DEFAULT;
       public          postgres    false    475    474    475            �           2604    27325    risk_kesimpulan id_kesimpulan    DEFAULT     �   ALTER TABLE ONLY public.risk_kesimpulan ALTER COLUMN id_kesimpulan SET DEFAULT nextval('public.risk_kesimpulan_id_kesimpulan_seq'::regclass);
 L   ALTER TABLE public.risk_kesimpulan ALTER COLUMN id_kesimpulan DROP DEFAULT;
       public          postgres    false    478    477    478            �           2604    27334 #   risk_kolom_laporan id_kolom_laporan    DEFAULT     �   ALTER TABLE ONLY public.risk_kolom_laporan ALTER COLUMN id_kolom_laporan SET DEFAULT nextval('public.risk_kolom_laporan_id_kolom_laporan_seq'::regclass);
 R   ALTER TABLE public.risk_kolom_laporan ALTER COLUMN id_kolom_laporan DROP DEFAULT;
       public          postgres    false    480    479    480            �           2604    27356    risk_kpi id_kpi    DEFAULT     r   ALTER TABLE ONLY public.risk_kpi ALTER COLUMN id_kpi SET DEFAULT nextval('public.risk_kpi_id_kpi_seq'::regclass);
 >   ALTER TABLE public.risk_kpi ALTER COLUMN id_kpi DROP DEFAULT;
       public          postgres    false    483    484    484            �           2604    27363    risk_kri id_kri    DEFAULT     r   ALTER TABLE ONLY public.risk_kri ALTER COLUMN id_kri SET DEFAULT nextval('public.risk_kri_id_kri_seq'::regclass);
 >   ALTER TABLE public.risk_kri ALTER COLUMN id_kri DROP DEFAULT;
       public          postgres    false    486    485    486            �           2604    27373    risk_kri_hasil id_kri_hasil    DEFAULT     �   ALTER TABLE ONLY public.risk_kri_hasil ALTER COLUMN id_kri_hasil SET DEFAULT nextval('public.risk_kri_hasil_id_kri_hasil_seq'::regclass);
 J   ALTER TABLE public.risk_kri_hasil ALTER COLUMN id_kri_hasil DROP DEFAULT;
       public          postgres    false    488    487    488            �           2604    27390    risk_mitigasi id_mitigasi    DEFAULT     �   ALTER TABLE ONLY public.risk_mitigasi ALTER COLUMN id_mitigasi SET DEFAULT nextval('public.risk_mitigasi_id_mitigasi_seq'::regclass);
 H   ALTER TABLE public.risk_mitigasi ALTER COLUMN id_mitigasi DROP DEFAULT;
       public          postgres    false    490    491    491            �           2604    27411 )   risk_mitigasi_efektif id_mitigasi_efektif    DEFAULT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif ALTER COLUMN id_mitigasi_efektif SET DEFAULT nextval('public.risk_mitigasi_efektif_id_mitigasi_efektif_seq'::regclass);
 X   ALTER TABLE public.risk_mitigasi_efektif ALTER COLUMN id_mitigasi_efektif DROP DEFAULT;
       public          postgres    false    493    492    493            �           2604    27430 %   risk_mitigasi_files id_mitigasi_files    DEFAULT     �   ALTER TABLE ONLY public.risk_mitigasi_files ALTER COLUMN id_mitigasi_files SET DEFAULT nextval('public.risk_mitigasi_files_id_mitigasi_files_seq'::regclass);
 T   ALTER TABLE public.risk_mitigasi_files ALTER COLUMN id_mitigasi_files DROP DEFAULT;
       public          postgres    false    496    495    496            �           2604    27460 +   risk_mitigasi_progress id_mitigasi_progress    DEFAULT     �   ALTER TABLE ONLY public.risk_mitigasi_progress ALTER COLUMN id_mitigasi_progress SET DEFAULT nextval('public.risk_mitigasi_progress_id_mitigasi_progress_seq'::regclass);
 Z   ALTER TABLE public.risk_mitigasi_progress ALTER COLUMN id_mitigasi_progress DROP DEFAULT;
       public          postgres    false    501    500    501            �           2604    27479    risk_msg id_msg    DEFAULT     r   ALTER TABLE ONLY public.risk_msg ALTER COLUMN id_msg SET DEFAULT nextval('public.risk_msg_id_msg_seq'::regclass);
 >   ALTER TABLE public.risk_msg ALTER COLUMN id_msg DROP DEFAULT;
       public          postgres    false    504    503    504            �           2604    27494    risk_penyebab id_risk_penyebab    DEFAULT     �   ALTER TABLE ONLY public.risk_penyebab ALTER COLUMN id_risk_penyebab SET DEFAULT nextval('public.risk_penyebab_id_risk_penyebab_seq'::regclass);
 M   ALTER TABLE public.risk_penyebab ALTER COLUMN id_risk_penyebab DROP DEFAULT;
       public          postgres    false    507    506    507            �           2604    27503    risk_review id_review    DEFAULT     ~   ALTER TABLE ONLY public.risk_review ALTER COLUMN id_review SET DEFAULT nextval('public.risk_review_id_review_seq'::regclass);
 D   ALTER TABLE public.risk_review ALTER COLUMN id_review DROP DEFAULT;
       public          postgres    false    508    509    509            �           2604    27514    risk_risiko id_risiko    DEFAULT     ~   ALTER TABLE ONLY public.risk_risiko ALTER COLUMN id_risiko SET DEFAULT nextval('public.risk_risiko_id_risiko_seq'::regclass);
 D   ALTER TABLE public.risk_risiko ALTER COLUMN id_risiko DROP DEFAULT;
       public          postgres    false    510    511    511            �           2604    27554 %   risk_risiko_current id_risiko_current    DEFAULT     �   ALTER TABLE ONLY public.risk_risiko_current ALTER COLUMN id_risiko_current SET DEFAULT nextval('public.risk_risiko_current_id_risiko_current_seq'::regclass);
 T   ALTER TABLE public.risk_risiko_current ALTER COLUMN id_risiko_current DROP DEFAULT;
       public          postgres    false    513    512    513            �           2604    27572 !   risk_risiko_files id_risiko_files    DEFAULT     �   ALTER TABLE ONLY public.risk_risiko_files ALTER COLUMN id_risiko_files SET DEFAULT nextval('public.risk_risiko_files_id_risiko_files_seq'::regclass);
 P   ALTER TABLE public.risk_risiko_files ALTER COLUMN id_risiko_files DROP DEFAULT;
       public          postgres    false    516    515    516            �           2604    27611    risk_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.risk_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.risk_sasaran_id_sasaran_seq'::regclass);
 F   ALTER TABLE public.risk_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    522    523    523            �           2604    27634    risk_scorecard id_scorecard    DEFAULT     �   ALTER TABLE ONLY public.risk_scorecard ALTER COLUMN id_scorecard SET DEFAULT nextval('public.risk_scorecard_id_scorecard_seq'::regclass);
 J   ALTER TABLE public.risk_scorecard ALTER COLUMN id_scorecard DROP DEFAULT;
       public          postgres    false    527    526    527            �           2604    27656 '   risk_scorecard_files id_scorecard_files    DEFAULT     �   ALTER TABLE ONLY public.risk_scorecard_files ALTER COLUMN id_scorecard_files SET DEFAULT nextval('public.risk_scorecard_files_id_scorecard_files_seq'::regclass);
 V   ALTER TABLE public.risk_scorecard_files ALTER COLUMN id_scorecard_files DROP DEFAULT;
       public          postgres    false    528    529    529            �           2604    27679 !   risk_strategi_map id_strategi_map    DEFAULT     �   ALTER TABLE ONLY public.risk_strategi_map ALTER COLUMN id_strategi_map SET DEFAULT nextval('public.risk_strategi_map_id_strategi_map_seq'::regclass);
 P   ALTER TABLE public.risk_strategi_map ALTER COLUMN id_strategi_map DROP DEFAULT;
       public          postgres    false    532    533    533            �           2604    27686    risk_task id_task    DEFAULT     v   ALTER TABLE ONLY public.risk_task ALTER COLUMN id_task SET DEFAULT nextval('public.risk_task_id_task_seq'::regclass);
 @   ALTER TABLE public.risk_task ALTER COLUMN id_task DROP DEFAULT;
       public          postgres    false    534    535    535            �           2604    27711    risk_visi_misi id_visi_misi    DEFAULT     �   ALTER TABLE ONLY public.risk_visi_misi ALTER COLUMN id_visi_misi SET DEFAULT nextval('public.risk_visi_misi_id_visi_misi_seq'::regclass);
 J   ALTER TABLE public.risk_visi_misi ALTER COLUMN id_visi_misi DROP DEFAULT;
       public          postgres    false    537    538    538            �           2604    27720 
   rtm id_rtm    DEFAULT     h   ALTER TABLE ONLY public.rtm ALTER COLUMN id_rtm SET DEFAULT nextval('public.rtm_id_rtm_seq'::regclass);
 9   ALTER TABLE public.rtm ALTER COLUMN id_rtm DROP DEFAULT;
       public          postgres    false    540    539    540            �           2604    27728    rtm_files id_rtm_files    DEFAULT     �   ALTER TABLE ONLY public.rtm_files ALTER COLUMN id_rtm_files SET DEFAULT nextval('public.rtm_files_id_rtm_files_seq'::regclass);
 E   ALTER TABLE public.rtm_files ALTER COLUMN id_rtm_files DROP DEFAULT;
       public          postgres    false    541    542    542            �           2604    27739    rtm_progress id_rtm_progress    DEFAULT     �   ALTER TABLE ONLY public.rtm_progress ALTER COLUMN id_rtm_progress SET DEFAULT nextval('public.rtm_progress_id_rtm_progress_seq'::regclass);
 K   ALTER TABLE public.rtm_progress ALTER COLUMN id_rtm_progress DROP DEFAULT;
       public          postgres    false    543    544    544            �           2604    27747    rtm_uraian id_rtm_uraian    DEFAULT     �   ALTER TABLE ONLY public.rtm_uraian ALTER COLUMN id_rtm_uraian SET DEFAULT nextval('public.rtm_uraian_id_rtm_uraian_seq'::regclass);
 G   ALTER TABLE public.rtm_uraian ALTER COLUMN id_rtm_uraian DROP DEFAULT;
       public          postgres    false    545    546    546            �           2604    27759 $   rtm_uraian_files id_rtm_uraian_files    DEFAULT     �   ALTER TABLE ONLY public.rtm_uraian_files ALTER COLUMN id_rtm_uraian_files SET DEFAULT nextval('public.rtm_uraian_files_id_rtm_uraian_files_seq'::regclass);
 S   ALTER TABLE public.rtm_uraian_files ALTER COLUMN id_rtm_uraian_files DROP DEFAULT;
       public          postgres    false    547    548    548            �           2604    27785 $   spi_audit_evaluasi id_audit_evaluasi    DEFAULT     �   ALTER TABLE ONLY public.spi_audit_evaluasi ALTER COLUMN id_audit_evaluasi SET DEFAULT nextval('public.spi_audit_evaluasi_id_audit_evaluasi_seq'::regclass);
 S   ALTER TABLE public.spi_audit_evaluasi ALTER COLUMN id_audit_evaluasi DROP DEFAULT;
       public          postgres    false    552    551    552            �           2604    27794 "   spi_hasil_monitoring id_monitoring    DEFAULT     �   ALTER TABLE ONLY public.spi_hasil_monitoring ALTER COLUMN id_monitoring SET DEFAULT nextval('public.spi_hasil_monitoring_id_monitoring_seq'::regclass);
 Q   ALTER TABLE public.spi_hasil_monitoring ALTER COLUMN id_monitoring DROP DEFAULT;
       public          postgres    false    553    554    554            �           2604    27803    spi_library id_dokumen    DEFAULT     �   ALTER TABLE ONLY public.spi_library ALTER COLUMN id_dokumen SET DEFAULT nextval('public.spi_library_id_dokumen_seq'::regclass);
 E   ALTER TABLE public.spi_library ALTER COLUMN id_dokumen DROP DEFAULT;
       public          postgres    false    555    556    556            �           2604    27812 "   spi_library_files id_dokumen_files    DEFAULT     �   ALTER TABLE ONLY public.spi_library_files ALTER COLUMN id_dokumen_files SET DEFAULT nextval('public.spi_library_files_id_dokumen_files_seq'::regclass);
 Q   ALTER TABLE public.spi_library_files ALTER COLUMN id_dokumen_files DROP DEFAULT;
       public          postgres    false    558    557    558            �           2604    27822    spi_notulen id_notulen    DEFAULT     �   ALTER TABLE ONLY public.spi_notulen ALTER COLUMN id_notulen SET DEFAULT nextval('public.spi_notulen_id_notulen_seq'::regclass);
 E   ALTER TABLE public.spi_notulen ALTER COLUMN id_notulen DROP DEFAULT;
       public          postgres    false    560    559    560            �           2604    27831    spi_notulen_acara id_acara    DEFAULT     �   ALTER TABLE ONLY public.spi_notulen_acara ALTER COLUMN id_acara SET DEFAULT nextval('public.spi_notulen_acara_id_acara_seq'::regclass);
 I   ALTER TABLE public.spi_notulen_acara ALTER COLUMN id_acara DROP DEFAULT;
       public          postgres    false    562    561    562            �           2604    27838    spi_notulen_peserta id_peserta    DEFAULT     �   ALTER TABLE ONLY public.spi_notulen_peserta ALTER COLUMN id_peserta SET DEFAULT nextval('public.spi_notulen_peserta_id_peserta_seq'::regclass);
 M   ALTER TABLE public.spi_notulen_peserta ALTER COLUMN id_peserta DROP DEFAULT;
       public          postgres    false    563    564    564            �           2604    27845 "   spi_program_audit id_program_audit    DEFAULT     �   ALTER TABLE ONLY public.spi_program_audit ALTER COLUMN id_program_audit SET DEFAULT nextval('public.spi_program_audit_id_program_audit_seq'::regclass);
 Q   ALTER TABLE public.spi_program_audit ALTER COLUMN id_program_audit DROP DEFAULT;
       public          postgres    false    565    566    566            �           2604    27858 (   spi_program_audit_tahun id_program_audit    DEFAULT     �   ALTER TABLE ONLY public.spi_program_audit_tahun ALTER COLUMN id_program_audit SET DEFAULT nextval('public.spi_program_audit_tahun_id_program_audit_seq'::regclass);
 W   ALTER TABLE public.spi_program_audit_tahun ALTER COLUMN id_program_audit DROP DEFAULT;
       public          postgres    false    568    569    569                        2604    27865 "   spi_rekap_consulting id_konsultasi    DEFAULT     �   ALTER TABLE ONLY public.spi_rekap_consulting ALTER COLUMN id_konsultasi SET DEFAULT nextval('public.spi_rekap_consulting_id_konsultasi_seq'::regclass);
 Q   ALTER TABLE public.spi_rekap_consulting ALTER COLUMN id_konsultasi DROP DEFAULT;
       public          postgres    false    570    571    571                       2604    27874    spi_rka id_rka    DEFAULT     p   ALTER TABLE ONLY public.spi_rka ALTER COLUMN id_rka SET DEFAULT nextval('public.spi_rka_id_rka_seq'::regclass);
 =   ALTER TABLE public.spi_rka ALTER COLUMN id_rka DROP DEFAULT;
       public          postgres    false    572    573    573                       2604    27881    spi_sasaran id_sasaran    DEFAULT     �   ALTER TABLE ONLY public.spi_sasaran ALTER COLUMN id_sasaran SET DEFAULT nextval('public.spi_sasaran_id_sasaran_seq'::regclass);
 E   ALTER TABLE public.spi_sasaran ALTER COLUMN id_sasaran DROP DEFAULT;
       public          postgres    false    574    575    575                       2604    27895    template id_template    DEFAULT     |   ALTER TABLE ONLY public.template ALTER COLUMN id_template SET DEFAULT nextval('public.template_id_template_seq'::regclass);
 C   ALTER TABLE public.template ALTER COLUMN id_template DROP DEFAULT;
       public          postgres    false    577    578    578                      0    26012    comp_kebutuhan 
   TABLE DATA           �   COPY public.comp_kebutuhan (id_comp_kebutuhan, nama, id_interval, id_dokumen, is_file, url, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, mapping) FROM stdin;
    public          postgres    false    216   :�	                0    26023    comp_penilaian 
   TABLE DATA           /  COPY public.comp_penilaian (id_comp_penilaian, id_comp_kebutuhan, periode_label, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, id_status_penilaian, keterangan, id_jabatan_pereview, nama_jabatan_pereview, id_pereview, nama_pereview, tahun, id_unit) FROM stdin;
    public          postgres    false    218   W�	                0    26036    comp_penilaian_files 
   TABLE DATA           �   COPY public.comp_penilaian_files (id_comp_penilaian_files, client_name, file_name, file_type, file_size, id_comp_penilaian, jenis, url) FROM stdin;
    public          postgres    false    220   t�	      
          0    26047    contents 
   TABLE DATA           �   COPY public.contents (id_contents, contents, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, page, title, tgl_mulai_aktif, tgl_akhir_aktif) FROM stdin;
    public          postgres    false    222   ��	                0    26056    dokumen 
   TABLE DATA           ^  COPY public.dokumen (id_dokumen, is_aktif, is_approved, nomor_dokumen, nama, id_jenis_dokumen, tgl_upload, tgl_disahkan, id_diupload_oleh, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, keterangan, client_name, file_name, file_type, file_size, file_url, id_mig, id_unit, id_jabatan, id_kategori) FROM stdin;
    public          postgres    false    224   ��	                0    26068    dokumen_files 
   TABLE DATA           �   COPY public.dokumen_files (id_dokumen_files, client_name, file_name, file_type, file_size, id_dokumen, jenis, url, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, id_dokumen_versi, folder_name) FROM stdin;
    public          postgres    false    226   ˻	                0    26077    dokumen_jabatan 
   TABLE DATA           A   COPY public.dokumen_jabatan (id_dokumen, id_jabatan) FROM stdin;
    public          postgres    false    227   �	                0    26081    dokumen_kriteria 
   TABLE DATA           C   COPY public.dokumen_kriteria (id_dokumen, id_kriteria) FROM stdin;
    public          postgres    false    228   �	                0    26085    dokumen_unit 
   TABLE DATA           ;   COPY public.dokumen_unit (id_unit, id_dokumen) FROM stdin;
    public          postgres    false    229   "�	                0    26092    dokumen_versi 
   TABLE DATA           �   COPY public.dokumen_versi (id_dokumen_versi, id_dokumen, status, catatan_revisi, catatan_ajuan, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    231   ?�	                0    26101    kpi 
   TABLE DATA           �   COPY public.kpi (id_kpi, id_parent, kode, nama, is_bersama, is_direktorat, is_korporat, is_nilai_akhir, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, jenis_realisasi, id_mig, urutan) FROM stdin;
    public          postgres    false    233   \�	                0    26114 
   kpi_config 
   TABLE DATA           �   COPY public.kpi_config (tahun, is_bersama, is_direktorat, is_korporat, jenis_realisasi, id_kpi, jenis_realisasi_direktorat, jenis_realisasi_korporat) FROM stdin;
    public          postgres    false    234   y�	                0    26121    kpi_individu 
   TABLE DATA           m   COPY public.kpi_individu (id_kpi, target, pegawai, id_pegawai, kategori, id_kategori, is_setuju) FROM stdin;
    public          postgres    false    236   ��	                0    26130 
   kpi_target 
   TABLE DATA           j  COPY public.kpi_target (id_kpi_target, id_dit_bid, id_subbid, id_kpi, satuan, bobot, bobot1, polarisasi, target, analisa, tahun, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, id_unit, evaluasi, total_realisasi, realisasi_bobot, persen_realisasi, max_month, is_pic, bobot2, jenis, definisi, tujuan, formula) FROM stdin;
    public          postgres    false    238   ��	                0    26144    kpi_target_evaluasi 
   TABLE DATA           �   COPY public.kpi_target_evaluasi (id_kpi_target_evaluasi, id_kpi_target, evaluasi, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    240   м	                0    26154    kpi_target_files 
   TABLE DATA           �   COPY public.kpi_target_files (id_kpi_target_files, client_name, file_name, file_type, file_size, jenis_file, id_kpi_target) FROM stdin;
    public          postgres    false    242   ��	                 0    26163    kpi_target_realisasi 
   TABLE DATA           �   COPY public.kpi_target_realisasi (id_kpi_target_realisasi, id_kpi_target, bulan, nilai, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, prosentase) FROM stdin;
    public          postgres    false    244   
�	      "          0    26171    lost_incident 
   TABLE DATA           �   COPY public.lost_incident (id_lost_incident, nama_kejadian, pelaku, kronologi, penyebab, dampak, waktu, nilai_kerugian, id_risiko, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, is_progress, lokasi) FROM stdin;
    public          postgres    false    246   '�	      $          0    26180    lost_incident_files 
   TABLE DATA           �   COPY public.lost_incident_files (id_lost_incident_files, client_name, file_name, file_type, file_size, id_lost_incident, jenis) FROM stdin;
    public          postgres    false    248   D�	      &          0    26188    lost_incident_follow_up 
   TABLE DATA           =  COPY public.lost_incident_follow_up (id_follow_up, aktifitas_pengendalian, biaya, deadline, is_segabai_tindakan_mitigasi, is_sebagain_prosedur_control, id_history_fu_terakhir, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, id_lost_incident, id_dit_bid, progress) FROM stdin;
    public          postgres    false    250   a�	      (          0    26197    lost_incident_fu_files 
   TABLE DATA           �   COPY public.lost_incident_fu_files (id_follow_up_files, client_name, file_name, file_type, file_size, id_follow_up, jenis) FROM stdin;
    public          postgres    false    252   ~�	      *          0    26205    lost_incident_fu_p_files 
   TABLE DATA           �   COPY public.lost_incident_fu_p_files (id_follow_up_p_files, client_name, file_name, file_type, file_size, id_fu_progress, jenis) FROM stdin;
    public          postgres    false    254   ��	      ,          0    26215    lost_incident_fu_progress 
   TABLE DATA           �   COPY public.lost_incident_fu_progress (id_fu_progress, progress, hambatan_kendala, id_follow_up, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    256   ��	      .          0    26224    mt_aspek_lingkungan 
   TABLE DATA           �   COPY public.mt_aspek_lingkungan (id_aspek_lingkungan, kode, nama, keterangan, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    258   ս	      0          0    26233    mt_bidang_pemeriksaan 
   TABLE DATA           �   COPY public.mt_bidang_pemeriksaan (id_bidang_pemeriksaan, nama, jenis, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    260   �	      2          0    26242    mt_interval 
   TABLE DATA           �   COPY public.mt_interval (id_interval, nama, created_date, modified_date, created_by, modified_by, konversi_bulan, jenis) FROM stdin;
    public          postgres    false    262   �	      4          0    26249    mt_jenis_audit_eksternal 
   TABLE DATA           R   COPY public.mt_jenis_audit_eksternal (id_jenis_audit_eksternal, nama) FROM stdin;
    public          postgres    false    264   ,�	      6          0    26256    mt_jenis_dokumen 
   TABLE DATA           J   COPY public.mt_jenis_dokumen (id_jenis_dokumen, is_ppd, nama) FROM stdin;
    public          postgres    false    266   I�	      8          0    26263    mt_jenis_rtm 
   TABLE DATA           �   COPY public.mt_jenis_rtm (id_jenis_rtm, id_jenis_rtm_parent, jenis_masalah, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    268   f�	      :          0    26272    mt_kategori 
   TABLE DATA           �   COPY public.mt_kategori (id_kategori, id_kategori_parent, nama, is_aktif, id_kategori_jenis, id_interval, prosentase) FROM stdin;
    public          postgres    false    270   ��	      <          0    26281    mt_kategori_jenis 
   TABLE DATA           N   COPY public.mt_kategori_jenis (id_kategori_jenis, nama, is_aktif) FROM stdin;
    public          postgres    false    272   ��	      >          0    26288    mt_kategori_kpi_individu 
   TABLE DATA           E   COPY public.mt_kategori_kpi_individu (id_kategori, nama) FROM stdin;
    public          postgres    false    274   ��	      @          0    26296    mt_kriteria 
   TABLE DATA           `  COPY public.mt_kriteria (id_kriteria, id_kategori, kode, nama, is_upload, id_kriteria_parent, is_aktif, id_interval, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, bobot, tahun, id_unit, id_kriteria_before, id_kriteria_parent1, d, k, w, o, kode_lvl, nama_lvl, keterangan, keterangan1, keterangan2) FROM stdin;
    public          postgres    false    276   ھ	      A          0    26305    mt_kriteria_link 
   TABLE DATA           F   COPY public.mt_kriteria_link (id_kriteria1, id_kriteria2) FROM stdin;
    public          postgres    false    277   ��	      B          0    26310    mt_maturity 
   TABLE DATA           ?   COPY public.mt_maturity (tahun, target, realisasi) FROM stdin;
    public          postgres    false    278   �	      D          0    26316    mt_message_template 
   TABLE DATA           �   COPY public.mt_message_template (id_message, msg, is_user, created_date, modfied_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    280   1�	      F          0    26325    mt_opp_dampak 
   TABLE DATA           �   COPY public.mt_opp_dampak (id_dampak, nama, keterangan, created_date, modified_date, created_by, modified_by, kode, rating, mulai, sampai) FROM stdin;
    public          postgres    false    282   N�	      H          0    26334    mt_opp_kelayakan 
   TABLE DATA           >   COPY public.mt_opp_kelayakan (id_kelayakan, nama) FROM stdin;
    public          postgres    false    284   k�	      J          0    26341    mt_opp_kemungkinan 
   TABLE DATA           �   COPY public.mt_opp_kemungkinan (id_kemungkinan, nama, deskripsi_kualitatif, created_date, modified_date, created_by, modified_by, probabilitas, insiden_sebelumnya, kode, rating, mulai, sampai) FROM stdin;
    public          postgres    false    286   ��	      L          0    26350    mt_opp_kriteria_dampak 
   TABLE DATA           Z   COPY public.mt_opp_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode) FROM stdin;
    public          postgres    false    288   ��	      M          0    26357    mt_opp_kriteria_dampak_detail 
   TABLE DATA           b   COPY public.mt_opp_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan) FROM stdin;
    public          postgres    false    289   ¿	      N          0    26363    mt_opp_matrix 
   TABLE DATA           S   COPY public.mt_opp_matrix (id_dampak, id_kemungkinan, id_tingkat, css) FROM stdin;
    public          postgres    false    290   ߿	      P          0    26371    mt_opp_tingkat 
   TABLE DATA           M   COPY public.mt_opp_tingkat (id_tingkat, nama, warna, penanganan) FROM stdin;
    public          postgres    false    292   ��	      R          0    26380    mt_pb_kategori 
   TABLE DATA           g   COPY public.mt_pb_kategori (id_kategori, nama, tgl_mulai_efektif, tgl_akhir_efektif, kode) FROM stdin;
    public          postgres    false    294   �	      T          0    26387    mt_pb_kelompok_proses 
   TABLE DATA           �   COPY public.mt_pb_kelompok_proses (id_kelompok_proses, nama, tgl_mulai_efektif, tgl_akhir_efektif, kode, id_kategori) FROM stdin;
    public          postgres    false    296   6�	      V          0    26395    mt_pb_nama_proses 
   TABLE DATA           �   COPY public.mt_pb_nama_proses (id_nama_proses, nama, tgl_mulai_efektif, tgl_akhir_efektif, kode, id_kelompok_proses) FROM stdin;
    public          postgres    false    298   S�	      X          0    26403    mt_pemeriksaan_checklist 
   TABLE DATA           �   COPY public.mt_pemeriksaan_checklist (id_checklist, nama, id_checklist_parent, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, jenis) FROM stdin;
    public          postgres    false    300   p�	      Z          0    26413    mt_pemeriksaan_jenis_akomodasi 
   TABLE DATA           N   COPY public.mt_pemeriksaan_jenis_akomodasi (id_jenis, nama_jenis) FROM stdin;
    public          postgres    false    302   ��	      \          0    26420    mt_pemeriksaan_kka 
   TABLE DATA           �   COPY public.mt_pemeriksaan_kka (id_kka, nomor_kka, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, keterangan, client_name, file_name, file_type, file_size) FROM stdin;
    public          postgres    false    304   ��	      ^          0    26429    mt_periode_tw 
   TABLE DATA           ~   COPY public.mt_periode_tw (id_periode_tw, nama, bulan_mulai, bulan_akhir, tgl_bulan_le_mulai, tgl_bulan_le_akhir) FROM stdin;
    public          postgres    false    306   ��	      `          0    26436    mt_ppd 
   TABLE DATA           .   COPY public.mt_ppd (id_ppd, nama) FROM stdin;
    public          postgres    false    308   ��	      a          0    26442    mt_prioritas 
   TABLE DATA           �   COPY public.mt_prioritas (id_prioritas, nama, warna, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, keterangan) FROM stdin;
    public          postgres    false    309   �	      c          0    26450    mt_rating_spi 
   TABLE DATA           ?   COPY public.mt_rating_spi (id_rating, nama_rating) FROM stdin;
    public          postgres    false    311   �	      e          0    26457    mt_risk_dampak 
   TABLE DATA           �   COPY public.mt_risk_dampak (id_dampak, nama, keterangan, created_date, modified_date, created_by, modified_by, kode, rating, mulai, sampai, nama_peluang, ketarangan_peluang) FROM stdin;
    public          postgres    false    313   ;�	      g          0    26466    mt_risk_efektif_m 
   TABLE DATA           u   COPY public.mt_risk_efektif_m (id_efektif_m, nama, created_date, modified_date, created_by, modified_by) FROM stdin;
    public          postgres    false    315   X�	      h          0    26472    mt_risk_efektif_m_bobot 
   TABLE DATA           i   COPY public.mt_risk_efektif_m_bobot (id_efektif_m, id_efektif_m_jawaban, bobot, rekomendasi) FROM stdin;
    public          postgres    false    316   u�	      j          0    26480    mt_risk_efektif_m_jawaban 
   TABLE DATA           O   COPY public.mt_risk_efektif_m_jawaban (id_efektif_m_jawaban, nama) FROM stdin;
    public          postgres    false    318   ��	      l          0    26487    mt_risk_efektif_m_pengukuran 
   TABLE DATA           �   COPY public.mt_risk_efektif_m_pengukuran (id_pengukuran, skor_bawah, skor_atas, efektifitas_mitigasi, diskripsi_kriteria) FROM stdin;
    public          postgres    false    320   ��	      n          0    26496    mt_risk_efektifitas 
   TABLE DATA           �   COPY public.mt_risk_efektifitas (id_efektifitas, nama, created_date, modified_date, created_by, modified_by, need_lampiran, need_explanation) FROM stdin;
    public          postgres    false    322   ��	      o          0    26504    mt_risk_efektifitas_bobot 
   TABLE DATA           b   COPY public.mt_risk_efektifitas_bobot (id_efektifitas, id_efektifitas_jawaban, bobot) FROM stdin;
    public          postgres    false    323   ��	      q          0    26510    mt_risk_efektifitas_jawaban 
   TABLE DATA           S   COPY public.mt_risk_efektifitas_jawaban (id_efektifitas_jawaban, nama) FROM stdin;
    public          postgres    false    325   �	      s          0    26517    mt_risk_efektifitas_pengukuran 
   TABLE DATA           �   COPY public.mt_risk_efektifitas_pengukuran (id_pengukuran, skor_bawah, skor_atas, efektifitas, diskripsi_kriteria, faktor_terhadap_risiko, warna) FROM stdin;
    public          postgres    false    327   #�	      u          0    26526    mt_risk_kemungkinan 
   TABLE DATA             COPY public.mt_risk_kemungkinan (id_kemungkinan, nama, deskripsi_kualitatif, created_date, modified_date, created_by, modified_by, probabilitas, insiden_sebelumnya, kode, rating, mulai, sampai, probabilitas_non_rutin, nama_non_rutin, deskripsi_kualitatif_non_rutin) FROM stdin;
    public          postgres    false    329   @�	      w          0    26535    mt_risk_kriteria_dampak 
   TABLE DATA           l   COPY public.mt_risk_kriteria_dampak (id_kriteria_dampak, nama, id_induk, kode, rutin_non_rutin) FROM stdin;
    public          postgres    false    331   ]�	      x          0    26542    mt_risk_kriteria_dampak_detail 
   TABLE DATA           c   COPY public.mt_risk_kriteria_dampak_detail (id_kriteria_dampak, id_dampak, keterangan) FROM stdin;
    public          postgres    false    332   z�	      y          0    26548    mt_risk_matrix 
   TABLE DATA           T   COPY public.mt_risk_matrix (id_dampak, id_kemungkinan, id_tingkat, css) FROM stdin;
    public          postgres    false    333   ��	      {          0    26556    mt_risk_taksonomi 
   TABLE DATA           {   COPY public.mt_risk_taksonomi (id_taksonomi, kode, nama, id_taksonomi_area, is_regulasi, penjelasan, is_aktif) FROM stdin;
    public          postgres    false    335   ��	      |          0    26565    mt_risk_taksonomi_appetite 
   TABLE DATA           w   COPY public.mt_risk_taksonomi_appetite (id_taksonomi, tahun, id_kemungkinan, id_dampak, id_taksonomi_area) FROM stdin;
    public          postgres    false    336   ��	      ~          0    26572    mt_risk_taksonomi_area 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_area (id_taksonomi_area, kode, nama, id_taksonomi_objective, tgl_mulai_efektif, tgl_akhir_efektif, keterangan, jenis) FROM stdin;
    public          postgres    false    338   ��	      �          0    26582    mt_risk_taksonomi_objective 
   TABLE DATA           �   COPY public.mt_risk_taksonomi_objective (id_taksonomi_objective, kode, nama, tgl_mulai_efektif, tgl_akhir_efektif, id_mig, jenis) FROM stdin;
    public          postgres    false    340   �	      �          0    26589    mt_risk_tingkat 
   TABLE DATA              COPY public.mt_risk_tingkat (id_tingkat, nama, warna, penanganan, nama_peluang, warna_peluang, penanganan_peluang) FROM stdin;
    public          postgres    false    342   (�	      �          0    26597    mt_sdm_dit_bid 
   TABLE DATA           >   COPY public.mt_sdm_dit_bid (code, nama, is_aktif) FROM stdin;
    public          postgres    false    343   E�	      �          0    26604    mt_sdm_jabatan 
   TABLE DATA             COPY public.mt_sdm_jabatan (id_jabatan, nama, id_unit, position_id, created_date, modified_date, tgl_mulai_efektif, tgl_akhir_efektif, id_jabatan_parent, superior_id, id_kategori, id_jenjang, id_tipe_unit, id_dit_bid, id_subbid, urutan, id_sdm_level) FROM stdin;
    public          postgres    false    345   b�	      �          0    26617    mt_sdm_jenjang 
   TABLE DATA           >   COPY public.mt_sdm_jenjang (code, nama, is_aktif) FROM stdin;
    public          postgres    false    346   �	      �          0    26623    mt_sdm_kategori 
   TABLE DATA           ?   COPY public.mt_sdm_kategori (code, nama, is_aktif) FROM stdin;
    public          postgres    false    347   ��	      �          0    26629    mt_sdm_level 
   TABLE DATA           K   COPY public.mt_sdm_level (id_sdm_level, level, nama, is_aktif) FROM stdin;
    public          postgres    false    349   ��	      �          0    26635    mt_sdm_pegawai 
   TABLE DATA           O   COPY public.mt_sdm_pegawai (nid, email, position_id, nama_lengkap) FROM stdin;
    public          postgres    false    350   ��	      �          0    26643    mt_sdm_struktur 
   TABLE DATA           �   COPY public.mt_sdm_struktur (id_struktur, kode, nama, tgl_mulai_efektif, tgl_akhir_efektif, id_struktur_parent, urutan) FROM stdin;
    public          postgres    false    352   ��	      �          0    26651    mt_sdm_struktur_history 
   TABLE DATA           S   COPY public.mt_sdm_struktur_history (id_struktur, id_struktur_history) FROM stdin;
    public          postgres    false    353   �	      �          0    26658    mt_sdm_sub_unit 
   TABLE DATA           E   COPY public.mt_sdm_sub_unit (id_sub_unit, id_unit, nama) FROM stdin;
    public          postgres    false    355   -�	      �          0    26665    mt_sdm_subbid 
   TABLE DATA           =   COPY public.mt_sdm_subbid (code, nama, is_aktif) FROM stdin;
    public          postgres    false    356   J�	      �          0    26670    mt_sdm_tipe_unit 
   TABLE DATA           @   COPY public.mt_sdm_tipe_unit (code, nama, is_aktif) FROM stdin;
    public          postgres    false    357   g�	      �          0    26676    mt_sdm_unit 
   TABLE DATA           }   COPY public.mt_sdm_unit (table_code, table_desc, is_aktif, kode_distrik, id_mig_dep, kode_lama, id_subunitkerja) FROM stdin;
    public          postgres    false    358   ��	      �          0    26682    mt_stakeholder 
   TABLE DATA           �   COPY public.mt_stakeholder (id_stakeholder, nama, kepentingan, created_date, modfied_date, created_by, modified_by, created_by_desc, modified_by_desc, id_owner_sso) FROM stdin;
    public          postgres    false    359   ��	      �          0    26690    mt_status_pemeriksaan 
   TABLE DATA           �   COPY public.mt_status_pemeriksaan (id_status_pemeriksaan, nama, created_date, modified_date, created_by, modified_by) FROM stdin;
    public          postgres    false    361   ��	      �          0    26697    mt_status_pengajuan 
   TABLE DATA           ~   COPY public.mt_status_pengajuan (id_status_pengajuan, nama, created_date, modified_date, created_by, modified_by) FROM stdin;
    public          postgres    false    363   ��	      �          0    26704    mt_status_penilaian 
   TABLE DATA           �   COPY public.mt_status_penilaian (id_status_penilaian, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    365   ��	      �          0    26711    mt_status_progress 
   TABLE DATA           �   COPY public.mt_status_progress (id_status_progress, nama, created_date, modified_date, created_by, modified_by, prosentase) FROM stdin;
    public          postgres    false    367   �	      �          0    26718    mt_target_kpi 
   TABLE DATA           :   COPY public.mt_target_kpi (id_target, target) FROM stdin;
    public          postgres    false    369   2�	      �          0    26726    mt_tingkat_agregasi_risiko 
   TABLE DATA           y   COPY public.mt_tingkat_agregasi_risiko (id_tingkat_agregasi_risiko, nama, id_tingkat_agregasi_risiko_parent) FROM stdin;
    public          postgres    false    371   O�	      �          0    26734    opp_kolom_laporan 
   TABLE DATA           Q   COPY public.opp_kolom_laporan (id_kolom_laporan, nama, kolom, judul) FROM stdin;
    public          postgres    false    373   l�	      �          0    26742    opp_log 
   TABLE DATA           v   COPY public.opp_log (id_peluang, deskripsi, created_by, group_id, id_scorecard, activity_time, user_name) FROM stdin;
    public          postgres    false    374   ��	      �          0    26751    opp_peluang 
   TABLE DATA           �  COPY public.opp_peluang (id_peluang, nomor, nama, deskripsi, inheren_dampak, inheren_kemungkinan, control_dampak_penurunan, control_kemungkinan_penurunan, penyebab, dampak, id_scorecard, id_status_pengajuan, id_kegiatan, residual_target_dampak, residual_target_kemungkinan, created_date, modified_date, created_by, modified_by, residual_dampak_evaluasi, residual_kemungkinan_evaluasi, current_opp, id_sasaran, current_opp_dampak, current_opp_kemungkinan, id_kriteria_dampak, progress_capaian_kinerja, hambatan_kendala, penyesuaian_tindakan_mitigasi, progress_capaian_sasaran, status_peluang, status_keterangan, is_lock, tgl_peluang, id_peluang_sebelum, tgl_close, nomor_asli, id_kriteria_kemungkinan, urutan, id_aktifitas, nama_aktifitas, kode_aktifitas, rekomendasi_keterangan, rekomendasi_is_verified, rekomendasi_nid, rekomendasi_date, rekomendasi_jabatan, rekomendasi_group, review_nid, review_date, review_jabatan, id_jabatan, review_group, review_is_verified, no, review_kepatuhan, id_taksonomi, id_kategori, sub_tahapan_kegiatan, id_fraud_kategori, id_fraud_jenis, skor_inheren_dampak, skor_inheren_kemungkinan, skor_control_dampak, skor_control_kemungkinan, skor_target_dampak, skor_target_kemungkinan, skor_current_dampak, skor_current_kemungkinan, regulasi, id_peluang_parent, nama_kegiatan, id_peluang_parent_lain, red_flag, id_kpi, sasaran, id_taksonomi_area, pengendalian_peluang_berjalan, target_penyelesaian, anggaran_biaya, is_evaluasi_mitigasi, is_evaluasi_peluang, is_kerangka_acuan_kerja, id_mig, ab) FROM stdin;
    public          postgres    false    376   ��	      �          0    26788    opp_peluang_files 
   TABLE DATA           ~   COPY public.opp_peluang_files (id_peluang_files, client_name, file_name, file_type, file_size, id_peluang, jenis) FROM stdin;
    public          postgres    false    378   ��	      �          0    26796    opp_peluang_kelayakan 
   TABLE DATA           I   COPY public.opp_peluang_kelayakan (id_peluang, id_kelayakan) FROM stdin;
    public          postgres    false    379   ��	      �          0    26802    opp_peluang_unit 
   TABLE DATA           G   COPY public.opp_peluang_unit (id_peluang_unit, id_peluang) FROM stdin;
    public          postgres    false    380   ��	      �          0    26808    opp_scorecard 
   TABLE DATA           �  COPY public.opp_scorecard (id_scorecard, nama, scope, id_visi_misi, created_date, modified_date, created_by, modified_by, id_kajian_risiko, id_unit, tgl_mulai_efektif, tgl_akhir_efektif, owner, id_struktur, id_parent_scorecard, navigasi, open_evaluasi, id_nama_proses, is_info, template_laporan, proses, id_tingkat_agregasi_risiko, id_temp, is_kegiatan, kode, id_status_pengajuan, is_evaluasi_mitigasi, is_evaluasi_peluang) FROM stdin;
    public          postgres    false    382   �	      �          0    26825    opp_scorecard_files 
   TABLE DATA           �   COPY public.opp_scorecard_files (id_scorecard_files, client_name, file_name, file_type, file_size, id_scorecard, jenis) FROM stdin;
    public          postgres    false    384   7�	      �          0    26835    opp_scorecard_user 
   TABLE DATA           F   COPY public.opp_scorecard_user (id_scorecard, id_jabatan) FROM stdin;
    public          postgres    false    385   T�	      �          0    26840    opp_scorecard_view 
   TABLE DATA           F   COPY public.opp_scorecard_view (id_jabatan, id_scorecard) FROM stdin;
    public          postgres    false    386   q�	      �          0    26847    pemeriksaan 
   TABLE DATA           �  COPY public.pemeriksaan (id_pemeriksaan, id_unit, nama, lokasi, tgl_mulai, tgl_selesai, id_jabatan_penyesusun, id_jabatan_pereview, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, jabatan_penyesusun, nama_jabatan_penyusun, jabatan_pereview, nama_jabatan_pereview, keterangan, jenis, tujuan, kriteria_audit, objeklainnya, pemeriksaancol, id_subbid, id_jenis_audit_eksternal, id_status, nomor_stp, id_spn, id_penyusun, id_pereview, nama_penyusun, nama_pereview, tanggal_sptp, user_id, nama_user, id_penanggung_jawab, nama_penanggung_jawab, nama_jabatan_penanggung_jawab, id_sasaran, nama_sasaran) FROM stdin;
    public          postgres    false    388   ��	      �          0    26863    pemeriksaan_anggaran_biaya 
   TABLE DATA             COPY public.pemeriksaan_anggaran_biaya (id_pemeriksaan_anggaran_biaya, id_pemeriksaan_detail, id_pemeriksaan, nama, anggaran, nilai_realisasi, id_jenis, nama_jenis, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, tanggal_surat) FROM stdin;
    public          postgres    false    390   ��	      �          0    26872    pemeriksaan_checklist 
   TABLE DATA           �   COPY public.pemeriksaan_checklist (id_pemeriksaan_checklist, id_pemeriksaan, id_checklist, is_oke, penyelesaian, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, jenis, keterangan) FROM stdin;
    public          postgres    false    392   ��	      �          0    26885    pemeriksaan_detail 
   TABLE DATA           T  COPY public.pemeriksaan_detail (id_pemeriksaan_detail, uraian, detail_uraian, rencana, realisasi, catatan, id_pemeriksaan, klausul, referensi, id_dokumen, id_jabatan, id_kka, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, anggaran, realisasi_anggaran, user_id, nama_user, nama_jabatan) FROM stdin;
    public          postgres    false    394   ��	      �          0    26896    pemeriksaan_dokumen_eksternal 
   TABLE DATA           �   COPY public.pemeriksaan_dokumen_eksternal (id_dokumen_aksternal, nomor_dokumen, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, keterangan, client_name, file_name, file_type, file_size) FROM stdin;
    public          postgres    false    396   �	      �          0    26905    pemeriksaan_peminjaman 
   TABLE DATA           �   COPY public.pemeriksaan_peminjaman (id_pemeriksaan_peminjaman, id_pemeriksaan, jenis_dokumen_yang_dipinjam, nomor_berkas, nama_peminjam, maksud_dan_keperluan, tgl_peminjaman, tgl_pengembalian, keterangan) FROM stdin;
    public          postgres    false    398   �	      �          0    26915    pemeriksaan_review_supervisi 
   TABLE DATA           �   COPY public.pemeriksaan_review_supervisi (id_review_supervisi, permsalahan, id_kka, penyelesaian, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, is_persetujuan, id_pemeriksaan, id_pemeriksaan_detail) FROM stdin;
    public          postgres    false    400   <�	      �          0    26924    pemeriksaan_spn 
   TABLE DATA           �   COPY public.pemeriksaan_spn (id_spn, nomor_surat, periode_pemeriksaan_mulai, periode_pemeriksaan_selesai, deskripsi, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, tanggal_surat) FROM stdin;
    public          postgres    false    402   Y�	      �          0    26933    pemeriksaan_spn_petugas 
   TABLE DATA           {   COPY public.pemeriksaan_spn_petugas (id_petugas, user_id, nama, nama_jabatan, peran, id_jabatan, id_spn, nipp) FROM stdin;
    public          postgres    false    404   v�	      �          0    26942    pemeriksaan_temuan 
   TABLE DATA           ~  COPY public.pemeriksaan_temuan (id_pemeriksaan_temuan, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, judul_temuan, kondisi, kriteria, sebab, akibat, rekomendasi, saran, id_pemeriksaan, id_pemeriksaan_detail, tgl_klarifikasi, id_jabatan_auditor, jabatan_auditor, nama_jabatan_auditor, id_jabatan_auditee, jabatan_auditee, nama_jabatan_auditee, rincian_tindak_lanjut, hasil_evaluasi, tmt, id_dokumen, klausul, jenis_temuan, rencana_tindakan_perbaikan, target_penyelesaian, referensi, status, id_periode_tw, tahun, is_disetujui, kondisi1, id_bidang_pemeriksaan, id_bidang, nama_bidang) FROM stdin;
    public          postgres    false    406   ��	      �          0    26957    pemeriksaan_temuan_diskusi 
   TABLE DATA           �   COPY public.pemeriksaan_temuan_diskusi (id_pemeriksaan_temuan_diskusi, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, keterangan, id_pemeriksaan_temuan) FROM stdin;
    public          postgres    false    408   ��	      �          0    26967    pemeriksaan_temuan_files 
   TABLE DATA           �   COPY public.pemeriksaan_temuan_files (id_pemeriksaan_temuan_files, client_name, file_name, file_type, file_size, id_pemeriksaan_temuan, jenis) FROM stdin;
    public          postgres    false    410   ��	      �          0    26978    pemeriksaan_temuan_saran 
   TABLE DATA           q   COPY public.pemeriksaan_temuan_saran (id_pemeriksaan_temuan_saran, id_pemeriksaan_temuan, deskripsi) FROM stdin;
    public          postgres    false    412   ��	      �          0    26988    pemeriksaan_tim 
   TABLE DATA           �   COPY public.pemeriksaan_tim (id_pemeriksaan_tim, user_id, nama, nama_jabatan, peran, id_bidang_pemeriksaan, id_jabatan, id_pemeriksaan) FROM stdin;
    public          postgres    false    414   �	      �          0    26996    pemeriksaan_tindak_lanjut 
   TABLE DATA             COPY public.pemeriksaan_tindak_lanjut (id_pemeriksaan_tindak_lanjut, id_pemeriksaan_temuan, id_periode_tw, rincian_tindak_lanjut, hasil_evaluasi, status, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, kesimpulan, tahun) FROM stdin;
    public          postgres    false    416   $�	      �          0    27007    pemeriksaan_tindak_lanjut_files 
   TABLE DATA           �   COPY public.pemeriksaan_tindak_lanjut_files (id_pemeriksaan_tindak_lanjut_files, client_name, file_name, file_type, file_size, id_pemeriksaan_tindak_lanjut, jenis) FROM stdin;
    public          postgres    false    418   A�	      �          0    27017    pemeriksaan_tindak_lanjut_saran 
   TABLE DATA           �   COPY public.pemeriksaan_tindak_lanjut_saran (id_pemeriksaan_tindak_lanjut, id_pemeriksaan_temuan_saran, rincian_tindak_lanjut) FROM stdin;
    public          postgres    false    419   ^�	      �          0    27025 	   penilaian 
   TABLE DATA           �   COPY public.penilaian (id_penilaian, tgl, status, id_penilaian_periode, tgl_label, rekomendasi, nama_dokumen, sumber_dokumen, pemilik_dokumen, tgl_review, id_dokumen, id_penilaian_detail) FROM stdin;
    public          postgres    false    421   {�	      �          0    27036    penilaian_detail 
   TABLE DATA           �   COPY public.penilaian_detail (id_penilaian_detail, id_penilaian, jenis, skor, tgl, simpulan, saran, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    423   ��	      �          0    27045    penilaian_dokumen 
   TABLE DATA           K   COPY public.penilaian_dokumen (id_penilaian, id_dokumen_versi) FROM stdin;
    public          postgres    false    424   ��	      �          0    27049    penilaian_files 
   TABLE DATA           �   COPY public.penilaian_files (id_penilaian_files, client_name, file_name, file_type, file_size, id_penilaian, jenis) FROM stdin;
    public          postgres    false    426   ��	      �          0    27058    penilaian_komentar 
   TABLE DATA           �   COPY public.penilaian_komentar (id_penilaian_komentar, id_penilaian, komentar, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    428   ��	      �          0    27067    penilaian_link 
   TABLE DATA           �   COPY public.penilaian_link (id_penilaian_periode1, id_kriteria1, id_penilaian_periode2, id_kriteria2, id_penilaian1, id_penilaian2) FROM stdin;
    public          postgres    false    429   �	      �          0    27071    penilaian_periode 
   TABLE DATA           �   COPY public.penilaian_periode (id_penilaian_periode, tgl_penilaian, id_kriteria, id_unit_bak, id_interval, is_aktif, nilai_target, tgl_next, id_penilaian_session) FROM stdin;
    public          postgres    false    431   )�	      �          0    27081    penilaian_quisioner 
   TABLE DATA           �   COPY public.penilaian_quisioner (id_penilaian_quisioner, id_jabatan, id_quisioner, id_quisioner_parent, pertanyaan, jenis_jawaban, jawaban, id_penilaian_session, nilai) FROM stdin;
    public          postgres    false    433   F�	      �          0    27090    penilaian_session 
   TABLE DATA           �   COPY public.penilaian_session (id_penilaian_session, nama, tgl, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, page_ctrl, id_kategori, target_lvl, jenis_assessment_gcg) FROM stdin;
    public          postgres    false    435   c�	      �          0    27100    public_sys_action 
   TABLE DATA           T   COPY public.public_sys_action (action_id, menu_id, name, type, visible) FROM stdin;
    public          postgres    false    437   ��	      �          0    27109    public_sys_group 
   TABLE DATA           C   COPY public.public_sys_group (group_id, name, visible) FROM stdin;
    public          postgres    false    439   ��	      �          0    27116    public_sys_group_action 
   TABLE DATA           K   COPY public.public_sys_group_action (group_menu_id, action_id) FROM stdin;
    public          postgres    false    440   ��	      �          0    27123    public_sys_group_menu 
   TABLE DATA           Q   COPY public.public_sys_group_menu (group_menu_id, group_id, menu_id) FROM stdin;
    public          postgres    false    442   ��	      �          0    27131    public_sys_log 
   TABLE DATA           g   COPY public.public_sys_log (page, activity, ip, activity_time, user_id, action, user_name) FROM stdin;
    public          postgres    false    443   ��	      �          0    27138    public_sys_menu 
   TABLE DATA           h   COPY public.public_sys_menu (menu_id, parent_id, label, iconcls, url, visible, state, sort) FROM stdin;
    public          postgres    false    445   �	      �          0    27148    public_sys_message 
   TABLE DATA             COPY public.public_sys_message (id_message, msg, topik, status, id_message_parent, id_user, jabatan, id_jabatan, is_aktif, is_user, "time", is_read, nama, created_date, modfied_date, created_by, modified_by, created_by_desc, modified_by_desc, is_lanjutan, rating) FROM stdin;
    public          postgres    false    447   .�	      �          0    27160    public_sys_message_files 
   TABLE DATA           �   COPY public.public_sys_message_files (id_message_files, file_name, file_type, file_size, client_name, jenis_file, id_message, created_date, modfied_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    448   K�	      �          0    27167    public_sys_notification 
   TABLE DATA           q   COPY public.public_sys_notification (id_notification, isi, id_user, id_jabatan, url, is_open, jenis) FROM stdin;
    public          postgres    false    450   h�	      �          0    27178    public_sys_setting 
   TABLE DATA           c   COPY public.public_sys_setting (id_public_sys_setting, nama, is_show, isi, keterangan) FROM stdin;
    public          postgres    false    452   ��	      �          0    27187    public_sys_user 
   TABLE DATA           �   COPY public.public_sys_user (user_id, username, group_id, name, last_ip, last_login, is_active, password, nid, id_jabatan, is_notification, email, is_manual, tgl_mulai_aktif, tgl_selesai_aktif) FROM stdin;
    public          postgres    false    454   ��	      �          0    27200    public_sys_user_group 
   TABLE DATA           N   COPY public.public_sys_user_group (user_id, group_id, id_jabatan) FROM stdin;
    public          postgres    false    455   ��	      �          0    27208 	   quisioner 
   TABLE DATA           n   COPY public.quisioner (id_quisioner, pertanyaan, jenis_jawaban, id_kategori, id_quisioner_parent) FROM stdin;
    public          postgres    false    457   ��	      �          0    27216    quisioner_jabatan 
   TABLE DATA           E   COPY public.quisioner_jabatan (id_jabatan, id_quisioner) FROM stdin;
    public          postgres    false    458   ��	      �          0    27220    quisioner_kriteria 
   TABLE DATA           G   COPY public.quisioner_kriteria (id_quisioner, id_kriteria) FROM stdin;
    public          postgres    false    459   �	      �          0    27224    quisioner_pemeriksaan 
   TABLE DATA           M   COPY public.quisioner_pemeriksaan (id_pemeriksaan, id_quisioner) FROM stdin;
    public          postgres    false    460   3�	      �          0    27227    quisioner_tahun 
   TABLE DATA           >   COPY public.quisioner_tahun (tahun, id_quisioner) FROM stdin;
    public          postgres    false    461   P�	      �          0    27231    risk_control 
   TABLE DATA           *  COPY public.risk_control (id_control, nama, deskripsi, is_efektif, id_interval, remark, id_risiko, id_control_parent, menurunkan_dampak_kemungkinan, created_date, modified_date, created_by, modified_by, id_mitigasi_sumber, is_lock, id_control_sebelum, review_kepatuhan, review_nid, review_date, rekomendasi_keterangan, rekomendasi_is_verified, rekomendasi_nid, rekomendasi_date, rekomendasi_jabatan, rekomendasi_group, review_jabatan, id_jabatan, review_group, review_is_verified, no, id_pengukuran, id_dokumen, efektifitas, status_progress) FROM stdin;
    public          postgres    false    463   m�	      �          0    27252    risk_control_efektifitas 
   TABLE DATA           �   COPY public.risk_control_efektifitas (id_control, id_efektifitas, is_iya, created_date, modified_date, created_by, modified_by, keterangan, id_jawaban) FROM stdin;
    public          postgres    false    464   ��	      �          0    27262    risk_control_efektifitas_files 
   TABLE DATA           �   COPY public.risk_control_efektifitas_files (id_control_efektifitas_files, client_name, file_name, file_type, file_size, id_control, id_efektifitas, jenis) FROM stdin;
    public          postgres    false    466   ��	      �          0    27273    risk_control_risiko 
   TABLE DATA           D   COPY public.risk_control_risiko (id_risiko, id_control) FROM stdin;
    public          postgres    false    467   ��	                0    27279    risk_dampak 
   TABLE DATA           �   COPY public.risk_dampak (id_risk_dampak, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    469   ��	                0    27287    risk_dampak_risiko 
   TABLE DATA           G   COPY public.risk_dampak_risiko (id_risiko, id_risk_dampak) FROM stdin;
    public          postgres    false    470   ��	                0    27293    risk_high_info 
   TABLE DATA           M   COPY public.risk_high_info (id_risiko, keterangan, created_date) FROM stdin;
    public          postgres    false    472   �	                0    27301    risk_integrasi_internal 
   TABLE DATA           E   COPY public.risk_integrasi_internal (id_risiko, id_unit) FROM stdin;
    public          postgres    false    473   8�	                0    27307    risk_kegiatan 
   TABLE DATA             COPY public.risk_kegiatan (id_kegiatan, nama, deskripsi, created_date, modified_date, created_by, modified_by, id_sasaran, id_parent_kegiatan, kpi_deskripsi, kpi, owner, id_risk_taksonomi_objective, id_scorecard, tujuan_kegiatan, keselarasan, target_sasaran) FROM stdin;
    public          postgres    false    475   U�	                0    27315    risk_kegiatan_kpi 
   TABLE DATA           @   COPY public.risk_kegiatan_kpi (id_kegiatan, id_kpi) FROM stdin;
    public          postgres    false    476   r�	      
          0    27322    risk_kesimpulan 
   TABLE DATA           �   COPY public.risk_kesimpulan (id_kajian_risiko, created_date, keterangan, id_scorecard, tahun, status, id_kesimpulan) FROM stdin;
    public          postgres    false    478   ��	                0    27331    risk_kolom_laporan 
   TABLE DATA           R   COPY public.risk_kolom_laporan (id_kolom_laporan, nama, kolom, judul) FROM stdin;
    public          postgres    false    480   ��	                0    27339    risk_konteks 
   TABLE DATA           �   COPY public.risk_konteks (id_konteks, nama, deskripsi, strength, weakness, opportunity, threat, created_date, modified_date, created_by, modified_by, konteks_internal, konteks_eksternal, tgl_mulai_efektif, tgl_akhir_efektif, id_owner_sso) FROM stdin;
    public          postgres    false    481   ��	                0    27346    risk_konteks_stakeholder 
   TABLE DATA           N   COPY public.risk_konteks_stakeholder (id_stakeholder, id_konteks) FROM stdin;
    public          postgres    false    482   ��	                0    27353    risk_kpi 
   TABLE DATA           0   COPY public.risk_kpi (id_kpi, nama) FROM stdin;
    public          postgres    false    484   �	                0    27360    risk_kri 
   TABLE DATA           �   COPY public.risk_kri (id_kri, nama, id_risiko, satuan, target_mulai, target_sampai, keterangan, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, polaritas, batas_bawah, batas_atas) FROM stdin;
    public          postgres    false    486    �	                0    27370    risk_kri_hasil 
   TABLE DATA           �   COPY public.risk_kri_hasil (id_kri_hasil, nilai, id_kri, id_periode_tw, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, target_mulai, target_sampai, batas_atas, batas_bawah, tahun, bulan) FROM stdin;
    public          postgres    false    488   =�	                0    27378    risk_log 
   TABLE DATA           v   COPY public.risk_log (id_risiko, deskripsi, created_by, group_id, id_scorecard, activity_time, user_name) FROM stdin;
    public          postgres    false    489   Z�	                0    27387    risk_mitigasi 
   TABLE DATA           ~  COPY public.risk_mitigasi (id_mitigasi, nama, deskripsi, start_date, dead_line, end_date, id_risiko, id_status_progress, menurunkan_dampak_kemungkinan, biaya, revenue, is_efektif, progress_capaian_kinerja, hambatan_kendala, penyesuaian_tindakan_mitigasi, created_date, modified_date, created_by, modified_by, cba, is_control, penanggung_jawab, status_konfirmasi, is_lock, id_mitigasi_sebelum, rekomendasi_keterangan, rekomendasi_is_verified, rekomendasi_nid, rekomendasi_date, rekomendasi_jabatan, rekomendasi_group, review_nid, review_date, id_jabatan, review_jabatan, review_group, review_is_verified, no, review_kepatuhan, interdependent_delegasi, status_progress, id_pengukuran, remark, program_kerja, rencana, realisasi, devisiasi, satuan, anggaran, rab, target_penyelesaian, tujuan, integrasi_eksternal, id_prioritas, nomor, sasaran, start_date_realisasi, end_date_realisasi) FROM stdin;
    public          postgres    false    491   w�	                0    27408    risk_mitigasi_efektif 
   TABLE DATA           �   COPY public.risk_mitigasi_efektif (id_mitigasi_efektif, id_mitigasi, id_pengukuran, created_date, id_periode_tw, tahun) FROM stdin;
    public          postgres    false    493   ��	                0    27417    risk_mitigasi_efektif_m 
   TABLE DATA           �   COPY public.risk_mitigasi_efektif_m (id_mitigasi_efektif, id_efektif_m, created_date, modified_date, created_by, modified_by, keterangan, id_efektif_m_jawaban) FROM stdin;
    public          postgres    false    494   ��	                0    27427    risk_mitigasi_files 
   TABLE DATA           �   COPY public.risk_mitigasi_files (id_mitigasi_files, client_name, file_name, file_type, file_size, id_mitigasi, jenis, id_mitigasi_progress) FROM stdin;
    public          postgres    false    496   ��	                0    27437     risk_mitigasi_integrasi_internal 
   TABLE DATA           P   COPY public.risk_mitigasi_integrasi_internal (id_risiko, id_subbid) FROM stdin;
    public          postgres    false    497   ��	                0    27441    risk_mitigasi_program 
   TABLE DATA             COPY public.risk_mitigasi_program (id_mitigasi_program, nama, start_date, end_date, id_mitigasi, biaya, created_date, modified_date, created_by, modified_by, penanggung_jawab, no, id_risiko, penanganan_pencegahan, tgl_penyelesaiaan, sumber_daya) FROM stdin;
    public          postgres    false    498   �	                0    27450    risk_mitigasi_program_evaluasi 
   TABLE DATA           �   COPY public.risk_mitigasi_program_evaluasi (id_mitigasi_program_evaluasi, progress, created_date, modified_date, created_by, modified_by, id_mitigasi_program, id_periode_tw) FROM stdin;
    public          postgres    false    499   %�	      !          0    27457    risk_mitigasi_progress 
   TABLE DATA           6  COPY public.risk_mitigasi_progress (id_mitigasi_progress, status_progress, id_periode_tw, id_mitigasi, create_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, tahun, remark, status_mitigasi, bulan, id_risiko, start_date_realisasi, end_date_realisasi, id_pengukuran) FROM stdin;
    public          postgres    false    501   B�	      "          0    27468    risk_mitigasi_risiko 
   TABLE DATA           R   COPY public.risk_mitigasi_risiko (id_risiko, id_mitigasi, keterangan) FROM stdin;
    public          postgres    false    502   _�	      $          0    27476    risk_msg 
   TABLE DATA           /   COPY public.risk_msg (id_msg, msg) FROM stdin;
    public          postgres    false    504   |�	      %          0    27484    risk_msg_penerima 
   TABLE DATA           E   COPY public.risk_msg_penerima (id_msg, is_read, id_user) FROM stdin;
    public          postgres    false    505   ��	      '          0    27491    risk_penyebab 
   TABLE DATA           �   COPY public.risk_penyebab (id_risk_penyebab, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    507   ��	      )          0    27500    risk_review 
   TABLE DATA           �   COPY public.risk_review (id_review, review, id_risiko, created_date, modified_date, created_by, modified_by, group_id) FROM stdin;
    public          postgres    false    509   ��	      +          0    27511    risk_risiko 
   TABLE DATA           �  COPY public.risk_risiko (id_risiko, nomor, nama, deskripsi, inheren_dampak, inheren_kemungkinan, control_dampak_penurunan, control_kemungkinan_penurunan, penyebab, dampak, id_scorecard, id_status_pengajuan, id_kegiatan, residual_target_dampak, residual_target_kemungkinan, created_date, modified_date, created_by, modified_by, residual_dampak_evaluasi, residual_kemungkinan_evaluasi, current_risk, id_sasaran, current_risk_dampak, current_risk_kemungkinan, id_kriteria_dampak, progress_capaian_kinerja, hambatan_kendala, penyesuaian_tindakan_mitigasi, progress_capaian_sasaran, status_risiko, status_keterangan, is_lock, tgl_risiko, id_risiko_sebelum, tgl_close, nomor_asli, id_kriteria_kemungkinan, urutan, id_aktifitas, nama_aktifitas, kode_aktifitas, rekomendasi_keterangan, rekomendasi_is_verified, rekomendasi_nid, rekomendasi_date, rekomendasi_jabatan, rekomendasi_group, review_nid, review_date, review_jabatan, id_jabatan, review_group, review_is_verified, no, review_kepatuhan, id_taksonomi, id_kategori, sub_tahapan_kegiatan, id_fraud_kategori, id_fraud_jenis, skor_inheren_dampak, skor_inheren_kemungkinan, skor_control_dampak, skor_control_kemungkinan, skor_target_dampak, skor_target_kemungkinan, skor_current_dampak, skor_current_kemungkinan, regulasi, id_risiko_parent, nama_kegiatan, id_risiko_parent_lain, red_flag, id_kpi, sasaran, id_taksonomi_area, pengendalian_risiko_berjalan, target_penyelesaian, anggaran_biaya, id_interval_anggaran, dampak_kuantitatif_inheren, dampak_kuantitatif_current, dampak_kuantitatif_residual, hasil_mitigasi_terhadap_sasaran, is_monitoring_rmtik, is_monitoring_p2k3, is_monitoring_fkap, ket_monitoring_rmtik, ket_monitoring_p2k3, ket_monitoring_fkap, is_evaluasi_mitigasi, is_evaluasi_risiko, id_mig, id_taksonomi_objective, kuantifikasi, hasil_thdp_perusahaan, is_capability, is_accept, benefit_potential, dampak_kuantitatif_target, id_owner_sso, is_rutin, is_opp_inherent, is_opp_current, is_opp_target, is_opp_evaluasi, is_signifikan_inherent, is_signifikan_current, is_signifikan_evaluasi, id_aspek_lingkungan, id_risk_penyebab, id_risk_dampak, integrasi_eksternal, id_prioritas, id_kategori_proyek, id_proyek_terkait, proyek_terkait, response, selera_dampak, selera_kemungkinan) FROM stdin;
    public          postgres    false    511   ��	      -          0    27551    risk_risiko_current 
   TABLE DATA           ?  COPY public.risk_risiko_current (id_risiko, id_kemungkinan, id_dampak, skor_kemungkinan, skor_dampak, id_risiko_current, id_periode_tw, progress_capaian_kinerja, progress_capaian_sasaran, penyesuaian_tindakan_mitigasi, hambatan_kendala, tahun, is_opp, is_signifikan, bulan, hasil_mitigasi_terhadap_sasaran) FROM stdin;
    public          postgres    false    513   �	      .          0    27563    risk_risiko_dampak 
   TABLE DATA           G   COPY public.risk_risiko_dampak (id_risiko, id_risk_dampak) FROM stdin;
    public          postgres    false    514   *�	      0          0    27569    risk_risiko_files 
   TABLE DATA           |   COPY public.risk_risiko_files (id_risiko_files, client_name, file_name, file_type, file_size, id_risiko, jenis) FROM stdin;
    public          postgres    false    516   G�	      1          0    27577    risk_risiko_history 
   TABLE DATA           �   COPY public.risk_risiko_history (id_risiko, tgl_close, created_date, modified_date, created_by, modified_by, jenis_close, content) FROM stdin;
    public          postgres    false    517   d�	      2          0    27585    risk_risiko_kpi 
   TABLE DATA           <   COPY public.risk_risiko_kpi (id_risiko, id_kpi) FROM stdin;
    public          postgres    false    518   ��	      3          0    27591    risk_risiko_penyebab 
   TABLE DATA           K   COPY public.risk_risiko_penyebab (id_risiko, id_risk_penyebab) FROM stdin;
    public          postgres    false    519   ��	      4          0    27596    risk_risiko_proyek_terkait 
   TABLE DATA           M   COPY public.risk_risiko_proyek_terkait (id_risiko, id_scorecard) FROM stdin;
    public          postgres    false    520   ��	      5          0    27601    risk_risiko_unit 
   TABLE DATA           E   COPY public.risk_risiko_unit (id_risiko_unit, id_risiko) FROM stdin;
    public          postgres    false    521   ��	      7          0    27608    risk_sasaran 
   TABLE DATA           �   COPY public.risk_sasaran (id_sasaran, nama, id_sasaran_parent, kpi_deskripsi, kpi, kelompok, kategori, kode, tgl_mulai_efektif, tgl_akhir_efektif, created_date, modified_date, is_kegiatan) FROM stdin;
    public          postgres    false    523   ��	      8          0    27618    risk_sasaran_kpi 
   TABLE DATA           >   COPY public.risk_sasaran_kpi (id_sasaran, id_kpi) FROM stdin;
    public          postgres    false    524   �	      9          0    27624    risk_sasaran_pic 
   TABLE DATA           B   COPY public.risk_sasaran_pic (id_sasaran, id_jabatan) FROM stdin;
    public          postgres    false    525   /�	      ;          0    27631    risk_scorecard 
   TABLE DATA           �  COPY public.risk_scorecard (id_scorecard, nama, scope, id_visi_misi, created_date, modified_date, created_by, modified_by, id_kajian_risiko, id_unit, tgl_mulai_efektif, tgl_akhir_efektif, owner, id_struktur, id_parent_scorecard, navigasi, open_evaluasi, id_nama_proses, is_info, template_laporan, proses, id_tingkat_agregasi_risiko, id_temp, is_kegiatan, kode, id_status_pengajuan, is_evaluasi_mitigasi, is_evaluasi_risiko, id_konteks, rutin_non_rutin, jenis_proyek, id_sasaran_proyek, biaya_proyek, tgl_mulai, tgl_selesai, nama_user, id_user, nama_jabatan_user, id_jabatan_user, nama_owner, id_owner, nama_jabatan_owner, id_jabatan_owner, nama_upmr, id_upmr, nama_jabatan_upmr, id_jabatan_upmr) FROM stdin;
    public          postgres    false    527   L�	      =          0    27653    risk_scorecard_files 
   TABLE DATA           �   COPY public.risk_scorecard_files (id_scorecard_files, client_name, file_name, file_type, file_size, id_scorecard, jenis) FROM stdin;
    public          postgres    false    529   i�	      >          0    27663    risk_scorecard_user 
   TABLE DATA           G   COPY public.risk_scorecard_user (id_scorecard, id_jabatan) FROM stdin;
    public          postgres    false    530   ��	      ?          0    27669    risk_scorecard_view 
   TABLE DATA           G   COPY public.risk_scorecard_view (id_jabatan, id_scorecard) FROM stdin;
    public          postgres    false    531   ��	      A          0    27676    risk_strategi_map 
   TABLE DATA           b   COPY public.risk_strategi_map (id_strategi_map, tgl_mulai_efektif, tgl_akhir_efektif) FROM stdin;
    public          postgres    false    533   ��	      C          0    27683 	   risk_task 
   TABLE DATA             COPY public.risk_task (id_task, page, dari, deskripsi, id_scorecard, id_risiko, id_control, id_mitigasi, id_kegiatan, id_status_pengajuan, created_date, modified_date, created_by, modified_by, group_id, status, untuk, is_pending, url, id_scorecard_peluang, id_pemeriksaan) FROM stdin;
    public          postgres    false    535   ��	      D          0    27702    risk_var 
   TABLE DATA           N   COPY public.risk_var (id_risiko, tahun, target, realisasi, jenis) FROM stdin;
    public          postgres    false    536   ��	      F          0    27708    risk_visi_misi 
   TABLE DATA           �   COPY public.risk_visi_misi (id_visi_misi, visi, misi, strength, weakness, opportunity, threat, created_date, modified_date, created_by, modified_by, konteks_internal, konteks_eksternal, tgl_mulai_efektif, tgl_akhir_efektif) FROM stdin;
    public          postgres    false    538   �	      H          0    27717    rtm 
   TABLE DATA           �   COPY public.rtm (id_rtm, rtm_ke, tingkat, rkt, tahun, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    540   4�	      J          0    27725 	   rtm_files 
   TABLE DATA           n   COPY public.rtm_files (id_rtm_files, client_name, file_name, file_type, file_size, id_rtm, jenis) FROM stdin;
    public          postgres    false    542   Q�	      L          0    27736    rtm_progress 
   TABLE DATA           �   COPY public.rtm_progress (id_rtm_progress, target, realisasi, competitor, tahun, id_rtm_uraian, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    544   n�	      N          0    27744 
   rtm_uraian 
   TABLE DATA           z  COPY public.rtm_uraian (id_rtm_uraian, uraian, analisis, uraian_rencana, uraian_target, keterangan_pic, status, tindak_lanjut, tindak_lanjut_rencana_penyelesaian, tindak_lanjut_realisasi_penyelesaian, id_jenis_rtm, id_jenis_rtm_parent, is_risalah, created_date, modified_date, created_by, modified_by, created_by_desc, is_tindak_lanjut, is_grafik, modified_by_desc) FROM stdin;
    public          postgres    false    546   ��	      P          0    27756    rtm_uraian_files 
   TABLE DATA           �   COPY public.rtm_uraian_files (id_rtm_uraian_files, client_name, file_name, file_type, file_size, id_rtm_uraian, jenis, rtm_uraian_filescol, id_rtm) FROM stdin;
    public          postgres    false    548   ��	      Q          0    27767    rtm_uraian_link 
   TABLE DATA           �   COPY public.rtm_uraian_link (id_rtm_uraian, id_rtm, status, tindak_lanjut, tindak_lanjut_rencana_penyelesaian, tindak_lanjut_realisasi_penyelesaian, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    549   ��	      R          0    27775    rtm_urian_unit 
   TABLE DATA           @   COPY public.rtm_urian_unit (id_unit, id_rtm_uraian) FROM stdin;
    public          postgres    false    550   ��	      T          0    27782    spi_audit_evaluasi 
   TABLE DATA           #  COPY public.spi_audit_evaluasi (id_audit_evaluasi, tanggal, nomor, lampiran, hal, simpulan, saran, dasar_tugas, dasar_evaluasi, cakupan_evaluasi, informasi_umum, hasil_evaluasi, id_manajer, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    552   ��	      V          0    27791    spi_hasil_monitoring 
   TABLE DATA             COPY public.spi_hasil_monitoring (id_monitoring, kepada, dari, tanggal, nomor, perihal, dasar_tugas, dasar_hukum, data_fakta, pembahasan, kesimpulan, id_penyusun, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    554   �	      X          0    27800    spi_library 
   TABLE DATA           �   COPY public.spi_library (id_dokumen, nomor_dokumen, tanggal_dokumen, judul_dokumen, id_kategori_dokumen, kategori_dokumen, sumber_dokumen, uraian_dokumen, id_file) FROM stdin;
    public          postgres    false    556   9�	      Z          0    27809    spi_library_files 
   TABLE DATA           �   COPY public.spi_library_files (id_dokumen_files, client_name, file_name, file_type, file_size, id_dokumen, jenis, url, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc) FROM stdin;
    public          postgres    false    558   V�	      \          0    27819    spi_notulen 
   TABLE DATA           B  COPY public.spi_notulen (id_notulen, nama_rapat, tanggal_rapat, waktu_rapat, tempat_rapat, acara, pimpinan_rapat, notulis, id_peserta_rapat, kegiatan_rapat, pembukaan, pembahasan, penutup, kesimpulan, created_date, created_by_desc, modified_by_desc, modified_date, created_by, modified_by, id_jabatan_notulis) FROM stdin;
    public          postgres    false    560   s�	      ^          0    27828    spi_notulen_acara 
   TABLE DATA           H   COPY public.spi_notulen_acara (id_acara, id_notulen, acara) FROM stdin;
    public          postgres    false    562   ��	      `          0    27835    spi_notulen_peserta 
   TABLE DATA           K   COPY public.spi_notulen_peserta (id_peserta, nama, id_notulen) FROM stdin;
    public          postgres    false    564   ��	      b          0    27842    spi_program_audit 
   TABLE DATA           9  COPY public.spi_program_audit (id_program_audit, nama_audit, id_risiko, sarana_kendaraan, sarana_lainnya, dana_sppd, dana_lainnya, lain_lain, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, jenis_audit, frekuensi_audit, minggu_mulai, minggu_selesai, tahun, id_jabatan_penyesusun, id_jabatan_pereview, jabatan_penyesusun, nama_jabatan_penyusun, jabatan_pereview, nama_jabatan_pereview, nama_penyusun, nama_pereview, id_penanggung_jawab, nama_penanggung_jawab, nama_jabatan_penanggung_jawab, id_penyusun, id_pereview) FROM stdin;
    public          postgres    false    566   ��	      c          0    27851    spi_program_audit_jabatan 
   TABLE DATA           u   COPY public.spi_program_audit_jabatan (id_program_audit, id_jabatan, nama, nama_jabatan, peran, user_id) FROM stdin;
    public          postgres    false    567   ��	      e          0    27855    spi_program_audit_tahun 
   TABLE DATA           }   COPY public.spi_program_audit_tahun (id_program_audit, nama_audit, id_risk_risiko, frekuensi_audit, jenis_audit) FROM stdin;
    public          postgres    false    569   �	      g          0    27862    spi_rekap_consulting 
   TABLE DATA           '  COPY public.spi_rekap_consulting (id_konsultasi, id_msg, tanggal, jabatan, waktu_mulai, waktu_selesai, contact_person, nomor_telpon, uraian_layanan, pendapat_spi, dokumen_disampaikan, pengawas, keterangan, rating, created_date, modified_date, created_by, modified_by, id_unit_kerja) FROM stdin;
    public          postgres    false    571   !�	      i          0    27871    spi_rka 
   TABLE DATA           o   COPY public.spi_rka (id_rka, id_kpi, polaritas_minimal, polaritas_maksimal, nialai, satuan, tahun) FROM stdin;
    public          postgres    false    573   >�	      k          0    27878    spi_sasaran 
   TABLE DATA           �   COPY public.spi_sasaran (id_sasaran, sasaran, id_jabatan, misi, keterangan, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, tahun) FROM stdin;
    public          postgres    false    575   [�	      l          0    27886    temp_pegawai 
   TABLE DATA           �   COPY public.temp_pegawai (id_jabatan, nama_jabatan, nik, nama, nama_unitkerja, nama_sub_unitkerja, nama_bidang, nama_subbidang, seksi, id_unitkerja, id_subunitkerja, id_bidang, id_subbidang, id_seksi) FROM stdin;
    public          postgres    false    576   x�	      n          0    27892    template 
   TABLE DATA           �   COPY public.template (id_template, no_template, nama, created_date, modified_date, created_by, modified_by, created_by_desc, modified_by_desc, client_name, file_name, file_type, file_size, file_url, id_mig) FROM stdin;
    public          postgres    false    578   ��	      o          0    27900    tr_kategori_arsip_spi 
   TABLE DATA           H   COPY public.tr_kategori_arsip_spi (id, nama_kategori_arsip) FROM stdin;
    public          postgres    false    579   ��	      
           0    0 $   comp_kebutuhan_id_comp_kebutuhan_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.comp_kebutuhan_id_comp_kebutuhan_seq', 1, false);
          public          postgres    false    215                       0    0 0   comp_penilaian_files_id_comp_penilaian_files_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.comp_penilaian_files_id_comp_penilaian_files_seq', 1, false);
          public          postgres    false    219                       0    0 $   comp_penilaian_id_comp_penilaian_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.comp_penilaian_id_comp_penilaian_seq', 1, false);
          public          postgres    false    217                       0    0    contents_id_contents_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.contents_id_contents_seq', 1, false);
          public          postgres    false    221                       0    0 "   dokumen_files_id_dokumen_files_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.dokumen_files_id_dokumen_files_seq', 1, false);
          public          postgres    false    225                       0    0    dokumen_id_dokumen_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_id_dokumen_seq', 1, false);
          public          postgres    false    223                       0    0 "   dokumen_versi_id_dokumen_versi_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.dokumen_versi_id_dokumen_versi_seq', 1, false);
          public          postgres    false    230                       0    0    kpi_id_kpi_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.kpi_id_kpi_seq', 1, false);
          public          postgres    false    232                       0    0    kpi_individu_id_kpi_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.kpi_individu_id_kpi_seq', 1, false);
          public          postgres    false    235                       0    0 .   kpi_target_evaluasi_id_kpi_target_evaluasi_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.kpi_target_evaluasi_id_kpi_target_evaluasi_seq', 1, false);
          public          postgres    false    239                       0    0 (   kpi_target_files_id_kpi_target_files_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.kpi_target_files_id_kpi_target_files_seq', 1, false);
          public          postgres    false    241                       0    0    kpi_target_id_kpi_target_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.kpi_target_id_kpi_target_seq', 1, false);
          public          postgres    false    237                       0    0 0   kpi_target_realisasi_id_kpi_target_realisasi_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.kpi_target_realisasi_id_kpi_target_realisasi_seq', 1, false);
          public          postgres    false    243                       0    0 .   lost_incident_files_id_lost_incident_files_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.lost_incident_files_id_lost_incident_files_seq', 1, false);
          public          postgres    false    247                       0    0 (   lost_incident_follow_up_id_follow_up_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.lost_incident_follow_up_id_follow_up_seq', 1, false);
          public          postgres    false    249                       0    0 -   lost_incident_fu_files_id_follow_up_files_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.lost_incident_fu_files_id_follow_up_files_seq', 1, false);
          public          postgres    false    251                       0    0 1   lost_incident_fu_p_files_id_follow_up_p_files_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.lost_incident_fu_p_files_id_follow_up_p_files_seq', 1, false);
          public          postgres    false    253                       0    0 ,   lost_incident_fu_progress_id_fu_progress_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.lost_incident_fu_progress_id_fu_progress_seq', 1, false);
          public          postgres    false    255                       0    0 "   lost_incident_id_lost_incident_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.lost_incident_id_lost_incident_seq', 1, false);
          public          postgres    false    245                       0    0 +   mt_aspek_lingkungan_id_aspek_lingkungan_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_aspek_lingkungan_id_aspek_lingkungan_seq', 1, false);
          public          postgres    false    257                       0    0 /   mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.mt_bidang_pemeriksaan_id_bidang_pemeriksaan_seq', 1, false);
          public          postgres    false    259                       0    0    mt_interval_id_interval_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_interval_id_interval_seq', 1, false);
          public          postgres    false    261                        0    0 5   mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.mt_jenis_audit_eksternal_id_jenis_audit_eksternal_seq', 1, false);
          public          postgres    false    263            !           0    0 %   mt_jenis_dokumen_id_jenis_dokumen_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.mt_jenis_dokumen_id_jenis_dokumen_seq', 1, false);
          public          postgres    false    265            "           0    0    mt_jenis_rtm_id_jenis_rtm_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_jenis_rtm_id_jenis_rtm_seq', 1, false);
          public          postgres    false    267            #           0    0    mt_kategori_id_kategori_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_kategori_id_kategori_seq', 1, false);
          public          postgres    false    269            $           0    0 '   mt_kategori_jenis_id_kategori_jenis_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.mt_kategori_jenis_id_kategori_jenis_seq', 1, false);
          public          postgres    false    271            %           0    0 (   mt_kategori_kpi_individu_id_kategori_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.mt_kategori_kpi_individu_id_kategori_seq', 1, false);
          public          postgres    false    273            &           0    0    mt_kriteria_id_kriteria_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_kriteria_id_kriteria_seq', 1, false);
          public          postgres    false    275            '           0    0 "   mt_message_template_id_message_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_message_template_id_message_seq', 1, false);
          public          postgres    false    279            (           0    0    mt_opp_dampak_id_dampak_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_opp_dampak_id_dampak_seq', 1, false);
          public          postgres    false    281            )           0    0 !   mt_opp_kelayakan_id_kelayakan_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.mt_opp_kelayakan_id_kelayakan_seq', 1, false);
          public          postgres    false    283            *           0    0 %   mt_opp_kemungkinan_id_kemungkinan_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.mt_opp_kemungkinan_id_kemungkinan_seq', 1, false);
          public          postgres    false    285            +           0    0 -   mt_opp_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.mt_opp_kriteria_dampak_id_kriteria_dampak_seq', 1, false);
          public          postgres    false    287            ,           0    0    mt_opp_tingkat_id_tingkat_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_opp_tingkat_id_tingkat_seq', 1, false);
          public          postgres    false    291            -           0    0    mt_pb_kategori_id_kategori_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mt_pb_kategori_id_kategori_seq', 1, false);
          public          postgres    false    293            .           0    0 ,   mt_pb_kelompok_proses_id_kelompok_proses_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.mt_pb_kelompok_proses_id_kelompok_proses_seq', 1, false);
          public          postgres    false    295            /           0    0 $   mt_pb_nama_proses_id_nama_proses_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.mt_pb_nama_proses_id_nama_proses_seq', 1, false);
          public          postgres    false    297            0           0    0 )   mt_pemeriksaan_checklist_id_checklist_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.mt_pemeriksaan_checklist_id_checklist_seq', 1, false);
          public          postgres    false    299            1           0    0 +   mt_pemeriksaan_jenis_akomodasi_id_jenis_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_pemeriksaan_jenis_akomodasi_id_jenis_seq', 1, false);
          public          postgres    false    301            2           0    0    mt_pemeriksaan_kka_id_kka_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_pemeriksaan_kka_id_kka_seq', 1, false);
          public          postgres    false    303            3           0    0    mt_periode_tw_id_periode_tw_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mt_periode_tw_id_periode_tw_seq', 1, false);
          public          postgres    false    305            4           0    0    mt_ppd_id_ppd_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.mt_ppd_id_ppd_seq', 1, false);
          public          postgres    false    307            5           0    0    mt_rating_spi_id_rating_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_rating_spi_id_rating_seq', 1, false);
          public          postgres    false    310            6           0    0    mt_risk_dampak_id_dampak_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.mt_risk_dampak_id_dampak_seq', 1, false);
          public          postgres    false    312            7           0    0 "   mt_risk_efektif_m_id_efektif_m_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_risk_efektif_m_id_efektif_m_seq', 1, false);
          public          postgres    false    314            8           0    0 2   mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.mt_risk_efektif_m_jawaban_id_efektif_m_jawaban_seq', 1, false);
          public          postgres    false    317            9           0    0 .   mt_risk_efektif_m_pengukuran_id_pengukuran_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_efektif_m_pengukuran_id_pengukuran_seq', 1, false);
          public          postgres    false    319            :           0    0 &   mt_risk_efektifitas_id_efektifitas_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.mt_risk_efektifitas_id_efektifitas_seq', 1, false);
          public          postgres    false    321            ;           0    0 6   mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.mt_risk_efektifitas_jawaban_id_efektifitas_jawaban_seq', 1, false);
          public          postgres    false    324            <           0    0 0   mt_risk_efektifitas_pengukuran_id_pengukuran_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.mt_risk_efektifitas_pengukuran_id_pengukuran_seq', 1, false);
          public          postgres    false    326            =           0    0 &   mt_risk_kemungkinan_id_kemungkinan_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.mt_risk_kemungkinan_id_kemungkinan_seq', 1, false);
          public          postgres    false    328            >           0    0 .   mt_risk_kriteria_dampak_id_kriteria_dampak_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mt_risk_kriteria_dampak_id_kriteria_dampak_seq', 1, false);
          public          postgres    false    330            ?           0    0 ,   mt_risk_taksonomi_area_id_taksonomi_area_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.mt_risk_taksonomi_area_id_taksonomi_area_seq', 1, false);
          public          postgres    false    337            @           0    0 "   mt_risk_taksonomi_id_taksonomi_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mt_risk_taksonomi_id_taksonomi_seq', 1, false);
          public          postgres    false    334            A           0    0 6   mt_risk_taksonomi_objective_id_taksonomi_objective_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.mt_risk_taksonomi_objective_id_taksonomi_objective_seq', 1, false);
          public          postgres    false    339            B           0    0    mt_risk_tingkat_id_tingkat_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mt_risk_tingkat_id_tingkat_seq', 1, false);
          public          postgres    false    341            C           0    0    mt_sdm_jabatan_id_jabatan_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_sdm_jabatan_id_jabatan_seq', 1, false);
          public          postgres    false    344            D           0    0    mt_sdm_level_id_sdm_level_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mt_sdm_level_id_sdm_level_seq', 1, false);
          public          postgres    false    348            E           0    0    mt_sdm_struktur_id_struktur_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mt_sdm_struktur_id_struktur_seq', 1, false);
          public          postgres    false    351            F           0    0    mt_sdm_sub_unit_id_sub_unit_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mt_sdm_sub_unit_id_sub_unit_seq', 1, false);
          public          postgres    false    354            G           0    0 /   mt_status_pemeriksaan_id_status_pemeriksaan_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.mt_status_pemeriksaan_id_status_pemeriksaan_seq', 1, false);
          public          postgres    false    360            H           0    0 +   mt_status_pengajuan_id_status_pengajuan_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_status_pengajuan_id_status_pengajuan_seq', 1, false);
          public          postgres    false    362            I           0    0 +   mt_status_penilaian_id_status_penilaian_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.mt_status_penilaian_id_status_penilaian_seq', 1, false);
          public          postgres    false    364            J           0    0 )   mt_status_progress_id_status_progress_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.mt_status_progress_id_status_progress_seq', 1, false);
          public          postgres    false    366            K           0    0    mt_target_kpi_id_target_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mt_target_kpi_id_target_seq', 1, false);
          public          postgres    false    368            L           0    0 9   mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.mt_tingkat_agregasi_risiko_id_tingkat_agregasi_risiko_seq', 1, false);
          public          postgres    false    370            M           0    0 &   opp_kolom_laporan_id_kolom_laporan_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.opp_kolom_laporan_id_kolom_laporan_seq', 1, false);
          public          postgres    false    372            N           0    0 &   opp_peluang_files_id_peluang_files_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.opp_peluang_files_id_peluang_files_seq', 1, false);
          public          postgres    false    377            O           0    0    opp_peluang_id_peluang_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.opp_peluang_id_peluang_seq', 1, false);
          public          postgres    false    375            P           0    0 *   opp_scorecard_files_id_scorecard_files_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.opp_scorecard_files_id_scorecard_files_seq', 1, false);
          public          postgres    false    383            Q           0    0    opp_scorecard_id_scorecard_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.opp_scorecard_id_scorecard_seq', 1, false);
          public          postgres    false    381            R           0    0 <   pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.pemeriksaan_anggaran_biaya_id_pemeriksaan_anggaran_biaya_seq', 1, false);
          public          postgres    false    389            S           0    0 2   pemeriksaan_checklist_id_pemeriksaan_checklist_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.pemeriksaan_checklist_id_pemeriksaan_checklist_seq', 1, false);
          public          postgres    false    391            T           0    0 ,   pemeriksaan_detail_id_pemeriksaan_detail_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.pemeriksaan_detail_id_pemeriksaan_detail_seq', 1, false);
          public          postgres    false    393            U           0    0 6   pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.pemeriksaan_dokumen_eksternal_id_dokumen_aksternal_seq', 1, false);
          public          postgres    false    395            V           0    0    pemeriksaan_id_pemeriksaan_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pemeriksaan_id_pemeriksaan_seq', 1, false);
          public          postgres    false    387            W           0    0 4   pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.pemeriksaan_peminjaman_id_pemeriksaan_peminjaman_seq', 1, false);
          public          postgres    false    397            X           0    0 4   pemeriksaan_review_supervisi_id_review_supervisi_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.pemeriksaan_review_supervisi_id_review_supervisi_seq', 1, false);
          public          postgres    false    399            Y           0    0    pemeriksaan_spn_id_spn_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pemeriksaan_spn_id_spn_seq', 1, false);
          public          postgres    false    401            Z           0    0 &   pemeriksaan_spn_petugas_id_petugas_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.pemeriksaan_spn_petugas_id_petugas_seq', 1, false);
          public          postgres    false    403            [           0    0 <   pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.pemeriksaan_temuan_diskusi_id_pemeriksaan_temuan_diskusi_seq', 1, false);
          public          postgres    false    407            \           0    0 8   pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.pemeriksaan_temuan_files_id_pemeriksaan_temuan_files_seq', 1, false);
          public          postgres    false    409            ]           0    0 ,   pemeriksaan_temuan_id_pemeriksaan_temuan_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.pemeriksaan_temuan_id_pemeriksaan_temuan_seq', 1, false);
          public          postgres    false    405            ^           0    0 8   pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.pemeriksaan_temuan_saran_id_pemeriksaan_temuan_saran_seq', 1, false);
          public          postgres    false    411            _           0    0 &   pemeriksaan_tim_id_pemeriksaan_tim_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.pemeriksaan_tim_id_pemeriksaan_tim_seq', 1, false);
          public          postgres    false    413            `           0    0 ?   pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.pemeriksaan_tindak_lanjut_fil_id_pemeriksaan_tindak_lanjut__seq', 1, false);
          public          postgres    false    417            a           0    0 :   pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('public.pemeriksaan_tindak_lanjut_id_pemeriksaan_tindak_lanjut_seq', 1, false);
          public          postgres    false    415            b           0    0 (   penilaian_detail_id_penilaian_detail_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.penilaian_detail_id_penilaian_detail_seq', 1, false);
          public          postgres    false    422            c           0    0 &   penilaian_files_id_penilaian_files_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.penilaian_files_id_penilaian_files_seq', 1, false);
          public          postgres    false    425            d           0    0    penilaian_id_penilaian_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.penilaian_id_penilaian_seq', 1, false);
          public          postgres    false    420            e           0    0 ,   penilaian_komentar_id_penilaian_komentar_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.penilaian_komentar_id_penilaian_komentar_seq', 1, false);
          public          postgres    false    427            f           0    0 *   penilaian_periode_id_penilaian_periode_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.penilaian_periode_id_penilaian_periode_seq', 1, false);
          public          postgres    false    430            g           0    0 .   penilaian_quisioner_id_penilaian_quisioner_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.penilaian_quisioner_id_penilaian_quisioner_seq', 1, false);
          public          postgres    false    432            h           0    0 *   penilaian_session_id_penilaian_session_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.penilaian_session_id_penilaian_session_seq', 1, false);
          public          postgres    false    434            i           0    0    public_sys_action_action_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.public_sys_action_action_id_seq', 1, false);
          public          postgres    false    436            j           0    0    public_sys_group_group_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.public_sys_group_group_id_seq', 1, false);
          public          postgres    false    438            k           0    0 '   public_sys_group_menu_group_menu_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.public_sys_group_menu_group_menu_id_seq', 1, false);
          public          postgres    false    441            l           0    0    public_sys_menu_menu_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.public_sys_menu_menu_id_seq', 1, false);
          public          postgres    false    444            m           0    0 !   public_sys_message_id_message_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.public_sys_message_id_message_seq', 1, false);
          public          postgres    false    446            n           0    0 +   public_sys_notification_id_notification_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.public_sys_notification_id_notification_seq', 1, false);
          public          postgres    false    449            o           0    0 ,   public_sys_setting_id_public_sys_setting_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.public_sys_setting_id_public_sys_setting_seq', 1, false);
          public          postgres    false    451            p           0    0    public_sys_user_user_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.public_sys_user_user_id_seq', 1, false);
          public          postgres    false    453            q           0    0    quisioner_id_quisioner_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.quisioner_id_quisioner_seq', 1, false);
          public          postgres    false    456            r           0    0 ?   risk_control_efektifitas_files_id_control_efektifitas_files_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.risk_control_efektifitas_files_id_control_efektifitas_files_seq', 1, false);
          public          postgres    false    465            s           0    0    risk_control_id_control_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.risk_control_id_control_seq', 1, false);
          public          postgres    false    462            t           0    0    risk_dampak_id_risk_dampak_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.risk_dampak_id_risk_dampak_seq', 1, false);
          public          postgres    false    468            u           0    0    risk_high_info_id_risiko_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.risk_high_info_id_risiko_seq', 1, false);
          public          postgres    false    471            v           0    0    risk_kegiatan_id_kegiatan_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_kegiatan_id_kegiatan_seq', 1, false);
          public          postgres    false    474            w           0    0 !   risk_kesimpulan_id_kesimpulan_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.risk_kesimpulan_id_kesimpulan_seq', 1, false);
          public          postgres    false    477            x           0    0 '   risk_kolom_laporan_id_kolom_laporan_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.risk_kolom_laporan_id_kolom_laporan_seq', 1, false);
          public          postgres    false    479            y           0    0    risk_kpi_id_kpi_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_kpi_id_kpi_seq', 1, false);
          public          postgres    false    483            z           0    0    risk_kri_hasil_id_kri_hasil_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.risk_kri_hasil_id_kri_hasil_seq', 1, false);
          public          postgres    false    487            {           0    0    risk_kri_id_kri_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_kri_id_kri_seq', 1, false);
          public          postgres    false    485            |           0    0 -   risk_mitigasi_efektif_id_mitigasi_efektif_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.risk_mitigasi_efektif_id_mitigasi_efektif_seq', 1, false);
          public          postgres    false    492            }           0    0 )   risk_mitigasi_files_id_mitigasi_files_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.risk_mitigasi_files_id_mitigasi_files_seq', 1, false);
          public          postgres    false    495            ~           0    0    risk_mitigasi_id_mitigasi_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.risk_mitigasi_id_mitigasi_seq', 1, false);
          public          postgres    false    490                       0    0 /   risk_mitigasi_progress_id_mitigasi_progress_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.risk_mitigasi_progress_id_mitigasi_progress_seq', 1, false);
          public          postgres    false    500            �           0    0    risk_msg_id_msg_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_msg_id_msg_seq', 1, false);
          public          postgres    false    503            �           0    0 "   risk_penyebab_id_risk_penyebab_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.risk_penyebab_id_risk_penyebab_seq', 1, false);
          public          postgres    false    506            �           0    0    risk_review_id_review_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.risk_review_id_review_seq', 1, false);
          public          postgres    false    508            �           0    0 )   risk_risiko_current_id_risiko_current_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.risk_risiko_current_id_risiko_current_seq', 1, false);
          public          postgres    false    512            �           0    0 %   risk_risiko_files_id_risiko_files_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.risk_risiko_files_id_risiko_files_seq', 1, false);
          public          postgres    false    515            �           0    0    risk_risiko_id_risiko_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.risk_risiko_id_risiko_seq', 1, false);
          public          postgres    false    510            �           0    0    risk_sasaran_id_sasaran_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.risk_sasaran_id_sasaran_seq', 1, false);
          public          postgres    false    522            �           0    0 +   risk_scorecard_files_id_scorecard_files_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.risk_scorecard_files_id_scorecard_files_seq', 1, false);
          public          postgres    false    528            �           0    0    risk_scorecard_id_scorecard_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.risk_scorecard_id_scorecard_seq', 1, false);
          public          postgres    false    526            �           0    0 %   risk_strategi_map_id_strategi_map_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.risk_strategi_map_id_strategi_map_seq', 1, false);
          public          postgres    false    532            �           0    0    risk_task_id_task_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.risk_task_id_task_seq', 1, false);
          public          postgres    false    534            �           0    0    risk_visi_misi_id_visi_misi_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.risk_visi_misi_id_visi_misi_seq', 1, false);
          public          postgres    false    537            �           0    0    rtm_files_id_rtm_files_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.rtm_files_id_rtm_files_seq', 1, false);
          public          postgres    false    541            �           0    0    rtm_id_rtm_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.rtm_id_rtm_seq', 1, false);
          public          postgres    false    539            �           0    0     rtm_progress_id_rtm_progress_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.rtm_progress_id_rtm_progress_seq', 1, false);
          public          postgres    false    543            �           0    0 (   rtm_uraian_files_id_rtm_uraian_files_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.rtm_uraian_files_id_rtm_uraian_files_seq', 1, false);
          public          postgres    false    547            �           0    0    rtm_uraian_id_rtm_uraian_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.rtm_uraian_id_rtm_uraian_seq', 1, false);
          public          postgres    false    545            �           0    0 (   spi_audit_evaluasi_id_audit_evaluasi_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.spi_audit_evaluasi_id_audit_evaluasi_seq', 1, false);
          public          postgres    false    551            �           0    0 &   spi_hasil_monitoring_id_monitoring_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.spi_hasil_monitoring_id_monitoring_seq', 1, false);
          public          postgres    false    553            �           0    0 &   spi_library_files_id_dokumen_files_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.spi_library_files_id_dokumen_files_seq', 1, false);
          public          postgres    false    557            �           0    0    spi_library_id_dokumen_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.spi_library_id_dokumen_seq', 1, false);
          public          postgres    false    555            �           0    0    spi_notulen_acara_id_acara_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.spi_notulen_acara_id_acara_seq', 1, false);
          public          postgres    false    561            �           0    0    spi_notulen_id_notulen_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.spi_notulen_id_notulen_seq', 1, false);
          public          postgres    false    559            �           0    0 "   spi_notulen_peserta_id_peserta_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.spi_notulen_peserta_id_peserta_seq', 1, false);
          public          postgres    false    563            �           0    0 &   spi_program_audit_id_program_audit_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.spi_program_audit_id_program_audit_seq', 1, false);
          public          postgres    false    565            �           0    0 ,   spi_program_audit_tahun_id_program_audit_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.spi_program_audit_tahun_id_program_audit_seq', 1, false);
          public          postgres    false    568            �           0    0 &   spi_rekap_consulting_id_konsultasi_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.spi_rekap_consulting_id_konsultasi_seq', 1, false);
          public          postgres    false    570            �           0    0    spi_rka_id_rka_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.spi_rka_id_rka_seq', 1, false);
          public          postgres    false    572            �           0    0    spi_sasaran_id_sasaran_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.spi_sasaran_id_sasaran_seq', 1, false);
          public          postgres    false    574            �           0    0    template_id_template_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.template_id_template_seq', 1, false);
          public          postgres    false    577            �           2606    27270 3   risk_control_efektifitas_files idx_02dafa35e3214f57 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_efektifitas_files
    ADD CONSTRAINT idx_02dafa35e3214f57 PRIMARY KEY (id_control_efektifitas_files);
 ]   ALTER TABLE ONLY public.risk_control_efektifitas_files DROP CONSTRAINT idx_02dafa35e3214f57;
       public            postgres    false    466            d           2606    26355 +   mt_opp_kriteria_dampak idx_02e12583ca9486dc 
   CONSTRAINT     y   ALTER TABLE ONLY public.mt_opp_kriteria_dampak
    ADD CONSTRAINT idx_02e12583ca9486dc PRIMARY KEY (id_kriteria_dampak);
 U   ALTER TABLE ONLY public.mt_opp_kriteria_dampak DROP CONSTRAINT idx_02e12583ca9486dc;
       public            postgres    false    288            �           2606    27319 &   risk_kegiatan_kpi idx_0535e00f7ff266d5 
   CONSTRAINT     u   ALTER TABLE ONLY public.risk_kegiatan_kpi
    ADD CONSTRAINT idx_0535e00f7ff266d5 PRIMARY KEY (id_kegiatan, id_kpi);
 P   ALTER TABLE ONLY public.risk_kegiatan_kpi DROP CONSTRAINT idx_0535e00f7ff266d5;
       public            postgres    false    476    476            �           2606    27447 *   risk_mitigasi_program idx_05614d0398412cde 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_mitigasi_program
    ADD CONSTRAINT idx_05614d0398412cde PRIMARY KEY (id_mitigasi_program);
 T   ALTER TABLE ONLY public.risk_mitigasi_program DROP CONSTRAINT idx_05614d0398412cde;
       public            postgres    false    498            �           2606    27350 -   risk_konteks_stakeholder idx_06153b769580703e 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_konteks_stakeholder
    ADD CONSTRAINT idx_06153b769580703e PRIMARY KEY (id_stakeholder, id_konteks);
 W   ALTER TABLE ONLY public.risk_konteks_stakeholder DROP CONSTRAINT idx_06153b769580703e;
       public            postgres    false    482    482            _           2606    27088 (   penilaian_quisioner idx_084c6d07131834ed 
   CONSTRAINT     z   ALTER TABLE ONLY public.penilaian_quisioner
    ADD CONSTRAINT idx_084c6d07131834ed PRIMARY KEY (id_penilaian_quisioner);
 R   ALTER TABLE ONLY public.penilaian_quisioner DROP CONSTRAINT idx_084c6d07131834ed;
       public            postgres    false    433            �           2606    26485 .   mt_risk_efektif_m_jawaban idx_0c43cb08000a7a2c 
   CONSTRAINT     ~   ALTER TABLE ONLY public.mt_risk_efektif_m_jawaban
    ADD CONSTRAINT idx_0c43cb08000a7a2c PRIMARY KEY (id_efektif_m_jawaban);
 X   ALTER TABLE ONLY public.mt_risk_efektif_m_jawaban DROP CONSTRAINT idx_0c43cb08000a7a2c;
       public            postgres    false    318            9           2606    26195 ,   lost_incident_follow_up idx_0c8bd174e5e512c3 
   CONSTRAINT     t   ALTER TABLE ONLY public.lost_incident_follow_up
    ADD CONSTRAINT idx_0c8bd174e5e512c3 PRIMARY KEY (id_follow_up);
 V   ALTER TABLE ONLY public.lost_incident_follow_up DROP CONSTRAINT idx_0c8bd174e5e512c3;
       public            postgres    false    250            G           2606    27733    rtm_files idx_0deb5a35a6899a0d 
   CONSTRAINT     f   ALTER TABLE ONLY public.rtm_files
    ADD CONSTRAINT idx_0deb5a35a6899a0d PRIMARY KEY (id_rtm_files);
 H   ALTER TABLE ONLY public.rtm_files DROP CONSTRAINT idx_0deb5a35a6899a0d;
       public            postgres    false    542            [           2606    27789 '   spi_audit_evaluasi idx_0e53df8685efc1fe 
   CONSTRAINT     t   ALTER TABLE ONLY public.spi_audit_evaluasi
    ADD CONSTRAINT idx_0e53df8685efc1fe PRIMARY KEY (id_audit_evaluasi);
 Q   ALTER TABLE ONLY public.spi_audit_evaluasi DROP CONSTRAINT idx_0e53df8685efc1fe;
       public            postgres    false    552            3           2606    27681 &   risk_strategi_map idx_0f8e13d0df0a6b1b 
   CONSTRAINT     q   ALTER TABLE ONLY public.risk_strategi_map
    ADD CONSTRAINT idx_0f8e13d0df0a6b1b PRIMARY KEY (id_strategi_map);
 P   ALTER TABLE ONLY public.risk_strategi_map DROP CONSTRAINT idx_0f8e13d0df0a6b1b;
       public            postgres    false    533            �           2606    27435 (   risk_mitigasi_files idx_0fc0733967c3d9f5 
   CONSTRAINT     u   ALTER TABLE ONLY public.risk_mitigasi_files
    ADD CONSTRAINT idx_0fc0733967c3d9f5 PRIMARY KEY (id_mitigasi_files);
 R   ALTER TABLE ONLY public.risk_mitigasi_files DROP CONSTRAINT idx_0fc0733967c3d9f5;
       public            postgres    false    496            �           2606    26515 0   mt_risk_efektifitas_jawaban idx_12c133dd6a45a744 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_jawaban
    ADD CONSTRAINT idx_12c133dd6a45a744 PRIMARY KEY (id_efektifitas_jawaban);
 Z   ALTER TABLE ONLY public.mt_risk_efektifitas_jawaban DROP CONSTRAINT idx_12c133dd6a45a744;
       public            postgres    false    325            �           2606    26441    mt_ppd idx_15dc072094d20344 
   CONSTRAINT     ]   ALTER TABLE ONLY public.mt_ppd
    ADD CONSTRAINT idx_15dc072094d20344 PRIMARY KEY (id_ppd);
 E   ALTER TABLE ONLY public.mt_ppd DROP CONSTRAINT idx_15dc072094d20344;
       public            postgres    false    308            �           2606    26741 &   opp_kolom_laporan idx_182c7a0bd998f19d 
   CONSTRAINT     r   ALTER TABLE ONLY public.opp_kolom_laporan
    ADD CONSTRAINT idx_182c7a0bd998f19d PRIMARY KEY (id_kolom_laporan);
 P   ALTER TABLE ONLY public.opp_kolom_laporan DROP CONSTRAINT idx_182c7a0bd998f19d;
       public            postgres    false    373            �           2606    26587 0   mt_risk_taksonomi_objective idx_18d8a35225719b65 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_objective
    ADD CONSTRAINT idx_18d8a35225719b65 PRIMARY KEY (id_taksonomi_objective);
 Z   ALTER TABLE ONLY public.mt_risk_taksonomi_objective DROP CONSTRAINT idx_18d8a35225719b65;
       public            postgres    false    340            h           2606    27120 ,   public_sys_group_action idx_190ef80bc867041c 
   CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_group_action
    ADD CONSTRAINT idx_190ef80bc867041c PRIMARY KEY (group_menu_id, action_id);
 V   ALTER TABLE ONLY public.public_sys_group_action DROP CONSTRAINT idx_190ef80bc867041c;
       public            postgres    false    440    440            S           2606    26294 -   mt_kategori_kpi_individu idx_19aa5547468cb538 
   CONSTRAINT     t   ALTER TABLE ONLY public.mt_kategori_kpi_individu
    ADD CONSTRAINT idx_19aa5547468cb538 PRIMARY KEY (id_kategori);
 W   ALTER TABLE ONLY public.mt_kategori_kpi_individu DROP CONSTRAINT idx_19aa5547468cb538;
       public            postgres    false    274            �           2606    26552 #   mt_risk_matrix idx_1bd2096ea05fbc5e 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT idx_1bd2096ea05fbc5e PRIMARY KEY (id_dampak, id_kemungkinan);
 M   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT idx_1bd2096ea05fbc5e;
       public            postgres    false    333    333            -           2606    27667 (   risk_scorecard_user idx_1bd4acd376852b54 
   CONSTRAINT     |   ALTER TABLE ONLY public.risk_scorecard_user
    ADD CONSTRAINT idx_1bd4acd376852b54 PRIMARY KEY (id_scorecard, id_jabatan);
 R   ALTER TABLE ONLY public.risk_scorecard_user DROP CONSTRAINT idx_1bd4acd376852b54;
       public            postgres    false    530    530            "           2606    26118    kpi_config idx_1d0e6ca625a12065 
   CONSTRAINT     h   ALTER TABLE ONLY public.kpi_config
    ADD CONSTRAINT idx_1d0e6ca625a12065 PRIMARY KEY (tahun, id_kpi);
 I   ALTER TABLE ONLY public.kpi_config DROP CONSTRAINT idx_1d0e6ca625a12065;
       public            postgres    false    234    234            �           2606    26609 #   mt_sdm_jabatan idx_1e38228f1edb51f5 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT idx_1e38228f1edb51f5 PRIMARY KEY (id_jabatan);
 M   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT idx_1e38228f1edb51f5;
       public            postgres    false    345            {           2606    26418 3   mt_pemeriksaan_jenis_akomodasi idx_1e624ed63c78592b 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_pemeriksaan_jenis_akomodasi
    ADD CONSTRAINT idx_1e624ed63c78592b PRIMARY KEY (id_jenis);
 ]   ALTER TABLE ONLY public.mt_pemeriksaan_jenis_akomodasi DROP CONSTRAINT idx_1e624ed63c78592b;
       public            postgres    false    302            �           2606    27498 "   risk_penyebab idx_1f52d5e7e8125b4c 
   CONSTRAINT     n   ALTER TABLE ONLY public.risk_penyebab
    ADD CONSTRAINT idx_1f52d5e7e8125b4c PRIMARY KEY (id_risk_penyebab);
 L   ALTER TABLE ONLY public.risk_penyebab DROP CONSTRAINT idx_1f52d5e7e8125b4c;
       public            postgres    false    507            i           2606    27850 &   spi_program_audit idx_1fd2c305af1ab6a1 
   CONSTRAINT     r   ALTER TABLE ONLY public.spi_program_audit
    ADD CONSTRAINT idx_1fd2c305af1ab6a1 PRIMARY KEY (id_program_audit);
 P   ALTER TABLE ONLY public.spi_program_audit DROP CONSTRAINT idx_1fd2c305af1ab6a1;
       public            postgres    false    566            %           2606    26128 !   kpi_individu idx_20ebb7d8be90f4b0 
   CONSTRAINT     c   ALTER TABLE ONLY public.kpi_individu
    ADD CONSTRAINT idx_20ebb7d8be90f4b0 PRIMARY KEY (id_kpi);
 K   ALTER TABLE ONLY public.kpi_individu DROP CONSTRAINT idx_20ebb7d8be90f4b0;
       public            postgres    false    236            a           2606    27817 &   spi_library_files idx_25c954bb0908a821 
   CONSTRAINT     r   ALTER TABLE ONLY public.spi_library_files
    ADD CONSTRAINT idx_25c954bb0908a821 PRIMARY KEY (id_dokumen_files);
 P   ALTER TABLE ONLY public.spi_library_files DROP CONSTRAINT idx_25c954bb0908a821;
       public            postgres    false    558            �           2606    27401 "   risk_mitigasi idx_25d207fde31c57e2 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_mitigasi
    ADD CONSTRAINT idx_25d207fde31c57e2 PRIMARY KEY (id_mitigasi);
 L   ALTER TABLE ONLY public.risk_mitigasi DROP CONSTRAINT idx_25d207fde31c57e2;
       public            postgres    false    491            o           2606    27876    spi_rka idx_28a1321502483f78 
   CONSTRAINT     ^   ALTER TABLE ONLY public.spi_rka
    ADD CONSTRAINT idx_28a1321502483f78 PRIMARY KEY (id_rka);
 F   ALTER TABLE ONLY public.spi_rka DROP CONSTRAINT idx_28a1321502483f78;
       public            postgres    false    573            7           2606    26186 (   lost_incident_files idx_28be9f65ac4140da 
   CONSTRAINT     z   ALTER TABLE ONLY public.lost_incident_files
    ADD CONSTRAINT idx_28be9f65ac4140da PRIMARY KEY (id_lost_incident_files);
 R   ALTER TABLE ONLY public.lost_incident_files DROP CONSTRAINT idx_28be9f65ac4140da;
       public            postgres    false    248                       2606    26844 '   opp_scorecard_view idx_2ae30b4b4bdeedd2 
   CONSTRAINT     {   ALTER TABLE ONLY public.opp_scorecard_view
    ADD CONSTRAINT idx_2ae30b4b4bdeedd2 PRIMARY KEY (id_jabatan, id_scorecard);
 Q   ALTER TABLE ONLY public.opp_scorecard_view DROP CONSTRAINT idx_2ae30b4b4bdeedd2;
       public            postgres    false    386    386            u           2606    26400 &   mt_pb_nama_proses idx_2c42dec0eb023761 
   CONSTRAINT     p   ALTER TABLE ONLY public.mt_pb_nama_proses
    ADD CONSTRAINT idx_2c42dec0eb023761 PRIMARY KEY (id_nama_proses);
 P   ALTER TABLE ONLY public.mt_pb_nama_proses DROP CONSTRAINT idx_2c42dec0eb023761;
       public            postgres    false    298            I           2606    26261 %   mt_jenis_dokumen idx_2d09bd6f716a60db 
   CONSTRAINT     q   ALTER TABLE ONLY public.mt_jenis_dokumen
    ADD CONSTRAINT idx_2d09bd6f716a60db PRIMARY KEY (id_jenis_dokumen);
 O   ALTER TABLE ONLY public.mt_jenis_dokumen DROP CONSTRAINT idx_2d09bd6f716a60db;
       public            postgres    false    266            k           2606    26367 "   mt_opp_matrix idx_2fd07690c5a02332 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_opp_matrix
    ADD CONSTRAINT idx_2fd07690c5a02332 PRIMARY KEY (id_dampak, id_kemungkinan);
 L   ALTER TABLE ONLY public.mt_opp_matrix DROP CONSTRAINT idx_2fd07690c5a02332;
       public            postgres    false    290    290            �           2606    26622 #   mt_sdm_jenjang idx_3365770e00820bef 
   CONSTRAINT     c   ALTER TABLE ONLY public.mt_sdm_jenjang
    ADD CONSTRAINT idx_3365770e00820bef PRIMARY KEY (code);
 M   ALTER TABLE ONLY public.mt_sdm_jenjang DROP CONSTRAINT idx_3365770e00820bef;
       public            postgres    false    346            "           2606    26892 '   pemeriksaan_detail idx_348aa6b8a44f6a7a 
   CONSTRAINT     x   ALTER TABLE ONLY public.pemeriksaan_detail
    ADD CONSTRAINT idx_348aa6b8a44f6a7a PRIMARY KEY (id_pemeriksaan_detail);
 Q   ALTER TABLE ONLY public.pemeriksaan_detail DROP CONSTRAINT idx_348aa6b8a44f6a7a;
       public            postgres    false    394            �           2606    26596 $   mt_risk_tingkat idx_36f2cbc68b2bc353 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_risk_tingkat
    ADD CONSTRAINT idx_36f2cbc68b2bc353 PRIMARY KEY (id_tingkat);
 N   ALTER TABLE ONLY public.mt_risk_tingkat DROP CONSTRAINT idx_36f2cbc68b2bc353;
       public            postgres    false    342            ,           2606    26931 $   pemeriksaan_spn idx_38acd4b7c6629b62 
   CONSTRAINT     f   ALTER TABLE ONLY public.pemeriksaan_spn
    ADD CONSTRAINT idx_38acd4b7c6629b62 PRIMARY KEY (id_spn);
 N   ALTER TABLE ONLY public.pemeriksaan_spn DROP CONSTRAINT idx_38acd4b7c6629b62;
       public            postgres    false    402            �           2606    26702 (   mt_status_pengajuan idx_38d4e01f5bd43ed6 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_status_pengajuan
    ADD CONSTRAINT idx_38d4e01f5bd43ed6 PRIMARY KEY (id_status_pengajuan);
 R   ALTER TABLE ONLY public.mt_status_pengajuan DROP CONSTRAINT idx_38d4e01f5bd43ed6;
       public            postgres    false    363            a           2606    27098 &   penilaian_session idx_390146f772997cbc 
   CONSTRAINT     v   ALTER TABLE ONLY public.penilaian_session
    ADD CONSTRAINT idx_390146f772997cbc PRIMARY KEY (id_penilaian_session);
 P   ALTER TABLE ONLY public.penilaian_session DROP CONSTRAINT idx_390146f772997cbc;
       public            postgres    false    435            �           2606    27489 &   risk_msg_penerima idx_3c73a326dee309e5 
   CONSTRAINT     q   ALTER TABLE ONLY public.risk_msg_penerima
    ADD CONSTRAINT idx_3c73a326dee309e5 PRIMARY KEY (id_msg, id_user);
 P   ALTER TABLE ONLY public.risk_msg_penerima DROP CONSTRAINT idx_3c73a326dee309e5;
       public            postgres    false    505    505            G           2606    26254 -   mt_jenis_audit_eksternal idx_3d5f5e17a4abc1c5 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_jenis_audit_eksternal
    ADD CONSTRAINT idx_3d5f5e17a4abc1c5 PRIMARY KEY (id_jenis_audit_eksternal);
 W   ALTER TABLE ONLY public.mt_jenis_audit_eksternal DROP CONSTRAINT idx_3d5f5e17a4abc1c5;
       public            postgres    false    264                       2606    26064    dokumen idx_3e412fb90803dcf9 
   CONSTRAINT     b   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT idx_3e412fb90803dcf9 PRIMARY KEY (id_dokumen);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT idx_3e412fb90803dcf9;
       public            postgres    false    224            �           2606    26602 #   mt_sdm_dit_bid idx_3e8ed51a219f911b 
   CONSTRAINT     c   ALTER TABLE ONLY public.mt_sdm_dit_bid
    ADD CONSTRAINT idx_3e8ed51a219f911b PRIMARY KEY (code);
 M   ALTER TABLE ONLY public.mt_sdm_dit_bid DROP CONSTRAINT idx_3e8ed51a219f911b;
       public            postgres    false    343            \           2606    26323 (   mt_message_template idx_408d3b09f53ba2c4 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_message_template
    ADD CONSTRAINT idx_408d3b09f53ba2c4 PRIMARY KEY (id_message);
 R   ALTER TABLE ONLY public.mt_message_template DROP CONSTRAINT idx_408d3b09f53ba2c4;
       public            postgres    false    280                       2606    26800 *   opp_peluang_kelayakan idx_4201507a9e7d5c9e 
   CONSTRAINT     ~   ALTER TABLE ONLY public.opp_peluang_kelayakan
    ADD CONSTRAINT idx_4201507a9e7d5c9e PRIMARY KEY (id_peluang, id_kelayakan);
 T   ALTER TABLE ONLY public.opp_peluang_kelayakan DROP CONSTRAINT idx_4201507a9e7d5c9e;
       public            postgres    false    379    379            (           2606    26138    kpi_target idx_423c0ed55c60dbb6 
   CONSTRAINT     h   ALTER TABLE ONLY public.kpi_target
    ADD CONSTRAINT idx_423c0ed55c60dbb6 PRIMARY KEY (id_kpi_target);
 I   ALTER TABLE ONLY public.kpi_target DROP CONSTRAINT idx_423c0ed55c60dbb6;
       public            postgres    false    238            �           2606    27367    risk_kri idx_42f7b767e5e7e8f2 
   CONSTRAINT     _   ALTER TABLE ONLY public.risk_kri
    ADD CONSTRAINT idx_42f7b767e5e7e8f2 PRIMARY KEY (id_kri);
 G   ALTER TABLE ONLY public.risk_kri DROP CONSTRAINT idx_42f7b767e5e7e8f2;
       public            postgres    false    486            c           2606    27106 &   public_sys_action idx_46a225abb446a5a4 
   CONSTRAINT     k   ALTER TABLE ONLY public.public_sys_action
    ADD CONSTRAINT idx_46a225abb446a5a4 PRIMARY KEY (action_id);
 P   ALTER TABLE ONLY public.public_sys_action DROP CONSTRAINT idx_46a225abb446a5a4;
       public            postgres    false    437            X           2606    27779 #   rtm_urian_unit idx_475d7066cc55adac 
   CONSTRAINT     u   ALTER TABLE ONLY public.rtm_urian_unit
    ADD CONSTRAINT idx_475d7066cc55adac PRIMARY KEY (id_unit, id_rtm_uraian);
 M   ALTER TABLE ONLY public.rtm_urian_unit DROP CONSTRAINT idx_475d7066cc55adac;
       public            postgres    false    550    550                       2606    27584 (   risk_risiko_history idx_4c320827c068532f 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_history
    ADD CONSTRAINT idx_4c320827c068532f PRIMARY KEY (id_risiko, tgl_close, jenis_close);
 R   ALTER TABLE ONLY public.risk_risiko_history DROP CONSTRAINT idx_4c320827c068532f;
       public            postgres    false    517    517    517            }           2606    27197 $   public_sys_user idx_4c3e3190d8a84519 
   CONSTRAINT     g   ALTER TABLE ONLY public.public_sys_user
    ADD CONSTRAINT idx_4c3e3190d8a84519 PRIMARY KEY (user_id);
 N   ALTER TABLE ONLY public.public_sys_user DROP CONSTRAINT idx_4c3e3190d8a84519;
       public            postgres    false    454            K           2606    26270 !   mt_jenis_rtm idx_4d219dd0f2bccfa1 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_jenis_rtm
    ADD CONSTRAINT idx_4d219dd0f2bccfa1 PRIMARY KEY (id_jenis_rtm);
 K   ALTER TABLE ONLY public.mt_jenis_rtm DROP CONSTRAINT idx_4d219dd0f2bccfa1;
       public            postgres    false    268            0           2606    26161 %   kpi_target_files idx_4dc2a478f0dadeab 
   CONSTRAINT     t   ALTER TABLE ONLY public.kpi_target_files
    ADD CONSTRAINT idx_4dc2a478f0dadeab PRIMARY KEY (id_kpi_target_files);
 O   ALTER TABLE ONLY public.kpi_target_files DROP CONSTRAINT idx_4dc2a478f0dadeab;
       public            postgres    false    242            �           2606    27454 3   risk_mitigasi_program_evaluasi idx_4e9dadbc5f85a08f 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_program_evaluasi
    ADD CONSTRAINT idx_4e9dadbc5f85a08f PRIMARY KEY (id_mitigasi_program_evaluasi);
 ]   ALTER TABLE ONLY public.risk_mitigasi_program_evaluasi DROP CONSTRAINT idx_4e9dadbc5f85a08f;
       public            postgres    false    499            �           2606    26648 $   mt_sdm_struktur idx_4fedccff0f1755ed 
   CONSTRAINT     k   ALTER TABLE ONLY public.mt_sdm_struktur
    ADD CONSTRAINT idx_4fedccff0f1755ed PRIMARY KEY (id_struktur);
 N   ALTER TABLE ONLY public.mt_sdm_struktur DROP CONSTRAINT idx_4fedccff0f1755ed;
       public            postgres    false    352            �           2606    27243 !   risk_control idx_511197b5ec00c2c5 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT idx_511197b5ec00c2c5 PRIMARY KEY (id_control);
 K   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT idx_511197b5ec00c2c5;
       public            postgres    false    463            m           2606    27869 )   spi_rekap_consulting idx_5367311033dffb23 
   CONSTRAINT     r   ALTER TABLE ONLY public.spi_rekap_consulting
    ADD CONSTRAINT idx_5367311033dffb23 PRIMARY KEY (id_konsultasi);
 S   ALTER TABLE ONLY public.spi_rekap_consulting DROP CONSTRAINT idx_5367311033dffb23;
       public            postgres    false    571            K           2606    27741 !   rtm_progress idx_53fd4d9d9bb87824 
   CONSTRAINT     l   ALTER TABLE ONLY public.rtm_progress
    ADD CONSTRAINT idx_53fd4d9d9bb87824 PRIMARY KEY (id_rtm_progress);
 K   ALTER TABLE ONLY public.rtm_progress DROP CONSTRAINT idx_53fd4d9d9bb87824;
       public            postgres    false    544            �           2606    27329 $   risk_kesimpulan idx_540d5dd565466968 
   CONSTRAINT     m   ALTER TABLE ONLY public.risk_kesimpulan
    ADD CONSTRAINT idx_540d5dd565466968 PRIMARY KEY (id_kesimpulan);
 N   ALTER TABLE ONLY public.risk_kesimpulan DROP CONSTRAINT idx_540d5dd565466968;
       public            postgres    false    478            �           2606    26688 #   mt_stakeholder idx_5671203aafd5366d 
   CONSTRAINT     m   ALTER TABLE ONLY public.mt_stakeholder
    ADD CONSTRAINT idx_5671203aafd5366d PRIMARY KEY (id_stakeholder);
 M   ALTER TABLE ONLY public.mt_stakeholder DROP CONSTRAINT idx_5671203aafd5366d;
       public            postgres    false    359            �           2606    26709 (   mt_status_penilaian idx_56ff62ded1c416f0 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_status_penilaian
    ADD CONSTRAINT idx_56ff62ded1c416f0 PRIMARY KEY (id_status_penilaian);
 R   ALTER TABLE ONLY public.mt_status_penilaian DROP CONSTRAINT idx_56ff62ded1c416f0;
       public            postgres    false    365                       2606    26434 "   mt_periode_tw idx_571cf6b325300575 
   CONSTRAINT     k   ALTER TABLE ONLY public.mt_periode_tw
    ADD CONSTRAINT idx_571cf6b325300575 PRIMARY KEY (id_periode_tw);
 L   ALTER TABLE ONLY public.mt_periode_tw DROP CONSTRAINT idx_571cf6b325300575;
       public            postgres    false    306            0           2606    27673 (   risk_scorecard_view idx_5792b7d2a67d00c3 
   CONSTRAINT     |   ALTER TABLE ONLY public.risk_scorecard_view
    ADD CONSTRAINT idx_5792b7d2a67d00c3 PRIMARY KEY (id_jabatan, id_scorecard);
 R   ALTER TABLE ONLY public.risk_scorecard_view DROP CONSTRAINT idx_5792b7d2a67d00c3;
       public            postgres    false    531    531            �           2606    27375 #   risk_kri_hasil idx_590a4ea9ee7c6349 
   CONSTRAINT     k   ALTER TABLE ONLY public.risk_kri_hasil
    ADD CONSTRAINT idx_590a4ea9ee7c6349 PRIMARY KEY (id_kri_hasil);
 M   ALTER TABLE ONLY public.risk_kri_hasil DROP CONSTRAINT idx_590a4ea9ee7c6349;
       public            postgres    false    488            �           2606    27314 "   risk_kegiatan idx_5dac15d98c9a8869 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_kegiatan
    ADD CONSTRAINT idx_5dac15d98c9a8869 PRIMARY KEY (id_kegiatan);
 L   ALTER TABLE ONLY public.risk_kegiatan DROP CONSTRAINT idx_5dac15d98c9a8869;
       public            postgres    false    475            k           2606    27860 ,   spi_program_audit_tahun idx_5e5f4cda57d95468 
   CONSTRAINT     x   ALTER TABLE ONLY public.spi_program_audit_tahun
    ADD CONSTRAINT idx_5e5f4cda57d95468 PRIMARY KEY (id_program_audit);
 V   ALTER TABLE ONLY public.spi_program_audit_tahun DROP CONSTRAINT idx_5e5f4cda57d95468;
       public            postgres    false    569            _           2606    27807     spi_library idx_5f6a1c6f3d21fb69 
   CONSTRAINT     f   ALTER TABLE ONLY public.spi_library
    ADD CONSTRAINT idx_5f6a1c6f3d21fb69 PRIMARY KEY (id_dokumen);
 J   ALTER TABLE ONLY public.spi_library DROP CONSTRAINT idx_5f6a1c6f3d21fb69;
       public            postgres    false    556            C           2606    26240 *   mt_bidang_pemeriksaan idx_605882b6a33720af 
   CONSTRAINT     {   ALTER TABLE ONLY public.mt_bidang_pemeriksaan
    ADD CONSTRAINT idx_605882b6a33720af PRIMARY KEY (id_bidang_pemeriksaan);
 T   ALTER TABLE ONLY public.mt_bidang_pemeriksaan DROP CONSTRAINT idx_605882b6a33720af;
       public            postgres    false    260            �           2606    26494 1   mt_risk_efektif_m_pengukuran idx_636a2f858235dafc 
   CONSTRAINT     z   ALTER TABLE ONLY public.mt_risk_efektif_m_pengukuran
    ADD CONSTRAINT idx_636a2f858235dafc PRIMARY KEY (id_pengukuran);
 [   ALTER TABLE ONLY public.mt_risk_efektif_m_pengukuran DROP CONSTRAINT idx_636a2f858235dafc;
       public            postgres    false    320            b           2606    26348 '   mt_opp_kemungkinan idx_63c927df8cad92cd 
   CONSTRAINT     q   ALTER TABLE ONLY public.mt_opp_kemungkinan
    ADD CONSTRAINT idx_63c927df8cad92cd PRIMARY KEY (id_kemungkinan);
 Q   ALTER TABLE ONLY public.mt_opp_kemungkinan DROP CONSTRAINT idx_63c927df8cad92cd;
       public            postgres    false    286                       2606    26821 "   opp_scorecard idx_646593b2582fd53e 
   CONSTRAINT     j   ALTER TABLE ONLY public.opp_scorecard
    ADD CONSTRAINT idx_646593b2582fd53e PRIMARY KEY (id_scorecard);
 L   ALTER TABLE ONLY public.opp_scorecard DROP CONSTRAINT idx_646593b2582fd53e;
       public            postgres    false    382            *           2606    26922 1   pemeriksaan_review_supervisi idx_647ae8a60dbc787d 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_review_supervisi
    ADD CONSTRAINT idx_647ae8a60dbc787d PRIMARY KEY (id_review_supervisi);
 [   ALTER TABLE ONLY public.pemeriksaan_review_supervisi DROP CONSTRAINT idx_647ae8a60dbc787d;
       public            postgres    false    400            E           2606    26247     mt_interval idx_65230486ca790af9 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_interval
    ADD CONSTRAINT idx_65230486ca790af9 PRIMARY KEY (id_interval);
 J   ALTER TABLE ONLY public.mt_interval DROP CONSTRAINT idx_65230486ca790af9;
       public            postgres    false    262            c           2606    27826     spi_notulen idx_6b06928d81222aa3 
   CONSTRAINT     f   ALTER TABLE ONLY public.spi_notulen
    ADD CONSTRAINT idx_6b06928d81222aa3 PRIMARY KEY (id_notulen);
 J   ALTER TABLE ONLY public.spi_notulen DROP CONSTRAINT idx_6b06928d81222aa3;
       public            postgres    false    560                       2606    26870 /   pemeriksaan_anggaran_biaya idx_6d367ebccf881d5e 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_anggaran_biaya
    ADD CONSTRAINT idx_6d367ebccf881d5e PRIMARY KEY (id_pemeriksaan_anggaran_biaya);
 Y   ALTER TABLE ONLY public.pemeriksaan_anggaran_biaya DROP CONSTRAINT idx_6d367ebccf881d5e;
       public            postgres    false    390            �           2606    26731 /   mt_tingkat_agregasi_risiko idx_6d38b409db81e919 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_tingkat_agregasi_risiko
    ADD CONSTRAINT idx_6d38b409db81e919 PRIMARY KEY (id_tingkat_agregasi_risiko);
 Y   ALTER TABLE ONLY public.mt_tingkat_agregasi_risiko DROP CONSTRAINT idx_6d38b409db81e919;
       public            postgres    false    371            v           2606    27174 ,   public_sys_notification idx_6e52fbbb7a0fe31d 
   CONSTRAINT     w   ALTER TABLE ONLY public.public_sys_notification
    ADD CONSTRAINT idx_6e52fbbb7a0fe31d PRIMARY KEY (id_notification);
 V   ALTER TABLE ONLY public.public_sys_notification DROP CONSTRAINT idx_6e52fbbb7a0fe31d;
       public            postgres    false    450            �           2606    26627 $   mt_sdm_kategori idx_6f08bf8fb3f3950e 
   CONSTRAINT     d   ALTER TABLE ONLY public.mt_sdm_kategori
    ADD CONSTRAINT idx_6f08bf8fb3f3950e PRIMARY KEY (code);
 N   ALTER TABLE ONLY public.mt_sdm_kategori DROP CONSTRAINT idx_6f08bf8fb3f3950e;
       public            postgres    false    347            �           2606    26546 3   mt_risk_kriteria_dampak_detail idx_6f84416f628429ba 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT idx_6f84416f628429ba PRIMARY KEY (id_kriteria_dampak, id_dampak);
 ]   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT idx_6f84416f628429ba;
       public            postgres    false    332    332            h           2606    26361 2   mt_opp_kriteria_dampak_detail idx_7065b80927a5f3ee 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_opp_kriteria_dampak_detail
    ADD CONSTRAINT idx_7065b80927a5f3ee PRIMARY KEY (id_kriteria_dampak, id_dampak);
 \   ALTER TABLE ONLY public.mt_opp_kriteria_dampak_detail DROP CONSTRAINT idx_7065b80927a5f3ee;
       public            postgres    false    289    289            r           2606    26392 *   mt_pb_kelompok_proses idx_71dd735aa32cc7a2 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_pb_kelompok_proses
    ADD CONSTRAINT idx_71dd735aa32cc7a2 PRIMARY KEY (id_kelompok_proses);
 T   ALTER TABLE ONLY public.mt_pb_kelompok_proses DROP CONSTRAINT idx_71dd735aa32cc7a2;
       public            postgres    false    296            p           2606    27145 $   public_sys_menu idx_724a051ab55e5049 
   CONSTRAINT     g   ALTER TABLE ONLY public.public_sys_menu
    ADD CONSTRAINT idx_724a051ab55e5049 PRIMARY KEY (menu_id);
 N   ALTER TABLE ONLY public.public_sys_menu DROP CONSTRAINT idx_724a051ab55e5049;
       public            postgres    false    445            f           2606    27115 %   public_sys_group idx_7315821177a1627b 
   CONSTRAINT     i   ALTER TABLE ONLY public.public_sys_group
    ADD CONSTRAINT idx_7315821177a1627b PRIMARY KEY (group_id);
 O   ALTER TABLE ONLY public.public_sys_group DROP CONSTRAINT idx_7315821177a1627b;
       public            postgres    false    439            �           2606    26681     mt_sdm_unit idx_75cec7a8a135822c 
   CONSTRAINT     f   ALTER TABLE ONLY public.mt_sdm_unit
    ADD CONSTRAINT idx_75cec7a8a135822c PRIMARY KEY (table_code);
 J   ALTER TABLE ONLY public.mt_sdm_unit DROP CONSTRAINT idx_75cec7a8a135822c;
       public            postgres    false    358            �           2606    26716 '   mt_status_progress idx_77ab60c038355f5d 
   CONSTRAINT     u   ALTER TABLE ONLY public.mt_status_progress
    ADD CONSTRAINT idx_77ab60c038355f5d PRIMARY KEY (id_status_progress);
 Q   ALTER TABLE ONLY public.mt_status_progress DROP CONSTRAINT idx_77ab60c038355f5d;
       public            postgres    false    367            <           2606    27692    risk_task idx_797eb583dbc534d6 
   CONSTRAINT     a   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT idx_797eb583dbc534d6 PRIMARY KEY (id_task);
 H   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT idx_797eb583dbc534d6;
       public            postgres    false    535            �           2606    27358    risk_kpi idx_7cc6e297d051bd6f 
   CONSTRAINT     _   ALTER TABLE ONLY public.risk_kpi
    ADD CONSTRAINT idx_7cc6e297d051bd6f PRIMARY KEY (id_kpi);
 G   ALTER TABLE ONLY public.risk_kpi DROP CONSTRAINT idx_7cc6e297d051bd6f;
       public            postgres    false    484            B           2606    27715 #   risk_visi_misi idx_7d0aca83497fc010 
   CONSTRAINT     k   ALTER TABLE ONLY public.risk_visi_misi
    ADD CONSTRAINT idx_7d0aca83497fc010 PRIMARY KEY (id_visi_misi);
 M   ALTER TABLE ONLY public.risk_visi_misi DROP CONSTRAINT idx_7d0aca83497fc010;
       public            postgres    false    538            O           2606    27032    penilaian idx_7e54d07169dd5189 
   CONSTRAINT     f   ALTER TABLE ONLY public.penilaian
    ADD CONSTRAINT idx_7e54d07169dd5189 PRIMARY KEY (id_penilaian);
 H   ALTER TABLE ONLY public.penilaian DROP CONSTRAINT idx_7e54d07169dd5189;
       public            postgres    false    421            �           2606    26540 ,   mt_risk_kriteria_dampak idx_7f01e4bd21fcabde 
   CONSTRAINT     z   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT idx_7f01e4bd21fcabde PRIMARY KEY (id_kriteria_dampak);
 V   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT idx_7f01e4bd21fcabde;
       public            postgres    false    331            �           2606    26448 !   mt_prioritas idx_7fe3e640e0319754 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_prioritas
    ADD CONSTRAINT idx_7fe3e640e0319754 PRIMARY KEY (id_prioritas);
 K   ALTER TABLE ONLY public.mt_prioritas DROP CONSTRAINT idx_7fe3e640e0319754;
       public            postgres    false    309            [           2606    27076 &   penilaian_periode idx_83be65fd9765db13 
   CONSTRAINT     v   ALTER TABLE ONLY public.penilaian_periode
    ADD CONSTRAINT idx_83be65fd9765db13 PRIMARY KEY (id_penilaian_periode);
 P   ALTER TABLE ONLY public.penilaian_periode DROP CONSTRAINT idx_83be65fd9765db13;
       public            postgres    false    431            �           2606    26471 &   mt_risk_efektif_m idx_84b3ac2eb3949f65 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_risk_efektif_m
    ADD CONSTRAINT idx_84b3ac2eb3949f65 PRIMARY KEY (id_efektif_m);
 P   ALTER TABLE ONLY public.mt_risk_efektif_m DROP CONSTRAINT idx_84b3ac2eb3949f65;
       public            postgres    false    315                       2606    27605 %   risk_risiko_unit idx_85b9cc9278942d4d 
   CONSTRAINT     z   ALTER TABLE ONLY public.risk_risiko_unit
    ADD CONSTRAINT idx_85b9cc9278942d4d PRIMARY KEY (id_risiko_unit, id_risiko);
 O   ALTER TABLE ONLY public.risk_risiko_unit DROP CONSTRAINT idx_85b9cc9278942d4d;
       public            postgres    false    521    521            >           2606    26985 -   pemeriksaan_temuan_saran idx_87d64d42b8d90189 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_saran
    ADD CONSTRAINT idx_87d64d42b8d90189 PRIMARY KEY (id_pemeriksaan_temuan_saran);
 W   ALTER TABLE ONLY public.pemeriksaan_temuan_saran DROP CONSTRAINT idx_87d64d42b8d90189;
       public            postgres    false    412            U           2606    27773 $   rtm_uraian_link idx_8a17a5d3565ecd84 
   CONSTRAINT     u   ALTER TABLE ONLY public.rtm_uraian_link
    ADD CONSTRAINT idx_8a17a5d3565ecd84 PRIMARY KEY (id_rtm_uraian, id_rtm);
 N   ALTER TABLE ONLY public.rtm_uraian_link DROP CONSTRAINT idx_8a17a5d3565ecd84;
       public            postgres    false    549    549            .           2606    26940 ,   pemeriksaan_spn_petugas idx_8c6da401013d919b 
   CONSTRAINT     r   ALTER TABLE ONLY public.pemeriksaan_spn_petugas
    ADD CONSTRAINT idx_8c6da401013d919b PRIMARY KEY (id_petugas);
 V   ALTER TABLE ONLY public.pemeriksaan_spn_petugas DROP CONSTRAINT idx_8c6da401013d919b;
       public            postgres    false    404            Z           2606    26314     mt_maturity idx_8cf174ed260b7cf4 
   CONSTRAINT     a   ALTER TABLE ONLY public.mt_maturity
    ADD CONSTRAINT idx_8cf174ed260b7cf4 PRIMARY KEY (tahun);
 J   ALTER TABLE ONLY public.mt_maturity DROP CONSTRAINT idx_8cf174ed260b7cf4;
       public            postgres    false    278            �           2606    26503 (   mt_risk_efektifitas idx_8d67692f0a946f88 
   CONSTRAINT     r   ALTER TABLE ONLY public.mt_risk_efektifitas
    ADD CONSTRAINT idx_8d67692f0a946f88 PRIMARY KEY (id_efektifitas);
 R   ALTER TABLE ONLY public.mt_risk_efektifitas DROP CONSTRAINT idx_8d67692f0a946f88;
       public            postgres    false    322            8           2606    26964 /   pemeriksaan_temuan_diskusi idx_9363fee2881c61ff 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_diskusi
    ADD CONSTRAINT idx_9363fee2881c61ff PRIMARY KEY (id_pemeriksaan_temuan_diskusi);
 Y   ALTER TABLE ONLY public.pemeriksaan_temuan_diskusi DROP CONSTRAINT idx_9363fee2881c61ff;
       public            postgres    false    408            s           2606    27899    template idx_9485922d800e5be0 
   CONSTRAINT     d   ALTER TABLE ONLY public.template
    ADD CONSTRAINT idx_9485922d800e5be0 PRIMARY KEY (id_template);
 G   ALTER TABLE ONLY public.template DROP CONSTRAINT idx_9485922d800e5be0;
       public            postgres    false    578            5           2606    26178 "   lost_incident idx_94b15be58e2e2437 
   CONSTRAINT     n   ALTER TABLE ONLY public.lost_incident
    ADD CONSTRAINT idx_94b15be58e2e2437 PRIMARY KEY (id_lost_incident);
 L   ALTER TABLE ONLY public.lost_incident DROP CONSTRAINT idx_94b15be58e2e2437;
       public            postgres    false    246            e           2606    27833 &   spi_notulen_acara idx_955ee5687f703343 
   CONSTRAINT     j   ALTER TABLE ONLY public.spi_notulen_acara
    ADD CONSTRAINT idx_955ee5687f703343 PRIMARY KEY (id_acara);
 P   ALTER TABLE ONLY public.spi_notulen_acara DROP CONSTRAINT idx_955ee5687f703343;
       public            postgres    false    562                       2606    26089 !   dokumen_unit idx_9a487ae3ae9931e0 
   CONSTRAINT     p   ALTER TABLE ONLY public.dokumen_unit
    ADD CONSTRAINT idx_9a487ae3ae9931e0 PRIMARY KEY (id_unit, id_dokumen);
 K   ALTER TABLE ONLY public.dokumen_unit DROP CONSTRAINT idx_9a487ae3ae9931e0;
       public            postgres    false    229    229            T           2606    27055 $   penilaian_files idx_9a4b45b882bc44c0 
   CONSTRAINT     r   ALTER TABLE ONLY public.penilaian_files
    ADD CONSTRAINT idx_9a4b45b882bc44c0 PRIMARY KEY (id_penilaian_files);
 N   ALTER TABLE ONLY public.penilaian_files DROP CONSTRAINT idx_9a4b45b882bc44c0;
       public            postgres    false    426            X           2606    27065 '   penilaian_komentar idx_9ca7db843b7c06b9 
   CONSTRAINT     x   ALTER TABLE ONLY public.penilaian_komentar
    ADD CONSTRAINT idx_9ca7db843b7c06b9 PRIMARY KEY (id_penilaian_komentar);
 Q   ALTER TABLE ONLY public.penilaian_komentar DROP CONSTRAINT idx_9ca7db843b7c06b9;
       public            postgres    false    428            
           2606    27575 &   risk_risiko_files idx_9cbd929dee49568c 
   CONSTRAINT     q   ALTER TABLE ONLY public.risk_risiko_files
    ADD CONSTRAINT idx_9cbd929dee49568c PRIMARY KEY (id_risiko_files);
 P   ALTER TABLE ONLY public.risk_risiko_files DROP CONSTRAINT idx_9cbd929dee49568c;
       public            postgres    false    516            l           2606    27128 *   public_sys_group_menu idx_9db7ded78d4ff9e5 
   CONSTRAINT     s   ALTER TABLE ONLY public.public_sys_group_menu
    ADD CONSTRAINT idx_9db7ded78d4ff9e5 PRIMARY KEY (group_menu_id);
 T   ALTER TABLE ONLY public.public_sys_group_menu DROP CONSTRAINT idx_9db7ded78d4ff9e5;
       public            postgres    false    442            �           2606    27259 -   risk_control_efektifitas idx_9de51555d10ec957 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_efektifitas
    ADD CONSTRAINT idx_9de51555d10ec957 PRIMARY KEY (id_control, id_efektifitas);
 W   ALTER TABLE ONLY public.risk_control_efektifitas DROP CONSTRAINT idx_9de51555d10ec957;
       public            postgres    false    464    464            g           2606    27840 (   spi_notulen_peserta idx_9e0be9c2b698e353 
   CONSTRAINT     n   ALTER TABLE ONLY public.spi_notulen_peserta
    ADD CONSTRAINT idx_9e0be9c2b698e353 PRIMARY KEY (id_peserta);
 R   ALTER TABLE ONLY public.spi_notulen_peserta DROP CONSTRAINT idx_9e0be9c2b698e353;
       public            postgres    false    564            R           2606    27043 %   penilaian_detail idx_9f378ff42d166df9 
   CONSTRAINT     t   ALTER TABLE ONLY public.penilaian_detail
    ADD CONSTRAINT idx_9f378ff42d166df9 PRIMARY KEY (id_penilaian_detail);
 O   ALTER TABLE ONLY public.penilaian_detail DROP CONSTRAINT idx_9f378ff42d166df9;
       public            postgres    false    423                       2606    27616 !   risk_sasaran idx_a0eb6a778d2d4f9a 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT idx_a0eb6a778d2d4f9a PRIMARY KEY (id_sasaran);
 K   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT idx_a0eb6a778d2d4f9a;
       public            postgres    false    523                       2606    26030 #   comp_penilaian idx_a18cefa76394880d 
   CONSTRAINT     p   ALTER TABLE ONLY public.comp_penilaian
    ADD CONSTRAINT idx_a18cefa76394880d PRIMARY KEY (id_comp_penilaian);
 M   ALTER TABLE ONLY public.comp_penilaian DROP CONSTRAINT idx_a18cefa76394880d;
       public            postgres    false    218                       2606    26883 *   pemeriksaan_checklist idx_a220ee3599adb58e 
   CONSTRAINT     ~   ALTER TABLE ONLY public.pemeriksaan_checklist
    ADD CONSTRAINT idx_a220ee3599adb58e PRIMARY KEY (id_pemeriksaan_checklist);
 T   ALTER TABLE ONLY public.pemeriksaan_checklist DROP CONSTRAINT idx_a220ee3599adb58e;
       public            postgres    false    392            �           2606    27524     risk_risiko idx_a307f85775252e21 
   CONSTRAINT     e   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT idx_a307f85775252e21 PRIMARY KEY (id_risiko);
 J   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT idx_a307f85775252e21;
       public            postgres    false    511            �           2606    26455 "   mt_rating_spi idx_a498e127def18212 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_rating_spi
    ADD CONSTRAINT idx_a498e127def18212 PRIMARY KEY (id_rating);
 L   ALTER TABLE ONLY public.mt_rating_spi DROP CONSTRAINT idx_a498e127def18212;
       public            postgres    false    311            V           2606    26303     mt_kriteria idx_a658a23b638ff0d3 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_kriteria
    ADD CONSTRAINT idx_a658a23b638ff0d3 PRIMARY KEY (id_kriteria);
 J   ALTER TABLE ONLY public.mt_kriteria DROP CONSTRAINT idx_a658a23b638ff0d3;
       public            postgres    false    276            �           2606    26524 3   mt_risk_efektifitas_pengukuran idx_a67258a0d11ee268 
   CONSTRAINT     |   ALTER TABLE ONLY public.mt_risk_efektifitas_pengukuran
    ADD CONSTRAINT idx_a67258a0d11ee268 PRIMARY KEY (id_pengukuran);
 ]   ALTER TABLE ONLY public.mt_risk_efektifitas_pengukuran DROP CONSTRAINT idx_a67258a0d11ee268;
       public            postgres    false    327            %           2606    26903 2   pemeriksaan_dokumen_eksternal idx_a6ad041a252e98b4 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_dokumen_eksternal
    ADD CONSTRAINT idx_a6ad041a252e98b4 PRIMARY KEY (id_dokumen_aksternal);
 \   ALTER TABLE ONLY public.pemeriksaan_dokumen_eksternal DROP CONSTRAINT idx_a6ad041a252e98b4;
       public            postgres    false    396            .           2606    26151 (   kpi_target_evaluasi idx_abc2e36b7194f57a 
   CONSTRAINT     z   ALTER TABLE ONLY public.kpi_target_evaluasi
    ADD CONSTRAINT idx_abc2e36b7194f57a PRIMARY KEY (id_kpi_target_evaluasi);
 R   ALTER TABLE ONLY public.kpi_target_evaluasi DROP CONSTRAINT idx_abc2e36b7194f57a;
       public            postgres    false    240            �           2606    26563 &   mt_risk_taksonomi idx_ae01f0becb598a2e 
   CONSTRAINT     n   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT idx_ae01f0becb598a2e PRIMARY KEY (id_taksonomi);
 P   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT idx_ae01f0becb598a2e;
       public            postgres    false    335            �           2606    27338 '   risk_kolom_laporan idx_b0551e3ee22dd74b 
   CONSTRAINT     s   ALTER TABLE ONLY public.risk_kolom_laporan
    ADD CONSTRAINT idx_b0551e3ee22dd74b PRIMARY KEY (id_kolom_laporan);
 Q   ALTER TABLE ONLY public.risk_kolom_laporan DROP CONSTRAINT idx_b0551e3ee22dd74b;
       public            postgres    false    480            �           2606    27507     risk_review idx_b1c19d87ee910ac5 
   CONSTRAINT     e   ALTER TABLE ONLY public.risk_review
    ADD CONSTRAINT idx_b1c19d87ee910ac5 PRIMARY KEY (id_review);
 J   ALTER TABLE ONLY public.risk_review DROP CONSTRAINT idx_b1c19d87ee910ac5;
       public            postgres    false    509            O           2606    27752    rtm_uraian idx_b2dad294e4dbbd0e 
   CONSTRAINT     h   ALTER TABLE ONLY public.rtm_uraian
    ADD CONSTRAINT idx_b2dad294e4dbbd0e PRIMARY KEY (id_rtm_uraian);
 I   ALTER TABLE ONLY public.rtm_uraian DROP CONSTRAINT idx_b2dad294e4dbbd0e;
       public            postgres    false    546            �           2606    26724 "   mt_target_kpi idx_b53ede91b7d67ca2 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_target_kpi
    ADD CONSTRAINT idx_b53ede91b7d67ca2 PRIMARY KEY (id_target);
 L   ALTER TABLE ONLY public.mt_target_kpi DROP CONSTRAINT idx_b53ede91b7d67ca2;
       public            postgres    false    369            ;           2606    26203 +   lost_incident_fu_files idx_b683916473ae4006 
   CONSTRAINT     y   ALTER TABLE ONLY public.lost_incident_fu_files
    ADD CONSTRAINT idx_b683916473ae4006 PRIMARY KEY (id_follow_up_files);
 U   ALTER TABLE ONLY public.lost_incident_fu_files DROP CONSTRAINT idx_b683916473ae4006;
       public            postgres    false    252            �           2606    26655 ,   mt_sdm_struktur_history idx_b684607e51bd0687 
   CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_struktur_history
    ADD CONSTRAINT idx_b684607e51bd0687 PRIMARY KEY (id_struktur, id_struktur_history);
 V   ALTER TABLE ONLY public.mt_sdm_struktur_history DROP CONSTRAINT idx_b684607e51bd0687;
       public            postgres    false    353    353            �           2606    26634 !   mt_sdm_level idx_b69dd63501aa2eb2 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_sdm_level
    ADD CONSTRAINT idx_b69dd63501aa2eb2 PRIMARY KEY (id_sdm_level);
 K   ALTER TABLE ONLY public.mt_sdm_level DROP CONSTRAINT idx_b69dd63501aa2eb2;
       public            postgres    false    349                       2606    26854     pemeriksaan idx_b78798419482ae04 
   CONSTRAINT     j   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT idx_b78798419482ae04 PRIMARY KEY (id_pemeriksaan);
 J   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT idx_b78798419482ae04;
       public            postgres    false    388            q           2606    27885     spi_sasaran idx_b7f575bf6fde2266 
   CONSTRAINT     f   ALTER TABLE ONLY public.spi_sasaran
    ADD CONSTRAINT idx_b7f575bf6fde2266 PRIMARY KEY (id_sasaran);
 J   ALTER TABLE ONLY public.spi_sasaran DROP CONSTRAINT idx_b7f575bf6fde2266;
       public            postgres    false    575            O           2606    26277     mt_kategori idx_b90e96478fd151fc 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_kategori
    ADD CONSTRAINT idx_b90e96478fd151fc PRIMARY KEY (id_kategori);
 J   ALTER TABLE ONLY public.mt_kategori DROP CONSTRAINT idx_b90e96478fd151fc;
       public            postgres    false    270            A           2606    26231 (   mt_aspek_lingkungan idx_bb883395ea18741c 
   CONSTRAINT     w   ALTER TABLE ONLY public.mt_aspek_lingkungan
    ADD CONSTRAINT idx_bb883395ea18741c PRIMARY KEY (id_aspek_lingkungan);
 R   ALTER TABLE ONLY public.mt_aspek_lingkungan DROP CONSTRAINT idx_bb883395ea18741c;
       public            postgres    false    258                       2606    27589 $   risk_risiko_kpi idx_bc17f48ae377fbca 
   CONSTRAINT     q   ALTER TABLE ONLY public.risk_risiko_kpi
    ADD CONSTRAINT idx_bc17f48ae377fbca PRIMARY KEY (id_risiko, id_kpi);
 N   ALTER TABLE ONLY public.risk_risiko_kpi DROP CONSTRAINT idx_bc17f48ae377fbca;
       public            postgres    false    518    518            �           2606    27483    risk_msg idx_bc4dae4133700974 
   CONSTRAINT     _   ALTER TABLE ONLY public.risk_msg
    ADD CONSTRAINT idx_bc4dae4133700974 PRIMARY KEY (id_msg);
 G   ALTER TABLE ONLY public.risk_msg DROP CONSTRAINT idx_bc4dae4133700974;
       public            postgres    false    504            `           2606    26339 %   mt_opp_kelayakan idx_bd1c9e7b7d7c3b70 
   CONSTRAINT     m   ALTER TABLE ONLY public.mt_opp_kelayakan
    ADD CONSTRAINT idx_bd1c9e7b7d7c3b70 PRIMARY KEY (id_kelayakan);
 O   ALTER TABLE ONLY public.mt_opp_kelayakan DROP CONSTRAINT idx_bd1c9e7b7d7c3b70;
       public            postgres    false    284            �           2606    27204 *   public_sys_user_group idx_bdc2cf97dcaee553 
   CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_user_group
    ADD CONSTRAINT idx_bdc2cf97dcaee553 PRIMARY KEY (user_id, id_jabatan, group_id);
 T   ALTER TABLE ONLY public.public_sys_user_group DROP CONSTRAINT idx_bdc2cf97dcaee553;
       public            postgres    false    455    455    455            4           2606    26949 '   pemeriksaan_temuan idx_bdfd6ab353560e43 
   CONSTRAINT     x   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT idx_bdfd6ab353560e43 PRIMARY KEY (id_pemeriksaan_temuan);
 Q   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT idx_bdfd6ab353560e43;
       public            postgres    false    406            ]           2606    27798 )   spi_hasil_monitoring idx_bea610cd4286fd8e 
   CONSTRAINT     r   ALTER TABLE ONLY public.spi_hasil_monitoring
    ADD CONSTRAINT idx_bea610cd4286fd8e PRIMARY KEY (id_monitoring);
 S   ALTER TABLE ONLY public.spi_hasil_monitoring DROP CONSTRAINT idx_bea610cd4286fd8e;
       public            postgres    false    554            �           2606    26663 $   mt_sdm_sub_unit idx_bfa296efbc41d706 
   CONSTRAINT     k   ALTER TABLE ONLY public.mt_sdm_sub_unit
    ADD CONSTRAINT idx_bfa296efbc41d706 PRIMARY KEY (id_sub_unit);
 N   ALTER TABLE ONLY public.mt_sdm_sub_unit DROP CONSTRAINT idx_bfa296efbc41d706;
       public            postgres    false    355                       2606    26794 &   opp_peluang_files idx_c24abf64de90d1f2 
   CONSTRAINT     r   ALTER TABLE ONLY public.opp_peluang_files
    ADD CONSTRAINT idx_c24abf64de90d1f2 PRIMARY KEY (id_peluang_files);
 P   ALTER TABLE ONLY public.opp_peluang_files DROP CONSTRAINT idx_c24abf64de90d1f2;
       public            postgres    false    378            ?           2606    26222 .   lost_incident_fu_progress idx_c2a7914820ba1a78 
   CONSTRAINT     x   ALTER TABLE ONLY public.lost_incident_fu_progress
    ADD CONSTRAINT idx_c2a7914820ba1a78 PRIMARY KEY (id_fu_progress);
 X   ALTER TABLE ONLY public.lost_incident_fu_progress DROP CONSTRAINT idx_c2a7914820ba1a78;
       public            postgres    false    256            �           2606    26464 #   mt_risk_dampak idx_c3143ccdaf94670a 
   CONSTRAINT     h   ALTER TABLE ONLY public.mt_risk_dampak
    ADD CONSTRAINT idx_c3143ccdaf94670a PRIMARY KEY (id_dampak);
 M   ALTER TABLE ONLY public.mt_risk_dampak DROP CONSTRAINT idx_c3143ccdaf94670a;
       public            postgres    false    313            %           2606    27644 #   risk_scorecard idx_c3ae979ce28d717c 
   CONSTRAINT     k   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT idx_c3ae979ce28d717c PRIMARY KEY (id_scorecard);
 M   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT idx_c3ae979ce28d717c;
       public            postgres    false    527                       2606    26833 (   opp_scorecard_files idx_c40f74192f647092 
   CONSTRAINT     v   ALTER TABLE ONLY public.opp_scorecard_files
    ADD CONSTRAINT idx_c40f74192f647092 PRIMARY KEY (id_scorecard_files);
 R   ALTER TABLE ONLY public.opp_scorecard_files DROP CONSTRAINT idx_c40f74192f647092;
       public            postgres    false    384                       2606    26019 #   comp_kebutuhan idx_c6e05c05a6532479 
   CONSTRAINT     p   ALTER TABLE ONLY public.comp_kebutuhan
    ADD CONSTRAINT idx_c6e05c05a6532479 PRIMARY KEY (id_comp_kebutuhan);
 M   ALTER TABLE ONLY public.comp_kebutuhan DROP CONSTRAINT idx_c6e05c05a6532479;
       public            postgres    false    216            ^           2606    26332 "   mt_opp_dampak idx_c893c93030ed9741 
   CONSTRAINT     g   ALTER TABLE ONLY public.mt_opp_dampak
    ADD CONSTRAINT idx_c893c93030ed9741 PRIMARY KEY (id_dampak);
 L   ALTER TABLE ONLY public.mt_opp_dampak DROP CONSTRAINT idx_c893c93030ed9741;
       public            postgres    false    282            s           2606    27159 '   public_sys_message idx_ca37d09115954acf 
   CONSTRAINT     m   ALTER TABLE ONLY public.public_sys_message
    ADD CONSTRAINT idx_ca37d09115954acf PRIMARY KEY (id_message);
 Q   ALTER TABLE ONLY public.public_sys_message DROP CONSTRAINT idx_ca37d09115954acf;
       public            postgres    false    447            y           2606    27185 '   public_sys_setting idx_cec6982768eb7434 
   CONSTRAINT     ~   ALTER TABLE ONLY public.public_sys_setting
    ADD CONSTRAINT idx_cec6982768eb7434 PRIMARY KEY (id_public_sys_setting, nama);
 Q   ALTER TABLE ONLY public.public_sys_setting DROP CONSTRAINT idx_cec6982768eb7434;
       public            postgres    false    452    452                       2606    26099 "   dokumen_versi idx_cf4014a32b9b8bab 
   CONSTRAINT     n   ALTER TABLE ONLY public.dokumen_versi
    ADD CONSTRAINT idx_cf4014a32b9b8bab PRIMARY KEY (id_dokumen_versi);
 L   ALTER TABLE ONLY public.dokumen_versi DROP CONSTRAINT idx_cf4014a32b9b8bab;
       public            postgres    false    231                       2606    26054    contents idx_d1b90b9157b78c43 
   CONSTRAINT     d   ALTER TABLE ONLY public.contents
    ADD CONSTRAINT idx_d1b90b9157b78c43 PRIMARY KEY (id_contents);
 G   ALTER TABLE ONLY public.contents DROP CONSTRAINT idx_d1b90b9157b78c43;
       public            postgres    false    222                       2606    26806 %   opp_peluang_unit idx_d30778835ebab1df 
   CONSTRAINT     |   ALTER TABLE ONLY public.opp_peluang_unit
    ADD CONSTRAINT idx_d30778835ebab1df PRIMARY KEY (id_peluang_unit, id_peluang);
 O   ALTER TABLE ONLY public.opp_peluang_unit DROP CONSTRAINT idx_d30778835ebab1df;
       public            postgres    false    380    380            +           2606    27661 )   risk_scorecard_files idx_d83985ae7e0aa28c 
   CONSTRAINT     w   ALTER TABLE ONLY public.risk_scorecard_files
    ADD CONSTRAINT idx_d83985ae7e0aa28c PRIMARY KEY (id_scorecard_files);
 S   ALTER TABLE ONLY public.risk_scorecard_files DROP CONSTRAINT idx_d83985ae7e0aa28c;
       public            postgres    false    529                       2606    27628 %   risk_sasaran_pic idx_d9324f479abfd4df 
   CONSTRAINT     w   ALTER TABLE ONLY public.risk_sasaran_pic
    ADD CONSTRAINT idx_d9324f479abfd4df PRIMARY KEY (id_sasaran, id_jabatan);
 O   ALTER TABLE ONLY public.risk_sasaran_pic DROP CONSTRAINT idx_d9324f479abfd4df;
       public            postgres    false    525    525                       2606    27558 (   risk_risiko_current idx_db3caa238ad03031 
   CONSTRAINT     u   ALTER TABLE ONLY public.risk_risiko_current
    ADD CONSTRAINT idx_db3caa238ad03031 PRIMARY KEY (id_risiko_current);
 R   ALTER TABLE ONLY public.risk_risiko_current DROP CONSTRAINT idx_db3caa238ad03031;
       public            postgres    false    513            �           2606    26669 "   mt_sdm_subbid idx_db54f0c28950504f 
   CONSTRAINT     b   ALTER TABLE ONLY public.mt_sdm_subbid
    ADD CONSTRAINT idx_db54f0c28950504f PRIMARY KEY (code);
 L   ALTER TABLE ONLY public.mt_sdm_subbid DROP CONSTRAINT idx_db54f0c28950504f;
       public            postgres    false    356            @           2606    27706    risk_var idx_db9fcff3470d5f2b 
   CONSTRAINT     i   ALTER TABLE ONLY public.risk_var
    ADD CONSTRAINT idx_db9fcff3470d5f2b PRIMARY KEY (id_risiko, tahun);
 G   ALTER TABLE ONLY public.risk_var DROP CONSTRAINT idx_db9fcff3470d5f2b;
       public            postgres    false    536    536            �           2606    27423 ,   risk_mitigasi_efektif_m idx_dba5e816b2cddc64 
   CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif_m
    ADD CONSTRAINT idx_dba5e816b2cddc64 PRIMARY KEY (id_mitigasi_efektif, id_efektif_m);
 V   ALTER TABLE ONLY public.risk_mitigasi_efektif_m DROP CONSTRAINT idx_dba5e816b2cddc64;
       public            postgres    false    494    494            }           2606    26427 '   mt_pemeriksaan_kka idx_de57d4b567d568bb 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_pemeriksaan_kka
    ADD CONSTRAINT idx_de57d4b567d568bb PRIMARY KEY (id_kka);
 Q   ALTER TABLE ONLY public.mt_pemeriksaan_kka DROP CONSTRAINT idx_de57d4b567d568bb;
       public            postgres    false    304                       2606    27622 %   risk_sasaran_kpi idx_df0e7cd883c5cb24 
   CONSTRAINT     s   ALTER TABLE ONLY public.risk_sasaran_kpi
    ADD CONSTRAINT idx_df0e7cd883c5cb24 PRIMARY KEY (id_sasaran, id_kpi);
 O   ALTER TABLE ONLY public.risk_sasaran_kpi DROP CONSTRAINT idx_df0e7cd883c5cb24;
       public            postgres    false    524    524            �           2606    27464 +   risk_mitigasi_progress idx_df2559eb85770f00 
   CONSTRAINT     {   ALTER TABLE ONLY public.risk_mitigasi_progress
    ADD CONSTRAINT idx_df2559eb85770f00 PRIMARY KEY (id_mitigasi_progress);
 U   ALTER TABLE ONLY public.risk_mitigasi_progress DROP CONSTRAINT idx_df2559eb85770f00;
       public            postgres    false    501            n           2606    26378 #   mt_opp_tingkat idx_df42609e0cdaa34b 
   CONSTRAINT     i   ALTER TABLE ONLY public.mt_opp_tingkat
    ADD CONSTRAINT idx_df42609e0cdaa34b PRIMARY KEY (id_tingkat);
 M   ALTER TABLE ONLY public.mt_opp_tingkat DROP CONSTRAINT idx_df42609e0cdaa34b;
       public            postgres    false    292                       2606    26044 )   comp_penilaian_files idx_e0674f784f5bbc2d 
   CONSTRAINT     |   ALTER TABLE ONLY public.comp_penilaian_files
    ADD CONSTRAINT idx_e0674f784f5bbc2d PRIMARY KEY (id_comp_penilaian_files);
 S   ALTER TABLE ONLY public.comp_penilaian_files DROP CONSTRAINT idx_e0674f784f5bbc2d;
       public            postgres    false    220                        2606    26112    kpi idx_e0accedb4fd300cb 
   CONSTRAINT     Z   ALTER TABLE ONLY public.kpi
    ADD CONSTRAINT idx_e0accedb4fd300cb PRIMARY KEY (id_kpi);
 B   ALTER TABLE ONLY public.kpi DROP CONSTRAINT idx_e0accedb4fd300cb;
       public            postgres    false    233            S           2606    27764 %   rtm_uraian_files idx_e1da0462d5aa7baa 
   CONSTRAINT     t   ALTER TABLE ONLY public.rtm_uraian_files
    ADD CONSTRAINT idx_e1da0462d5aa7baa PRIMARY KEY (id_rtm_uraian_files);
 O   ALTER TABLE ONLY public.rtm_uraian_files DROP CONSTRAINT idx_e1da0462d5aa7baa;
       public            postgres    false    548            F           2606    27003 .   pemeriksaan_tindak_lanjut idx_e3c42f981dfcde01 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut
    ADD CONSTRAINT idx_e3c42f981dfcde01 PRIMARY KEY (id_pemeriksaan_tindak_lanjut);
 X   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut DROP CONSTRAINT idx_e3c42f981dfcde01;
       public            postgres    false    416            �           2606    27286     risk_dampak idx_e6652cbc4922bfc8 
   CONSTRAINT     j   ALTER TABLE ONLY public.risk_dampak
    ADD CONSTRAINT idx_e6652cbc4922bfc8 PRIMARY KEY (id_risk_dampak);
 J   ALTER TABLE ONLY public.risk_dampak DROP CONSTRAINT idx_e6652cbc4922bfc8;
       public            postgres    false    469            E           2606    27722    rtm idx_ea2b107eef2c85f3 
   CONSTRAINT     Z   ALTER TABLE ONLY public.rtm
    ADD CONSTRAINT idx_ea2b107eef2c85f3 PRIMARY KEY (id_rtm);
 B   ALTER TABLE ONLY public.rtm DROP CONSTRAINT idx_ea2b107eef2c85f3;
       public            postgres    false    540            �           2606    26641 #   mt_sdm_pegawai idx_eb362d1e065e7918 
   CONSTRAINT     b   ALTER TABLE ONLY public.mt_sdm_pegawai
    ADD CONSTRAINT idx_eb362d1e065e7918 PRIMARY KEY (nid);
 M   ALTER TABLE ONLY public.mt_sdm_pegawai DROP CONSTRAINT idx_eb362d1e065e7918;
       public            postgres    false    350            �           2606    26695 *   mt_status_pemeriksaan idx_ec083ef26cbb3dd5 
   CONSTRAINT     {   ALTER TABLE ONLY public.mt_status_pemeriksaan
    ADD CONSTRAINT idx_ec083ef26cbb3dd5 PRIMARY KEY (id_status_pemeriksaan);
 T   ALTER TABLE ONLY public.mt_status_pemeriksaan DROP CONSTRAINT idx_ec083ef26cbb3dd5;
       public            postgres    false    361            (           2606    26912 +   pemeriksaan_peminjaman idx_ec66c632d616298a 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_peminjaman
    ADD CONSTRAINT idx_ec66c632d616298a PRIMARY KEY (id_pemeriksaan_peminjaman);
 U   ALTER TABLE ONLY public.pemeriksaan_peminjaman DROP CONSTRAINT idx_ec66c632d616298a;
       public            postgres    false    398            �           2606    27215    quisioner idx_ece88b040e685d0a 
   CONSTRAINT     f   ALTER TABLE ONLY public.quisioner
    ADD CONSTRAINT idx_ece88b040e685d0a PRIMARY KEY (id_quisioner);
 H   ALTER TABLE ONLY public.quisioner DROP CONSTRAINT idx_ece88b040e685d0a;
       public            postgres    false    457                       2606    26076 "   dokumen_files idx_edc7132737621339 
   CONSTRAINT     n   ALTER TABLE ONLY public.dokumen_files
    ADD CONSTRAINT idx_edc7132737621339 PRIMARY KEY (id_dokumen_files);
 L   ALTER TABLE ONLY public.dokumen_files DROP CONSTRAINT idx_edc7132737621339;
       public            postgres    false    226            �           2606    26579 +   mt_risk_taksonomi_area idx_efeea3ec186756aa 
   CONSTRAINT     x   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT idx_efeea3ec186756aa PRIMARY KEY (id_taksonomi_area);
 U   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT idx_efeea3ec186756aa;
       public            postgres    false    338            I           2606    27015 4   pemeriksaan_tindak_lanjut_files idx_f0025f27a8a0fdc7 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_files
    ADD CONSTRAINT idx_f0025f27a8a0fdc7 PRIMARY KEY (id_pemeriksaan_tindak_lanjut_files);
 ^   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_files DROP CONSTRAINT idx_f0025f27a8a0fdc7;
       public            postgres    false    418            �           2606    26765     opp_peluang idx_f021d315225a5b1e 
   CONSTRAINT     f   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT idx_f021d315225a5b1e PRIMARY KEY (id_peluang);
 J   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT idx_f021d315225a5b1e;
       public            postgres    false    376            �           2606    27345 !   risk_konteks idx_f03800aaba243b1e 
   CONSTRAINT     g   ALTER TABLE ONLY public.risk_konteks
    ADD CONSTRAINT idx_f03800aaba243b1e PRIMARY KEY (id_konteks);
 K   ALTER TABLE ONLY public.risk_konteks DROP CONSTRAINT idx_f03800aaba243b1e;
       public            postgres    false    481            3           2606    26168 )   kpi_target_realisasi idx_f09713649e61030a 
   CONSTRAINT     |   ALTER TABLE ONLY public.kpi_target_realisasi
    ADD CONSTRAINT idx_f09713649e61030a PRIMARY KEY (id_kpi_target_realisasi);
 S   ALTER TABLE ONLY public.kpi_target_realisasi DROP CONSTRAINT idx_f09713649e61030a;
       public            postgres    false    244            u           2606    27904 *   tr_kategori_arsip_spi idx_f37cf6f9273109c9 
   CONSTRAINT     h   ALTER TABLE ONLY public.tr_kategori_arsip_spi
    ADD CONSTRAINT idx_f37cf6f9273109c9 PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tr_kategori_arsip_spi DROP CONSTRAINT idx_f37cf6f9273109c9;
       public            postgres    false    579            �           2606    26533 (   mt_risk_kemungkinan idx_f52282f16b25ba0d 
   CONSTRAINT     r   ALTER TABLE ONLY public.mt_risk_kemungkinan
    ADD CONSTRAINT idx_f52282f16b25ba0d PRIMARY KEY (id_kemungkinan);
 R   ALTER TABLE ONLY public.mt_risk_kemungkinan DROP CONSTRAINT idx_f52282f16b25ba0d;
       public            postgres    false    329            p           2606    26385 #   mt_pb_kategori idx_f57d907328487550 
   CONSTRAINT     j   ALTER TABLE ONLY public.mt_pb_kategori
    ADD CONSTRAINT idx_f57d907328487550 PRIMARY KEY (id_kategori);
 M   ALTER TABLE ONLY public.mt_pb_kategori DROP CONSTRAINT idx_f57d907328487550;
       public            postgres    false    294            �           2606    27413 *   risk_mitigasi_efektif idx_f68c7283f3675eab 
   CONSTRAINT     y   ALTER TABLE ONLY public.risk_mitigasi_efektif
    ADD CONSTRAINT idx_f68c7283f3675eab PRIMARY KEY (id_mitigasi_efektif);
 T   ALTER TABLE ONLY public.risk_mitigasi_efektif DROP CONSTRAINT idx_f68c7283f3675eab;
       public            postgres    false    493            <           2606    26975 -   pemeriksaan_temuan_files idx_f754b4e4df5ba10c 
   CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_files
    ADD CONSTRAINT idx_f754b4e4df5ba10c PRIMARY KEY (id_pemeriksaan_temuan_files);
 W   ALTER TABLE ONLY public.pemeriksaan_temuan_files DROP CONSTRAINT idx_f754b4e4df5ba10c;
       public            postgres    false    410            y           2606    26410 -   mt_pemeriksaan_checklist idx_f7d1cd088052025c 
   CONSTRAINT     u   ALTER TABLE ONLY public.mt_pemeriksaan_checklist
    ADD CONSTRAINT idx_f7d1cd088052025c PRIMARY KEY (id_checklist);
 W   ALTER TABLE ONLY public.mt_pemeriksaan_checklist DROP CONSTRAINT idx_f7d1cd088052025c;
       public            postgres    false    300            =           2606    26213 -   lost_incident_fu_p_files idx_f82e19494902e91d 
   CONSTRAINT     }   ALTER TABLE ONLY public.lost_incident_fu_p_files
    ADD CONSTRAINT idx_f82e19494902e91d PRIMARY KEY (id_follow_up_p_files);
 W   ALTER TABLE ONLY public.lost_incident_fu_p_files DROP CONSTRAINT idx_f82e19494902e91d;
       public            postgres    false    254            B           2606    26993 $   pemeriksaan_tim idx_f88e633bb1bf996a 
   CONSTRAINT     r   ALTER TABLE ONLY public.pemeriksaan_tim
    ADD CONSTRAINT idx_f88e633bb1bf996a PRIMARY KEY (id_pemeriksaan_tim);
 N   ALTER TABLE ONLY public.pemeriksaan_tim DROP CONSTRAINT idx_f88e633bb1bf996a;
       public            postgres    false    414            Q           2606    26286 &   mt_kategori_jenis idx_f8a5102dd6584931 
   CONSTRAINT     s   ALTER TABLE ONLY public.mt_kategori_jenis
    ADD CONSTRAINT idx_f8a5102dd6584931 PRIMARY KEY (id_kategori_jenis);
 P   ALTER TABLE ONLY public.mt_kategori_jenis DROP CONSTRAINT idx_f8a5102dd6584931;
       public            postgres    false    272            �           2606    26675 %   mt_sdm_tipe_unit idx_fc6d277e44c4983d 
   CONSTRAINT     e   ALTER TABLE ONLY public.mt_sdm_tipe_unit
    ADD CONSTRAINT idx_fc6d277e44c4983d PRIMARY KEY (code);
 O   ALTER TABLE ONLY public.mt_sdm_tipe_unit DROP CONSTRAINT idx_fc6d277e44c4983d;
       public            postgres    false    357            �           2606    27300 #   risk_high_info idx_fe668ec93ed0282a 
   CONSTRAINT     h   ALTER TABLE ONLY public.risk_high_info
    ADD CONSTRAINT idx_fe668ec93ed0282a PRIMARY KEY (id_risiko);
 M   ALTER TABLE ONLY public.risk_high_info DROP CONSTRAINT idx_fe668ec93ed0282a;
       public            postgres    false    472            z           1259    27199    idx_02182f8e143e489d    INDEX     V   CREATE INDEX idx_02182f8e143e489d ON public.public_sys_user USING btree (id_jabatan);
 (   DROP INDEX public.idx_02182f8e143e489d;
       public            postgres    false    454            �           1259    26508    idx_02aee19e95640d51    INDEX     l   CREATE INDEX idx_02aee19e95640d51 ON public.mt_risk_efektifitas_bobot USING btree (id_efektifitas_jawaban);
 (   DROP INDEX public.idx_02aee19e95640d51;
       public            postgres    false    323            �           1259    27537    idx_05aa6ef144f4cd2b    INDEX     c   CREATE INDEX idx_05aa6ef144f4cd2b ON public.risk_risiko USING btree (residual_target_kemungkinan);
 (   DROP INDEX public.idx_05aa6ef144f4cd2b;
       public            postgres    false    511            �           1259    27526    idx_06cfd58896a241e6    INDEX     T   CREATE INDEX idx_06cfd58896a241e6 ON public.risk_risiko USING btree (id_scorecard);
 (   DROP INDEX public.idx_06cfd58896a241e6;
       public            postgres    false    511            ,           1259    26152    idx_078b07df837b13c9    INDEX     ]   CREATE INDEX idx_078b07df837b13c9 ON public.kpi_target_evaluasi USING btree (id_kpi_target);
 (   DROP INDEX public.idx_078b07df837b13c9;
       public            postgres    false    240            V           1259    27066    idx_0851cdef03d57cb0    INDEX     [   CREATE INDEX idx_0851cdef03d57cb0 ON public.penilaian_komentar USING btree (id_penilaian);
 (   DROP INDEX public.idx_0851cdef03d57cb0;
       public            postgres    false    428            �           1259    26785    idx_09109c93d481771b    INDEX     Y   CREATE INDEX idx_09109c93d481771b ON public.opp_peluang USING btree (id_peluang_parent);
 (   DROP INDEX public.idx_09109c93d481771b;
       public            postgres    false    376            �           1259    27290    idx_0a6981e448d1d883    INDEX     ]   CREATE INDEX idx_0a6981e448d1d883 ON public.risk_dampak_risiko USING btree (id_risk_dampak);
 (   DROP INDEX public.idx_0a6981e448d1d883;
       public            postgres    false    470            �           1259    26777    idx_0bce3b27dea5266d    INDEX     `   CREATE INDEX idx_0bce3b27dea5266d ON public.opp_peluang USING btree (residual_dampak_evaluasi);
 (   DROP INDEX public.idx_0bce3b27dea5266d;
       public            postgres    false    376            �           1259    27305    idx_0dac0c2fffd2522b    INDEX     [   CREATE INDEX idx_0dac0c2fffd2522b ON public.risk_integrasi_internal USING btree (id_unit);
 (   DROP INDEX public.idx_0dac0c2fffd2522b;
       public            postgres    false    473            4           1259    27698    idx_0e023b909c2c54bf    INDEX     Q   CREATE INDEX idx_0e023b909c2c54bf ON public.risk_task USING btree (id_mitigasi);
 (   DROP INDEX public.idx_0e023b909c2c54bf;
       public            postgres    false    535            {           1259    27198    idx_0e2c01897a7691ee    INDEX     T   CREATE INDEX idx_0e2c01897a7691ee ON public.public_sys_user USING btree (group_id);
 (   DROP INDEX public.idx_0e2c01897a7691ee;
       public            postgres    false    454                        1259    26893    idx_0f051cd1c654e6a2    INDEX     ]   CREATE INDEX idx_0f051cd1c654e6a2 ON public.pemeriksaan_detail USING btree (id_pemeriksaan);
 (   DROP INDEX public.idx_0f051cd1c654e6a2;
       public            postgres    false    394            5           1259    27700    idx_0f0a952ae10ddfb0    INDEX     Y   CREATE INDEX idx_0f0a952ae10ddfb0 ON public.risk_task USING btree (id_status_pengajuan);
 (   DROP INDEX public.idx_0f0a952ae10ddfb0;
       public            postgres    false    535            �           1259    27249    idx_0f92572a52b0be25    INDEX     [   CREATE INDEX idx_0f92572a52b0be25 ON public.risk_control USING btree (id_control_sebelum);
 (   DROP INDEX public.idx_0f92572a52b0be25;
       public            postgres    false    463            �           1259    27547    idx_10378a3296add867    INDEX     S   CREATE INDEX idx_10378a3296add867 ON public.risk_risiko USING btree (id_kategori);
 (   DROP INDEX public.idx_10378a3296add867;
       public            postgres    false    511            �           1259    27351    idx_1142e7428f6d7b92    INDEX     _   CREATE INDEX idx_1142e7428f6d7b92 ON public.risk_konteks_stakeholder USING btree (id_konteks);
 (   DROP INDEX public.idx_1142e7428f6d7b92;
       public            postgres    false    482            �           1259    26770    idx_116a2d25d1d20725    INDEX     V   CREATE INDEX idx_116a2d25d1d20725 ON public.opp_peluang USING btree (inheren_dampak);
 (   DROP INDEX public.idx_116a2d25d1d20725;
       public            postgres    false    376                       1259    26031    idx_117514be755c2656    INDEX     \   CREATE INDEX idx_117514be755c2656 ON public.comp_penilaian USING btree (id_comp_kebutuhan);
 (   DROP INDEX public.idx_117514be755c2656;
       public            postgres    false    218            �           1259    26749    idx_1520bd581f407a19    INDEX     P   CREATE INDEX idx_1520bd581f407a19 ON public.opp_log USING btree (id_scorecard);
 (   DROP INDEX public.idx_1520bd581f407a19;
       public            postgres    false    374                       1259    27606    idx_1553181f22b2b0c1    INDEX     V   CREATE INDEX idx_1553181f22b2b0c1 ON public.risk_risiko_unit USING btree (id_risiko);
 (   DROP INDEX public.idx_1553181f22b2b0c1;
       public            postgres    false    521            �           1259    26766    idx_159a781b74db35c5    INDEX     b   CREATE UNIQUE INDEX idx_159a781b74db35c5 ON public.opp_peluang USING btree (nomor, id_scorecard);
 (   DROP INDEX public.idx_159a781b74db35c5;
       public            postgres    false    376    376            	           1259    26034    idx_17fec3a53c85d5f6    INDEX     R   CREATE INDEX idx_17fec3a53c85d5f6 ON public.comp_penilaian USING btree (id_unit);
 (   DROP INDEX public.idx_17fec3a53c85d5f6;
       public            postgres    false    218            �           1259    27449    idx_1a225e4908fcc641    INDEX     [   CREATE INDEX idx_1a225e4908fcc641 ON public.risk_mitigasi_program USING btree (id_risiko);
 (   DROP INDEX public.idx_1a225e4908fcc641;
       public            postgres    false    498            L           1259    27034    idx_1acc876feeda3b74    INDEX     P   CREATE INDEX idx_1acc876feeda3b74 ON public.penilaian USING btree (id_dokumen);
 (   DROP INDEX public.idx_1acc876feeda3b74;
       public            postgres    false    421            J           1259    27023    idx_1c51556e16fd9969    INDEX     x   CREATE INDEX idx_1c51556e16fd9969 ON public.pemeriksaan_tindak_lanjut_saran USING btree (id_pemeriksaan_tindak_lanjut);
 (   DROP INDEX public.idx_1c51556e16fd9969;
       public            postgres    false    419            �           1259    27250    idx_1d5b8baad75a1bb9    INDEX     S   CREATE INDEX idx_1d5b8baad75a1bb9 ON public.risk_control USING btree (id_jabatan);
 (   DROP INDEX public.idx_1d5b8baad75a1bb9;
       public            postgres    false    463            f           1259    26362    idx_1dd6c3094beb16c1    INDEX     c   CREATE INDEX idx_1dd6c3094beb16c1 ON public.mt_opp_kriteria_dampak_detail USING btree (id_dampak);
 (   DROP INDEX public.idx_1dd6c3094beb16c1;
       public            postgres    false    289                       1259    27594    idx_1dfdc941674e5661    INDEX     Z   CREATE INDEX idx_1dfdc941674e5661 ON public.risk_risiko_penyebab USING btree (id_risiko);
 (   DROP INDEX public.idx_1dfdc941674e5661;
       public            postgres    false    519            ~           1259    27205    idx_1ea0268101aa20ed    INDEX     Z   CREATE INDEX idx_1ea0268101aa20ed ON public.public_sys_user_group USING btree (group_id);
 (   DROP INDEX public.idx_1ea0268101aa20ed;
       public            postgres    false    455                       1259    27600    idx_22ba5a8140d73c0a    INDEX     c   CREATE INDEX idx_22ba5a8140d73c0a ON public.risk_risiko_proyek_terkait USING btree (id_scorecard);
 (   DROP INDEX public.idx_22ba5a8140d73c0a;
       public            postgres    false    520            �           1259    26781    idx_238242f3b38f205d    INDEX     Z   CREATE INDEX idx_238242f3b38f205d ON public.opp_peluang USING btree (id_kriteria_dampak);
 (   DROP INDEX public.idx_238242f3b38f205d;
       public            postgres    false    376            �           1259    26748    idx_2447a62e22423d5f    INDEX     L   CREATE INDEX idx_2447a62e22423d5f ON public.opp_log USING btree (group_id);
 (   DROP INDEX public.idx_2447a62e22423d5f;
       public            postgres    false    374            6           1259    27697    idx_24c31dcf08b154e8    INDEX     P   CREATE INDEX idx_24c31dcf08b154e8 ON public.risk_task USING btree (id_control);
 (   DROP INDEX public.idx_24c31dcf08b154e8;
       public            postgres    false    535            �           1259    26767    idx_2589f1bd8d94b3d0    INDEX     R   CREATE INDEX idx_2589f1bd8d94b3d0 ON public.opp_peluang USING btree (nomor_asli);
 (   DROP INDEX public.idx_2589f1bd8d94b3d0;
       public            postgres    false    376            �           1259    27533    idx_25d2b1ae00cf9d6a    INDEX     e   CREATE INDEX idx_25d2b1ae00cf9d6a ON public.risk_risiko USING btree (control_kemungkinan_penurunan);
 (   DROP INDEX public.idx_25d2b1ae00cf9d6a;
       public            postgres    false    511                       1259    27576    idx_282bef5f5b8ca724    INDEX     W   CREATE INDEX idx_282bef5f5b8ca724 ON public.risk_risiko_files USING btree (id_risiko);
 (   DROP INDEX public.idx_282bef5f5b8ca724;
       public            postgres    false    516            �           1259    27245    idx_29991aeeb4cf42c4    INDEX     T   CREATE INDEX idx_29991aeeb4cf42c4 ON public.risk_control USING btree (id_interval);
 (   DROP INDEX public.idx_29991aeeb4cf42c4;
       public            postgres    false    463            M           1259    27033    idx_2aea29559549886b    INDEX     Z   CREATE INDEX idx_2aea29559549886b ON public.penilaian USING btree (id_penilaian_periode);
 (   DROP INDEX public.idx_2aea29559549886b;
       public            postgres    false    421            i           1259    26368    idx_2bf421d8400b71ea    INDEX     X   CREATE INDEX idx_2bf421d8400b71ea ON public.mt_opp_matrix USING btree (id_kemungkinan);
 (   DROP INDEX public.idx_2bf421d8400b71ea;
       public            postgres    false    290                        1259    27651    idx_2c6254990d3d2ff1    INDEX     Y   CREATE INDEX idx_2c6254990d3d2ff1 ON public.risk_scorecard USING btree (id_nama_proses);
 (   DROP INDEX public.idx_2c6254990d3d2ff1;
       public            postgres    false    527            L           1259    26278    idx_2d02601d4f53f9b6    INDEX     Y   CREATE INDEX idx_2d02601d4f53f9b6 ON public.mt_kategori USING btree (id_kategori_jenis);
 (   DROP INDEX public.idx_2d02601d4f53f9b6;
       public            postgres    false    270            �           1259    26564    idx_2f559852168865db    INDEX     _   CREATE INDEX idx_2f559852168865db ON public.mt_risk_taksonomi USING btree (id_taksonomi_area);
 (   DROP INDEX public.idx_2f559852168865db;
       public            postgres    false    335                       1259    27599    idx_306f8d003482bc86    INDEX     `   CREATE INDEX idx_306f8d003482bc86 ON public.risk_risiko_proyek_terkait USING btree (id_risiko);
 (   DROP INDEX public.idx_306f8d003482bc86;
       public            postgres    false    520            P           1259    27765    idx_327edbe7e073a2f1    INDEX     Z   CREATE INDEX idx_327edbe7e073a2f1 ON public.rtm_uraian_files USING btree (id_rtm_uraian);
 (   DROP INDEX public.idx_327edbe7e073a2f1;
       public            postgres    false    548                       1259    26855    idx_32cb0e561dda8cf3    INDEX     ]   CREATE INDEX idx_32cb0e561dda8cf3 ON public.pemeriksaan USING btree (id_jabatan_penyesusun);
 (   DROP INDEX public.idx_32cb0e561dda8cf3;
       public            postgres    false    388            Q           1259    27766    idx_34ce4880d6b856ec    INDEX     S   CREATE INDEX idx_34ce4880d6b856ec ON public.rtm_uraian_files USING btree (id_rtm);
 (   DROP INDEX public.idx_34ce4880d6b856ec;
       public            postgres    false    548            7           1259    27699    idx_358e3a6325d7716c    INDEX     Q   CREATE INDEX idx_358e3a6325d7716c ON public.risk_task USING btree (id_kegiatan);
 (   DROP INDEX public.idx_358e3a6325d7716c;
       public            postgres    false    535            �           1259    27544    idx_366ac726001977c5    INDEX     Y   CREATE INDEX idx_366ac726001977c5 ON public.risk_risiko USING btree (id_risiko_sebelum);
 (   DROP INDEX public.idx_366ac726001977c5;
       public            postgres    false    511            �           1259    27536    idx_36c4f355db50b2dc    INDEX     ^   CREATE INDEX idx_36c4f355db50b2dc ON public.risk_risiko USING btree (residual_target_dampak);
 (   DROP INDEX public.idx_36c4f355db50b2dc;
       public            postgres    false    511            �           1259    26650    idx_36c50f73ae3c3934    INDEX     ^   CREATE INDEX idx_36c50f73ae3c3934 ON public.mt_sdm_struktur USING btree (id_struktur_parent);
 (   DROP INDEX public.idx_36c50f73ae3c3934;
       public            postgres    false    352            /           1259    26952    idx_372f0ff8cc69a8bd    INDEX     a   CREATE INDEX idx_372f0ff8cc69a8bd ON public.pemeriksaan_temuan USING btree (id_jabatan_auditor);
 (   DROP INDEX public.idx_372f0ff8cc69a8bd;
       public            postgres    false    406            �           1259    27436    idx_37b4192b51c29f6f    INDEX     [   CREATE INDEX idx_37b4192b51c29f6f ON public.risk_mitigasi_files USING btree (id_mitigasi);
 (   DROP INDEX public.idx_37b4192b51c29f6f;
       public            postgres    false    496            M           1259    26279    idx_37f558364558ab62    INDEX     S   CREATE INDEX idx_37f558364558ab62 ON public.mt_kategori USING btree (id_interval);
 (   DROP INDEX public.idx_37f558364558ab62;
       public            postgres    false    270            �           1259    27404    idx_3867c5ced9307b7e    INDEX     ]   CREATE INDEX idx_3867c5ced9307b7e ON public.risk_mitigasi USING btree (id_mitigasi_sebelum);
 (   DROP INDEX public.idx_3867c5ced9307b7e;
       public            postgres    false    491            �           1259    27541    idx_39f38f4eea1d0bfc    INDEX     [   CREATE INDEX idx_39f38f4eea1d0bfc ON public.risk_risiko USING btree (current_risk_dampak);
 (   DROP INDEX public.idx_39f38f4eea1d0bfc;
       public            postgres    false    511            &           1259    26139    idx_3b690b8dee7f610d    INDEX     M   CREATE INDEX idx_3b690b8dee7f610d ON public.kpi_target USING btree (id_kpi);
 (   DROP INDEX public.idx_3b690b8dee7f610d;
       public            postgres    false    238            8           1259    27694    idx_3cbad975989bde6e    INDEX     Z   CREATE INDEX idx_3cbad975989bde6e ON public.risk_task USING btree (id_scorecard_peluang);
 (   DROP INDEX public.idx_3cbad975989bde6e;
       public            postgres    false    535            I           1259    27742    idx_3cc5fc9d5a479b0c    INDEX     V   CREATE INDEX idx_3cc5fc9d5a479b0c ON public.rtm_progress USING btree (id_rtm_uraian);
 (   DROP INDEX public.idx_3cc5fc9d5a479b0c;
       public            postgres    false    544            e           1259    26356    idx_3d65601516b083ab    INDEX     [   CREATE INDEX idx_3d65601516b083ab ON public.mt_opp_kriteria_dampak USING btree (id_induk);
 (   DROP INDEX public.idx_3d65601516b083ab;
       public            postgres    false    288            l           1259    26369    idx_3df898ea22202bef    INDEX     T   CREATE INDEX idx_3df898ea22202bef ON public.mt_opp_matrix USING btree (id_tingkat);
 (   DROP INDEX public.idx_3df898ea22202bef;
       public            postgres    false    290            i           1259    27121    idx_3e8142b5f89df6cc    INDEX     ]   CREATE INDEX idx_3e8142b5f89df6cc ON public.public_sys_group_action USING btree (action_id);
 (   DROP INDEX public.idx_3e8142b5f89df6cc;
       public            postgres    false    440            �           1259    27548    idx_3f5afd351d6cbb17    INDEX     X   CREATE INDEX idx_3f5afd351d6cbb17 ON public.risk_risiko USING btree (id_risiko_parent);
 (   DROP INDEX public.idx_3f5afd351d6cbb17;
       public            postgres    false    511            n           1259    27136    idx_3f6f1b069d8879c2    INDEX     O   CREATE INDEX idx_3f6f1b069d8879c2 ON public.public_sys_log USING btree (page);
 (   DROP INDEX public.idx_3f6f1b069d8879c2;
       public            postgres    false    443                       1259    26113    idx_4059931c6ef53e28    INDEX     I   CREATE INDEX idx_4059931c6ef53e28 ON public.kpi USING btree (id_parent);
 (   DROP INDEX public.idx_4059931c6ef53e28;
       public            postgres    false    233            9           1259    27696    idx_4111b667cd2a2a3a    INDEX     O   CREATE INDEX idx_4111b667cd2a2a3a ON public.risk_task USING btree (id_risiko);
 (   DROP INDEX public.idx_4111b667cd2a2a3a;
       public            postgres    false    535            �           1259    26541    idx_4117d7497929e2e2    INDEX     \   CREATE INDEX idx_4117d7497929e2e2 ON public.mt_risk_kriteria_dampak USING btree (id_induk);
 (   DROP INDEX public.idx_4117d7497929e2e2;
       public            postgres    false    331            �           1259    27545    idx_41db0959f25277d4    INDEX     R   CREATE INDEX idx_41db0959f25277d4 ON public.risk_risiko USING btree (id_jabatan);
 (   DROP INDEX public.idx_41db0959f25277d4;
       public            postgres    false    511                       1259    26857    idx_4243265345d812f4    INDEX     O   CREATE INDEX idx_4243265345d812f4 ON public.pemeriksaan USING btree (id_unit);
 (   DROP INDEX public.idx_4243265345d812f4;
       public            postgres    false    388            �           1259    27384    idx_455fef6173415a16    INDEX     M   CREATE INDEX idx_455fef6173415a16 ON public.risk_log USING btree (group_id);
 (   DROP INDEX public.idx_455fef6173415a16;
       public            postgres    false    489            L           1259    27754    idx_45e30a31a1d7aa09    INDEX     Z   CREATE INDEX idx_45e30a31a1d7aa09 ON public.rtm_uraian USING btree (id_jenis_rtm_parent);
 (   DROP INDEX public.idx_45e30a31a1d7aa09;
       public            postgres    false    546            �           1259    26778    idx_461707fa78704ea0    INDEX     e   CREATE INDEX idx_461707fa78704ea0 ON public.opp_peluang USING btree (residual_kemungkinan_evaluasi);
 (   DROP INDEX public.idx_461707fa78704ea0;
       public            postgres    false    376                        1259    27560    idx_46cb93aa3da76dee    INDEX     ^   CREATE INDEX idx_46cb93aa3da76dee ON public.risk_risiko_current USING btree (id_kemungkinan);
 (   DROP INDEX public.idx_46cb93aa3da76dee;
       public            postgres    false    513            P           1259    27044    idx_46f2e8cfd7771a16    INDEX     Y   CREATE INDEX idx_46f2e8cfd7771a16 ON public.penilaian_detail USING btree (id_penilaian);
 (   DROP INDEX public.idx_46f2e8cfd7771a16;
       public            postgres    false    423            �           1259    27538    idx_47ff756715b954ee    INDEX     `   CREATE INDEX idx_47ff756715b954ee ON public.risk_risiko USING btree (residual_dampak_evaluasi);
 (   DROP INDEX public.idx_47ff756715b954ee;
       public            postgres    false    511            �           1259    27531    idx_4822b0f84a82e17a    INDEX     [   CREATE INDEX idx_4822b0f84a82e17a ON public.risk_risiko USING btree (inheren_kemungkinan);
 (   DROP INDEX public.idx_4822b0f84a82e17a;
       public            postgres    false    511            �           1259    26747    idx_4bea11988daa96b9    INDEX     N   CREATE INDEX idx_4bea11988daa96b9 ON public.opp_log USING btree (id_peluang);
 (   DROP INDEX public.idx_4bea11988daa96b9;
       public            postgres    false    374            �           1259    27260    idx_4dbd7c2ba16cc899    INDEX     _   CREATE INDEX idx_4dbd7c2ba16cc899 ON public.risk_control_efektifitas USING btree (id_jawaban);
 (   DROP INDEX public.idx_4dbd7c2ba16cc899;
       public            postgres    false    464            �           1259    26780    idx_4e5782ae88a27ade    INDEX     _   CREATE INDEX idx_4e5782ae88a27ade ON public.opp_peluang USING btree (current_opp_kemungkinan);
 (   DROP INDEX public.idx_4e5782ae88a27ade;
       public            postgres    false    376            �           1259    26779    idx_4e9f42320e4521f7    INDEX     Z   CREATE INDEX idx_4e9f42320e4521f7 ON public.opp_peluang USING btree (current_opp_dampak);
 (   DROP INDEX public.idx_4e9f42320e4521f7;
       public            postgres    false    376            �           1259    26773    idx_503722a3b7b24c86    INDEX     e   CREATE INDEX idx_503722a3b7b24c86 ON public.opp_peluang USING btree (control_kemungkinan_penurunan);
 (   DROP INDEX public.idx_503722a3b7b24c86;
       public            postgres    false    376            �           1259    26580    idx_503cecf20f724c00    INDEX     i   CREATE INDEX idx_503cecf20f724c00 ON public.mt_risk_taksonomi_area USING btree (id_taksonomi_objective);
 (   DROP INDEX public.idx_503cecf20f724c00;
       public            postgres    false    338            t           1259    27176    idx_50712d4901dde756    INDEX     ^   CREATE INDEX idx_50712d4901dde756 ON public.public_sys_notification USING btree (id_jabatan);
 (   DROP INDEX public.idx_50712d4901dde756;
       public            postgres    false    450            !           1259    27647    idx_50ca9f985b536149    INDEX     R   CREATE INDEX idx_50ca9f985b536149 ON public.risk_scorecard USING btree (id_unit);
 (   DROP INDEX public.idx_50ca9f985b536149;
       public            postgres    false    527                       1259    26834    idx_512b6cedd3085997    INDEX     \   CREATE INDEX idx_512b6cedd3085997 ON public.opp_scorecard_files USING btree (id_scorecard);
 (   DROP INDEX public.idx_512b6cedd3085997;
       public            postgres    false    384            �           1259    27530    idx_5236956203dd1602    INDEX     V   CREATE INDEX idx_5236956203dd1602 ON public.risk_risiko USING btree (inheren_dampak);
 (   DROP INDEX public.idx_5236956203dd1602;
       public            postgres    false    511                       1259    26066    idx_52d43a01d0672e53    INDEX     T   CREATE INDEX idx_52d43a01d0672e53 ON public.dokumen USING btree (id_jenis_dokumen);
 (   DROP INDEX public.idx_52d43a01d0672e53;
       public            postgres    false    224            �           1259    27425    idx_534693108e63b07d    INDEX     `   CREATE INDEX idx_534693108e63b07d ON public.risk_mitigasi_efektif_m USING btree (id_efektif_m);
 (   DROP INDEX public.idx_534693108e63b07d;
       public            postgres    false    494            �           1259    26569    idx_53d6b537be09a68e    INDEX     c   CREATE INDEX idx_53d6b537be09a68e ON public.mt_risk_taksonomi_appetite USING btree (id_taksonomi);
 (   DROP INDEX public.idx_53d6b537be09a68e;
       public            postgres    false    336                       1259    26856    idx_54171e6595e12298    INDEX     [   CREATE INDEX idx_54171e6595e12298 ON public.pemeriksaan USING btree (id_jabatan_pereview);
 (   DROP INDEX public.idx_54171e6595e12298;
       public            postgres    false    388            Y           1259    27079    idx_5417396046b1c586    INDEX     Y   CREATE INDEX idx_5417396046b1c586 ON public.penilaian_periode USING btree (id_unit_bak);
 (   DROP INDEX public.idx_5417396046b1c586;
       public            postgres    false    431            H           1259    27734    idx_547ee61cb0787810    INDEX     L   CREATE INDEX idx_547ee61cb0787810 ON public.rtm_files USING btree (id_rtm);
 (   DROP INDEX public.idx_547ee61cb0787810;
       public            postgres    false    542            d           1259    27107    idx_556eab1fe99ed713    INDEX     U   CREATE INDEX idx_556eab1fe99ed713 ON public.public_sys_action USING btree (menu_id);
 (   DROP INDEX public.idx_556eab1fe99ed713;
       public            postgres    false    437            �           1259    26478    idx_55fc236fa9c6167e    INDEX     h   CREATE INDEX idx_55fc236fa9c6167e ON public.mt_risk_efektif_m_bobot USING btree (id_efektif_m_jawaban);
 (   DROP INDEX public.idx_55fc236fa9c6167e;
       public            postgres    false    316            
           1259    26033    idx_57531fa59bb88046    INDEX     ^   CREATE INDEX idx_57531fa59bb88046 ON public.comp_penilaian USING btree (id_jabatan_pereview);
 (   DROP INDEX public.idx_57531fa59bb88046;
       public            postgres    false    218            �           1259    27529    idx_576525b55f08fbe6    INDEX     N   CREATE INDEX idx_576525b55f08fbe6 ON public.risk_risiko USING btree (id_kpi);
 (   DROP INDEX public.idx_576525b55f08fbe6;
       public            postgres    false    511            �           1259    26786    idx_57cf64266e26fe9f    INDEX     N   CREATE INDEX idx_57cf64266e26fe9f ON public.opp_peluang USING btree (id_kpi);
 (   DROP INDEX public.idx_57cf64266e26fe9f;
       public            postgres    false    376                       1259    27623    idx_58bebfa6aa69750c    INDEX     S   CREATE INDEX idx_58bebfa6aa69750c ON public.risk_sasaran_kpi USING btree (id_kpi);
 (   DROP INDEX public.idx_58bebfa6aa69750c;
       public            postgres    false    524            �           1259    27534    idx_58e8fadb7361730d    INDEX     [   CREATE INDEX idx_58e8fadb7361730d ON public.risk_risiko USING btree (id_status_pengajuan);
 (   DROP INDEX public.idx_58e8fadb7361730d;
       public            postgres    false    511            �           1259    26553    idx_5a2c827dcc33218d    INDEX     Y   CREATE INDEX idx_5a2c827dcc33218d ON public.mt_risk_matrix USING btree (id_kemungkinan);
 (   DROP INDEX public.idx_5a2c827dcc33218d;
       public            postgres    false    333            �           1259    26570    idx_5c4294b60dd98f90    INDEX     `   CREATE INDEX idx_5c4294b60dd98f90 ON public.mt_risk_taksonomi_appetite USING btree (id_dampak);
 (   DROP INDEX public.idx_5c4294b60dd98f90;
       public            postgres    false    336            "           1259    27648    idx_5cfc35cdaf174d38    INDEX     P   CREATE INDEX idx_5cfc35cdaf174d38 ON public.risk_scorecard USING btree (owner);
 (   DROP INDEX public.idx_5cfc35cdaf174d38;
       public            postgres    false    527            1           1259    26169    idx_5dad8680d838d814    INDEX     ^   CREATE INDEX idx_5dad8680d838d814 ON public.kpi_target_realisasi USING btree (id_kpi_target);
 (   DROP INDEX public.idx_5dad8680d838d814;
       public            postgres    false    244            �           1259    26783    idx_5dfbd3736d94880a    INDEX     R   CREATE INDEX idx_5dfbd3736d94880a ON public.opp_peluang USING btree (id_jabatan);
 (   DROP INDEX public.idx_5dfbd3736d94880a;
       public            postgres    false    376            :           1259    27695    idx_5fd10dc93c09b1ec    INDEX     R   CREATE INDEX idx_5fd10dc93c09b1ec ON public.risk_task USING btree (id_scorecard);
 (   DROP INDEX public.idx_5fd10dc93c09b1ec;
       public            postgres    false    535            �           1259    27455    idx_657277003a0ce637    INDEX     h   CREATE INDEX idx_657277003a0ce637 ON public.risk_mitigasi_program_evaluasi USING btree (id_periode_tw);
 (   DROP INDEX public.idx_657277003a0ce637;
       public            postgres    false    499            �           1259    26611    idx_6a65cb7ffc19fb84    INDEX     \   CREATE INDEX idx_6a65cb7ffc19fb84 ON public.mt_sdm_jabatan USING btree (id_jabatan_parent);
 (   DROP INDEX public.idx_6a65cb7ffc19fb84;
       public            postgres    false    345            �           1259    27440    idx_6e0524f8131be500    INDEX     f   CREATE INDEX idx_6e0524f8131be500 ON public.risk_mitigasi_integrasi_internal USING btree (id_risiko);
 (   DROP INDEX public.idx_6e0524f8131be500;
       public            postgres    false    497            	           1259    26822    idx_6ecc6aa935b76881    INDEX     ]   CREATE INDEX idx_6ecc6aa935b76881 ON public.opp_scorecard USING btree (id_status_pengajuan);
 (   DROP INDEX public.idx_6ecc6aa935b76881;
       public            postgres    false    382            �           1259    26613    idx_6f6e7d868e5a2fe5    INDEX     U   CREATE INDEX idx_6f6e7d868e5a2fe5 ON public.mt_sdm_jabatan USING btree (id_jenjang);
 (   DROP INDEX public.idx_6f6e7d868e5a2fe5;
       public            postgres    false    345            C           1259    27004    idx_710b6148ad9f0d54    INDEX     k   CREATE INDEX idx_710b6148ad9f0d54 ON public.pemeriksaan_tindak_lanjut USING btree (id_pemeriksaan_temuan);
 (   DROP INDEX public.idx_710b6148ad9f0d54;
       public            postgres    false    416                       1259    26801    idx_715ad21c7ede8acc    INDEX     ^   CREATE INDEX idx_715ad21c7ede8acc ON public.opp_peluang_kelayakan USING btree (id_kelayakan);
 (   DROP INDEX public.idx_715ad21c7ede8acc;
       public            postgres    false    379            #           1259    26119    idx_7378b902f8a09d04    INDEX     M   CREATE INDEX idx_7378b902f8a09d04 ON public.kpi_config USING btree (id_kpi);
 (   DROP INDEX public.idx_7378b902f8a09d04;
       public            postgres    false    234            �           1259    26614    idx_73e2a407a8147a60    INDEX     W   CREATE INDEX idx_73e2a407a8147a60 ON public.mt_sdm_jabatan USING btree (id_tipe_unit);
 (   DROP INDEX public.idx_73e2a407a8147a60;
       public            postgres    false    345            �           1259    26610    idx_75636a680f2188e6    INDEX     R   CREATE INDEX idx_75636a680f2188e6 ON public.mt_sdm_jabatan USING btree (id_unit);
 (   DROP INDEX public.idx_75636a680f2188e6;
       public            postgres    false    345                       1259    26859    idx_75e45f19b53f0358    INDEX     `   CREATE INDEX idx_75e45f19b53f0358 ON public.pemeriksaan USING btree (id_jenis_audit_eksternal);
 (   DROP INDEX public.idx_75e45f19b53f0358;
       public            postgres    false    388            �           1259    27509    idx_762fd254a922514f    INDEX     P   CREATE INDEX idx_762fd254a922514f ON public.risk_review USING btree (group_id);
 (   DROP INDEX public.idx_762fd254a922514f;
       public            postgres    false    509            �           1259    27402    idx_76b99330b9f77b52    INDEX     S   CREATE INDEX idx_76b99330b9f77b52 ON public.risk_mitigasi USING btree (id_risiko);
 (   DROP INDEX public.idx_76b99330b9f77b52;
       public            postgres    false    491            �           1259    26774    idx_7736cf0ccb33d10a    INDEX     [   CREATE INDEX idx_7736cf0ccb33d10a ON public.opp_peluang USING btree (id_status_pengajuan);
 (   DROP INDEX public.idx_7736cf0ccb33d10a;
       public            postgres    false    376            �           1259    26795    idx_7747a5521a808ff8    INDEX     X   CREATE INDEX idx_7747a5521a808ff8 ON public.opp_peluang_files USING btree (id_peluang);
 (   DROP INDEX public.idx_7747a5521a808ff8;
       public            postgres    false    378            T           1259    26304    idx_78d856f8665d949d    INDEX     O   CREATE INDEX idx_78d856f8665d949d ON public.mt_kriteria USING btree (id_unit);
 (   DROP INDEX public.idx_78d856f8665d949d;
       public            postgres    false    276            �           1259    26507    idx_78ea42f2637132e8    INDEX     d   CREATE INDEX idx_78ea42f2637132e8 ON public.mt_risk_efektifitas_bobot USING btree (id_efektifitas);
 (   DROP INDEX public.idx_78ea42f2637132e8;
       public            postgres    false    323            �           1259    27546    idx_7a86dd5236180095    INDEX     T   CREATE INDEX idx_7a86dd5236180095 ON public.risk_risiko USING btree (id_taksonomi);
 (   DROP INDEX public.idx_7a86dd5236180095;
       public            postgres    false    511            Y           1259    27780    idx_7d07109881bcd77e    INDEX     X   CREATE INDEX idx_7d07109881bcd77e ON public.rtm_urian_unit USING btree (id_rtm_uraian);
 (   DROP INDEX public.idx_7d07109881bcd77e;
       public            postgres    false    550            0           1259    26950    idx_7d817b6efbaa1aa0    INDEX     d   CREATE INDEX idx_7d817b6efbaa1aa0 ON public.pemeriksaan_temuan USING btree (id_pemeriksaan_detail);
 (   DROP INDEX public.idx_7d817b6efbaa1aa0;
       public            postgres    false    406            M           1259    27753    idx_7e6f623c6ba2dd57    INDEX     S   CREATE INDEX idx_7e6f623c6ba2dd57 ON public.rtm_uraian USING btree (id_jenis_rtm);
 (   DROP INDEX public.idx_7e6f623c6ba2dd57;
       public            postgres    false    546                       1259    26020    idx_7e83fc49342a8178    INDEX     U   CREATE INDEX idx_7e83fc49342a8178 ON public.comp_kebutuhan USING btree (id_dokumen);
 (   DROP INDEX public.idx_7e83fc49342a8178;
       public            postgres    false    216            �           1259    27542    idx_80410b17359054da    INDEX     `   CREATE INDEX idx_80410b17359054da ON public.risk_risiko USING btree (current_risk_kemungkinan);
 (   DROP INDEX public.idx_80410b17359054da;
       public            postgres    false    511            �           1259    27376    idx_8296f20416a82c19    INDEX     Q   CREATE INDEX idx_8296f20416a82c19 ON public.risk_kri_hasil USING btree (id_kri);
 (   DROP INDEX public.idx_8296f20416a82c19;
       public            postgres    false    488                       1259    26845    idx_836fb91f11abb840    INDEX     [   CREATE INDEX idx_836fb91f11abb840 ON public.opp_scorecard_view USING btree (id_scorecard);
 (   DROP INDEX public.idx_836fb91f11abb840;
       public            postgres    false    386            �           1259    27416    idx_84b626e5158001e7    INDEX     _   CREATE INDEX idx_84b626e5158001e7 ON public.risk_mitigasi_efektif USING btree (id_periode_tw);
 (   DROP INDEX public.idx_84b626e5158001e7;
       public            postgres    false    493            �           1259    26772    idx_8672facc3639d5ba    INDEX     `   CREATE INDEX idx_8672facc3639d5ba ON public.opp_peluang USING btree (control_dampak_penurunan);
 (   DROP INDEX public.idx_8672facc3639d5ba;
       public            postgres    false    376            �           1259    27272    idx_86990cd7370c157c    INDEX     i   CREATE INDEX idx_86990cd7370c157c ON public.risk_control_efektifitas_files USING btree (id_efektifitas);
 (   DROP INDEX public.idx_86990cd7370c157c;
       public            postgres    false    466            G           1259    27016    idx_883cc479d7f411c5    INDEX     x   CREATE INDEX idx_883cc479d7f411c5 ON public.pemeriksaan_tindak_lanjut_files USING btree (id_pemeriksaan_tindak_lanjut);
 (   DROP INDEX public.idx_883cc479d7f411c5;
       public            postgres    false    418            �           1259    26616    idx_8845b010f63178d2    INDEX     T   CREATE INDEX idx_8845b010f63178d2 ON public.mt_sdm_jabatan USING btree (id_subbid);
 (   DROP INDEX public.idx_8845b010f63178d2;
       public            postgres    false    345            �           1259    27405    idx_88ae8cacabef64bc    INDEX     T   CREATE INDEX idx_88ae8cacabef64bc ON public.risk_mitigasi USING btree (id_jabatan);
 (   DROP INDEX public.idx_88ae8cacabef64bc;
       public            postgres    false    491            �           1259    27277    idx_88f1a0d7a2e4ec57    INDEX     Z   CREATE INDEX idx_88f1a0d7a2e4ec57 ON public.risk_control_risiko USING btree (id_control);
 (   DROP INDEX public.idx_88f1a0d7a2e4ec57;
       public            postgres    false    467            \           1259    27078    idx_89e7f60ee593db64    INDEX     Y   CREATE INDEX idx_89e7f60ee593db64 ON public.penilaian_periode USING btree (id_interval);
 (   DROP INDEX public.idx_89e7f60ee593db64;
       public            postgres    false    431            v           1259    26401    idx_8bc018fb3d9e1641    INDEX     `   CREATE INDEX idx_8bc018fb3d9e1641 ON public.mt_pb_nama_proses USING btree (id_kelompok_proses);
 (   DROP INDEX public.idx_8bc018fb3d9e1641;
       public            postgres    false    298            K           1259    27022    idx_8bef5a2e4f81fb91    INDEX     w   CREATE INDEX idx_8bef5a2e4f81fb91 ON public.pemeriksaan_tindak_lanjut_saran USING btree (id_pemeriksaan_temuan_saran);
 (   DROP INDEX public.idx_8bef5a2e4f81fb91;
       public            postgres    false    419            �           1259    27368    idx_8c5406e216377989    INDEX     N   CREATE INDEX idx_8c5406e216377989 ON public.risk_kri USING btree (id_risiko);
 (   DROP INDEX public.idx_8c5406e216377989;
       public            postgres    false    486            �           1259    27415    idx_8cdac1f81ef605e7    INDEX     _   CREATE INDEX idx_8cdac1f81ef605e7 ON public.risk_mitigasi_efektif USING btree (id_pengukuran);
 (   DROP INDEX public.idx_8cdac1f81ef605e7;
       public            postgres    false    493            �           1259    26664    idx_8ce61513454d45d3    INDEX     S   CREATE INDEX idx_8ce61513454d45d3 ON public.mt_sdm_sub_unit USING btree (id_unit);
 (   DROP INDEX public.idx_8ce61513454d45d3;
       public            postgres    false    355            �           1259    27424    idx_8e587193bf77562c    INDEX     h   CREATE INDEX idx_8e587193bf77562c ON public.risk_mitigasi_efektif_m USING btree (id_efektif_m_jawaban);
 (   DROP INDEX public.idx_8e587193bf77562c;
       public            postgres    false    494                       1259    27617    idx_8ec38d399fec2e9c    INDEX     Z   CREATE INDEX idx_8ec38d399fec2e9c ON public.risk_sasaran USING btree (id_sasaran_parent);
 (   DROP INDEX public.idx_8ec38d399fec2e9c;
       public            postgres    false    523            )           1259    26141    idx_9012b119edfabc40    INDEX     P   CREATE INDEX idx_9012b119edfabc40 ON public.kpi_target USING btree (id_subbid);
 (   DROP INDEX public.idx_9012b119edfabc40;
       public            postgres    false    238            j           1259    27129    idx_90cf3fc965298639    INDEX     Y   CREATE INDEX idx_90cf3fc965298639 ON public.public_sys_group_menu USING btree (menu_id);
 (   DROP INDEX public.idx_90cf3fc965298639;
       public            postgres    false    442            �           1259    27406    idx_9394699b2dbce2c6    INDEX     W   CREATE INDEX idx_9394699b2dbce2c6 ON public.risk_mitigasi USING btree (id_pengukuran);
 (   DROP INDEX public.idx_9394699b2dbce2c6;
       public            postgres    false    491                       1259    26021    idx_94acfd2188941675    INDEX     V   CREATE INDEX idx_94acfd2188941675 ON public.comp_kebutuhan USING btree (id_interval);
 (   DROP INDEX public.idx_94acfd2188941675;
       public            postgres    false    216            �           1259    26775    idx_9599dd9efe6afb4c    INDEX     ^   CREATE INDEX idx_9599dd9efe6afb4c ON public.opp_peluang USING btree (residual_target_dampak);
 (   DROP INDEX public.idx_9599dd9efe6afb4c;
       public            postgres    false    376            #           1259    27646    idx_985ce873852eee3a    INDEX     W   CREATE INDEX idx_985ce873852eee3a ON public.risk_scorecard USING btree (id_visi_misi);
 (   DROP INDEX public.idx_985ce873852eee3a;
       public            postgres    false    527            �           1259    26776    idx_9a235bc68324a849    INDEX     c   CREATE INDEX idx_9a235bc68324a849 ON public.opp_peluang USING btree (residual_target_kemungkinan);
 (   DROP INDEX public.idx_9a235bc68324a849;
       public            postgres    false    376            �           1259    27525    idx_9a4b0efb0ffbff61    INDEX     R   CREATE INDEX idx_9a4b0efb0ffbff61 ON public.risk_risiko USING btree (nomor_asli);
 (   DROP INDEX public.idx_9a4b0efb0ffbff61;
       public            postgres    false    511            �           1259    27276    idx_9b643bd8aabc2f8b    INDEX     Y   CREATE INDEX idx_9b643bd8aabc2f8b ON public.risk_control_risiko USING btree (id_risiko);
 (   DROP INDEX public.idx_9b643bd8aabc2f8b;
       public            postgres    false    467            �           1259    26769    idx_9c9b0dd42669faa1    INDEX     Y   CREATE INDEX idx_9c9b0dd42669faa1 ON public.opp_peluang USING btree (id_taksonomi_area);
 (   DROP INDEX public.idx_9c9b0dd42669faa1;
       public            postgres    false    376            W           1259    26309    idx_9cb5a079a797899f    INDEX     g   CREATE INDEX idx_9cb5a079a797899f ON public.mt_kriteria_link USING btree (id_kriteria1, id_kriteria2);
 (   DROP INDEX public.idx_9cb5a079a797899f;
       public            postgres    false    277    277            �           1259    26615    idx_9d8d6d200733401c    INDEX     U   CREATE INDEX idx_9d8d6d200733401c ON public.mt_sdm_jabatan USING btree (id_dit_bid);
 (   DROP INDEX public.idx_9d8d6d200733401c;
       public            postgres    false    345            �           1259    26649    idx_9dc3df536f26aed6    INDEX     P   CREATE INDEX idx_9dc3df536f26aed6 ON public.mt_sdm_struktur USING btree (kode);
 (   DROP INDEX public.idx_9dc3df536f26aed6;
       public            postgres    false    352            w           1259    26411    idx_9e9edba3073a5b56    INDEX     h   CREATE INDEX idx_9e9edba3073a5b56 ON public.mt_pemeriksaan_checklist USING btree (id_checklist_parent);
 (   DROP INDEX public.idx_9e9edba3073a5b56;
       public            postgres    false    300                       1259    27561    idx_9f2587860f8037f4    INDEX     Y   CREATE INDEX idx_9f2587860f8037f4 ON public.risk_risiko_current USING btree (id_dampak);
 (   DROP INDEX public.idx_9f2587860f8037f4;
       public            postgres    false    513            C           1259    27723    idx_9f6de17436ce1e6f    INDEX     C   CREATE INDEX idx_9f6de17436ce1e6f ON public.rtm USING btree (rkt);
 (   DROP INDEX public.idx_9f6de17436ce1e6f;
       public            postgres    false    540            �           1259    26612    idx_a14505891dc58cc5    INDEX     V   CREATE INDEX idx_a14505891dc58cc5 ON public.mt_sdm_jabatan USING btree (id_kategori);
 (   DROP INDEX public.idx_a14505891dc58cc5;
       public            postgres    false    345            1           1259    26955    idx_a1aa2eaeae47d47a    INDEX     d   CREATE INDEX idx_a1aa2eaeae47d47a ON public.pemeriksaan_temuan USING btree (id_bidang_pemeriksaan);
 (   DROP INDEX public.idx_a1aa2eaeae47d47a;
       public            postgres    false    406                       1259    26860    idx_a1e2d59282f11f14    INDEX     N   CREATE INDEX idx_a1e2d59282f11f14 ON public.pemeriksaan USING btree (id_spn);
 (   DROP INDEX public.idx_a1e2d59282f11f14;
       public            postgres    false    388            �           1259    27304    idx_a1f194ae0403a2b0    INDEX     ]   CREATE INDEX idx_a1f194ae0403a2b0 ON public.risk_integrasi_internal USING btree (id_risiko);
 (   DROP INDEX public.idx_a1f194ae0403a2b0;
       public            postgres    false    473            �           1259    27528    idx_a23a1b278c2a99ef    INDEX     \   CREATE INDEX idx_a23a1b278c2a99ef ON public.risk_risiko USING btree (id_interval_anggaran);
 (   DROP INDEX public.idx_a23a1b278c2a99ef;
       public            postgres    false    511            2           1259    26951    idx_a402e2dfb0fb30bf    INDEX     ]   CREATE INDEX idx_a402e2dfb0fb30bf ON public.pemeriksaan_temuan USING btree (id_pemeriksaan);
 (   DROP INDEX public.idx_a402e2dfb0fb30bf;
       public            postgres    false    406            �           1259    27448    idx_a58f304acd4701b3    INDEX     ]   CREATE INDEX idx_a58f304acd4701b3 ON public.risk_mitigasi_program USING btree (id_mitigasi);
 (   DROP INDEX public.idx_a58f304acd4701b3;
       public            postgres    false    498            &           1259    26913    idx_a6c4d560c593f42d    INDEX     a   CREATE INDEX idx_a6c4d560c593f42d ON public.pemeriksaan_peminjaman USING btree (id_pemeriksaan);
 (   DROP INDEX public.idx_a6c4d560c593f42d;
       public            postgres    false    398                       1259    27590    idx_a7260b77cbf63c4c    INDEX     R   CREATE INDEX idx_a7260b77cbf63c4c ON public.risk_risiko_kpi USING btree (id_kpi);
 (   DROP INDEX public.idx_a7260b77cbf63c4c;
       public            postgres    false    518            1           1259    27674    idx_a7f132258832aa05    INDEX     \   CREATE INDEX idx_a7f132258832aa05 ON public.risk_scorecard_view USING btree (id_scorecard);
 (   DROP INDEX public.idx_a7f132258832aa05;
       public            postgres    false    531            X           1259    26308    idx_a8e257d74b31cdac    INDEX     Y   CREATE INDEX idx_a8e257d74b31cdac ON public.mt_kriteria_link USING btree (id_kriteria2);
 (   DROP INDEX public.idx_a8e257d74b31cdac;
       public            postgres    false    277            :           1259    26976    idx_ad7462b816ff26d7    INDEX     j   CREATE INDEX idx_ad7462b816ff26d7 ON public.pemeriksaan_temuan_files USING btree (id_pemeriksaan_temuan);
 (   DROP INDEX public.idx_ad7462b816ff26d7;
       public            postgres    false    410            �           1259    27403    idx_adbe7e42aa0a0ecb    INDEX     \   CREATE INDEX idx_adbe7e42aa0a0ecb ON public.risk_mitigasi USING btree (id_status_progress);
 (   DROP INDEX public.idx_adbe7e42aa0a0ecb;
       public            postgres    false    491            @           1259    26994    idx_ae05985b96fe1a27    INDEX     a   CREATE INDEX idx_ae05985b96fe1a27 ON public.pemeriksaan_tim USING btree (id_bidang_pemeriksaan);
 (   DROP INDEX public.idx_ae05985b96fe1a27;
       public            postgres    false    414            m           1259    27130    idx_ae62ea9576c00d4c    INDEX     Z   CREATE INDEX idx_ae62ea9576c00d4c ON public.public_sys_group_menu USING btree (group_id);
 (   DROP INDEX public.idx_ae62ea9576c00d4c;
       public            postgres    false    442            �           1259    26477    idx_aec6d58c4ad66c00    INDEX     `   CREATE INDEX idx_aec6d58c4ad66c00 ON public.mt_risk_efektif_m_bobot USING btree (id_efektif_m);
 (   DROP INDEX public.idx_aec6d58c4ad66c00;
       public            postgres    false    316                       1259    26032    idx_b2539d0564c92b7f    INDEX     ^   CREATE INDEX idx_b2539d0564c92b7f ON public.comp_penilaian USING btree (id_status_penilaian);
 (   DROP INDEX public.idx_b2539d0564c92b7f;
       public            postgres    false    218            w           1259    27175    idx_b6e1f325f5527a40    INDEX     [   CREATE INDEX idx_b6e1f325f5527a40 ON public.public_sys_notification USING btree (id_user);
 (   DROP INDEX public.idx_b6e1f325f5527a40;
       public            postgres    false    450            �           1259    26771    idx_b702bbb7de3cce91    INDEX     [   CREATE INDEX idx_b702bbb7de3cce91 ON public.opp_peluang USING btree (inheren_kemungkinan);
 (   DROP INDEX public.idx_b702bbb7de3cce91;
       public            postgres    false    376            �           1259    27414    idx_b82d24f4063a3f09    INDEX     ]   CREATE INDEX idx_b82d24f4063a3f09 ON public.risk_mitigasi_efektif USING btree (id_mitigasi);
 (   DROP INDEX public.idx_b82d24f4063a3f09;
       public            postgres    false    493            *           1259    26142    idx_b9cef35af6b192f9    INDEX     N   CREATE INDEX idx_b9cef35af6b192f9 ON public.kpi_target USING btree (id_unit);
 (   DROP INDEX public.idx_b9cef35af6b192f9;
       public            postgres    false    238            �           1259    27527    idx_bde2cffff85b56e2    INDEX     Y   CREATE INDEX idx_bde2cffff85b56e2 ON public.risk_risiko USING btree (id_taksonomi_area);
 (   DROP INDEX public.idx_bde2cffff85b56e2;
       public            postgres    false    511            �           1259    26568    idx_c3e3b16e7be1fb1c    INDEX     e   CREATE INDEX idx_c3e3b16e7be1fb1c ON public.mt_risk_taksonomi_appetite USING btree (id_kemungkinan);
 (   DROP INDEX public.idx_c3e3b16e7be1fb1c;
       public            postgres    false    336            �           1259    26554    idx_c43e50359b65112e    INDEX     U   CREATE INDEX idx_c43e50359b65112e ON public.mt_risk_matrix USING btree (id_tingkat);
 (   DROP INDEX public.idx_c43e50359b65112e;
       public            postgres    false    333            D           1259    27005    idx_c58e848a4f4e8176    INDEX     c   CREATE INDEX idx_c58e848a4f4e8176 ON public.pemeriksaan_tindak_lanjut USING btree (id_periode_tw);
 (   DROP INDEX public.idx_c58e848a4f4e8176;
       public            postgres    false    416                       1259    26839    idx_c8101c9132a693c4    INDEX     Y   CREATE INDEX idx_c8101c9132a693c4 ON public.opp_scorecard_user USING btree (id_jabatan);
 (   DROP INDEX public.idx_c8101c9132a693c4;
       public            postgres    false    385            �           1259    27540    idx_c8ba1230f8b5afbc    INDEX     R   CREATE INDEX idx_c8ba1230f8b5afbc ON public.risk_risiko USING btree (id_sasaran);
 (   DROP INDEX public.idx_c8ba1230f8b5afbc;
       public            postgres    false    511            .           1259    27668    idx_ca5dbaef463bd325    INDEX     Z   CREATE INDEX idx_ca5dbaef463bd325 ON public.risk_scorecard_user USING btree (id_jabatan);
 (   DROP INDEX public.idx_ca5dbaef463bd325;
       public            postgres    false    530                       1259    27559    idx_cb38c2333a3ded00    INDEX     Y   CREATE INDEX idx_cb38c2333a3ded00 ON public.risk_risiko_current USING btree (id_risiko);
 (   DROP INDEX public.idx_cb38c2333a3ded00;
       public            postgres    false    513            �           1259    27508    idx_cc8716382a953655    INDEX     Q   CREATE INDEX idx_cc8716382a953655 ON public.risk_review USING btree (id_risiko);
 (   DROP INDEX public.idx_cc8716382a953655;
       public            postgres    false    509            �           1259    27539    idx_cd0e9e00491ab330    INDEX     e   CREATE INDEX idx_cd0e9e00491ab330 ON public.risk_risiko USING btree (residual_kemungkinan_evaluasi);
 (   DROP INDEX public.idx_cd0e9e00491ab330;
       public            postgres    false    511            �           1259    27385    idx_cd1c92fd3a375044    INDEX     Q   CREATE INDEX idx_cd1c92fd3a375044 ON public.risk_log USING btree (id_scorecard);
 (   DROP INDEX public.idx_cd1c92fd3a375044;
       public            postgres    false    489                       1259    26065    idx_cdbe1edd31129613    INDEX     T   CREATE INDEX idx_cdbe1edd31129613 ON public.dokumen USING btree (id_diupload_oleh);
 (   DROP INDEX public.idx_cdbe1edd31129613;
       public            postgres    false    224            �           1259    27473    idx_ce8007742ffb4899    INDEX     Z   CREATE INDEX idx_ce8007742ffb4899 ON public.risk_mitigasi_risiko USING btree (id_risiko);
 (   DROP INDEX public.idx_ce8007742ffb4899;
       public            postgres    false    502            
           1259    26823    idx_cf4d0987f7f848c7    INDEX     Q   CREATE INDEX idx_cf4d0987f7f848c7 ON public.opp_scorecard USING btree (id_unit);
 (   DROP INDEX public.idx_cf4d0987f7f848c7;
       public            postgres    false    382            )           1259    27662    idx_d231c9f789ea409a    INDEX     ]   CREATE INDEX idx_d231c9f789ea409a ON public.risk_scorecard_files USING btree (id_scorecard);
 (   DROP INDEX public.idx_d231c9f789ea409a;
       public            postgres    false    529            #           1259    26894    idx_d23a8bcdf19ef3b6    INDEX     Y   CREATE INDEX idx_d23a8bcdf19ef3b6 ON public.pemeriksaan_detail USING btree (id_dokumen);
 (   DROP INDEX public.idx_d23a8bcdf19ef3b6;
       public            postgres    false    394            q           1259    27146    idx_d25e469ba9886195    INDEX     U   CREATE INDEX idx_d25e469ba9886195 ON public.public_sys_menu USING btree (parent_id);
 (   DROP INDEX public.idx_d25e469ba9886195;
       public            postgres    false    445            �           1259    27467    idx_d2dac04a69865427    INDEX     ^   CREATE INDEX idx_d2dac04a69865427 ON public.risk_mitigasi_progress USING btree (id_mitigasi);
 (   DROP INDEX public.idx_d2dac04a69865427;
       public            postgres    false    501            s           1259    26393    idx_d42487a1c7e9d1eb    INDEX     ]   CREATE INDEX idx_d42487a1c7e9d1eb ON public.mt_pb_kelompok_proses USING btree (id_kategori);
 (   DROP INDEX public.idx_d42487a1c7e9d1eb;
       public            postgres    false    296                       1259    27566    idx_d428cabbbe2d88e1    INDEX     X   CREATE INDEX idx_d428cabbbe2d88e1 ON public.risk_risiko_dampak USING btree (id_risiko);
 (   DROP INDEX public.idx_d428cabbbe2d88e1;
       public            postgres    false    514            �           1259    27271    idx_d529837e2509143e    INDEX     e   CREATE INDEX idx_d529837e2509143e ON public.risk_control_efektifitas_files USING btree (id_control);
 (   DROP INDEX public.idx_d529837e2509143e;
       public            postgres    false    466                       1259    26861    idx_d53cc3b1d9d0a786    INDEX     Q   CREATE INDEX idx_d53cc3b1d9d0a786 ON public.pemeriksaan USING btree (id_status);
 (   DROP INDEX public.idx_d53cc3b1d9d0a786;
       public            postgres    false    388            �           1259    27535    idx_d76e82e12c897574    INDEX     S   CREATE INDEX idx_d76e82e12c897574 ON public.risk_risiko USING btree (id_kegiatan);
 (   DROP INDEX public.idx_d76e82e12c897574;
       public            postgres    false    511            �           1259    26732    idx_d7f15a1db2902dfc    INDEX     x   CREATE INDEX idx_d7f15a1db2902dfc ON public.mt_tingkat_agregasi_risiko USING btree (id_tingkat_agregasi_risiko_parent);
 (   DROP INDEX public.idx_d7f15a1db2902dfc;
       public            postgres    false    371            �           1259    26782    idx_d8a80dd905f9afbf    INDEX     Z   CREATE INDEX idx_d8a80dd905f9afbf ON public.opp_peluang USING btree (id_peluang_sebelum);
 (   DROP INDEX public.idx_d8a80dd905f9afbf;
       public            postgres    false    376            =           1259    27701    idx_d91c320bbc1441e5    INDEX     N   CREATE INDEX idx_d91c320bbc1441e5 ON public.risk_task USING btree (group_id);
 (   DROP INDEX public.idx_d91c320bbc1441e5;
       public            postgres    false    535            �           1259    27383    idx_db32d32560feb731    INDEX     N   CREATE INDEX idx_db32d32560feb731 ON public.risk_log USING btree (id_risiko);
 (   DROP INDEX public.idx_db32d32560feb731;
       public            postgres    false    489            +           1259    26140    idx_db452f9b607586cb    INDEX     Q   CREATE INDEX idx_db452f9b607586cb ON public.kpi_target USING btree (id_dit_bid);
 (   DROP INDEX public.idx_db452f9b607586cb;
       public            postgres    false    238            �           1259    27206    idx_dc47dffcb8df0b0f    INDEX     \   CREATE INDEX idx_dc47dffcb8df0b0f ON public.public_sys_user_group USING btree (id_jabatan);
 (   DROP INDEX public.idx_dc47dffcb8df0b0f;
       public            postgres    false    455            U           1259    27056    idx_dc8edc39dd6bb983    INDEX     X   CREATE INDEX idx_dc8edc39dd6bb983 ON public.penilaian_files USING btree (id_penilaian);
 (   DROP INDEX public.idx_dc8edc39dd6bb983;
       public            postgres    false    426            �           1259    26784    idx_df9200642f80ce2e    INDEX     T   CREATE INDEX idx_df9200642f80ce2e ON public.opp_peluang USING btree (id_taksonomi);
 (   DROP INDEX public.idx_df9200642f80ce2e;
       public            postgres    false    376            &           1259    27649    idx_e0149170b44f5d44    INDEX     V   CREATE INDEX idx_e0149170b44f5d44 ON public.risk_scorecard USING btree (id_struktur);
 (   DROP INDEX public.idx_e0149170b44f5d44;
       public            postgres    false    527            �           1259    27549    idx_e062935b4461481e    INDEX     ^   CREATE INDEX idx_e062935b4461481e ON public.risk_risiko USING btree (id_taksonomi_objective);
 (   DROP INDEX public.idx_e062935b4461481e;
       public            postgres    false    511            �           1259    27466    idx_e0957cf11972f457    INDEX     `   CREATE INDEX idx_e0957cf11972f457 ON public.risk_mitigasi_progress USING btree (id_periode_tw);
 (   DROP INDEX public.idx_e0957cf11972f457;
       public            postgres    false    501            >           1259    27693    idx_e0b4e634a95a5dbb    INDEX     L   CREATE INDEX idx_e0b4e634a95a5dbb ON public.risk_task USING btree (status);
 (   DROP INDEX public.idx_e0b4e634a95a5dbb;
       public            postgres    false    535            �           1259    27377    idx_e1813bc2d19d2617    INDEX     X   CREATE INDEX idx_e1813bc2d19d2617 ON public.risk_kri_hasil USING btree (id_periode_tw);
 (   DROP INDEX public.idx_e1813bc2d19d2617;
       public            postgres    false    488            �           1259    27251    idx_e184237c7b70710e    INDEX     V   CREATE INDEX idx_e184237c7b70710e ON public.risk_control USING btree (id_pengukuran);
 (   DROP INDEX public.idx_e184237c7b70710e;
       public            postgres    false    463            '           1259    27650    idx_e2aaeb4569db3840    INDEX     ^   CREATE INDEX idx_e2aaeb4569db3840 ON public.risk_scorecard USING btree (id_parent_scorecard);
 (   DROP INDEX public.idx_e2aaeb4569db3840;
       public            postgres    false    527            �           1259    27247    idx_e34a8235b8002f7b    INDEX     Z   CREATE INDEX idx_e34a8235b8002f7b ON public.risk_control USING btree (id_control_parent);
 (   DROP INDEX public.idx_e34a8235b8002f7b;
       public            postgres    false    463            �           1259    27248    idx_e5bbf7c461cde3b9    INDEX     [   CREATE INDEX idx_e5bbf7c461cde3b9 ON public.risk_control USING btree (id_mitigasi_sumber);
 (   DROP INDEX public.idx_e5bbf7c461cde3b9;
       public            postgres    false    463            �           1259    26768    idx_e689eb39e45bf789    INDEX     T   CREATE INDEX idx_e689eb39e45bf789 ON public.opp_peluang USING btree (id_scorecard);
 (   DROP INDEX public.idx_e689eb39e45bf789;
       public            postgres    false    376                       1259    27629    idx_e6eb6c11647a8c57    INDEX     W   CREATE INDEX idx_e6eb6c11647a8c57 ON public.risk_sasaran_pic USING btree (id_jabatan);
 (   DROP INDEX public.idx_e6eb6c11647a8c57;
       public            postgres    false    525            �           1259    26656    idx_e7094b3bb2205fee    INDEX     g   CREATE INDEX idx_e7094b3bb2205fee ON public.mt_sdm_struktur_history USING btree (id_struktur_history);
 (   DROP INDEX public.idx_e7094b3bb2205fee;
       public            postgres    false    353            V           1259    27774    idx_eb88f52b63374f59    INDEX     R   CREATE INDEX idx_eb88f52b63374f59 ON public.rtm_uraian_link USING btree (id_rtm);
 (   DROP INDEX public.idx_eb88f52b63374f59;
       public            postgres    false    549            �           1259    27474    idx_ec16742ff167954e    INDEX     \   CREATE INDEX idx_ec16742ff167954e ON public.risk_mitigasi_risiko USING btree (id_mitigasi);
 (   DROP INDEX public.idx_ec16742ff167954e;
       public            postgres    false    502            �           1259    27465    idx_ec7b60d277b81677    INDEX     \   CREATE INDEX idx_ec7b60d277b81677 ON public.risk_mitigasi_progress USING btree (id_risiko);
 (   DROP INDEX public.idx_ec7b60d277b81677;
       public            postgres    false    501            �           1259    27246    idx_eccbd7fb09b2ece6    INDEX     R   CREATE INDEX idx_eccbd7fb09b2ece6 ON public.risk_control USING btree (id_risiko);
 (   DROP INDEX public.idx_eccbd7fb09b2ece6;
       public            postgres    false    463            �           1259    27291    idx_ed0b563467e43177    INDEX     X   CREATE INDEX idx_ed0b563467e43177 ON public.risk_dampak_risiko USING btree (id_risiko);
 (   DROP INDEX public.idx_ed0b563467e43177;
       public            postgres    false    470                       1259    27595    idx_ee469418d3ab8d21    INDEX     a   CREATE INDEX idx_ee469418d3ab8d21 ON public.risk_risiko_penyebab USING btree (id_risk_penyebab);
 (   DROP INDEX public.idx_ee469418d3ab8d21;
       public            postgres    false    519                       1259    27567    idx_ee47b26ca966233e    INDEX     ]   CREATE INDEX idx_ee47b26ca966233e ON public.risk_risiko_dampak USING btree (id_risk_dampak);
 (   DROP INDEX public.idx_ee47b26ca966233e;
       public            postgres    false    514            ?           1259    26986    idx_eecc58f2d163e030    INDEX     j   CREATE INDEX idx_eecc58f2d163e030 ON public.pemeriksaan_temuan_saran USING btree (id_pemeriksaan_temuan);
 (   DROP INDEX public.idx_eecc58f2d163e030;
       public            postgres    false    412            �           1259    27532    idx_ef16de7e98a3bab3    INDEX     `   CREATE INDEX idx_ef16de7e98a3bab3 ON public.risk_risiko USING btree (control_dampak_penurunan);
 (   DROP INDEX public.idx_ef16de7e98a3bab3;
       public            postgres    false    511            �           1259    27244    idx_f04e261b166abe5b    INDEX     S   CREATE INDEX idx_f04e261b166abe5b ON public.risk_control USING btree (id_dokumen);
 (   DROP INDEX public.idx_f04e261b166abe5b;
       public            postgres    false    463                       1259    26090    idx_f0dba45d61f61110    INDEX     S   CREATE INDEX idx_f0dba45d61f61110 ON public.dokumen_unit USING btree (id_dokumen);
 (   DROP INDEX public.idx_f0dba45d61f61110;
       public            postgres    false    229            �           1259    27543    idx_f2a5688d01f097a8    INDEX     Z   CREATE INDEX idx_f2a5688d01f097a8 ON public.risk_risiko USING btree (id_kriteria_dampak);
 (   DROP INDEX public.idx_f2a5688d01f097a8;
       public            postgres    false    511            (           1259    27645    idx_f325001d4bfbd002    INDEX     ^   CREATE INDEX idx_f325001d4bfbd002 ON public.risk_scorecard USING btree (id_status_pengajuan);
 (   DROP INDEX public.idx_f325001d4bfbd002;
       public            postgres    false    527                       1259    26838    idx_f3f35c2e200bdf65    INDEX     [   CREATE INDEX idx_f3f35c2e200bdf65 ON public.opp_scorecard_user USING btree (id_scorecard);
 (   DROP INDEX public.idx_f3f35c2e200bdf65;
       public            postgres    false    385            �           1259    27320    idx_f50e78b81058cf60    INDEX     T   CREATE INDEX idx_f50e78b81058cf60 ON public.risk_kegiatan_kpi USING btree (id_kpi);
 (   DROP INDEX public.idx_f50e78b81058cf60;
       public            postgres    false    476                       1259    26045    idx_f5b80c12d6d2dcba    INDEX     b   CREATE INDEX idx_f5b80c12d6d2dcba ON public.comp_penilaian_files USING btree (id_comp_penilaian);
 (   DROP INDEX public.idx_f5b80c12d6d2dcba;
       public            postgres    false    220            5           1259    26954    idx_f6fe07ed0a23e84c    INDEX     Y   CREATE INDEX idx_f6fe07ed0a23e84c ON public.pemeriksaan_temuan USING btree (id_dokumen);
 (   DROP INDEX public.idx_f6fe07ed0a23e84c;
       public            postgres    false    406            ]           1259    27077    idx_f7f221986c043de7    INDEX     Y   CREATE INDEX idx_f7f221986c043de7 ON public.penilaian_periode USING btree (id_kriteria);
 (   DROP INDEX public.idx_f7f221986c043de7;
       public            postgres    false    431            9           1259    26965    idx_fb5141994c5bf736    INDEX     l   CREATE INDEX idx_fb5141994c5bf736 ON public.pemeriksaan_temuan_diskusi USING btree (id_pemeriksaan_temuan);
 (   DROP INDEX public.idx_fb5141994c5bf736;
       public            postgres    false    408                       1259    27562    idx_fd1a0766a1f5942a    INDEX     ]   CREATE INDEX idx_fd1a0766a1f5942a ON public.risk_risiko_current USING btree (id_periode_tw);
 (   DROP INDEX public.idx_fd1a0766a1f5942a;
       public            postgres    false    513            �           1259    26547    idx_fd8ed3810e104e72    INDEX     d   CREATE INDEX idx_fd8ed3810e104e72 ON public.mt_risk_kriteria_dampak_detail USING btree (id_dampak);
 (   DROP INDEX public.idx_fd8ed3810e104e72;
       public            postgres    false    332                       1259    26858    idx_feb5e3cb9bef29a4    INDEX     Q   CREATE INDEX idx_feb5e3cb9bef29a4 ON public.pemeriksaan USING btree (id_subbid);
 (   DROP INDEX public.idx_feb5e3cb9bef29a4;
       public            postgres    false    388            6           1259    26953    idx_ff36d06c69dc4545    INDEX     a   CREATE INDEX idx_ff36d06c69dc4545 ON public.pemeriksaan_temuan USING btree (id_jabatan_auditee);
 (   DROP INDEX public.idx_ff36d06c69dc4545;
       public            postgres    false    406            �           2606    28450 3   pemeriksaan_tindak_lanjut_files fk_007104dd2506fc5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_files
    ADD CONSTRAINT fk_007104dd2506fc5c FOREIGN KEY (id_pemeriksaan_tindak_lanjut) REFERENCES public.pemeriksaan_tindak_lanjut(id_pemeriksaan_tindak_lanjut);
 ]   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_files DROP CONSTRAINT fk_007104dd2506fc5c;
       public          postgres    false    6214    418    416            �           2606    28420 .   pemeriksaan_temuan_diskusi fk_01fb027b7cf52b11    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_diskusi
    ADD CONSTRAINT fk_01fb027b7cf52b11 FOREIGN KEY (id_pemeriksaan_temuan) REFERENCES public.pemeriksaan_temuan(id_pemeriksaan_temuan);
 X   ALTER TABLE ONLY public.pemeriksaan_temuan_diskusi DROP CONSTRAINT fk_01fb027b7cf52b11;
       public          postgres    false    6196    406    408            �           2606    28160 "   mt_sdm_jabatan fk_02330a27fbbfb2ad    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_02330a27fbbfb2ad FOREIGN KEY (id_subbid) REFERENCES public.mt_sdm_subbid(code) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_02330a27fbbfb2ad;
       public          postgres    false    345    356    6095                       2606    28695 !   risk_mitigasi fk_0310b1b7c1e4912b    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi
    ADD CONSTRAINT fk_0310b1b7c1e4912b FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.risk_mitigasi DROP CONSTRAINT fk_0310b1b7c1e4912b;
       public          postgres    false    511    6392    491                       2606    27950     dokumen_unit fk_046a976d76233f25    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen_unit
    ADD CONSTRAINT fk_046a976d76233f25 FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen);
 J   ALTER TABLE ONLY public.dokumen_unit DROP CONSTRAINT fk_046a976d76233f25;
       public          postgres    false    5908    229    224            _           2606    29080    risk_task fk_0552896fa31f1c12    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_0552896fa31f1c12 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_0552896fa31f1c12;
       public          postgres    false    535    511    6392            �           2606    28190    opp_log fk_05747c84cc0d93da    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_log
    ADD CONSTRAINT fk_05747c84cc0d93da FOREIGN KEY (group_id) REFERENCES public.public_sys_group(group_id);
 E   ALTER TABLE ONLY public.opp_log DROP CONSTRAINT fk_05747c84cc0d93da;
       public          postgres    false    439    374    6246            �           2606    28140 "   mt_sdm_jabatan fk_05d8d396e2d49bc0    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_05d8d396e2d49bc0 FOREIGN KEY (id_kategori) REFERENCES public.mt_sdm_kategori(code) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_05d8d396e2d49bc0;
       public          postgres    false    345    6079    347            R           2606    29035 "   risk_scorecard fk_060d894dedc14e34    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_060d894dedc14e34 FOREIGN KEY (id_nama_proses) REFERENCES public.mt_pb_nama_proses(id_nama_proses);
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_060d894dedc14e34;
       public          postgres    false    6005    527    298                       2606    28750 )   risk_mitigasi_program fk_061a51ff0489ae93    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_program
    ADD CONSTRAINT fk_061a51ff0489ae93 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_mitigasi(id_mitigasi) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.risk_mitigasi_program DROP CONSTRAINT fk_061a51ff0489ae93;
       public          postgres    false    498    6330    491            (           2606    28840    risk_risiko fk_07a38ec6fb418775    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_07a38ec6fb418775 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_07a38ec6fb418775;
       public          postgres    false    6068    511    345            )           2606    28820    risk_risiko fk_087a426868d5b4fd    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_087a426868d5b4fd FOREIGN KEY (current_risk_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_087a426868d5b4fd;
       public          postgres    false    511    6023    313            �           2606    28145 "   mt_sdm_jabatan fk_092947400eba30fb    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_092947400eba30fb FOREIGN KEY (id_jenjang) REFERENCES public.mt_sdm_jenjang(code) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_092947400eba30fb;
       public          postgres    false    345    6077    346            �           2606    28270    opp_peluang fk_0c4396a91eae01c0    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_0c4396a91eae01c0 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_0c4396a91eae01c0;
       public          postgres    false    6105    363    376            �           2606    28210    opp_peluang fk_0c581047c1e90131    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_0c581047c1e90131 FOREIGN KEY (current_opp_dampak) REFERENCES public.mt_opp_dampak(id_dampak);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_0c581047c1e90131;
       public          postgres    false    282    376    5982            l           2606    29135    rtm_uraian fk_0d03e014ff4e8d3e    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_uraian
    ADD CONSTRAINT fk_0d03e014ff4e8d3e FOREIGN KEY (id_jenis_rtm) REFERENCES public.mt_jenis_rtm(id_jenis_rtm);
 H   ALTER TABLE ONLY public.rtm_uraian DROP CONSTRAINT fk_0d03e014ff4e8d3e;
       public          postgres    false    546    268    5963            j           2606    29125    rtm_files fk_0e3450dab3ea4871    FK CONSTRAINT     }   ALTER TABLE ONLY public.rtm_files
    ADD CONSTRAINT fk_0e3450dab3ea4871 FOREIGN KEY (id_rtm) REFERENCES public.rtm(id_rtm);
 G   ALTER TABLE ONLY public.rtm_files DROP CONSTRAINT fk_0e3450dab3ea4871;
       public          postgres    false    540    6469    542                       2606    28720 )   risk_mitigasi_efektif fk_0ef860ffb67212b7    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif
    ADD CONSTRAINT fk_0ef860ffb67212b7 FOREIGN KEY (id_pengukuran) REFERENCES public.mt_risk_efektif_m_pengukuran(id_pengukuran);
 S   ALTER TABLE ONLY public.risk_mitigasi_efektif DROP CONSTRAINT fk_0ef860ffb67212b7;
       public          postgres    false    493    320    6031            �           2606    28600     risk_control fk_1118ba431dff32fa    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_1118ba431dff32fa FOREIGN KEY (id_pengukuran) REFERENCES public.mt_risk_efektifitas_pengukuran(id_pengukuran) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_1118ba431dff32fa;
       public          postgres    false    327    6039    463            �           2606    28115 .   mt_risk_taksonomi_appetite fk_1243957c2ce7bc93    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_appetite
    ADD CONSTRAINT fk_1243957c2ce7bc93 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi);
 X   ALTER TABLE ONLY public.mt_risk_taksonomi_appetite DROP CONSTRAINT fk_1243957c2ce7bc93;
       public          postgres    false    335    336    6054            �           2606    28510 +   public_sys_group_action fk_138ffc39ba938ae6    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_group_action
    ADD CONSTRAINT fk_138ffc39ba938ae6 FOREIGN KEY (action_id) REFERENCES public.public_sys_action(action_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.public_sys_group_action DROP CONSTRAINT fk_138ffc39ba938ae6;
       public          postgres    false    440    437    6243                       2606    28735 +   risk_mitigasi_efektif_m fk_13bae691df5bb42e    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif_m
    ADD CONSTRAINT fk_13bae691df5bb42e FOREIGN KEY (id_efektif_m) REFERENCES public.mt_risk_efektif_m(id_efektif_m);
 U   ALTER TABLE ONLY public.risk_mitigasi_efektif_m DROP CONSTRAINT fk_13bae691df5bb42e;
       public          postgres    false    494    6025    315            `           2606    29090    risk_task fk_14b599b999b67984    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_14b599b999b67984 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_mitigasi(id_mitigasi);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_14b599b999b67984;
       public          postgres    false    535    491    6330            S           2606    29010 "   risk_scorecard fk_1727eb15c99762af    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_1727eb15c99762af FOREIGN KEY (id_visi_misi) REFERENCES public.risk_visi_misi(id_visi_misi);
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_1727eb15c99762af;
       public          postgres    false    527    6466    538            �           2606    28295 %   opp_peluang_files fk_1a11a7bcdde66720    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang_files
    ADD CONSTRAINT fk_1a11a7bcdde66720 FOREIGN KEY (id_peluang) REFERENCES public.opp_peluang(id_peluang);
 O   ALTER TABLE ONLY public.opp_peluang_files DROP CONSTRAINT fk_1a11a7bcdde66720;
       public          postgres    false    6142    378    376            �           2606    28575     risk_control fk_1b0a3acc92750a35    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_1b0a3acc92750a35 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_1b0a3acc92750a35;
       public          postgres    false    463    6392    511                       2606    28675    risk_log fk_1ca63785f898d29a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_log
    ADD CONSTRAINT fk_1ca63785f898d29a FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.risk_log DROP CONSTRAINT fk_1ca63785f898d29a;
       public          postgres    false    6392    511    489                       2606    28650 ,   risk_konteks_stakeholder fk_2387abe95909c103    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_konteks_stakeholder
    ADD CONSTRAINT fk_2387abe95909c103 FOREIGN KEY (id_konteks) REFERENCES public.risk_konteks(id_konteks);
 V   ALTER TABLE ONLY public.risk_konteks_stakeholder DROP CONSTRAINT fk_2387abe95909c103;
       public          postgres    false    482    6313    481            "           2606    28770 *   risk_mitigasi_progress fk_23fde873decd3d62    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_progress
    ADD CONSTRAINT fk_23fde873decd3d62 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_mitigasi(id_mitigasi) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.risk_mitigasi_progress DROP CONSTRAINT fk_23fde873decd3d62;
       public          postgres    false    6330    501    491            �           2606    28415 &   pemeriksaan_temuan fk_240b1947d6ede51a    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT fk_240b1947d6ede51a FOREIGN KEY (id_bidang_pemeriksaan) REFERENCES public.mt_bidang_pemeriksaan(id_bidang_pemeriksaan);
 P   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT fk_240b1947d6ede51a;
       public          postgres    false    406    260    5955            �           2606    28205    opp_peluang fk_252ce1b24975c5f4    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_252ce1b24975c5f4 FOREIGN KEY (inheren_kemungkinan) REFERENCES public.mt_opp_kemungkinan(id_kemungkinan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_252ce1b24975c5f4;
       public          postgres    false    376    5986    286            �           2606    28240    opp_peluang fk_2533d66faa0d6c64    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_2533d66faa0d6c64 FOREIGN KEY (id_peluang_parent) REFERENCES public.opp_peluang(id_peluang);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_2533d66faa0d6c64;
       public          postgres    false    376    6142    376            *           2606    28795    risk_risiko fk_26b3be9bed2fa8e6    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_26b3be9bed2fa8e6 FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_26b3be9bed2fa8e6;
       public          postgres    false    6060    511    338            �           2606    28175 +   mt_sdm_struktur_history fk_273613bc96b1b763    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_struktur_history
    ADD CONSTRAINT fk_273613bc96b1b763 FOREIGN KEY (id_struktur_history) REFERENCES public.mt_sdm_struktur(id_struktur);
 U   ALTER TABLE ONLY public.mt_sdm_struktur_history DROP CONSTRAINT fk_273613bc96b1b763;
       public          postgres    false    352    6086    353            p           2606    29155 #   rtm_uraian_link fk_283cf4e214590ed8    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_uraian_link
    ADD CONSTRAINT fk_283cf4e214590ed8 FOREIGN KEY (id_rtm) REFERENCES public.rtm(id_rtm);
 M   ALTER TABLE ONLY public.rtm_uraian_link DROP CONSTRAINT fk_283cf4e214590ed8;
       public          postgres    false    540    6469    549            N           2606    28990 $   risk_sasaran_kpi fk_2a8b2c7768a89511    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_kpi
    ADD CONSTRAINT fk_2a8b2c7768a89511 FOREIGN KEY (id_kpi) REFERENCES public.kpi(id_kpi);
 N   ALTER TABLE ONLY public.risk_sasaran_kpi DROP CONSTRAINT fk_2a8b2c7768a89511;
       public          postgres    false    524    233    5920            �           2606    28310 !   opp_scorecard fk_2b77db76847121a9    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard
    ADD CONSTRAINT fk_2b77db76847121a9 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 K   ALTER TABLE ONLY public.opp_scorecard DROP CONSTRAINT fk_2b77db76847121a9;
       public          postgres    false    6105    382    363            �           2606    28535 +   public_sys_notification fk_2ca26133bdcc2659    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_notification
    ADD CONSTRAINT fk_2ca26133bdcc2659 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 U   ALTER TABLE ONLY public.public_sys_notification DROP CONSTRAINT fk_2ca26133bdcc2659;
       public          postgres    false    345    450    6068            F           2606    28950 #   risk_risiko_kpi fk_2d4468cc65eec32d    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_kpi
    ADD CONSTRAINT fk_2d4468cc65eec32d FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 M   ALTER TABLE ONLY public.risk_risiko_kpi DROP CONSTRAINT fk_2d4468cc65eec32d;
       public          postgres    false    511    518    6392            �           2606    28430 ,   pemeriksaan_temuan_saran fk_2d68bae36ecba038    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_saran
    ADD CONSTRAINT fk_2d68bae36ecba038 FOREIGN KEY (id_pemeriksaan_temuan) REFERENCES public.pemeriksaan_temuan(id_pemeriksaan_temuan) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.pemeriksaan_temuan_saran DROP CONSTRAINT fk_2d68bae36ecba038;
       public          postgres    false    412    6196    406            �           2606    28285    opp_peluang fk_2d796ad81f892559    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_2d796ad81f892559 FOREIGN KEY (residual_dampak_evaluasi) REFERENCES public.mt_opp_dampak(id_dampak);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_2d796ad81f892559;
       public          postgres    false    282    5982    376            �           2606    28355    pemeriksaan fk_2fc53047c628b671    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT fk_2fc53047c628b671 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT fk_2fc53047c628b671;
       public          postgres    false    388    6099    358            @           2606    28930 '   risk_risiko_current fk_331250e4abcbf2f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_current
    ADD CONSTRAINT fk_331250e4abcbf2f1 FOREIGN KEY (id_periode_tw) REFERENCES public.mt_periode_tw(id_periode_tw);
 Q   ALTER TABLE ONLY public.risk_risiko_current DROP CONSTRAINT fk_331250e4abcbf2f1;
       public          postgres    false    513    6015    306            �           2606    28370    pemeriksaan fk_358951057a3fbfdb    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT fk_358951057a3fbfdb FOREIGN KEY (id_spn) REFERENCES public.pemeriksaan_spn(id_spn);
 I   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT fk_358951057a3fbfdb;
       public          postgres    false    388    6188    402            �           2606    28465    penilaian fk_35915672737f8bcb    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian
    ADD CONSTRAINT fk_35915672737f8bcb FOREIGN KEY (id_penilaian_periode) REFERENCES public.penilaian_periode(id_penilaian_periode) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.penilaian DROP CONSTRAINT fk_35915672737f8bcb;
       public          postgres    false    431    6235    421            �           2606    28405 &   pemeriksaan_temuan fk_3650fd94effd3dde    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT fk_3650fd94effd3dde FOREIGN KEY (id_jabatan_auditee) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 P   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT fk_3650fd94effd3dde;
       public          postgres    false    6068    345    406            A           2606    28915 '   risk_risiko_current fk_371dc880ca4cb812    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_current
    ADD CONSTRAINT fk_371dc880ca4cb812 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 Q   ALTER TABLE ONLY public.risk_risiko_current DROP CONSTRAINT fk_371dc880ca4cb812;
       public          postgres    false    6392    513    511            �           2606    28530 +   public_sys_notification fk_3765288045a3c8db    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_notification
    ADD CONSTRAINT fk_3765288045a3c8db FOREIGN KEY (id_user) REFERENCES public.public_sys_user(user_id);
 U   ALTER TABLE ONLY public.public_sys_notification DROP CONSTRAINT fk_3765288045a3c8db;
       public          postgres    false    6269    454    450            �           2606    28585     risk_control fk_37ef060fab593383    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_37ef060fab593383 FOREIGN KEY (id_mitigasi_sumber) REFERENCES public.risk_mitigasi(id_mitigasi) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_37ef060fab593383;
       public          postgres    false    491    6330    463            a           2606    29110    risk_task fk_381fe4fd61a597a8    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_381fe4fd61a597a8 FOREIGN KEY (group_id) REFERENCES public.public_sys_group(group_id);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_381fe4fd61a597a8;
       public          postgres    false    6246    535    439            ]           2606    29065 '   risk_scorecard_view fk_382e0e7d53f1bcf3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard_view
    ADD CONSTRAINT fk_382e0e7d53f1bcf3 FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 Q   ALTER TABLE ONLY public.risk_scorecard_view DROP CONSTRAINT fk_382e0e7d53f1bcf3;
       public          postgres    false    531    6437    527            T           2606    29005 "   risk_scorecard fk_388ab7f7f4fd9818    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_388ab7f7f4fd9818 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_388ab7f7f4fd9818;
       public          postgres    false    527    363    6105            �           2606    28035 !   mt_opp_matrix fk_39892c970e515934    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_opp_matrix
    ADD CONSTRAINT fk_39892c970e515934 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_opp_kemungkinan(id_kemungkinan);
 K   ALTER TABLE ONLY public.mt_opp_matrix DROP CONSTRAINT fk_39892c970e515934;
       public          postgres    false    5986    286    290            �           2606    28505 %   public_sys_action fk_3be0b3d25f7e6d0e    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_action
    ADD CONSTRAINT fk_3be0b3d25f7e6d0e FOREIGN KEY (menu_id) REFERENCES public.public_sys_menu(menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.public_sys_action DROP CONSTRAINT fk_3be0b3d25f7e6d0e;
       public          postgres    false    437    445    6256            �           2606    28390 &   pemeriksaan_temuan fk_3d1643242a910d98    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT fk_3d1643242a910d98 FOREIGN KEY (id_pemeriksaan_detail) REFERENCES public.pemeriksaan_detail(id_pemeriksaan_detail) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT fk_3d1643242a910d98;
       public          postgres    false    394    6178    406                        2606    28755 )   risk_mitigasi_program fk_3d27096b4792b91a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_program
    ADD CONSTRAINT fk_3d27096b4792b91a FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 S   ALTER TABLE ONLY public.risk_mitigasi_program DROP CONSTRAINT fk_3d27096b4792b91a;
       public          postgres    false    511    498    6392            M           2606    28980     risk_sasaran fk_3d8029ea75e4afe2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran
    ADD CONSTRAINT fk_3d8029ea75e4afe2 FOREIGN KEY (id_sasaran_parent) REFERENCES public.risk_sasaran(id_sasaran);
 J   ALTER TABLE ONLY public.risk_sasaran DROP CONSTRAINT fk_3d8029ea75e4afe2;
       public          postgres    false    523    6425    523                       2606    28680    risk_log fk_3e77f392873d364d    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_log
    ADD CONSTRAINT fk_3e77f392873d364d FOREIGN KEY (group_id) REFERENCES public.public_sys_group(group_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.risk_log DROP CONSTRAINT fk_3e77f392873d364d;
       public          postgres    false    489    439    6246            �           2606    27990 '   kpi_target_evaluasi fk_3e7a97d0c0a4d953    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_target_evaluasi
    ADD CONSTRAINT fk_3e7a97d0c0a4d953 FOREIGN KEY (id_kpi_target) REFERENCES public.kpi_target(id_kpi_target);
 Q   ALTER TABLE ONLY public.kpi_target_evaluasi DROP CONSTRAINT fk_3e7a97d0c0a4d953;
       public          postgres    false    238    240    5928            �           2606    28015 $   mt_kriteria_link fk_3e9f7020ea64cd13    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_kriteria_link
    ADD CONSTRAINT fk_3e9f7020ea64cd13 FOREIGN KEY (id_kriteria2) REFERENCES public.mt_kriteria(id_kriteria);
 N   ALTER TABLE ONLY public.mt_kriteria_link DROP CONSTRAINT fk_3e9f7020ea64cd13;
       public          postgres    false    276    277    5974            v           2606    27910 "   comp_kebutuhan fk_3f8e8bd9e9086a58    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_kebutuhan
    ADD CONSTRAINT fk_3f8e8bd9e9086a58 FOREIGN KEY (id_interval) REFERENCES public.mt_interval(id_interval);
 L   ALTER TABLE ONLY public.comp_kebutuhan DROP CONSTRAINT fk_3f8e8bd9e9086a58;
       public          postgres    false    5957    216    262            +           2606    28815    risk_risiko fk_3fef6f60441397f3    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_3fef6f60441397f3 FOREIGN KEY (residual_kemungkinan_evaluasi) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_3fef6f60441397f3;
       public          postgres    false    6041    329    511            �           2606    28560 )   public_sys_user_group fk_40e79670d36590b1    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_user_group
    ADD CONSTRAINT fk_40e79670d36590b1 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 S   ALTER TABLE ONLY public.public_sys_user_group DROP CONSTRAINT fk_40e79670d36590b1;
       public          postgres    false    455    6068    345            �           2606    28085 2   mt_risk_kriteria_dampak_detail fk_41ba39047b02c6e5    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_41ba39047b02c6e5 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_41ba39047b02c6e5;
       public          postgres    false    331    332    6044            b           2606    29105    risk_task fk_446d44cc3120ed51    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_446d44cc3120ed51 FOREIGN KEY (id_scorecard_peluang) REFERENCES public.opp_scorecard(id_scorecard);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_446d44cc3120ed51;
       public          postgres    false    6152    535    382            �           2606    28360    pemeriksaan fk_450b99b6f24f8b94    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT fk_450b99b6f24f8b94 FOREIGN KEY (id_subbid) REFERENCES public.mt_sdm_subbid(code) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT fk_450b99b6f24f8b94;
       public          postgres    false    6095    356    388            �           2606    28220    opp_peluang fk_451d320b25693e02    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_451d320b25693e02 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_opp_kriteria_dampak(id_kriteria_dampak);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_451d320b25693e02;
       public          postgres    false    288    376    5988            [           2606    29055 '   risk_scorecard_user fk_46ba33b9f31fc92f    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard_user
    ADD CONSTRAINT fk_46ba33b9f31fc92f FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 Q   ALTER TABLE ONLY public.risk_scorecard_user DROP CONSTRAINT fk_46ba33b9f31fc92f;
       public          postgres    false    345    6068    530            n           2606    29150 $   rtm_uraian_files fk_48cd010e90cde708    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_uraian_files
    ADD CONSTRAINT fk_48cd010e90cde708 FOREIGN KEY (id_rtm) REFERENCES public.rtm(id_rtm);
 N   ALTER TABLE ONLY public.rtm_uraian_files DROP CONSTRAINT fk_48cd010e90cde708;
       public          postgres    false    6469    540    548            ,           2606    28910    risk_risiko fk_495d11344230e557    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_495d11344230e557 FOREIGN KEY (id_kegiatan) REFERENCES public.risk_kegiatan(id_kegiatan);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_495d11344230e557;
       public          postgres    false    475    6304    511            �           2606    27965    kpi_config fk_4a2369ad6877ca10    FK CONSTRAINT     ~   ALTER TABLE ONLY public.kpi_config
    ADD CONSTRAINT fk_4a2369ad6877ca10 FOREIGN KEY (id_kpi) REFERENCES public.kpi(id_kpi);
 H   ALTER TABLE ONLY public.kpi_config DROP CONSTRAINT fk_4a2369ad6877ca10;
       public          postgres    false    234    5920    233            c           2606    29085    risk_task fk_4ad9f16467ac0d2f    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_4ad9f16467ac0d2f FOREIGN KEY (id_control) REFERENCES public.risk_control(id_control);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_4ad9f16467ac0d2f;
       public          postgres    false    463    6280    535            �           2606    28150 "   mt_sdm_jabatan fk_4b87f893f72a7c12    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_4b87f893f72a7c12 FOREIGN KEY (id_tipe_unit) REFERENCES public.mt_sdm_tipe_unit(code) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_4b87f893f72a7c12;
       public          postgres    false    357    6097    345            �           2606    28090 2   mt_risk_kriteria_dampak_detail fk_4d57df3881e291e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail
    ADD CONSTRAINT fk_4d57df3881e291e2 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.mt_risk_kriteria_dampak_detail DROP CONSTRAINT fk_4d57df3881e291e2;
       public          postgres    false    6023    332    313            -           2606    28845    risk_risiko fk_4e248fa5ca7531b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_4e248fa5ca7531b4 FOREIGN KEY (id_interval_anggaran) REFERENCES public.mt_interval(id_interval);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_4e248fa5ca7531b4;
       public          postgres    false    5957    511    262            �           2606    27970    kpi_target fk_4e5facd1ed6c634e    FK CONSTRAINT     ~   ALTER TABLE ONLY public.kpi_target
    ADD CONSTRAINT fk_4e5facd1ed6c634e FOREIGN KEY (id_kpi) REFERENCES public.kpi(id_kpi);
 H   ALTER TABLE ONLY public.kpi_target DROP CONSTRAINT fk_4e5facd1ed6c634e;
       public          postgres    false    238    233    5920            .           2606    28860    risk_risiko fk_4e6fc4feb3a930f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_4e6fc4feb3a930f1 FOREIGN KEY (id_risiko_parent) REFERENCES public.risk_risiko(id_risiko);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_4e6fc4feb3a930f1;
       public          postgres    false    6392    511    511            o           2606    29145 $   rtm_uraian_files fk_4f00288e0f9c1b63    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_uraian_files
    ADD CONSTRAINT fk_4f00288e0f9c1b63 FOREIGN KEY (id_rtm_uraian) REFERENCES public.rtm_uraian(id_rtm_uraian);
 N   ALTER TABLE ONLY public.rtm_uraian_files DROP CONSTRAINT fk_4f00288e0f9c1b63;
       public          postgres    false    6479    546    548            �           2606    28605     risk_control fk_5359a0e5543a44bf    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_5359a0e5543a44bf FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_5359a0e5543a44bf;
       public          postgres    false    224    5908    463            K           2606    28970 $   risk_risiko_unit fk_540772826484c91e    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_unit
    ADD CONSTRAINT fk_540772826484c91e FOREIGN KEY (id_risiko_unit) REFERENCES public.risk_risiko(id_risiko);
 N   ALTER TABLE ONLY public.risk_risiko_unit DROP CONSTRAINT fk_540772826484c91e;
       public          postgres    false    6392    521    511            �           2606    28155 "   mt_sdm_jabatan fk_541fb805dbfa8124    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_541fb805dbfa8124 FOREIGN KEY (id_dit_bid) REFERENCES public.mt_sdm_dit_bid(code) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_541fb805dbfa8124;
       public          postgres    false    6066    345    343            d           2606    29070    risk_task fk_5568718d8016bbf7    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_5568718d8016bbf7 FOREIGN KEY (id_scorecard_peluang) REFERENCES public.opp_scorecard(id_scorecard);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_5568718d8016bbf7;
       public          postgres    false    382    6152    535            �           2606    28445 -   pemeriksaan_tindak_lanjut fk_558dd8e7607cdf02    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut
    ADD CONSTRAINT fk_558dd8e7607cdf02 FOREIGN KEY (id_periode_tw) REFERENCES public.mt_periode_tw(id_periode_tw);
 W   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut DROP CONSTRAINT fk_558dd8e7607cdf02;
       public          postgres    false    6015    416    306                       2606    28700 !   risk_mitigasi fk_561093e69a52b2b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi
    ADD CONSTRAINT fk_561093e69a52b2b4 FOREIGN KEY (id_status_progress) REFERENCES public.mt_status_progress(id_status_progress) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.risk_mitigasi DROP CONSTRAINT fk_561093e69a52b2b4;
       public          postgres    false    6109    491    367            O           2606    28985 $   risk_sasaran_kpi fk_5b103dced211dabb    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_kpi
    ADD CONSTRAINT fk_5b103dced211dabb FOREIGN KEY (id_sasaran) REFERENCES public.risk_sasaran(id_sasaran);
 N   ALTER TABLE ONLY public.risk_sasaran_kpi DROP CONSTRAINT fk_5b103dced211dabb;
       public          postgres    false    524    6425    523            #           2606    28765 *   risk_mitigasi_progress fk_5bbd4d187b70ed15    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_progress
    ADD CONSTRAINT fk_5bbd4d187b70ed15 FOREIGN KEY (id_periode_tw) REFERENCES public.mt_periode_tw(id_periode_tw);
 T   ALTER TABLE ONLY public.risk_mitigasi_progress DROP CONSTRAINT fk_5bbd4d187b70ed15;
       public          postgres    false    6015    501    306            �           2606    28580     risk_control fk_5be5eec688643b30    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_5be5eec688643b30 FOREIGN KEY (id_control_parent) REFERENCES public.risk_control(id_control) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_5be5eec688643b30;
       public          postgres    false    6280    463    463            �           2606    28055 ,   mt_pemeriksaan_checklist fk_5d6a87b58b70e3ad    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_pemeriksaan_checklist
    ADD CONSTRAINT fk_5d6a87b58b70e3ad FOREIGN KEY (id_checklist_parent) REFERENCES public.mt_pemeriksaan_checklist(id_checklist);
 V   ALTER TABLE ONLY public.mt_pemeriksaan_checklist DROP CONSTRAINT fk_5d6a87b58b70e3ad;
       public          postgres    false    300    6009    300            �           2606    28380 &   pemeriksaan_detail fk_5d78b57df3c17e68    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_detail
    ADD CONSTRAINT fk_5d78b57df3c17e68 FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen);
 P   ALTER TABLE ONLY public.pemeriksaan_detail DROP CONSTRAINT fk_5d78b57df3c17e68;
       public          postgres    false    224    394    5908            /           2606    28885    risk_risiko fk_5e2774d7261451c6    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_5e2774d7261451c6 FOREIGN KEY (inheren_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_5e2774d7261451c6;
       public          postgres    false    329    511    6041            �           2606    28485 &   penilaian_komentar fk_5f380d5a9a91d63d    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian_komentar
    ADD CONSTRAINT fk_5f380d5a9a91d63d FOREIGN KEY (id_penilaian) REFERENCES public.penilaian(id_penilaian) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.penilaian_komentar DROP CONSTRAINT fk_5f380d5a9a91d63d;
       public          postgres    false    421    428    6223            �           2606    27985    kpi_target fk_5f870f7764d5ee4c    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_target
    ADD CONSTRAINT fk_5f870f7764d5ee4c FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE;
 H   ALTER TABLE ONLY public.kpi_target DROP CONSTRAINT fk_5f870f7764d5ee4c;
       public          postgres    false    358    238    6099            x           2606    27915 "   comp_penilaian fk_62320de0cddda641    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_penilaian
    ADD CONSTRAINT fk_62320de0cddda641 FOREIGN KEY (id_comp_kebutuhan) REFERENCES public.comp_kebutuhan(id_comp_kebutuhan);
 L   ALTER TABLE ONLY public.comp_penilaian DROP CONSTRAINT fk_62320de0cddda641;
       public          postgres    false    218    5895    216            �           2606    28250    opp_peluang fk_63e4cd8aa465e06b    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_63e4cd8aa465e06b FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_63e4cd8aa465e06b;
       public          postgres    false    338    6060    376            U           2606    29030 "   risk_scorecard fk_65f431cf37d7f015    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_65f431cf37d7f015 FOREIGN KEY (id_parent_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_65f431cf37d7f015;
       public          postgres    false    6437    527    527                       2606    28625 '   risk_control_risiko fk_66126e849048110e    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_risiko
    ADD CONSTRAINT fk_66126e849048110e FOREIGN KEY (id_control) REFERENCES public.risk_control(id_control) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.risk_control_risiko DROP CONSTRAINT fk_66126e849048110e;
       public          postgres    false    463    6280    467            0           2606    28805    risk_risiko fk_67e47f1f700b4262    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_67e47f1f700b4262 FOREIGN KEY (residual_target_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_67e47f1f700b4262;
       public          postgres    false    6041    511    329            �           2606    28045 )   mt_pb_kelompok_proses fk_6839304bbda5f4f2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_pb_kelompok_proses
    ADD CONSTRAINT fk_6839304bbda5f4f2 FOREIGN KEY (id_kategori) REFERENCES public.mt_pb_kategori(id_kategori);
 S   ALTER TABLE ONLY public.mt_pb_kelompok_proses DROP CONSTRAINT fk_6839304bbda5f4f2;
       public          postgres    false    6000    294    296            I           2606    28965 .   risk_risiko_proyek_terkait fk_68d740a364ab4c6f    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_proyek_terkait
    ADD CONSTRAINT fk_68d740a364ab4c6f FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 X   ALTER TABLE ONLY public.risk_risiko_proyek_terkait DROP CONSTRAINT fk_68d740a364ab4c6f;
       public          postgres    false    6437    527    520                       2606    28745 4   risk_mitigasi_integrasi_internal fk_6a6f07627e812e1c    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_integrasi_internal
    ADD CONSTRAINT fk_6a6f07627e812e1c FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 ^   ALTER TABLE ONLY public.risk_mitigasi_integrasi_internal DROP CONSTRAINT fk_6a6f07627e812e1c;
       public          postgres    false    511    497    6392            �           2606    28395 &   pemeriksaan_temuan fk_6b8b77c941906075    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT fk_6b8b77c941906075 FOREIGN KEY (id_pemeriksaan) REFERENCES public.pemeriksaan(id_pemeriksaan) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT fk_6b8b77c941906075;
       public          postgres    false    6169    388    406            �           2606    28290    opp_peluang fk_6b9919605149e17e    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_6b9919605149e17e FOREIGN KEY (residual_kemungkinan_evaluasi) REFERENCES public.mt_opp_kemungkinan(id_kemungkinan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_6b9919605149e17e;
       public          postgres    false    5986    286    376                       2606    28670 "   risk_kri_hasil fk_6c2702d25bf2d274    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_kri_hasil
    ADD CONSTRAINT fk_6c2702d25bf2d274 FOREIGN KEY (id_periode_tw) REFERENCES public.mt_periode_tw(id_periode_tw);
 L   ALTER TABLE ONLY public.risk_kri_hasil DROP CONSTRAINT fk_6c2702d25bf2d274;
       public          postgres    false    488    6015    306            V           2606    29040 "   risk_scorecard fk_6cfe1d3e9b9ade24    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_6cfe1d3e9b9ade24 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_6cfe1d3e9b9ade24;
       public          postgres    false    527    363    6105            1           2606    28895    risk_risiko fk_6d12296bd72d11b8    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_6d12296bd72d11b8 FOREIGN KEY (control_kemungkinan_penurunan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_6d12296bd72d11b8;
       public          postgres    false    6041    329    511                       2606    28660    risk_kri fk_6fcacdedc08a791a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_kri
    ADD CONSTRAINT fk_6fcacdedc08a791a FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 F   ALTER TABLE ONLY public.risk_kri DROP CONSTRAINT fk_6fcacdedc08a791a;
       public          postgres    false    486    511    6392            }           2606    27945    dokumen fk_711f42a5c508aef0    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT fk_711f42a5c508aef0 FOREIGN KEY (id_diupload_oleh) REFERENCES public.mt_ppd(id_ppd);
 E   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT fk_711f42a5c508aef0;
       public          postgres    false    224    308    6017            L           2606    28975 $   risk_risiko_unit fk_7182be82bb93f1b5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_unit
    ADD CONSTRAINT fk_7182be82bb93f1b5 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 N   ALTER TABLE ONLY public.risk_risiko_unit DROP CONSTRAINT fk_7182be82bb93f1b5;
       public          postgres    false    521    6392    511                       2606    28740 '   risk_mitigasi_files fk_71b95174fdafa029    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_files
    ADD CONSTRAINT fk_71b95174fdafa029 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_mitigasi(id_mitigasi);
 Q   ALTER TABLE ONLY public.risk_mitigasi_files DROP CONSTRAINT fk_71b95174fdafa029;
       public          postgres    false    491    6330    496            �           2606    28110 %   mt_risk_taksonomi fk_726c58c036e9bcdd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi
    ADD CONSTRAINT fk_726c58c036e9bcdd FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 O   ALTER TABLE ONLY public.mt_risk_taksonomi DROP CONSTRAINT fk_726c58c036e9bcdd;
       public          postgres    false    335    338    6060            �           2606    27980    kpi_target fk_72cf3d707be2be8a    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_target
    ADD CONSTRAINT fk_72cf3d707be2be8a FOREIGN KEY (id_subbid) REFERENCES public.mt_sdm_subbid(code) ON UPDATE CASCADE;
 H   ALTER TABLE ONLY public.kpi_target DROP CONSTRAINT fk_72cf3d707be2be8a;
       public          postgres    false    356    238    6095            �           2606    28480 #   penilaian_files fk_735d69f6c1d1e2d3    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian_files
    ADD CONSTRAINT fk_735d69f6c1d1e2d3 FOREIGN KEY (id_penilaian) REFERENCES public.penilaian(id_penilaian);
 M   ALTER TABLE ONLY public.penilaian_files DROP CONSTRAINT fk_735d69f6c1d1e2d3;
       public          postgres    false    421    6223    426            r           2606    29170 "   rtm_urian_unit fk_74510eb3809fe73e    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_urian_unit
    ADD CONSTRAINT fk_74510eb3809fe73e FOREIGN KEY (id_rtm_uraian) REFERENCES public.rtm_uraian(id_rtm_uraian);
 L   ALTER TABLE ONLY public.rtm_urian_unit DROP CONSTRAINT fk_74510eb3809fe73e;
       public          postgres    false    6479    546    550            e           2606    29095    risk_task fk_7463a1a0133c852f    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_7463a1a0133c852f FOREIGN KEY (id_kegiatan) REFERENCES public.risk_kegiatan(id_kegiatan);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_7463a1a0133c852f;
       public          postgres    false    475    535    6304            �           2606    28520 )   public_sys_group_menu fk_74650ebda1b0da35    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_group_menu
    ADD CONSTRAINT fk_74650ebda1b0da35 FOREIGN KEY (group_id) REFERENCES public.public_sys_group(group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.public_sys_group_menu DROP CONSTRAINT fk_74650ebda1b0da35;
       public          postgres    false    6246    439    442            �           2606    28230    opp_peluang fk_752941d64bdf12f0    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_752941d64bdf12f0 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_752941d64bdf12f0;
       public          postgres    false    376    345    6068            �           2606    28225    opp_peluang fk_7565852ba78b9fc4    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_7565852ba78b9fc4 FOREIGN KEY (id_peluang_sebelum) REFERENCES public.opp_peluang(id_peluang);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_7565852ba78b9fc4;
       public          postgres    false    376    6142    376            �           2606    28165 #   mt_sdm_struktur fk_75d366b98f5839cd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_struktur
    ADD CONSTRAINT fk_75d366b98f5839cd FOREIGN KEY (id_struktur_parent) REFERENCES public.mt_sdm_struktur(id_struktur);
 M   ALTER TABLE ONLY public.mt_sdm_struktur DROP CONSTRAINT fk_75d366b98f5839cd;
       public          postgres    false    352    352    6086            �           2606    28060 +   mt_risk_efektif_m_bobot fk_7742e6683fa10c12    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektif_m_bobot
    ADD CONSTRAINT fk_7742e6683fa10c12 FOREIGN KEY (id_efektif_m) REFERENCES public.mt_risk_efektif_m(id_efektif_m);
 U   ALTER TABLE ONLY public.mt_risk_efektif_m_bobot DROP CONSTRAINT fk_7742e6683fa10c12;
       public          postgres    false    6025    315    316            '           2606    28790    risk_review fk_7797d72a43ad8d54    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_review
    ADD CONSTRAINT fk_7797d72a43ad8d54 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 I   ALTER TABLE ONLY public.risk_review DROP CONSTRAINT fk_7797d72a43ad8d54;
       public          postgres    false    511    509    6392            �           2606    28040 !   mt_opp_matrix fk_77be5c19f2a68b77    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_opp_matrix
    ADD CONSTRAINT fk_77be5c19f2a68b77 FOREIGN KEY (id_tingkat) REFERENCES public.mt_opp_tingkat(id_tingkat);
 K   ALTER TABLE ONLY public.mt_opp_matrix DROP CONSTRAINT fk_77be5c19f2a68b77;
       public          postgres    false    5998    292    290            y           2606    27925 "   comp_penilaian fk_77dfd2e3bd51bbf2    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_penilaian
    ADD CONSTRAINT fk_77dfd2e3bd51bbf2 FOREIGN KEY (id_jabatan_pereview) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 L   ALTER TABLE ONLY public.comp_penilaian DROP CONSTRAINT fk_77dfd2e3bd51bbf2;
       public          postgres    false    218    6068    345            �           2606    28400 &   pemeriksaan_temuan fk_78a6e39ff0258ba4    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT fk_78a6e39ff0258ba4 FOREIGN KEY (id_jabatan_auditor) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 P   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT fk_78a6e39ff0258ba4;
       public          postgres    false    345    6068    406            �           2606    28375 &   pemeriksaan_detail fk_78b5d34a8494a02c    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_detail
    ADD CONSTRAINT fk_78b5d34a8494a02c FOREIGN KEY (id_pemeriksaan) REFERENCES public.pemeriksaan(id_pemeriksaan) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.pemeriksaan_detail DROP CONSTRAINT fk_78b5d34a8494a02c;
       public          postgres    false    394    388    6169            J           2606    28960 .   risk_risiko_proyek_terkait fk_7e8ad61484b67733    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_proyek_terkait
    ADD CONSTRAINT fk_7e8ad61484b67733 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 X   ALTER TABLE ONLY public.risk_risiko_proyek_terkait DROP CONSTRAINT fk_7e8ad61484b67733;
       public          postgres    false    511    6392    520            �           2606    28275    opp_peluang fk_7fc0b0607dab08f2    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_7fc0b0607dab08f2 FOREIGN KEY (residual_target_dampak) REFERENCES public.mt_opp_dampak(id_dampak);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_7fc0b0607dab08f2;
       public          postgres    false    376    282    5982            �           2606    27960    kpi fk_8063ae7508049f78    FK CONSTRAINT     z   ALTER TABLE ONLY public.kpi
    ADD CONSTRAINT fk_8063ae7508049f78 FOREIGN KEY (id_parent) REFERENCES public.kpi(id_kpi);
 A   ALTER TABLE ONLY public.kpi DROP CONSTRAINT fk_8063ae7508049f78;
       public          postgres    false    5920    233    233            �           2606    28500 %   penilaian_periode fk_80d2fcf129460aa9    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian_periode
    ADD CONSTRAINT fk_80d2fcf129460aa9 FOREIGN KEY (id_unit_bak) REFERENCES public.mt_sdm_unit(table_code);
 O   ALTER TABLE ONLY public.penilaian_periode DROP CONSTRAINT fk_80d2fcf129460aa9;
       public          postgres    false    431    358    6099                       2606    28635 &   risk_dampak_risiko fk_82760e1096d09e92    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_dampak_risiko
    ADD CONSTRAINT fk_82760e1096d09e92 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 P   ALTER TABLE ONLY public.risk_dampak_risiko DROP CONSTRAINT fk_82760e1096d09e92;
       public          postgres    false    511    470    6392            �           2606    28120 .   mt_risk_taksonomi_appetite fk_82a403c4db335893    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_appetite
    ADD CONSTRAINT fk_82a403c4db335893 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan);
 X   ALTER TABLE ONLY public.mt_risk_taksonomi_appetite DROP CONSTRAINT fk_82a403c4db335893;
       public          postgres    false    329    6041    336            �           2606    28540 #   public_sys_user fk_834d92e30da4d995    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_user
    ADD CONSTRAINT fk_834d92e30da4d995 FOREIGN KEY (group_id) REFERENCES public.public_sys_group(group_id);
 M   ALTER TABLE ONLY public.public_sys_user DROP CONSTRAINT fk_834d92e30da4d995;
       public          postgres    false    6246    454    439            q           2606    29160 #   rtm_uraian_link fk_88ab7641ee48cf68    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_uraian_link
    ADD CONSTRAINT fk_88ab7641ee48cf68 FOREIGN KEY (id_rtm_uraian) REFERENCES public.rtm_uraian(id_rtm_uraian);
 M   ALTER TABLE ONLY public.rtm_uraian_link DROP CONSTRAINT fk_88ab7641ee48cf68;
       public          postgres    false    549    6479    546            B           2606    28925 '   risk_risiko_current fk_88d061c8e8d8e118    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_current
    ADD CONSTRAINT fk_88d061c8e8d8e118 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak);
 Q   ALTER TABLE ONLY public.risk_risiko_current DROP CONSTRAINT fk_88d061c8e8d8e118;
       public          postgres    false    6023    513    313            �           2606    28300 )   opp_peluang_kelayakan fk_8a300cb4df2aa4d7    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang_kelayakan
    ADD CONSTRAINT fk_8a300cb4df2aa4d7 FOREIGN KEY (id_peluang) REFERENCES public.opp_peluang(id_peluang);
 S   ALTER TABLE ONLY public.opp_peluang_kelayakan DROP CONSTRAINT fk_8a300cb4df2aa4d7;
       public          postgres    false    379    376    6142            �           2606    28070 -   mt_risk_efektifitas_bobot fk_8a446fe71e92986c    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_bobot
    ADD CONSTRAINT fk_8a446fe71e92986c FOREIGN KEY (id_efektifitas) REFERENCES public.mt_risk_efektifitas(id_efektifitas);
 W   ALTER TABLE ONLY public.mt_risk_efektifitas_bobot DROP CONSTRAINT fk_8a446fe71e92986c;
       public          postgres    false    322    6033    323                       2606    28685    risk_log fk_8a8a4579c6375beb    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_log
    ADD CONSTRAINT fk_8a8a4579c6375beb FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.risk_log DROP CONSTRAINT fk_8a8a4579c6375beb;
       public          postgres    false    527    489    6437            H           2606    28955 (   risk_risiko_penyebab fk_8ad4c16478462c23    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_penyebab
    ADD CONSTRAINT fk_8ad4c16478462c23 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.risk_risiko_penyebab DROP CONSTRAINT fk_8ad4c16478462c23;
       public          postgres    false    511    519    6392            k           2606    29130     rtm_progress fk_8d6d5478f260fc27    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_progress
    ADD CONSTRAINT fk_8d6d5478f260fc27 FOREIGN KEY (id_rtm_uraian) REFERENCES public.rtm_uraian(id_rtm_uraian);
 J   ALTER TABLE ONLY public.rtm_progress DROP CONSTRAINT fk_8d6d5478f260fc27;
       public          postgres    false    544    6479    546            2           2606    28825    risk_risiko fk_907d751bbdb366a5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_907d751bbdb366a5 FOREIGN KEY (current_risk_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_907d751bbdb366a5;
       public          postgres    false    329    511    6041            �           2606    28365    pemeriksaan fk_9155494ba276ae48    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT fk_9155494ba276ae48 FOREIGN KEY (id_jenis_audit_eksternal) REFERENCES public.mt_jenis_audit_eksternal(id_jenis_audit_eksternal);
 I   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT fk_9155494ba276ae48;
       public          postgres    false    264    388    5959            �           2606    28005    mt_kategori fk_92651f626907a15e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_kategori
    ADD CONSTRAINT fk_92651f626907a15e FOREIGN KEY (id_interval) REFERENCES public.mt_interval(id_interval);
 I   ALTER TABLE ONLY public.mt_kategori DROP CONSTRAINT fk_92651f626907a15e;
       public          postgres    false    262    270    5957            �           2606    28315 !   opp_scorecard fk_92ae45378c182fb1    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard
    ADD CONSTRAINT fk_92ae45378c182fb1 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.opp_scorecard DROP CONSTRAINT fk_92ae45378c182fb1;
       public          postgres    false    358    6099    382            �           2606    28255    opp_peluang fk_92daf5cab0c80cbe    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_92daf5cab0c80cbe FOREIGN KEY (control_dampak_penurunan) REFERENCES public.mt_opp_dampak(id_dampak);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_92daf5cab0c80cbe;
       public          postgres    false    282    376    5982            �           2606    28330 &   opp_scorecard_user fk_930fe35bb8eebc93    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard_user
    ADD CONSTRAINT fk_930fe35bb8eebc93 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 P   ALTER TABLE ONLY public.opp_scorecard_user DROP CONSTRAINT fk_930fe35bb8eebc93;
       public          postgres    false    385    345    6068            �           2606    28515 +   public_sys_group_action fk_94f4f6fff1a7d139    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_group_action
    ADD CONSTRAINT fk_94f4f6fff1a7d139 FOREIGN KEY (group_menu_id) REFERENCES public.public_sys_group_menu(group_menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.public_sys_group_action DROP CONSTRAINT fk_94f4f6fff1a7d139;
       public          postgres    false    442    6252    440            �           2606    28475 $   penilaian_detail fk_98246fcf72932efa    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian_detail
    ADD CONSTRAINT fk_98246fcf72932efa FOREIGN KEY (id_penilaian) REFERENCES public.penilaian(id_penilaian) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.penilaian_detail DROP CONSTRAINT fk_98246fcf72932efa;
       public          postgres    false    421    6223    423            �           2606    28350    pemeriksaan fk_997c724d63f036c3    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT fk_997c724d63f036c3 FOREIGN KEY (id_jabatan_pereview) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 I   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT fk_997c724d63f036c3;
       public          postgres    false    6068    345    388            �           2606    28460 3   pemeriksaan_tindak_lanjut_saran fk_99f650a2beb019f9    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_saran
    ADD CONSTRAINT fk_99f650a2beb019f9 FOREIGN KEY (id_pemeriksaan_tindak_lanjut) REFERENCES public.pemeriksaan_tindak_lanjut(id_pemeriksaan_tindak_lanjut) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_saran DROP CONSTRAINT fk_99f650a2beb019f9;
       public          postgres    false    416    419    6214            3           2606    28810    risk_risiko fk_9a460b47b609e7a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_9a460b47b609e7a6 FOREIGN KEY (residual_dampak_evaluasi) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_9a460b47b609e7a6;
       public          postgres    false    511    313    6023                       2606    28710 !   risk_mitigasi fk_9acfe55bb91684d9    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi
    ADD CONSTRAINT fk_9acfe55bb91684d9 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.risk_mitigasi DROP CONSTRAINT fk_9acfe55bb91684d9;
       public          postgres    false    6068    345    491                       2606    28725 )   risk_mitigasi_efektif fk_9b4b831224199eeb    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif
    ADD CONSTRAINT fk_9b4b831224199eeb FOREIGN KEY (id_periode_tw) REFERENCES public.mt_periode_tw(id_periode_tw);
 S   ALTER TABLE ONLY public.risk_mitigasi_efektif DROP CONSTRAINT fk_9b4b831224199eeb;
       public          postgres    false    306    6015    493            W           2606    29020 "   risk_scorecard fk_9bca8419236912b5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_9bca8419236912b5 FOREIGN KEY (owner) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_9bca8419236912b5;
       public          postgres    false    6068    345    527            G           2606    28945 #   risk_risiko_kpi fk_9bfb64d0fc38c388    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_kpi
    ADD CONSTRAINT fk_9bfb64d0fc38c388 FOREIGN KEY (id_kpi) REFERENCES public.kpi(id_kpi);
 M   ALTER TABLE ONLY public.risk_risiko_kpi DROP CONSTRAINT fk_9bfb64d0fc38c388;
       public          postgres    false    5920    518    233            E           2606    28940 %   risk_risiko_files fk_9c3139e98170009a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_files
    ADD CONSTRAINT fk_9c3139e98170009a FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 O   ALTER TABLE ONLY public.risk_risiko_files DROP CONSTRAINT fk_9c3139e98170009a;
       public          postgres    false    516    511    6392            
           2606    28645 %   risk_kegiatan_kpi fk_9c31999a243ad389    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_kegiatan_kpi
    ADD CONSTRAINT fk_9c31999a243ad389 FOREIGN KEY (id_kegiatan) REFERENCES public.risk_kegiatan(id_kegiatan);
 O   ALTER TABLE ONLY public.risk_kegiatan_kpi DROP CONSTRAINT fk_9c31999a243ad389;
       public          postgres    false    476    6304    475            �           2606    28490 %   penilaian_periode fk_9d132ca93c820012    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian_periode
    ADD CONSTRAINT fk_9d132ca93c820012 FOREIGN KEY (id_kriteria) REFERENCES public.mt_kriteria(id_kriteria) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.penilaian_periode DROP CONSTRAINT fk_9d132ca93c820012;
       public          postgres    false    276    5974    431            4           2606    28835    risk_risiko fk_9e2e255f5b27f036    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_9e2e255f5b27f036 FOREIGN KEY (id_risiko_sebelum) REFERENCES public.risk_risiko(id_risiko);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_9e2e255f5b27f036;
       public          postgres    false    6392    511    511            �           2606    28425 ,   pemeriksaan_temuan_files fk_a3df66e88e83a97e    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan_files
    ADD CONSTRAINT fk_a3df66e88e83a97e FOREIGN KEY (id_pemeriksaan_temuan) REFERENCES public.pemeriksaan_temuan(id_pemeriksaan_temuan);
 V   ALTER TABLE ONLY public.pemeriksaan_temuan_files DROP CONSTRAINT fk_a3df66e88e83a97e;
       public          postgres    false    410    6196    406            w           2606    27905 "   comp_kebutuhan fk_a43978dd7bd824e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_kebutuhan
    ADD CONSTRAINT fk_a43978dd7bd824e8 FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen);
 L   ALTER TABLE ONLY public.comp_kebutuhan DROP CONSTRAINT fk_a43978dd7bd824e8;
       public          postgres    false    224    216    5908            �           2606    28100 "   mt_risk_matrix fk_a4669bbd55458901    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_a4669bbd55458901 FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_a4669bbd55458901;
       public          postgres    false    6041    333    329            �           2606    28000    mt_kategori fk_a95c64d7c61dc014    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_kategori
    ADD CONSTRAINT fk_a95c64d7c61dc014 FOREIGN KEY (id_kategori_jenis) REFERENCES public.mt_kategori_jenis(id_kategori_jenis);
 I   ALTER TABLE ONLY public.mt_kategori DROP CONSTRAINT fk_a95c64d7c61dc014;
       public          postgres    false    272    270    5969            �           2606    28130 *   mt_risk_taksonomi_area fk_a9d39025b9658c1d    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_area
    ADD CONSTRAINT fk_a9d39025b9658c1d FOREIGN KEY (id_taksonomi_objective) REFERENCES public.mt_risk_taksonomi_objective(id_taksonomi_objective);
 T   ALTER TABLE ONLY public.mt_risk_taksonomi_area DROP CONSTRAINT fk_a9d39025b9658c1d;
       public          postgres    false    338    340    6062            �           2606    28495 %   penilaian_periode fk_a9feaaa7731c0845    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian_periode
    ADD CONSTRAINT fk_a9feaaa7731c0845 FOREIGN KEY (id_interval) REFERENCES public.mt_interval(id_interval);
 O   ALTER TABLE ONLY public.penilaian_periode DROP CONSTRAINT fk_a9feaaa7731c0845;
       public          postgres    false    431    262    5957            �           2606    27955     dokumen_unit fk_aa13e3563c62611f    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen_unit
    ADD CONSTRAINT fk_aa13e3563c62611f FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE;
 J   ALTER TABLE ONLY public.dokumen_unit DROP CONSTRAINT fk_aa13e3563c62611f;
       public          postgres    false    358    6099    229            �           2606    28280    opp_peluang fk_ae32d1889709d9d2    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_ae32d1889709d9d2 FOREIGN KEY (residual_target_kemungkinan) REFERENCES public.mt_opp_kemungkinan(id_kemungkinan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_ae32d1889709d9d2;
       public          postgres    false    286    5986    376            !           2606    28760 2   risk_mitigasi_program_evaluasi fk_af68b719f864675c    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_program_evaluasi
    ADD CONSTRAINT fk_af68b719f864675c FOREIGN KEY (id_periode_tw) REFERENCES public.mt_periode_tw(id_periode_tw);
 \   ALTER TABLE ONLY public.risk_mitigasi_program_evaluasi DROP CONSTRAINT fk_af68b719f864675c;
       public          postgres    false    6015    499    306            5           2606    28800    risk_risiko fk_afc2f8ab726710d1    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_afc2f8ab726710d1 FOREIGN KEY (residual_target_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_afc2f8ab726710d1;
       public          postgres    false    6023    511    313            �           2606    28245    opp_peluang fk_b0c234d20d568b9b    FK CONSTRAINT        ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_b0c234d20d568b9b FOREIGN KEY (id_kpi) REFERENCES public.kpi(id_kpi);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_b0c234d20d568b9b;
       public          postgres    false    376    5920    233            �           2606    28440 -   pemeriksaan_tindak_lanjut fk_b12b4fcad7bbff68    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut
    ADD CONSTRAINT fk_b12b4fcad7bbff68 FOREIGN KEY (id_pemeriksaan_temuan) REFERENCES public.pemeriksaan_temuan(id_pemeriksaan_temuan) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut DROP CONSTRAINT fk_b12b4fcad7bbff68;
       public          postgres    false    406    416    6196            �           2606    27975    kpi_target fk_b2373629fa0b54a9    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_target
    ADD CONSTRAINT fk_b2373629fa0b54a9 FOREIGN KEY (id_dit_bid) REFERENCES public.mt_sdm_dit_bid(code) ON UPDATE CASCADE;
 H   ALTER TABLE ONLY public.kpi_target DROP CONSTRAINT fk_b2373629fa0b54a9;
       public          postgres    false    6066    343    238            �           2606    28305 )   opp_peluang_kelayakan fk_b4d21de89b266891    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang_kelayakan
    ADD CONSTRAINT fk_b4d21de89b266891 FOREIGN KEY (id_kelayakan) REFERENCES public.mt_opp_kelayakan(id_kelayakan);
 S   ALTER TABLE ONLY public.opp_peluang_kelayakan DROP CONSTRAINT fk_b4d21de89b266891;
       public          postgres    false    379    5984    284            �           2606    28135 "   mt_sdm_jabatan fk_b743dfd89358fc4e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_jabatan
    ADD CONSTRAINT fk_b743dfd89358fc4e FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.mt_sdm_jabatan DROP CONSTRAINT fk_b743dfd89358fc4e;
       public          postgres    false    345    6099    358            f           2606    29100    risk_task fk_b89dbb647af5e3a7    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_b89dbb647af5e3a7 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_b89dbb647af5e3a7;
       public          postgres    false    535    6105    363                       2606    28610 ,   risk_control_efektifitas fk_b9c07cceea120f16    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_efektifitas
    ADD CONSTRAINT fk_b9c07cceea120f16 FOREIGN KEY (id_jawaban) REFERENCES public.mt_risk_efektifitas_jawaban(id_efektifitas_jawaban);
 V   ALTER TABLE ONLY public.risk_control_efektifitas DROP CONSTRAINT fk_b9c07cceea120f16;
       public          postgres    false    6037    464    325            6           2606    28880    risk_risiko fk_ba73b7807d6fb481    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_ba73b7807d6fb481 FOREIGN KEY (inheren_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_ba73b7807d6fb481;
       public          postgres    false    6023    511    313            �           2606    28470    penilaian fk_bc48914e0847d227    FK CONSTRAINT     �   ALTER TABLE ONLY public.penilaian
    ADD CONSTRAINT fk_bc48914e0847d227 FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen);
 G   ALTER TABLE ONLY public.penilaian DROP CONSTRAINT fk_bc48914e0847d227;
       public          postgres    false    224    421    5908            �           2606    28570     risk_control fk_be8db6d0890a8590    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_be8db6d0890a8590 FOREIGN KEY (id_interval) REFERENCES public.mt_interval(id_interval) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_be8db6d0890a8590;
       public          postgres    false    5957    262    463            7           2606    28870    risk_risiko fk_bf5258a182799621    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_bf5258a182799621 FOREIGN KEY (id_taksonomi_area) REFERENCES public.mt_risk_taksonomi_area(id_taksonomi_area);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_bf5258a182799621;
       public          postgres    false    6060    511    338            �           2606    28555 )   public_sys_user_group fk_c02ed4d943b7ffd7    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_user_group
    ADD CONSTRAINT fk_c02ed4d943b7ffd7 FOREIGN KEY (group_id) REFERENCES public.public_sys_group(group_id);
 S   ALTER TABLE ONLY public.public_sys_user_group DROP CONSTRAINT fk_c02ed4d943b7ffd7;
       public          postgres    false    439    6246    455            �           2606    28200    opp_peluang fk_c1782c8a77285907    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_c1782c8a77285907 FOREIGN KEY (inheren_dampak) REFERENCES public.mt_opp_dampak(id_dampak);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_c1782c8a77285907;
       public          postgres    false    376    5982    282                       2606    28615 2   risk_control_efektifitas_files fk_c1a1a99b2bfcbd9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_efektifitas_files
    ADD CONSTRAINT fk_c1a1a99b2bfcbd9f FOREIGN KEY (id_control) REFERENCES public.risk_control(id_control);
 \   ALTER TABLE ONLY public.risk_control_efektifitas_files DROP CONSTRAINT fk_c1a1a99b2bfcbd9f;
       public          postgres    false    6280    466    463            X           2606    29025 "   risk_scorecard fk_c2dfc0cc5927da4d    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_c2dfc0cc5927da4d FOREIGN KEY (id_struktur) REFERENCES public.mt_sdm_struktur(id_struktur);
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_c2dfc0cc5927da4d;
       public          postgres    false    6086    527    352            8           2606    28900    risk_risiko fk_c3b68665c50b4f0e    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_c3b68665c50b4f0e FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_c3b68665c50b4f0e;
       public          postgres    false    527    511    6437            �           2606    28185    opp_log fk_c4be9603716b4ee1    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_log
    ADD CONSTRAINT fk_c4be9603716b4ee1 FOREIGN KEY (id_peluang) REFERENCES public.opp_peluang(id_peluang);
 E   ALTER TABLE ONLY public.opp_log DROP CONSTRAINT fk_c4be9603716b4ee1;
       public          postgres    false    6142    376    374                       2606    28730 +   risk_mitigasi_efektif_m fk_c5458220151ecb1b    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif_m
    ADD CONSTRAINT fk_c5458220151ecb1b FOREIGN KEY (id_efektif_m_jawaban) REFERENCES public.mt_risk_efektif_m_jawaban(id_efektif_m_jawaban);
 U   ALTER TABLE ONLY public.risk_mitigasi_efektif_m DROP CONSTRAINT fk_c5458220151ecb1b;
       public          postgres    false    318    494    6029                        2606    28590     risk_control fk_c574d91342d27036    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_c574d91342d27036 FOREIGN KEY (id_control_sebelum) REFERENCES public.risk_control(id_control) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_c574d91342d27036;
       public          postgres    false    463    6280    463            �           2606    28020 *   mt_opp_kriteria_dampak fk_c58ebc5be082583f    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_opp_kriteria_dampak
    ADD CONSTRAINT fk_c58ebc5be082583f FOREIGN KEY (id_induk) REFERENCES public.mt_opp_kriteria_dampak(id_kriteria_dampak);
 T   ALTER TABLE ONLY public.mt_opp_kriteria_dampak DROP CONSTRAINT fk_c58ebc5be082583f;
       public          postgres    false    288    5988    288            D           2606    28935 &   risk_risiko_dampak fk_c8f850aa05b90f21    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_dampak
    ADD CONSTRAINT fk_c8f850aa05b90f21 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.risk_risiko_dampak DROP CONSTRAINT fk_c8f850aa05b90f21;
       public          postgres    false    511    6392    514            �           2606    28435 #   pemeriksaan_tim fk_c9025e8f2b3ef382    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tim
    ADD CONSTRAINT fk_c9025e8f2b3ef382 FOREIGN KEY (id_bidang_pemeriksaan) REFERENCES public.mt_bidang_pemeriksaan(id_bidang_pemeriksaan) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.pemeriksaan_tim DROP CONSTRAINT fk_c9025e8f2b3ef382;
       public          postgres    false    414    5955    260            �           2606    28320 '   opp_scorecard_files fk_c940a8f3db19701b    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard_files
    ADD CONSTRAINT fk_c940a8f3db19701b FOREIGN KEY (id_scorecard) REFERENCES public.opp_scorecard(id_scorecard);
 Q   ALTER TABLE ONLY public.opp_scorecard_files DROP CONSTRAINT fk_c940a8f3db19701b;
       public          postgres    false    384    6152    382            h           2606    29115    risk_var fk_c980f604e72158ef    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_var
    ADD CONSTRAINT fk_c980f604e72158ef FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 F   ALTER TABLE ONLY public.risk_var DROP CONSTRAINT fk_c980f604e72158ef;
       public          postgres    false    536    6392    511            �           2606    28235    opp_peluang fk_ca23d5c9042ae8f7    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_ca23d5c9042ae8f7 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_ca23d5c9042ae8f7;
       public          postgres    false    376    6054    335            9           2606    28890    risk_risiko fk_cbeb46d065b47748    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_cbeb46d065b47748 FOREIGN KEY (control_dampak_penurunan) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_cbeb46d065b47748;
       public          postgres    false    6023    511    313            Z           2606    29045 (   risk_scorecard_files fk_ce2b35a4d4ce8eef    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard_files
    ADD CONSTRAINT fk_ce2b35a4d4ce8eef FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 R   ALTER TABLE ONLY public.risk_scorecard_files DROP CONSTRAINT fk_ce2b35a4d4ce8eef;
       public          postgres    false    6437    527    529                       2606    28630 '   risk_control_risiko fk_ce947322f94e215c    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_risiko
    ADD CONSTRAINT fk_ce947322f94e215c FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.risk_control_risiko DROP CONSTRAINT fk_ce947322f94e215c;
       public          postgres    false    511    467    6392                       2606    28715 )   risk_mitigasi_efektif fk_cec865bad35bcf29    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_efektif
    ADD CONSTRAINT fk_cec865bad35bcf29 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_mitigasi(id_mitigasi);
 S   ALTER TABLE ONLY public.risk_mitigasi_efektif DROP CONSTRAINT fk_cec865bad35bcf29;
       public          postgres    false    491    493    6330                       2606    28690 !   risk_mitigasi fk_cee6f9969a9f2880    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi
    ADD CONSTRAINT fk_cee6f9969a9f2880 FOREIGN KEY (id_pengukuran) REFERENCES public.mt_risk_efektifitas_pengukuran(id_pengukuran) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.risk_mitigasi DROP CONSTRAINT fk_cee6f9969a9f2880;
       public          postgres    false    491    327    6039            ~           2606    27940    dokumen fk_d03814e4b43289a7    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT fk_d03814e4b43289a7 FOREIGN KEY (id_jenis_dokumen) REFERENCES public.mt_jenis_dokumen(id_jenis_dokumen);
 E   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT fk_d03814e4b43289a7;
       public          postgres    false    224    266    5961            �           2606    28030 !   mt_opp_matrix fk_d1e5365778d83cd2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_opp_matrix
    ADD CONSTRAINT fk_d1e5365778d83cd2 FOREIGN KEY (id_dampak) REFERENCES public.mt_opp_dampak(id_dampak);
 K   ALTER TABLE ONLY public.mt_opp_matrix DROP CONSTRAINT fk_d1e5365778d83cd2;
       public          postgres    false    5982    282    290            \           2606    29050 '   risk_scorecard_user fk_d25747a8d1d87c58    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard_user
    ADD CONSTRAINT fk_d25747a8d1d87c58 FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 Q   ALTER TABLE ONLY public.risk_scorecard_user DROP CONSTRAINT fk_d25747a8d1d87c58;
       public          postgres    false    527    530    6437            :           2606    28875    risk_risiko fk_d2f108371106dd42    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_d2f108371106dd42 FOREIGN KEY (id_interval_anggaran) REFERENCES public.mt_interval(id_interval);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_d2f108371106dd42;
       public          postgres    false    5957    511    262            �           2606    28095 "   mt_risk_matrix fk_d414e4107f6c8462    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_d414e4107f6c8462 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_d414e4107f6c8462;
       public          postgres    false    6023    313    333                       2606    28665 "   risk_kri_hasil fk_d4582e0c20c52b33    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_kri_hasil
    ADD CONSTRAINT fk_d4582e0c20c52b33 FOREIGN KEY (id_kri) REFERENCES public.risk_kri(id_kri);
 L   ALTER TABLE ONLY public.risk_kri_hasil DROP CONSTRAINT fk_d4582e0c20c52b33;
       public          postgres    false    6320    486    488            �           2606    28525 )   public_sys_group_menu fk_d5b2cb3408c57957    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_group_menu
    ADD CONSTRAINT fk_d5b2cb3408c57957 FOREIGN KEY (menu_id) REFERENCES public.public_sys_menu(menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.public_sys_group_menu DROP CONSTRAINT fk_d5b2cb3408c57957;
       public          postgres    false    6256    445    442            �           2606    28325 &   opp_scorecard_user fk_d5eb4926895a516e    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard_user
    ADD CONSTRAINT fk_d5eb4926895a516e FOREIGN KEY (id_scorecard) REFERENCES public.opp_scorecard(id_scorecard);
 P   ALTER TABLE ONLY public.opp_scorecard_user DROP CONSTRAINT fk_d5eb4926895a516e;
       public          postgres    false    6152    382    385            %           2606    28785 (   risk_mitigasi_risiko fk_d900077d28993cf4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_risiko
    ADD CONSTRAINT fk_d900077d28993cf4 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.risk_mitigasi_risiko DROP CONSTRAINT fk_d900077d28993cf4;
       public          postgres    false    502    6392    511            �           2606    28335 &   opp_scorecard_view fk_da11604b5e84db16    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard_view
    ADD CONSTRAINT fk_da11604b5e84db16 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 P   ALTER TABLE ONLY public.opp_scorecard_view DROP CONSTRAINT fk_da11604b5e84db16;
       public          postgres    false    386    345    6068            i           2606    29120    rtm fk_da791e973f8cd545    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm
    ADD CONSTRAINT fk_da791e973f8cd545 FOREIGN KEY (rkt) REFERENCES public.mt_periode_tw(id_periode_tw);
 A   ALTER TABLE ONLY public.rtm DROP CONSTRAINT fk_da791e973f8cd545;
       public          postgres    false    306    6015    540            �           2606    28550 )   public_sys_user_group fk_db6a0bc2e36ed959    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_user_group
    ADD CONSTRAINT fk_db6a0bc2e36ed959 FOREIGN KEY (user_id) REFERENCES public.public_sys_user(user_id);
 S   ALTER TABLE ONLY public.public_sys_user_group DROP CONSTRAINT fk_db6a0bc2e36ed959;
       public          postgres    false    455    6269    454            ^           2606    29060 '   risk_scorecard_view fk_dc09fa9793a944b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard_view
    ADD CONSTRAINT fk_dc09fa9793a944b4 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 Q   ALTER TABLE ONLY public.risk_scorecard_view DROP CONSTRAINT fk_dc09fa9793a944b4;
       public          postgres    false    531    6068    345            |           2606    27935 (   comp_penilaian_files fk_dc5a429747985352    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_penilaian_files
    ADD CONSTRAINT fk_dc5a429747985352 FOREIGN KEY (id_comp_penilaian) REFERENCES public.comp_penilaian(id_comp_penilaian);
 R   ALTER TABLE ONLY public.comp_penilaian_files DROP CONSTRAINT fk_dc5a429747985352;
       public          postgres    false    218    5900    220            �           2606    28340 &   opp_scorecard_view fk_dcecfad05b67d636    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_scorecard_view
    ADD CONSTRAINT fk_dcecfad05b67d636 FOREIGN KEY (id_scorecard) REFERENCES public.opp_scorecard(id_scorecard);
 P   ALTER TABLE ONLY public.opp_scorecard_view DROP CONSTRAINT fk_dcecfad05b67d636;
       public          postgres    false    382    386    6152            �           2606    28025 1   mt_opp_kriteria_dampak_detail fk_de5152fd54006802    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_opp_kriteria_dampak_detail
    ADD CONSTRAINT fk_de5152fd54006802 FOREIGN KEY (id_dampak) REFERENCES public.mt_opp_dampak(id_dampak);
 [   ALTER TABLE ONLY public.mt_opp_kriteria_dampak_detail DROP CONSTRAINT fk_de5152fd54006802;
       public          postgres    false    5982    282    289                       2606    28620 2   risk_control_efektifitas_files fk_dfd5d8eb2b9ab550    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control_efektifitas_files
    ADD CONSTRAINT fk_dfd5d8eb2b9ab550 FOREIGN KEY (id_efektifitas) REFERENCES public.mt_risk_efektifitas(id_efektifitas);
 \   ALTER TABLE ONLY public.risk_control_efektifitas_files DROP CONSTRAINT fk_dfd5d8eb2b9ab550;
       public          postgres    false    6033    322    466            �           2606    28010    mt_kriteria fk_e0188d22ae94702f    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_kriteria
    ADD CONSTRAINT fk_e0188d22ae94702f FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.mt_kriteria DROP CONSTRAINT fk_e0188d22ae94702f;
       public          postgres    false    276    6099    358            ;           2606    28850    risk_risiko fk_e141b2eac4df97a5    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_e141b2eac4df97a5 FOREIGN KEY (id_taksonomi) REFERENCES public.mt_risk_taksonomi(id_taksonomi);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_e141b2eac4df97a5;
       public          postgres    false    6054    511    335            �           2606    28345    pemeriksaan fk_e1535d008660b364    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan
    ADD CONSTRAINT fk_e1535d008660b364 FOREIGN KEY (id_jabatan_penyesusun) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 I   ALTER TABLE ONLY public.pemeriksaan DROP CONSTRAINT fk_e1535d008660b364;
       public          postgres    false    345    6068    388            �           2606    28545 #   public_sys_user fk_e2d518c30a1f3cae    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_sys_user
    ADD CONSTRAINT fk_e2d518c30a1f3cae FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 M   ALTER TABLE ONLY public.public_sys_user DROP CONSTRAINT fk_e2d518c30a1f3cae;
       public          postgres    false    6068    454    345            �           2606    28105 "   mt_risk_matrix fk_e3066883e2e9bb72    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_matrix
    ADD CONSTRAINT fk_e3066883e2e9bb72 FOREIGN KEY (id_tingkat) REFERENCES public.mt_risk_tingkat(id_tingkat) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.mt_risk_matrix DROP CONSTRAINT fk_e3066883e2e9bb72;
       public          postgres    false    342    6064    333            <           2606    28865    risk_risiko fk_e3afb9b06ffda21d    FK CONSTRAINT        ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_e3afb9b06ffda21d FOREIGN KEY (id_kpi) REFERENCES public.kpi(id_kpi);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_e3afb9b06ffda21d;
       public          postgres    false    5920    511    233            z           2606    27920 "   comp_penilaian fk_e5136443d2763c6f    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_penilaian
    ADD CONSTRAINT fk_e5136443d2763c6f FOREIGN KEY (id_status_penilaian) REFERENCES public.mt_status_penilaian(id_status_penilaian);
 L   ALTER TABLE ONLY public.comp_penilaian DROP CONSTRAINT fk_e5136443d2763c6f;
       public          postgres    false    218    365    6107            =           2606    28830    risk_risiko fk_e6ed00b0f7d84ae9    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_e6ed00b0f7d84ae9 FOREIGN KEY (id_kriteria_dampak) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_e6ed00b0f7d84ae9;
       public          postgres    false    6044    511    331            &           2606    28780 (   risk_mitigasi_risiko fk_e75804f088362245    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_risiko
    ADD CONSTRAINT fk_e75804f088362245 FOREIGN KEY (id_mitigasi) REFERENCES public.risk_mitigasi(id_mitigasi) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.risk_mitigasi_risiko DROP CONSTRAINT fk_e75804f088362245;
       public          postgres    false    502    6330    491            g           2606    29075    risk_task fk_e808f03bd4233a6b    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_task
    ADD CONSTRAINT fk_e808f03bd4233a6b FOREIGN KEY (id_scorecard) REFERENCES public.risk_scorecard(id_scorecard);
 G   ALTER TABLE ONLY public.risk_task DROP CONSTRAINT fk_e808f03bd4233a6b;
       public          postgres    false    535    6437    527            Y           2606    29015 "   risk_scorecard fk_e839a323c85d81e2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_scorecard
    ADD CONSTRAINT fk_e839a323c85d81e2 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.risk_scorecard DROP CONSTRAINT fk_e839a323c85d81e2;
       public          postgres    false    527    358    6099            �           2606    28050 %   mt_pb_nama_proses fk_ea8341144bed14ad    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_pb_nama_proses
    ADD CONSTRAINT fk_ea8341144bed14ad FOREIGN KEY (id_kelompok_proses) REFERENCES public.mt_pb_kelompok_proses(id_kelompok_proses);
 O   ALTER TABLE ONLY public.mt_pb_nama_proses DROP CONSTRAINT fk_ea8341144bed14ad;
       public          postgres    false    6002    296    298            �           2606    28170 +   mt_sdm_struktur_history fk_eb6f19646a90c09a    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_struktur_history
    ADD CONSTRAINT fk_eb6f19646a90c09a FOREIGN KEY (id_struktur) REFERENCES public.mt_sdm_struktur(id_struktur);
 U   ALTER TABLE ONLY public.mt_sdm_struktur_history DROP CONSTRAINT fk_eb6f19646a90c09a;
       public          postgres    false    353    352    6086            {           2606    27930 "   comp_penilaian fk_eb800e14a79b7c79    FK CONSTRAINT     �   ALTER TABLE ONLY public.comp_penilaian
    ADD CONSTRAINT fk_eb800e14a79b7c79 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code);
 L   ALTER TABLE ONLY public.comp_penilaian DROP CONSTRAINT fk_eb800e14a79b7c79;
       public          postgres    false    6099    218    358            �           2606    28455 3   pemeriksaan_tindak_lanjut_saran fk_ec270156f563479f    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_saran
    ADD CONSTRAINT fk_ec270156f563479f FOREIGN KEY (id_pemeriksaan_temuan_saran) REFERENCES public.pemeriksaan_temuan_saran(id_pemeriksaan_temuan_saran) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.pemeriksaan_tindak_lanjut_saran DROP CONSTRAINT fk_ec270156f563479f;
       public          postgres    false    6206    412    419            C           2606    28920 '   risk_risiko_current fk_ee10c456f3715dea    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko_current
    ADD CONSTRAINT fk_ee10c456f3715dea FOREIGN KEY (id_kemungkinan) REFERENCES public.mt_risk_kemungkinan(id_kemungkinan);
 Q   ALTER TABLE ONLY public.risk_risiko_current DROP CONSTRAINT fk_ee10c456f3715dea;
       public          postgres    false    329    513    6041            �           2606    28075 -   mt_risk_efektifitas_bobot fk_ee3a7e08f432d354    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektifitas_bobot
    ADD CONSTRAINT fk_ee3a7e08f432d354 FOREIGN KEY (id_efektifitas_jawaban) REFERENCES public.mt_risk_efektifitas_jawaban(id_efektifitas_jawaban);
 W   ALTER TABLE ONLY public.mt_risk_efektifitas_bobot DROP CONSTRAINT fk_ee3a7e08f432d354;
       public          postgres    false    6037    325    323            m           2606    29140    rtm_uraian fk_eea64a175a75bcf2    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_uraian
    ADD CONSTRAINT fk_eea64a175a75bcf2 FOREIGN KEY (id_jenis_rtm_parent) REFERENCES public.mt_jenis_rtm(id_jenis_rtm);
 H   ALTER TABLE ONLY public.rtm_uraian DROP CONSTRAINT fk_eea64a175a75bcf2;
       public          postgres    false    268    5963    546            �           2606    28215    opp_peluang fk_eed9312cc67e9d49    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_eed9312cc67e9d49 FOREIGN KEY (current_opp_kemungkinan) REFERENCES public.mt_opp_kemungkinan(id_kemungkinan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_eed9312cc67e9d49;
       public          postgres    false    286    5986    376            �           2606    28195    opp_log fk_ef2dfa337f3760c4    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_log
    ADD CONSTRAINT fk_ef2dfa337f3760c4 FOREIGN KEY (id_scorecard) REFERENCES public.opp_scorecard(id_scorecard);
 E   ALTER TABLE ONLY public.opp_log DROP CONSTRAINT fk_ef2dfa337f3760c4;
       public          postgres    false    374    382    6152            >           2606    28905    risk_risiko fk_f1dafe7ebb2f4883    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_f1dafe7ebb2f4883 FOREIGN KEY (id_status_pengajuan) REFERENCES public.mt_status_pengajuan(id_status_pengajuan);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_f1dafe7ebb2f4883;
       public          postgres    false    363    511    6105            �           2606    28180 #   mt_sdm_sub_unit fk_f24b8637348f4628    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_sdm_sub_unit
    ADD CONSTRAINT fk_f24b8637348f4628 FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code) ON UPDATE CASCADE;
 M   ALTER TABLE ONLY public.mt_sdm_sub_unit DROP CONSTRAINT fk_f24b8637348f4628;
       public          postgres    false    6099    358    355            �           2606    28260    opp_peluang fk_f2825f5c1acc6399    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_f2825f5c1acc6399 FOREIGN KEY (control_kemungkinan_penurunan) REFERENCES public.mt_opp_kemungkinan(id_kemungkinan);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_f2825f5c1acc6399;
       public          postgres    false    5986    286    376                       2606    28565     risk_control fk_f3406a9fb77a6a03    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_f3406a9fb77a6a03 FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_f3406a9fb77a6a03;
       public          postgres    false    463    224    5908                       2606    28655 ,   risk_konteks_stakeholder fk_f3690bfec46678a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_konteks_stakeholder
    ADD CONSTRAINT fk_f3690bfec46678a6 FOREIGN KEY (id_stakeholder) REFERENCES public.mt_stakeholder(id_stakeholder);
 V   ALTER TABLE ONLY public.risk_konteks_stakeholder DROP CONSTRAINT fk_f3690bfec46678a6;
       public          postgres    false    359    6101    482            $           2606    28775 *   risk_mitigasi_progress fk_f4ae718de6c35067    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi_progress
    ADD CONSTRAINT fk_f4ae718de6c35067 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko);
 T   ALTER TABLE ONLY public.risk_mitigasi_progress DROP CONSTRAINT fk_f4ae718de6c35067;
       public          postgres    false    6392    501    511            �           2606    28265    opp_peluang fk_f5c7c419175f3d40    FK CONSTRAINT     �   ALTER TABLE ONLY public.opp_peluang
    ADD CONSTRAINT fk_f5c7c419175f3d40 FOREIGN KEY (id_scorecard) REFERENCES public.opp_scorecard(id_scorecard);
 I   ALTER TABLE ONLY public.opp_peluang DROP CONSTRAINT fk_f5c7c419175f3d40;
       public          postgres    false    376    6152    382            �           2606    28385 *   pemeriksaan_peminjaman fk_f7b0d347dce82241    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_peminjaman
    ADD CONSTRAINT fk_f7b0d347dce82241 FOREIGN KEY (id_pemeriksaan) REFERENCES public.pemeriksaan(id_pemeriksaan) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.pemeriksaan_peminjaman DROP CONSTRAINT fk_f7b0d347dce82241;
       public          postgres    false    388    6169    398            �           2606    28410 &   pemeriksaan_temuan fk_f88903281ee2fbda    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemeriksaan_temuan
    ADD CONSTRAINT fk_f88903281ee2fbda FOREIGN KEY (id_dokumen) REFERENCES public.dokumen(id_dokumen);
 P   ALTER TABLE ONLY public.pemeriksaan_temuan DROP CONSTRAINT fk_f88903281ee2fbda;
       public          postgres    false    224    5908    406            �           2606    28065 +   mt_risk_efektif_m_bobot fk_f8b43e7f8af46ecf    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_efektif_m_bobot
    ADD CONSTRAINT fk_f8b43e7f8af46ecf FOREIGN KEY (id_efektif_m_jawaban) REFERENCES public.mt_risk_efektif_m_jawaban(id_efektif_m_jawaban);
 U   ALTER TABLE ONLY public.mt_risk_efektif_m_bobot DROP CONSTRAINT fk_f8b43e7f8af46ecf;
       public          postgres    false    316    6029    318            �           2606    28080 +   mt_risk_kriteria_dampak fk_f9422fdc528daf94    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_kriteria_dampak
    ADD CONSTRAINT fk_f9422fdc528daf94 FOREIGN KEY (id_induk) REFERENCES public.mt_risk_kriteria_dampak(id_kriteria_dampak);
 U   ALTER TABLE ONLY public.mt_risk_kriteria_dampak DROP CONSTRAINT fk_f9422fdc528daf94;
       public          postgres    false    331    6044    331                       2606    28705 !   risk_mitigasi fk_f9bdbdb1b86282eb    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_mitigasi
    ADD CONSTRAINT fk_f9bdbdb1b86282eb FOREIGN KEY (id_mitigasi_sebelum) REFERENCES public.risk_mitigasi(id_mitigasi) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.risk_mitigasi DROP CONSTRAINT fk_f9bdbdb1b86282eb;
       public          postgres    false    491    491    6330            ?           2606    28855    risk_risiko fk_fa69511e4e1a940a    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_risiko
    ADD CONSTRAINT fk_fa69511e4e1a940a FOREIGN KEY (id_kategori) REFERENCES public.mt_pb_kategori(id_kategori);
 I   ALTER TABLE ONLY public.risk_risiko DROP CONSTRAINT fk_fa69511e4e1a940a;
       public          postgres    false    6000    511    294            �           2606    28125 .   mt_risk_taksonomi_appetite fk_fa69669e6fd8c317    FK CONSTRAINT     �   ALTER TABLE ONLY public.mt_risk_taksonomi_appetite
    ADD CONSTRAINT fk_fa69669e6fd8c317 FOREIGN KEY (id_dampak) REFERENCES public.mt_risk_dampak(id_dampak);
 X   ALTER TABLE ONLY public.mt_risk_taksonomi_appetite DROP CONSTRAINT fk_fa69669e6fd8c317;
       public          postgres    false    6023    313    336            P           2606    28995 $   risk_sasaran_pic fk_fac29e8458970eb2    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_pic
    ADD CONSTRAINT fk_fac29e8458970eb2 FOREIGN KEY (id_sasaran) REFERENCES public.risk_sasaran(id_sasaran);
 N   ALTER TABLE ONLY public.risk_sasaran_pic DROP CONSTRAINT fk_fac29e8458970eb2;
       public          postgres    false    523    525    6425            Q           2606    29000 $   risk_sasaran_pic fk_fba97d577a7e4d00    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_sasaran_pic
    ADD CONSTRAINT fk_fba97d577a7e4d00 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan);
 N   ALTER TABLE ONLY public.risk_sasaran_pic DROP CONSTRAINT fk_fba97d577a7e4d00;
       public          postgres    false    6068    345    525            	           2606    28640 +   risk_integrasi_internal fk_fbf05acaa36df691    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_integrasi_internal
    ADD CONSTRAINT fk_fbf05acaa36df691 FOREIGN KEY (id_risiko) REFERENCES public.risk_risiko(id_risiko) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.risk_integrasi_internal DROP CONSTRAINT fk_fbf05acaa36df691;
       public          postgres    false    511    473    6392            s           2606    29165 "   rtm_urian_unit fk_fc0872d11d5eee6b    FK CONSTRAINT     �   ALTER TABLE ONLY public.rtm_urian_unit
    ADD CONSTRAINT fk_fc0872d11d5eee6b FOREIGN KEY (id_unit) REFERENCES public.mt_sdm_unit(table_code);
 L   ALTER TABLE ONLY public.rtm_urian_unit DROP CONSTRAINT fk_fc0872d11d5eee6b;
       public          postgres    false    358    550    6099            �           2606    27995 (   kpi_target_realisasi fk_fda0fbfe778b6a6b    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_target_realisasi
    ADD CONSTRAINT fk_fda0fbfe778b6a6b FOREIGN KEY (id_kpi_target) REFERENCES public.kpi_target(id_kpi_target);
 R   ALTER TABLE ONLY public.kpi_target_realisasi DROP CONSTRAINT fk_fda0fbfe778b6a6b;
       public          postgres    false    238    244    5928                       2606    28595     risk_control fk_fef6e2f42b9a2898    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_control
    ADD CONSTRAINT fk_fef6e2f42b9a2898 FOREIGN KEY (id_jabatan) REFERENCES public.mt_sdm_jabatan(id_jabatan) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.risk_control DROP CONSTRAINT fk_fef6e2f42b9a2898;
       public          postgres    false    463    6068    345                  x������ � �            x������ � �            x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �             x������ � �      "      x������ � �      $      x������ � �      &      x������ � �      (      x������ � �      *      x������ � �      ,      x������ � �      .      x������ � �      0      x������ � �      2      x������ � �      4      x������ � �      6      x������ � �      8      x������ � �      :      x������ � �      <      x������ � �      >      x������ � �      @      x������ � �      A      x������ � �      B      x������ � �      D      x������ � �      F      x������ � �      H      x������ � �      J      x������ � �      L      x������ � �      M      x������ � �      N      x������ � �      P      x������ � �      R      x������ � �      T      x������ � �      V      x������ � �      X      x������ � �      Z      x������ � �      \      x������ � �      ^      x������ � �      `      x������ � �      a      x������ � �      c      x������ � �      e      x������ � �      g      x������ � �      h      x������ � �      j      x������ � �      l      x������ � �      n      x������ � �      o      x������ � �      q      x������ � �      s      x������ � �      u      x������ � �      w      x������ � �      x      x������ � �      y      x������ � �      {      x������ � �      |      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      !      x������ � �      "      x������ � �      $      x������ � �      %      x������ � �      '      x������ � �      )      x������ � �      +      x������ � �      -      x������ � �      .      x������ � �      0      x������ � �      1      x������ � �      2      x������ � �      3      x������ � �      4      x������ � �      5      x������ � �      7      x������ � �      8      x������ � �      9      x������ � �      ;      x������ � �      =      x������ � �      >      x������ � �      ?      x������ � �      A      x������ � �      C      x������ � �      D      x������ � �      F      x������ � �      H      x������ � �      J      x������ � �      L      x������ � �      N      x������ � �      P      x������ � �      Q      x������ � �      R      x������ � �      T      x������ � �      V      x������ � �      X      x������ � �      Z      x������ � �      \      x������ � �      ^      x������ � �      `      x������ � �      b      x������ � �      c      x������ � �      e      x������ � �      g      x������ � �      i      x������ � �      k      x������ � �      l      x������ � �      n      x������ � �      o      x������ � �     