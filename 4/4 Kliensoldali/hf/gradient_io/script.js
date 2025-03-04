class GradientBox extends HTMLElement {
  #colorFirst
  #colorSecond

  constructor() {
    super()

    this.#colorFirst = this.dataset.colorFirst
    this.#colorSecond = this.dataset.colorSecond

    this.style.background = `linear-gradient(${this.#colorFirst}, ${this.#colorSecond})`

    this.addEventListener('click', this.#onClick)
  }

  #getRandomColor = () => {
    return `#${Math.floor(Math.random() * 16777215).toString(16)}`
  }

  #onClick = () => {
    this.#colorFirst = this.#getRandomColor()
    this.#colorSecond = this.#getRandomColor()

    this.style.background = `linear-gradient(${this.#colorFirst}, ${this.#colorSecond})`
  }
}

customElements.define('gradient-box', GradientBox)
