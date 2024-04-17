ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS created_at;

ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN created_at timestamp without time zone;

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS updated_at;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN updated_at timestamp without time zone;


ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS created_by;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN created_by bigint;

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS updated_by;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN updated_by bigint;

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS deleted_by;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN deleted_by bigint;

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN deleted_at timestamp without time zone;

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS created_by_desc;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN created_by_desc character varying(200) COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS updated_by_desc;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN updated_by_desc character varying(200) COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public.mt_sasaran DROP COLUMN IF EXISTS deleted_by_desc;
ALTER TABLE IF EXISTS public.mt_sasaran
    ADD COLUMN deleted_by_desc character varying(200) COLLATE pg_catalog."default";