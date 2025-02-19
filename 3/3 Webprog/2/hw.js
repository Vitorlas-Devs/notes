const numField = document.getElementById('num')
const btn = document.getElementById('btn')
const result = document.getElementById('result')

function hello() {
  for (let i = 0; i < numField.value; i++)
    result.innerHTML += `<p>Hello ${i + 1}!</p>`
}

btn.addEventListener('click', hello)
