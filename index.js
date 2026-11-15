const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = 3000;

// Підключення до бази даних через змінні середовища (які передасть Docker Compose)
const pool = new Pool({
  connectionString: process.env.DATABASE_URL || 'postgres://myuser:mypassword@db:5432/mydb',
});

// Перевірка з'єднання при запуску
pool.connect((err, client, release) => {
  if (err) {
    console.error('Помилка підключення до бази даних PostgreSQL:', err.stack);
  } else {
    console.log('Успішне з\'єднання з базою даних PostgreSQL!');
    release();
  }
});

app.get('/', (req, res) => {
  res.send('Hello World from Dockerized Node.js with PostgreSQL!');
});

app.listen(port, () => {
  console.log(`Застосунок запущено на порті ${port}`);
});
