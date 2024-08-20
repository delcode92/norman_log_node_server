const express = require("express");
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

app.get('/get_jns_perkara', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT list_jns_perkara from jns_perkara');
    
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
  const { old_key, new_key, value } = req.body;
  
  console.log("old key: " + old_key);
  console.log("new key: " + new_key);
  console.log("value: " + value);

  try {
    const client = await pool.connect();
    
    if(new_key != ""){
      // update the KEY or VALUE
      
      // UPDATE jns_perkara SET list_jns_perkara = jsonb_set(list_jns_perkara, '{reg.100}', list_jns_perkara->'reg.1');

      await client.query("UPDATE jns_perkara SET list_jns_perkara = jsonb_set(list_jns_perkara, '{"+new_key+"}', list_jns_perkara->'"+old_key+"')");
      
      // remove old key
      //UPDATE jns_perkara SET list_jns_perkara = list_jns_perkara - 'reg.1' WHERE list_jns_perkara ? 'reg.1';
      await client.query("UPDATE jns_perkara SET list_jns_perkara = list_jns_perkara - '"+old_key+"' WHERE list_jns_perkara ? '"+ old_key +"'");
    }
    else if(new_key==""){
      await client.query(" UPDATE jns_perkara SET list_jns_perkara = jsonb_set(list_jns_perkara, "+old_key+", "+val+", false)");
    }

    // client.release(); // Release the client back to the pool
    res.status(200).json({ success: true });

  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).json({ error: 'Something wrong' });
  }
});

app.post('/login', async (req, res) => {

});

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
  });