const bananaImageElements = document.querySelectorAll('.banana')
const bananaFoundElement = document.querySelector('#BANANA-FOUND')

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.intersectionRatio > 0) {
      entry.target.classList.add('target')
      document.body.style = 'background-color: #e8ffea'
      bananaFoundElement.classList.remove('hidden')
    }
    else {
      entry.target.classList.remove('target')
      document.body.style = ''
      bananaFoundElement.classList.add('hidden')
    }
  })
})

bananaImageElements.forEach((e) => {
  observer.observe(e)
})
