const num = document.getElementById('num')
const btn = document.getElementById('btn')
const table = document.getElementById('table')

function generateTable() {
  table.innerHTML = ''
  const n = num.value
  let row = table.insertRow()
  row.inserCell()
  for (let i = 0; i < n; i++)
    row.inserCell().textContent = i + 1

  for (let i = 0; i < n; i++) {
    row = table.insertRow()
    for (let j = 0; j < n; j++)
      row.inserCell().textContent = i * j
  }
}

btn.addEventListener('click', generateTable)
