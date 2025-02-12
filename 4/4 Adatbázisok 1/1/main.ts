import { db } from '..'

const sql = await Bun.file('./1/main.sql').text()
const result = db.query(sql).all()
console.log(result)
