const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.static(path.join(__dirname, '../public')));
app.use(express.json());

// Database connection (SQLite for simplicity, can be changed to MySQL)
const db = new sqlite3.Database('./slonemta.db', (err) => {
    if (err) console.error(err.message);
    console.log('Connected to the SloneMTA database.');
});

// Routes
app.get('/api/stats', (req, res) => {
    // Mock stats - in a real scenario, you'd query the MTA server or DB
    res.json({
        online: true,
        players: 42,
        maxPlayers: 100,
        uptime: '15 nap, 4 óra'
    });
});

app.get('/api/news', (req, res) => {
    db.all("SELECT * FROM news ORDER BY created_at DESC LIMIT 5", [], (err, rows) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(rows);
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
