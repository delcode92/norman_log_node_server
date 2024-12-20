-- user:
-- su, editor, asisten
-- 

-- based on this query create diagram for each table, so I could see then big picture

-- CREATE DATABASE norman_log;

CREATE TABLE IF NOT EXISTS users( 
    id SERIAL PRIMARY KEY, 
    username VARCHAR(100), 
    password VARCHAR, 
    level VARCHAR(100) 
);

CREATE TABLE IF NOT EXISTS penasehat_hukum( id SERIAL PRIMARY KEY,nama VARCHAR(100),email VARCHAR(100),hp VARCHAR(100),addr VARCHAR(100),avatar VARCHAR(100)); 

CREATE TABLE IF NOT EXISTS asisten( 
    id SERIAL PRIMARY KEY, 
    nama VARCHAR(100), 
    email VARCHAR(100), 
    hp VARCHAR(100), 
    addr VARCHAR(100),
    avatar VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS client(
    id SERIAL PRIMARY KEY, 
    nik_client VARCHAR(100),
    nm_client VARCHAR(100),
    
    hp_client VARCHAR(100),
    email VARCHAR(100),

    mandiri BOOLEAN,
    nama_penghubung VARCHAR(100),
    no_kontak_penghubung VARCHAR(100),
    
    alamat VARCHAR(100),
    file_scan_ktp VARCHAR
);

CREATE TABLE IF NOT EXISTS registrasi_id(
    id SERIAL PRIMARY KEY,
    reg_id VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS list_jns_perkara( id SERIAL PRIMARY KEY, jns_perkara_reg_id VARCHAR(30), jns_perkara VARCHAR(100));

CREATE TABLE IF NOT EXISTS perkara( id SERIAL PRIMARY KEY, id_client SERIAL, id_penasehat_hukum JSONB, id_asisten JSONB, no_perkara VARCHAR(100), no_laporan_polisi VARCHAR(100), no_dll VARCHAR(100), jns_perkara_order VARCHAR, judul VARCHAR(100), deskripsi VARCHAR, para_pihak_tergugat JSONB, tgl_dibuat_perkara TIMESTAMP DEFAULT CURRENT_TIMESTAMP, tgl_selesai_perkara TIMESTAMP );

CREATE TABLE IF NOT EXISTS log_activity( 
    id SERIAL PRIMARY KEY, 
    no_perkara VARCHAR(100), 
    id_client VARCHAR(100), 
    id_asisten VARCHAR(100), 
    log_text VARCHAR,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


-- create table test_table(
--     id serial PRIMARYkey

--     nm_penggugat varchar(0)
--     your_column_name TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- )

-- CREATE TABLE test_table (
--     id SERIAL PRIMARY KEY,
--     nm_penggugat VARCHAR(100),
--     your_column_name TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- select by jsonb filter:
select * from perkara where id_asisten @>'[1]';

-- add element into jsonb
UPDATE perkara SET id_asisten = jsonb_set(id_asisten, '{999}', 'true', true) WHERE id = 1;
UPDATE perkara SET id_asisten = jsonb_set(id_asisten, '{999}', '5') WHERE id = 1;

-- delete element on jsonb
 -- Removes the element at index 1
UPDATE perkara SET id_asisten = id_asisten - 1 WHERE id = 1;


-- replace value on jsonb
UPDATE perkara SET id_asisten = ( SELECT jsonb_agg( CASE WHEN elem = 'true' THEN '"5"' ELSE elem END ) FROM jsonb_array_elements(id_asisten) AS elem ) WHERE id = 1;


INSERT INTO log_activity (no_perkara, id_client, id_asisten, log_text) SELECT p.no_perkara, p.id_client::varchar, p.id_asisten::varchar, 'test log activity message' FROM perkara p WHERE p.id_perkara=1;