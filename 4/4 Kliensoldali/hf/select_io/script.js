class SmartSelect extends HTMLSelectElement {
  constructor() {
    super()
    this.helpTextFirst = this.createHelpText('helptext-1', '⬅ Kattints a legördülő menüre! 😉')
    this.helpTextSecond = this.createHelpText('helptext-2', 'Nagyon ügyes! 😊 Most próbálj meg rákattintani valamelyik tantárgyra!! 😛🥵')
    this.parentElement.insertBefore(this.helpTextFirst, this)
    this.parentElement.insertBefore(this.helpTextSecond, this)

    this.showTooltip(this.helpTextFirst)
    this.hideTooltip(this.helpTextSecond)

    this.addEventListener('click', this.onClick)
  }

  showTooltip(tooltip) {
    tooltip.classList.remove('hidden')
  }

  hideTooltip(tooltip) {
    tooltip.classList.add('hidden')
  }

  createHelpText = (id, text) => {
    const helpText = document.createElement('div')
    helpText.textContent = text
    helpText.id = id
    helpText.classList.add('helptext')
    return helpText
  }

  onClick = (e) => {
    if (e.target.value === '') {
      this.hideTooltip(this.helpTextFirst)
      this.showTooltip(this.helpTextSecond)
    }
    else {
      this.hideTooltip(this.helpTextSecond)
    }
  }
}

customElements.define('smart-select', SmartSelect, { extends: 'select' })
