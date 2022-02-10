CREATE OR REPLACE FUNCTION update_sku_tsvector() RETURNS trigger AS $$
BEGIN
  new.tsv :=
    setweight(to_tsvector('pg_catalog.english', coalesce(new.skuid::text,           '')), 'A') ||
              to_tsvector('pg_catalog.english', coalesce(new.manf::text,            '')) ||
    setweight(to_tsvector('pg_catalog.english', coalesce(new.itemno::text,          '')), 'B') ||
              to_tsvector('pg_catalog.english', coalesce(new.skudesc::text,         '')) ||
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
