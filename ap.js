const express = require('express');
const app = express();

app.use(express.json());
app.get('/', (req, res) => {
    res.json({ message: 'Bienvenue dans mon app DevOps Node.js !' });
});
app.post('/add', (req, res) => {
    const { a, b } = req.body;
    if (a === undefined || b === undefined) {
        return res.status(400).json({ error: 'Veuillez fournir a et b' });
    }
    res.json({ result: a + b });
});
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
