document.addEventListener('input', (e) => {
  if (e.target.matches('.number')) {
    if (e.target.value.match(/\s/) || Number.isNaN(e.target.value)) {
      e.target.value = e.target.value.slice(0, -1)
    }
  }
})
