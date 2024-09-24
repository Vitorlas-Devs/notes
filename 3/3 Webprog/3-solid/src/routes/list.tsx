import { createSignal } from 'solid-js'

export default function List() {
  const [p, setP] = createSignal(0)
  const [time, setTime] = createSignal(0)

  

  return (
    <>
      <p>
        Average distance:
        {p()}
      </p>
      <p>
        Average time:
        {time()}
      </p>
    </>
  )
}
