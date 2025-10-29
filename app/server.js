const express = require('express');
const fs = require('fs');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  const log = `Visited at ${new Date().toISOString()}\n`;
  fs.appendFileSync('access.log', log);
  res.send('Hello from DevOps Capstone!');
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
