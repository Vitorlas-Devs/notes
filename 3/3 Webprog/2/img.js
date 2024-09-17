const text = document.getElementById('text')
const btn = document.getElementById('btn')
const img = document.getElementById('img')
btn.addEventListener('click', loadImage)

function loadImage() {
  img.src = text.value
}
