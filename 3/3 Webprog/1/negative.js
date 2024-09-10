const list = [10, 3, 34, -2, 0, 5, 6, -7, 8, 9]

/**
 * @param {number[]} list
 * @returns {number[]} list
 */
function negative(list) {
  return list.find(num => num < 0)
}

console.log(`Negative number: ${negative(list)}`)
