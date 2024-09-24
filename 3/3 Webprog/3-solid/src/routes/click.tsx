import { createSignal } from 'solid-js'

export default function Click() {
  const [text, setText] = createSignal('Click me')

  const click = (e: MouseEvent) => {
    if (e.target instanceof HTMLButtonElement) {
      setText('Button clicked')
    }
    else if (e.target instanceof HTMLAnchorElement) {
      setText('Link clicked')
      e.preventDefault()
    }
  }

  return (
    <>
      <p>{text()}</p>
      <button onClick={e => click(e)}>
        Button
      </button>
      <a
        href="https://www.google.com"
        onClick={e => click(e)}
      >
        Link
      </a>
    </>
  )
}
