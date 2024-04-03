ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS created_at;

ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN created_at timestamp without time zone;

ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS updated_at;
ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN updated_at timestamp without time zone;


ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS created_by;
ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN created_by bigint;

ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS modified_by;
ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN modified_by bigint;

ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN deleted_at timestamp without time zone;

ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS created_by_desc;
ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN created_by_desc character varying(200) COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public.mt_sdm_unit DROP COLUMN IF EXISTS modified_by_desc;
ALTER TABLE IF EXISTS public.mt_sdm_unit
    ADD COLUMN modified_by_desc character varying(200) COLLATE pg_catalog."default";