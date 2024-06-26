-- user:
-- su, editor, asisten

-- CREATE DATABASE norman_log;

CREATE TABLE IF NOT EXISTS users( 
    id SERIAL PRIMARY KEY, 
    username VARCHAR(100), 
    password VARCHAR, 
    level VARCHAR(100) 
);

CREATE TABLE IF NOT EXISTS asisten( 
    id SERIAL PRIMARY KEY, 
    id_user SERIAL, 
    nama VARCHAR(100), 
    hp VARCHAR(100) 
);

CREATE TABLE IF NOT EXISTS client(
    id SERIAL PRIMARY KEY, 
    nik_client VARCHAR(100),
    nm_client VARCHAR(100),
    hp_client VARCHAR(100),
    file_scan_ktp VARCHAR
);


CREATE TABLE IF NOT EXISTS perkara(
   id SERIAL PRIMARY KEY,
   id_client SERIAL,
   no_perkara VARCHAR(100),
   jns_perkara VARCHAR(100),
   judul VARCHAR(100),
   deskripsi VARCHAR,
   lokasi VARCHAR(100),
   nm_penggugat VARCHAR(100),
   nm_tergugat VARCHAR(100),
   tgl_dibuat_perkara TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   tgl_selesai_perkara TIMESTAMP
);

CREATE TABLE IF NOT EXISTS log_activity( 
    id SERIAL PRIMARY KEY, 
    no_perkara VARCHAR(100), 
    id_client VARCHAR(100), 
    id_asisten VARCHAR(100), 
    log_text VARCHAR,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


-- CREATE TABLE test_table (
--     id SERIAL PRIMARY KEY,
--     nm_penggugat VARCHAR(100),
--     your_column_name TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );