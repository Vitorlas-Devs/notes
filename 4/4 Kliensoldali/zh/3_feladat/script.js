class MinionElement extends HTMLElement {
  constructor() {
    super()
    this.attachShadow({ mode: 'open' })
    const style = document.createElement('style')
    style.textContent = `
        :host {
            text-align: center;
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        p {
            font-size: 1.2em;
            font-weight: bold;
            /* TODO: Állítsd be a p tag színét a type attribútum alapján */
        }
        
        img {
            max-width: 150px;
        }
    `
    this.shadowRoot.append(style)

    const p = document.createElement('p')
    const type = this.getAttribute('type')
    const name = this.getAttribute('name')

    p.textContent = name

    if (type === 'yellow')
      p.style = 'color: #e6bf00'
    else if (type === 'purple')
      p.style = 'color: #6500b3'

    const img = document.createElement('img')

    if (type === 'yellow')
      img.src = './yellow.png'
    else if (type === 'purple')
      img.src = './purple.png'

    this.shadowRoot.append(p)
    this.shadowRoot.append(img)
  }
}

customElements.define('minion-element', MinionElement)
