import { createSignal } from 'solid-js'

export default function Counter() {
  const [num, setNum] = createSignal(0)

  // start adding or substracting fast when mouse is over the button
  function handleHover(mode: '+' | '-') {
  }

  return (
    <>
      <h1>Counter</h1>
      <button
        id="substract"
        value="-"
        onClick={() => setNum(num() - 1)}
        onMouseOver={() => handleHover('-')}
        onMouseOut={() => setNum(num())}
      >
        -
      </button>
      <input type="number" id="num" value={num()} onInput={e => setNum(Number(e.currentTarget.value))} />
      <button id="add" value="+" onClick={() => setNum(num() + 1)}>
        +
      </button>
    </>
  )
}
