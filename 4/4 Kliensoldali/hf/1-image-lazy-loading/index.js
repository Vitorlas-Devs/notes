const imgs = document.querySelectorAll('.lazy-load')

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      const img = entry.target
      const src = img.dataset.src
      console.log(src)

      img.src = src
      img.classList.add('loaded')
      observer.unobserve(img)
    }
  })
})

imgs.forEach((img) => {
  observer.observe(img)
})
