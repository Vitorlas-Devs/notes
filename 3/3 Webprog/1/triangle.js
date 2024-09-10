/* eslint-disable no-alert */
const a = Number.parseInt(prompt('Enter a: '))
const b = Number.parseInt(prompt('Enter b: '))
const c = Number.parseInt(prompt('Enter c: '))

/**
 *
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @returns boolean
 */
function triangle(a, b, c) {
  return a + b > c && a + c > b && b + c > a
}

console.log(`${a}x${b}x${c} is a triangle? ${triangle(a, b, c)}`)
