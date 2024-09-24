let x = true

document.getElementById('table').addEventListener('click', (e) => {
  if (e.target.textContent === '') {
    e.target.textContent = x ? 'X' : 'O'
    x = !x
  }
})
