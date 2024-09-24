const p = document.getElementById('text')
const button = document.getElementById('button')
const link = document.getElementById('link')

function onClick(e) {
  console.log('clicked', e)

  if (e.target === button) {
    p.textContent = 'Button clicked'
  }
  else if (e.target === link) {
    p.textContent = 'Link clicked'
    e.preventDefault()
  }
}

button.addEventListener('click', onClick)
link.addEventListener('click', onClick)
