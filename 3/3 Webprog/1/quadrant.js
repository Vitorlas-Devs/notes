const p = { x: 1, y: 1 }

function printPoint(p) {
  return `(${p.x}, ${p.y})`
}

function quadrant(p) {
  const { x, y } = p

  if (x === 0 || y === 0)
    return 'none'

  if (x > 0)
    return y > 0 ? 'first' : 'fourth'
  else
    return y > 0 ? 'second' : 'third'
}

console.log(`The quadrant of ${printPoint(p)} is ${quadrant(p)}`)
