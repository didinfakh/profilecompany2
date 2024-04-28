ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS created_at;

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN created_at timestamp without time zone;

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS updated_at;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN updated_at timestamp without time zone;


ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS created_by;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN created_by bigint;

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS updated_by;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN updated_by bigint;

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS deleted_by;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN deleted_by bigint;

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS deleted_at;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN deleted_at timestamp without time zone;

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS created_by_desc;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN created_by_desc character varying(200) COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS updated_by_desc;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN updated_by_desc character varying(200) COLLATE pg_catalog."default";

ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control DROP COLUMN IF EXISTS deleted_by_desc;
ALTER TABLE IF EXISTS public.mt_risk_efektifitas_control
    ADD COLUMN deleted_by_desc character varying(200) COLLATE pg_catalog."default";