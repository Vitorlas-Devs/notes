import { createSignal } from 'solid-js'

export default function Input() {
  const [input1, setInput1] = createSignal('')
  const [input2, setInput2] = createSignal('')

  return (
    <>
      <input type="text" value={input1()} onInput={e => setInput1(e.currentTarget.value)} />
      <input type="text" value={input2()} onInput={e => setInput2(e.currentTarget.value)} />
    </>
  )
}
