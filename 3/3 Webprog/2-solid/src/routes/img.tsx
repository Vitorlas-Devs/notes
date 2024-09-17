import { createSignal } from 'solid-js'

export default function Img() {
  const [text, setText] = createSignal('')
  const [src, setSrc] = createSignal('')

  const loadImage = () => {
    setSrc(text())
  }

  return (
    <>
      <h1>Image</h1>
      <input type="text" id="text" placeholder="Enter image url" onInput={e => setText(e.currentTarget.value)} />
      <button id="btn" onClick={loadImage}>
        Load image
      </button>
      <img id="img" src={src()} alt="img" />
    </>
  )
}
