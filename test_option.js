const cors = require('cors');
const express = require('express');
const app = express();

// Enable CORS
app.use(cors());

app.options('/api/resource', cors());
app.get('/api/resource', cors(), (req, res) => {
  console.log("\n\n  display me \n\n" + req.method);
  res.send("ookkkkkk");
});

app.listen(3010, () => {
  console.log('Server is running on port 3010');
});
