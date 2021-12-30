
ALTER TABLE tblsku ADD COLUMN tsv tsvector;

CREATE OR REPLACE FUNCTION update_sku_tsvector() RETURNS trigger AS $$
BEGIN
  new.tsv :=
    to_tsvector('pg_catalog.english', coalesce(new.skuid::text,           '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.sku::text,             '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.manf::text,            '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.itemno::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.skudesc::text,         '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.unitweight::text,      '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.skuminunitstype::text, '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.dcloc::text,           '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku01::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku02::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku03::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku04::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku05::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku06::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku07::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku08::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku09::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.vsku10::text,          '')) ||
    to_tsvector('pg_catalog.english', coalesce(new.skunotes::text,        ''))
    ;
  return new;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER tsvectorupdate
    BEFORE INSERT OR UPDATE ON tblsku
    FOR EACH ROW EXECUTE FUNCTION update_sku_tsvector();

-- update all rows to trigger an update to tsv field
UPDATE tblsku SET tsv = NULL;

DROP VIEW frm_sku_subform1;
\i db/legacy/queries/frm_sku_subform1.sql

