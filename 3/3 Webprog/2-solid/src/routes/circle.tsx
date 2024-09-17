import { createSignal } from 'solid-js'

export default function Circle() {
  const [value, setValue] = createSignal(0)

  return (
    <>
      <h1>Circle</h1>
      <input type="text" id="num" placeholder="r" onChange={e => setValue(Number(e.currentTarget.value))} />
      <button id="btn">Calculate circle area</button>
      <p id="result">
        The area of a circle with radius
        {' '}
        {value()}
        {' '}
        is
        {' '}
        {value() * value() * Math.PI}
        .
      </p>
    </>
  )
}
