class BananaInput extends HTMLTextAreaElement {
  constructor() {
    super()
    this.inputValue = ''
    this.addEventListener('input', this.handleInput)
  }

  handleInput() {
    this.inputValue = this.value
    this.updateDisplay()
  }

  updateDisplay() {
    const array = this.inputValue.split('')

    const a = array.map((c, i, arr) => {
      const prev = arr[i - 1]
      let out = ''
      if (c === ' ')
        out = ' '
      else if (i === 0 || prev === ' ')
        out = 'B'
      else if (prev === 'B' || prev === ' ')
        out = 'a'
      else if (prev === 'a')
        out = 'n'
      else
        out = 'a'

      return out
    })

    this.value = a.join('')
  }
}

customElements.define('banana-input', BananaInput, { extends: 'textarea' })
