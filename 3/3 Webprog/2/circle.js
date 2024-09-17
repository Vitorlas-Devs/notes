const output = document.getElementById('result')
const num = document.getElementById('num')
const btn = document.getElementById('btn')
btn.addEventListener('click', calculateArea)

function calculateArea() {
  const r = Number(num.value)
  const area = Math.PI * r * r
  output.innerHTML = `The area of a circle with radius ${r} is ${area.toFixed(2)}`
}
