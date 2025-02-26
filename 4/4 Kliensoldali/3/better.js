const carousel = document.querySelector('#carousel')
const liEls = carousel.querySelectorAll('li')

let currentIndex = 0
let startX = 0
let isDragging = false
let currentTranslate = 0
let prevTranslate = 0
let animationID = 0
let startTime = 0

// Touch events kawaii~
carousel.addEventListener('touchstart', touchStart)
carousel.addEventListener('touchmove', touchMove)
carousel.addEventListener('touchend', touchEnd)

// Mouse events sugoi!
carousel.addEventListener('mousedown', touchStart)
carousel.addEventListener('mousemove', touchMove)
carousel.addEventListener('mouseup', touchEnd)
carousel.addEventListener('mouseleave', touchEnd)

function touchStart(event) {
  startTime = new Date().getTime()
  isDragging = true
  const touch = event.type.includes('mouse') ? event : event.touches[0]
  startX = touch.clientX

  // Stop any animation
  cancelAnimationFrame(animationID)

  // Sugoi! Set transition to none for immediate response
  liEls.forEach((li) => {
    li.style.transition = 'none'
  })
}

function touchMove(event) {
  if (!isDragging)
    return

  const touch = event.type.includes('mouse') ? event : event.touches[0]
  const currentX = touch.clientX
  const diff = currentX - startX

  // Calculate how far to translate
  currentTranslate = prevTranslate + diff

  // Kawaii resistance at edges
  if (currentIndex === 0 && diff > 0)
    currentTranslate = prevTranslate + diff * 0.3

  if (currentIndex === liEls.length - 1 && diff < 0)
    currentTranslate = prevTranslate + diff * 0.3

  // Apply translation in animation frame for smoother movement
  animationID = requestAnimationFrame(() => {
    liEls.forEach((li, index) => {
      li.style.transform = `translateX(${(index - currentIndex) * 100 + currentTranslate / carousel.clientWidth * 100}%)`
    })
  })

  // Prevent default to stop scrolling on touch devices
  event.preventDefault()
}

function touchEnd() {
  isDragging = false
  const endTime = new Date().getTime()
  const timeElapsed = endTime - startTime
  const moveDistance = currentTranslate - prevTranslate

  // Add transition back for smooth sliding
  liEls.forEach((li) => {
    li.style.transition = 'transform 0.3s ease-out'
  })

  // Nani?! Fast flick detection
  const isFlick = timeElapsed < 250 && Math.abs(moveDistance) > 30

  // Decide whether to go to next/prev slide or snap back
  if (moveDistance < -100 || (isFlick && moveDistance < -20)) {
    // Swipe left - go to next slide
    if (currentIndex < liEls.length - 1)
      currentIndex++
  }
  else if (moveDistance > 100 || (isFlick && moveDistance > 20)) {
    // Swipe right - go to previous slide
    if (currentIndex > 0)
      currentIndex--
  }

  // Update prevTranslate for next drag
  prevTranslate = 0
  currentTranslate = 0

  // Render the carousel
  render()
}

function render() {
  liEls.forEach((li, index) => {
    li.classList.toggle('active', index === currentIndex)
    li.classList.toggle('hidden', index !== currentIndex)

    li.style.transform = `translateX(${(index - currentIndex) * 100}%)`
    li.style.transition = 'transform 0.3s ease-out'
  })
}
render()
