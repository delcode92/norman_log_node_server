-- user:
-- su, editor, asisten


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
   nm_pengugat VARCHAR(100),
   nm_tergugat VARCHAR(100),
   tgl_mulai DATE NOT NULL DEFAULT CURRENT_DATE,
   tgl_selesai DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS log_activity( 
    id SERIAL PRIMARY KEY, 
    id_perkara SERIAL, 
    id_client SERIAL, 
    id_asisten SERIAL, 
    log_text VARCHAR,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);