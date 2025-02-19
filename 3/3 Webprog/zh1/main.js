const num = document.getElementById('num')
const btn = document.getElementById('btn')
const list = document.getElementById('list')
const avg = document.getElementById('avg')

btn.addEventListener('click', () => {
  const value = num.value

  if (value && !isNaN(value)) {
    for (const child of list.children) {
      if (value <= Number(child.textContent))
        return
    }

    const li = document.createElement('li')
    li.textContent = value
    li.addEventListener('click', () => {
      li.style.color = 'red'
    })

    list.appendChild(li)
    resetAllSelection()
    updateAvg()
    num.value = ''
  }

  if (list.children.length >= 5)
    btn.disabled = true
})

function resetAllSelection() {
  for (const child of list.children)
    child.style.color = 'black'
}

function updateAvg() {
  const sum = Array.from(list.children).reduce((prev, current) => prev + Number(current.textContent), 0)
  avg.textContent = (sum / list.children.length).toFixed(2)
}
