document.addEventListener('click', (e) => {
  if (e.target.matches('a')) {
    if (!e.target.href.includes('elte'))
      e.preventDefault()
  }
})
