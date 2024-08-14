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

CREATE TABLE IF NOT EXISTS penasihat_hukum(
    id SERIAL PRIMARY KEY, 
    nama VARCHAR(100), 
    email VARCHAR(100), 
    hp VARCHAR(100), 
    addr VARCHAR(100)
); 

CREATE TABLE IF NOT EXISTS asisten( 
    id SERIAL PRIMARY KEY, 
    id_user SERIAL, 
    nama VARCHAR(100), 
    email VARCHAR(100), 
    hp VARCHAR(100), 
    addr VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS client(
    id SERIAL PRIMARY KEY, 
    nik_client VARCHAR(100),
    file_scan_ktp VARCHAR
    
    nm_client VARCHAR(100),
    hp_client VARCHAR(100),
    email VARCHAR(100),
    alamat VARCHAR(100),

    mandiri BOOLEAN,
    penghubung BOOLEAN,
    nama_penghubung VARCHAR(100),
    no_kontak_penghubung VARCHAR(100),
    
);

CREATE TABLE IF NOT EXISTS basic_info();

CREATE TABLE IF NOT EXISTS jns_perkara( id SERIAL PRIMARY KEY, list_jns_perkara JSONB );

CREATE TABLE IF NOT EXISTS perkara(
   id SERIAL PRIMARY KEY,
   id_client SERIAL,
   id_asisten SERIAL,
   reg_id VARCHAR(100),
   no_perkara VARCHAR(100),
   no_laporan_polisi VARCHAR(100),
   no_dll VARCHAR(100),
   
   id_jns_perkara VARCHAR(100),
   judul VARCHAR(100),
   deskripsi VARCHAR,
   lokasi VARCHAR(100),
   
   nm_penggugat VARCHAR(100),
   para_pihak_tergugat JSONB,
   
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