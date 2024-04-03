PGDMP      .                |         
   hk_rms_dev    16.2    16.0 h    E           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            F           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            G           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            H           1262    29179 
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
       public          postgres    false    227            I           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.sys_failed_job.id;
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
       public          postgres    false    224            J           0    0    jobs_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.sys_job.id;
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
       public          postgres    false    216            K           0    0    migrations_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.sys_migration.id;
          public          postgres    false    215            �            1259    30886 
   sys_action    TABLE     �   CREATE TABLE public.sys_action (
    id_action integer NOT NULL,
    nama character varying(200),
    id_menu integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
       public          postgres    false    231            L           0    0    sys_action_id_action_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sys_action_id_action_seq OWNED BY public.sys_action.id_action;
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
       public         heap    postgres    false            �            1259    30898 	   sys_group    TABLE     �   CREATE TABLE public.sys_group (
    id_group integer NOT NULL,
    nama character varying(100),
    deleted_at timestamp without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
       public          postgres    false    233            M           0    0    sys_group_id_group_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sys_group_id_group_seq OWNED BY public.sys_group.id_group;
          public          postgres    false    232            �            1259    30921    sys_group_menu    TABLE     v   CREATE TABLE public.sys_group_menu (
    id_group_menu integer NOT NULL,
    id_group integer,
    id_menu integer
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
       public          postgres    false    239            N           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.sys_group_menu_id_group_menu_seq OWNED BY public.sys_group_menu.id_group_menu;
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
       public         heap    postgres    false            �            1259    30914    sys_log    TABLE     ,  CREATE TABLE public.sys_log (
    page character varying(500),
    activity text,
    ip character varying(50),
    activity_time timestamp without time zone,
    user_desc character varying(200),
    action character varying(50),
    table_name character varying(100),
    id_log bigint NOT NULL
);
    DROP TABLE public.sys_log;
       public         heap    postgres    false            �            1259    30913    sys_log_id_log_seq    SEQUENCE     {   CREATE SEQUENCE public.sys_log_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sys_log_id_log_seq;
       public          postgres    false    237            O           0    0    sys_log_id_log_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sys_log_id_log_seq OWNED BY public.sys_log.id_log;
          public          postgres    false    236            �            1259    30879    sys_menu    TABLE     x  CREATE TABLE public.sys_menu (
    id_menu integer NOT NULL,
    id_parent_menu integer,
    nama character varying(100),
    url character varying(300),
    deleted_at timestamp without time zone,
    sort integer,
    icon character varying(20),
    is_show smallint DEFAULT 1,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
       public          postgres    false    229            P           0    0    sys_menu_id_menu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_id_menu_seq OWNED BY public.sys_menu.id_menu;
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
       public          postgres    false    235            Q           0    0    sys_setting_id_setting_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_setting_id_setting_seq OWNED BY public.sys_setting.id_setting;
          public          postgres    false    234            �            1259    29188    sys_user    TABLE     �  CREATE TABLE public.sys_user (
    id_user bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp without time zone,
    last_ip character varying(30),
    last_login time without time zone,
    created_by integer,
    updated_by integer,
    created_by_desc character varying(200),
    modified_by_desc character varying(200),
    salt character varying(20)
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
       public          postgres    false    218            R           0    0    users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_id_seq OWNED BY public.sys_user.id_user;
          public          postgres    false    217            j           2604    30889    sys_action id_action    DEFAULT     |   ALTER TABLE ONLY public.sys_action ALTER COLUMN id_action SET DEFAULT nextval('public.sys_action_id_action_seq'::regclass);
 C   ALTER TABLE public.sys_action ALTER COLUMN id_action DROP DEFAULT;
       public          postgres    false    231    230    231            f           2604    29249    sys_failed_job id    DEFAULT     s   ALTER TABLE ONLY public.sys_failed_job ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 @   ALTER TABLE public.sys_failed_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            k           2604    30901    sys_group id_group    DEFAULT     x   ALTER TABLE ONLY public.sys_group ALTER COLUMN id_group SET DEFAULT nextval('public.sys_group_id_group_seq'::regclass);
 A   ALTER TABLE public.sys_group ALTER COLUMN id_group DROP DEFAULT;
       public          postgres    false    232    233    233            n           2604    30924    sys_group_menu id_group_menu    DEFAULT     �   ALTER TABLE ONLY public.sys_group_menu ALTER COLUMN id_group_menu SET DEFAULT nextval('public.sys_group_menu_id_group_menu_seq'::regclass);
 K   ALTER TABLE public.sys_group_menu ALTER COLUMN id_group_menu DROP DEFAULT;
       public          postgres    false    238    239    239            e           2604    29232 
   sys_job id    DEFAULT     e   ALTER TABLE ONLY public.sys_job ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 9   ALTER TABLE public.sys_job ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            m           2604    30917    sys_log id_log    DEFAULT     p   ALTER TABLE ONLY public.sys_log ALTER COLUMN id_log SET DEFAULT nextval('public.sys_log_id_log_seq'::regclass);
 =   ALTER TABLE public.sys_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    237    236    237            h           2604    30882    sys_menu id_menu    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN id_menu SET DEFAULT nextval('public.sys_menu_id_menu_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    229    228    229            c           2604    29184    sys_migration id    DEFAULT     q   ALTER TABLE ONLY public.sys_migration ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 ?   ALTER TABLE public.sys_migration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            l           2604    30908    sys_setting id_setting    DEFAULT     �   ALTER TABLE ONLY public.sys_setting ALTER COLUMN id_setting SET DEFAULT nextval('public.sys_setting_id_setting_seq'::regclass);
 E   ALTER TABLE public.sys_setting ALTER COLUMN id_setting DROP DEFAULT;
       public          postgres    false    235    234    235            d           2604    29191    sys_user id_user    DEFAULT     l   ALTER TABLE ONLY public.sys_user ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    217    218    218            8          0    30886 
   sys_action 
   TABLE DATA           V   COPY public.sys_action (id_action, nama, id_menu, created_at, updated_at) FROM stdin;
    public          postgres    false    231   �|       .          0    29214 	   sys_cache 
   TABLE DATA           ;   COPY public.sys_cache (key, value, expiration) FROM stdin;
    public          postgres    false    221   }       /          0    29221    sys_cache_lock 
   TABLE DATA           @   COPY public.sys_cache_lock (key, owner, expiration) FROM stdin;
    public          postgres    false    222   B~       4          0    29246    sys_failed_job 
   TABLE DATA           d   COPY public.sys_failed_job (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    227   _~       :          0    30898 	   sys_group 
   TABLE DATA           W   COPY public.sys_group (id_group, nama, deleted_at, created_at, updated_at) FROM stdin;
    public          postgres    false    233   |~       A          0    30937    sys_group_action 
   TABLE DATA           D   COPY public.sys_group_action (id_group_menu, id_action) FROM stdin;
    public          postgres    false    240   �~       @          0    30921    sys_group_menu 
   TABLE DATA           J   COPY public.sys_group_menu (id_group_menu, id_group, id_menu) FROM stdin;
    public          postgres    false    239   �~       1          0    29229    sys_job 
   TABLE DATA           f   COPY public.sys_job (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    224   	       2          0    29238    sys_job_batch 
   TABLE DATA           �   COPY public.sys_job_batch (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    225   &       >          0    30914    sys_log 
   TABLE DATA           k   COPY public.sys_log (page, activity, ip, activity_time, user_desc, action, table_name, id_log) FROM stdin;
    public          postgres    false    237   C       6          0    30879    sys_menu 
   TABLE DATA              COPY public.sys_menu (id_menu, id_parent_menu, nama, url, deleted_at, sort, icon, is_show, created_at, updated_at) FROM stdin;
    public          postgres    false    229   ��       )          0    29181    sys_migration 
   TABLE DATA           =   COPY public.sys_migration (id, migration, batch) FROM stdin;
    public          postgres    false    216   ��       ,          0    29198    sys_password_reset_token 
   TABLE DATA           L   COPY public.sys_password_reset_token (email, token, created_at) FROM stdin;
    public          postgres    false    219   ��       -          0    29205    sys_session 
   TABLE DATA           b   COPY public.sys_session (id, id_user, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    220   ��       <          0    30905    sys_setting 
   TABLE DATA           <   COPY public.sys_setting (id_setting, nama, isi) FROM stdin;
    public          postgres    false    235   ;�       +          0    29188    sys_user 
   TABLE DATA           �   COPY public.sys_user (id_user, name, email, email_verified_at, password, remember_token, created_at, updated_at, deleted_at, last_ip, last_login, created_by, updated_by, created_by_desc, modified_by_desc, salt) FROM stdin;
    public          postgres    false    218   X�       B          0    30951    sys_user_group 
   TABLE DATA           ;   COPY public.sys_user_group (id_user, id_group) FROM stdin;
    public          postgres    false    241   ��       S           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    226            T           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    223            U           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          postgres    false    215            V           0    0    sys_action_id_action_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sys_action_id_action_seq', 8, true);
          public          postgres    false    230            W           0    0    sys_group_id_group_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sys_group_id_group_seq', 1, false);
          public          postgres    false    232            X           0    0     sys_group_menu_id_group_menu_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 2, true);
          public          postgres    false    238            Y           0    0    sys_log_id_log_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sys_log_id_log_seq', 13, true);
          public          postgres    false    236            Z           0    0    sys_menu_id_menu_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 28, true);
          public          postgres    false    228            [           0    0    sys_setting_id_setting_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);
          public          postgres    false    234            \           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    217            ~           2606    29227    sys_cache_lock cache_locks_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_cache_lock
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 I   ALTER TABLE ONLY public.sys_cache_lock DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    222            |           2606    29220    sys_cache cache_pkey 
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
       public            postgres    false    227            �           2606    29244    sys_job_batch job_batches_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_job_batch
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.sys_job_batch DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    225            �           2606    29236    sys_job jobs_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.sys_job DROP CONSTRAINT jobs_pkey;
       public            postgres    false    224            p           2606    29186    sys_migration migrations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sys_migration
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.sys_migration DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            v           2606    29204 3   sys_password_reset_token password_reset_tokens_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sys_password_reset_token
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 ]   ALTER TABLE ONLY public.sys_password_reset_token DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    219            y           2606    29211    sys_session sessions_pkey 
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
       public            postgres    false    233            �           2606    30884    sys_menu sys_menu_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pk PRIMARY KEY (id_menu);
 >   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pk;
       public            postgres    false    229            �           2606    30912    sys_setting sys_setting_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.sys_setting
    ADD CONSTRAINT sys_setting_pk PRIMARY KEY (id_setting);
 D   ALTER TABLE ONLY public.sys_setting DROP CONSTRAINT sys_setting_pk;
       public            postgres    false    235            r           2606    29197    sys_user users_email_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 E   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_email_unique;
       public            postgres    false    218            t           2606    29195    sys_user users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           1259    29237    jobs_queue_index    INDEX     E   CREATE INDEX jobs_queue_index ON public.sys_job USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    224            w           1259    29213    sessions_last_activity_index    INDEX     ]   CREATE INDEX sessions_last_activity_index ON public.sys_session USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    220            z           1259    29212    sessions_user_id_index    INDEX     Q   CREATE INDEX sessions_user_id_index ON public.sys_session USING btree (id_user);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    220            �           2606    30892    sys_action aksi_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_action
    ADD CONSTRAINT aksi_fk1 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 =   ALTER TABLE ONLY public.sys_action DROP CONSTRAINT aksi_fk1;
       public          postgres    false    4745    229    231            �           2606    30940 !   sys_group_action group_action_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk1 FOREIGN KEY (id_group_menu) REFERENCES public.sys_group_menu(id_group_menu) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk1;
       public          postgres    false    239    4753    240            �           2606    30945 !   sys_group_action group_action_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_action
    ADD CONSTRAINT group_action_fk2 FOREIGN KEY (id_action) REFERENCES public.sys_action(id_action) MATCH FULL;
 K   ALTER TABLE ONLY public.sys_group_action DROP CONSTRAINT group_action_fk2;
       public          postgres    false    4747    240    231            �           2606    30927    sys_group_menu group_menu_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk1 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk1;
       public          postgres    false    4749    233    239            �           2606    30932    sys_group_menu group_menu_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_group_menu
    ADD CONSTRAINT group_menu_fk2 FOREIGN KEY (id_menu) REFERENCES public.sys_menu(id_menu) MATCH FULL;
 G   ALTER TABLE ONLY public.sys_group_menu DROP CONSTRAINT group_menu_fk2;
       public          postgres    false    239    4745    229            �           2606    30954 !   sys_user_group sys_user_group_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk1 FOREIGN KEY (id_user) REFERENCES public.sys_user(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk1;
       public          postgres    false    241    218    4724            �           2606    30959 !   sys_user_group sys_user_group_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_group
    ADD CONSTRAINT sys_user_group_fk2 FOREIGN KEY (id_group) REFERENCES public.sys_group(id_group) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sys_user_group DROP CONSTRAINT sys_user_group_fk2;
       public          postgres    false    4749    241    233            8   H   x�3���KI��4��".cΔԜԒT��)T��oS 0�LLI�+7�LM�,�s���0�I7F��� !��      .   0  x����n�0����T����2	�I3*����j��0���T%��_,+�)|v�6���l��
�$r&� �H%\������� X�e~Z�r3,�N��6����ZU�_���@��%�2��Ǣ�������z[۩��*�+��l��?�9�!�ڱf:��L�%��؁���M9��4��8f��V�B[��8��M�G��M�De;�4mƛr.�1/��&3��ҿ�G�m^���T[�������V�V�Bۭ�Y�Б-O�y�9�섵䠣������V�P�B����m����      /      x������ � �      4      x������ � �      :   !   x�3�tL����,.)J,�/�� �=... �g      A   %   x�3�4�2�4bc 6�2�|# �ȏ���� S�a      @      x�3�4�4�2�F\1z\\\ 	      1      x������ � �      2      x������ � �      >   H  x����j�0 ���%��&'?��w����j@��b"c���,[�H��+� x�!F?O�T�u�L$�JH��~kY7<4��]��]nM;X�B�2߇]?�x�vEoZ�Qm���i[l��v_���7c2N�>&��i�3e^��v��z�k���m�{����3��Z��W��(����!u;�9܍@T��xT��u�)r�Q\�tH���لg7��&�B{L����!��}}�ײӠP��p5UȀ��\�0)p�f�?��+g>��9A%�V4���q��f��
T����T{���7�i*��ɻ�Sh pI��>���(�� Ö�      6   5  x���KN�0DשS�@8� ��#�B���n�Ӄ)nFm���ɯ��s:=N��_Ӌ��e��=�߾�����u���ěs��Br��6f�!�SR�J��H
+���aIIF�ư�����b(#)sM�bXGR���ܮ�N)FL�ĈT.����J�� #͓�7Od�zMI��l2�*��֏�j+�,����(��4���d��j���- X�����Q�O��EUң�LF�������ך����z�~�Q�>���2p���d`���d��QDZmrm�nr�kdl�]+t>N� ~ ���S      )   �   x���K� ��u�0f�U�]L&�����`����>0�(!���a�*QѸߋ�g���^(�f�B�^A5Ak�gX�����5˅U�QW�%�x֑͓���a���T��1a���eN���d�����u>���%9�L�0�oF��|K����5�U��\�|�~�� ^vb�m      ,      x������ � �      -   p  x�͔�n�@E��^&҈��ƝV���1���O��/��[����bV��4Q-J��R�N]U�~���>]�ĝ�4�c�J�D�G}Q_���'� g@y���<1���e�0����9� ��'�*(�0(�h�2u�h�����f�"�m��x�!��H-���^xɺ�J �f�-+<���2�Ys1�~4s_�K,F�/#��xlDc�pV�zT$��N��N(�@x;1"��dWC��KՌ�E6Fb+���~h��!��,��܄D1����W�i�Omբ�g(���r$=�33_(��a��< ,C$�SK�r��2��]�N�2n�������8!�����/�~u�uv�;���A�Β�f0����Q�Ӳ�[#W��ƭϿ���v�4\����@�{�=�+2�J-͸���2��l0[64���9�>05'��=�B6�۬B1X�?o4�0B��JM��N�Q��#�?.Q�iP��,�$;}{߯7+�.�����V����۫m���Ȥ�H@�
��2�-�Y��^R�������=����J[��D� a��e$�;���8�����*C�!L���o;�@�Ȯ���C\Kj.�T����3}�����t:����      <      x������ � �      +   �   x�3�����.�Qp,�,�,�p����������\�?N�JC#/_�<c��R7������S�J���l�$�
�B}_��Ȣ<'ע���<w�LO��B�~##]c]C3+SC+#�b@��W� 9T/�      B      x�3�4����� ]     