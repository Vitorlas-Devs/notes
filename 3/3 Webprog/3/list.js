const ul = document.getElementById('list')
let x = false
let prev

ul.addEventListener('click', (e) => {
  if (e.target.matches('li')) {
    if (!x) {
      prev = e.target
      x = true
    }
    else {
      const temp = prev.textContent
      prev.textContent = e.target.textContent
      e.target.textContent = temp
      x = false
    }
  }
})
