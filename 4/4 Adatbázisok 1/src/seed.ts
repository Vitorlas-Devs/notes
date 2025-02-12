import { db } from '..'

// schema
db.query(`
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL  
  )
`).run()

// seed
const users = [
  { name: 'Bela', age: 20 },
  { name: 'Nem Bela', age: 30 },
]

const insert = db.query('INSERT INTO users (name, age) VALUES (?, ?)')
users.forEach(user => insert.run(user.name, user.age))
