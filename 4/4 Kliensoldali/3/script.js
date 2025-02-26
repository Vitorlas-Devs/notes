const carousel = document.querySelector('#carousel')
const liEls = carousel.querySelectorAll('li')
const prevBtn = document.querySelector('#prev')
const nextBtn = document.querySelector('#next')

let currentIndex = 0

function render() {
  liEls.forEach((li, index) => {
    li.classList.toggle('active', index === currentIndex)
    li.classList.toggle('hidden', index !== currentIndex)

    li.style.transform = `translateX(${(index - currentIndex) * 100}%)`
    li.style.transition = 'transform 0.3s ease-out'
  })
}

function next() {
  currentIndex = (currentIndex + 1) % liEls.length
  render()
}

function prev() {
  currentIndex = (currentIndex - 1 + liEls.length) % liEls.length
  render()
}

render()

nextBtn.addEventListener('click', next)
prevBtn.addEventListener('click', prev)
