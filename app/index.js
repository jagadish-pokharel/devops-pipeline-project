const http = require('http');

const PORT = 3000;
const HOST = '0.0.0.0';  // CHANGE THIS from 'localhost' to '0.0.0.0'

// Create an HTTP server that responds with JSON
const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    message: 'Hello from the DevOps Pipeline V2 rolling update!',
    version: 'v2.0',
    timestamp: new Date().toISOString()
  }));
});

// Start listening on all network interfaces
server.listen(PORT, HOST, () => {
  console.log(`Server running on http://${HOST}:${PORT}`);
});
