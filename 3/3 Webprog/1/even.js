const list = [10, 3, 34, -2, 0, 5, 6, -7, 8, 9]

function even(list) {
  return list.filter(num => num % 2 === 0)
}

console.log(`Even numbers: ${even(list).length} numbers`)
