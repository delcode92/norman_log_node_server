require('dotenv').config();
const express = require("express");

const cloudinary = require('cloudinary').v2;
const multer = require('multer');
const { CloudinaryStorage } = require('multer-storage-cloudinary');

const bodyParser = require('body-parser');
const app = express();
const cors = require("cors");
const { Pool } = require('pg');
const PORT = 8082;

app.use(cors());

// Middleware to parse JSON request body
app.use(bodyParser.json());

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'norman_log',
  // password: 'your_password',
  port: 5432, // Default PostgreSQL port
});

// ================== Configure Cloudinary =====================
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

// Configure multer storage
const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: process.env.CLOUDINARY_DIR, // Optional: specify a folder in Cloudinary
    allowed_formats: ['jpg', 'png', 'jpeg', 'gif'] // Optional: restrict file types
  }
});

// Initialize multer upload
const upload = multer({ storage: storage });
// ======================================


app.get('/get_jns_perkara', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM list_jns_perkara ORDER BY id');
    
    client.release(); // Release the client back to the pool
    res.status(200).json(result.rows);
  } 
  catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/get_penasihat', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM penasehat_hukum ORDER BY nama');
    
    client.release(); // Release the client back to the pool
    res.status(200).json(result.rows);
  } 
  catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/get_pendamping', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM asisten ORDER BY nama');
    
    client.release(); // Release the client back to the pool
    res.status(200).json(result.rows);
  } 
  catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/get_perkara', async (req, res) => {
  try {
    const client = await pool.connect();
    // const result = await client.query('SELECT  jns_perkara FROM perkara ORDER BY tgl_dibuat_perkara DESC');
    const result = await client.query('SELECT id, id_client, no_perkara, jns_perkara, judul, deskripsi, tgl_dibuat_perkara FROM perkara ORDER BY tgl_dibuat_perkara DESC');
    client.release(); // Release the client back to the pool
    res.status(200).json(result.rows);
  } 
  catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// on expressJS could I use routing like below ?
// first route if not have parameter
// second route if has param
// app.get('/get_log', async (req, res) => {}
// app.get('/get_log/:perkara_id', async (req, res) => {}

app.get('/get_log/:perkara_id', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query("SELECT * FROM log_activity WHERE no_perkara='"+req.params.perkara_id+"'  ORDER BY log_time DESC");
    client.release(); // Release the client back to the pool
    res.status(200).json(result.rows);
  } 
  catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// WHEN EDITOR SELECT LOG TO EDIT
app.get('/get_log_edit/:log_id', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query("SELECT log_text FROM log_activity WHERE id="+req.params.log_id);
    client.release(); // Release the client back to the pool
    res.status(200).json(result.rows);
  } 
  catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.post('/add_log', async (req, res) => {
  const { no_perkara, log_text } = req.body;
  
  try {
    const client = await pool.connect();
    const result = await client.query("INSERT INTO log_activity (no_perkara, log_text) VALUES ('"+no_perkara+"', '"+log_text+"')");
    client.release(); // Release the client back to the pool
    res.status(200).json({ success: true });

  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Something wrong' });
  }
  
});

app.post('/update_regid', async (req, res) => {
  const { id, RegID, jns_perkara } = req.body;
  
  // console.log(id, RegID, jns_perkara);

  // console.log("new key: " + new_key);
  // console.log("value: " + value);

  try {
    const client = await pool.connect();
    await client.query("UPDATE list_jns_perkara SET jns_perkara_reg_id='"+RegID+"', jns_perkara='"+jns_perkara+"' WHERE id="+id);
    client.release(); 

    res.status(200).json({ success: true });

  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Something wrong' });
  }
});


app.post('/upload_ktp', upload.single('file'), async (req, res) => {
  console.log("masuk 1");
  if (!req.file) {
    console.log("masuk 2");
    return res.status(400).json({ error: 'No file uploaded' });
  }
  
  // File uploaded successfully
  console.log("masuk 3");
  res.status(200).json({ fileUrl: req.file.path });
});

app.post('/save_client', async (req, res) => {
  const { NIK, NamaPenggugat, HP, Email, Alamat, ViaMandiri, NamaPenghubung, KontakPenghubung, file_url, table_name } = req.body;
  
  try {
    const client = await pool.connect();

    const result = await client.query(
      "INSERT INTO "+table_name+" (nik_client, nm_client, hp_client, email, mandiri, nama_penghubung, no_kontak_penghubung, alamat, file_scan_ktp) VALUES ('"+NIK+"', '"+NamaPenggugat+"', '"+HP+"', '"+Email+"', '"+ViaMandiri+"', '"+NamaPenghubung+"', '"+KontakPenghubung+"', '"+Alamat+"', '"+file_url+"') RETURNING id"
    );

    client.release();
    console.log("================");
    console.log(result.rows);

    res.status(200).json(result.rows); 
    
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Something wrong' });
  }
});

app.post('/save_perkara', async (req, res) => {
  const {idClient, IdPenasihat, IdPendamping, NoPerkara, NoLpPol, NoLainnya, perkaraOrder, Judul, Deskripsi, ParaPihakTergugat, table_name} = req.body;
  
  console.log("idpenasihat : ", IdPenasihat);
  console.log("idpendamping : ", IdPendamping);
  console.log("para tergugat : ", ParaPihakTergugat);

  /*
  try {
    const client = await pool.connect();

    const q = {text:''};

    const result = await client.query(
      "INSERT INTO "+table_name+" (id_client, id_penasehat_hukum, id_asisten, no_perkara, no_laporan_polisi, no_dll, jns_perkara_order, judul, deskripsi, para_pihak_tergugat) VALUES ("+idClient+", '"+IdPenasihat+"', '"+IdPendamping+"', '"+NoPerkara+"', '"+NoLpPol+"', '"+NoLainnya+"', '"+perkaraOrder+"', '"+Judul+"', '"+Deskripsi+"', '"+ParaPihakTergugat+"')"
    );

    // const result = await client.query(
    //   "INSERT INTO "+table_name+" (id_client, id_penasehat_hukum) VALUES ("+idClient+", "+IdPenasihat+")"
    // );

    client.release();
    console.log("================");
    console.log(result.rows);

    res.status(200).json(result.rows); 
    
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Something wrong' });
  }
  */

  try {
    const client = await pool.connect();
    try {
      const query = {
        text: `
          INSERT INTO ${table_name} (
            id_client, id_penasehat_hukum, id_asisten, no_perkara,
            no_laporan_polisi, no_dll, jns_perkara_order, judul,
            deskripsi, para_pihak_tergugat
          ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
        `,
        values: [
          idClient,
          JSON.stringify(IdPenasihat),
          JSON.stringify(IdPendamping),
          NoPerkara,
          NoLpPol,
          NoLainnya,
          perkaraOrder,
          Judul,
          Deskripsi,
          JSON.stringify(ParaPihakTergugat)
        ]
      };

      const result = await client.query(query);
      res.status(200).json({ message: 'Data inserted successfully', result });
    } finally {
      client.release();
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'An error occurred while inserting data' });
  }

});

app.post('/save_ap_bio', async (req, res) => {
  const { Name, Email, Phone, Addr, table_name } = req.body;
  console.log(Name, Email, Phone, Addr, table_name ); 
  
  try {
    const client = await pool.connect();
    // const result = await client.query(
    //   "INSERT INTO "+table_name+" (nama, email, hp, addr) VALUES ($1, $2, $3, $4)", 
    //   [Name, Email, Phone, Addr]
    // );

    const result = await client.query(
      "INSERT INTO "+table_name+" (nama, email, hp, addr) VALUES ('"+Name+"', '"+Email+"', '"+Phone+"', '"+Addr+"')"
    );

    client.release(); // Release the client back to the pool
    res.status(200).json({ success: true });
    // console.log("akhir: ", result);

  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Something wrong' });
  }
  
});


app.post('/login', async (req, res) => {

});

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
    
    // console.log(process.env.CLOUDINARY_CLOUD_NAME);
  });