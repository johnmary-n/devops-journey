const express = require('express');
const client = require('prom-client');

const app = express();
const PORT = process.env.PORT || 8080;

// Initialize Prometheus default metrics collection
const register = new client.Registry();
client.collectDefaultMetrics({ register });

// Custom HTTP Request Counter
const httpRequestCounter = new client.Counter({
  name: 'http_requests_total',
  help: 'Total number of HTTP requests',
  labelNames: ['method', 'route', 'status']
});
register.registerMetric(httpRequestCounter);

// Middleware to track requests
app.use((req, res, next) => {
  res.on('finish', () => {
    httpRequestCounter.inc({ method: req.method, route: req.path, status: res.statusCode });
  });
  next();
});

// App Routes
app.get('/', (req, res) => {
  res.json({ message: "Welcome to the DevSecOps Capstone API", status: "Active" });
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: "UP", timestamp: new Date() });
});

// Prometheus Metrics Endpoint
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.listen(PORT, () => {
  console.log(`🚀 Capstone API running on port ${PORT}`);
});
