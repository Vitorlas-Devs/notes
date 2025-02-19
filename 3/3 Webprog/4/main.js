const menuDiv = document.getElementById('menu')
const gameDiv = document.getElementById('game')

const name1Text = document.getElementById('name1')
const name2Text = document.getElementById('name2')
const sizeText = document.getElementById('size')

let name1
let name2

const table = document.querySelector('tbody')
table.addEventListener('click', clickTile)
const output = document.getElementById('output')
let size
let sign = 'X'
let placedSigns = 0

document.querySelector('#start').addEventListener('click', () => {
  if (!tryReadInput())
    return

  output.innerHTML = `${name1}'s turn`
  menuDiv.style.display = 'none'
  gameDiv.style.display = 'block'

  for (let i = 0; i < size; i++) {
    const row = table.insertRow()
    for (let j = 0; j < size; j++)
      row.insertCell()
  }
})

function tryReadInput() {
  if (name1Text.value === ''
    || name2Text.value === ''
    || sizeText.value === ''
    || sizeText.value < 15
    || sizeText.value > 25)
    return false

  size = Number.parseInt(sizeText.value)
  name1 = name1Text.value
  name2 = name2Text.value
  return true
}

function clickTile(e) {
  /** @type {HTMLTableCellElement} */
  const target = e.target

  if (target.matches('td')) {
    const row = target.closest('tr').rowIndex
    const col = target.closest('td').cellIndex
    const s = placedSign(row, col)
    if (!s)
      return

    if (checkForWin(row, col)) {
      output.textContent = `${sign === 'X' ? name1 : name2} wins!`
      table.removeEventListener('click', clickTile)
    }
    else if (checkForTie()) {
      output.textContent = 'Tie!'
      table.removeEventListener('click', clickTile)
    }
    else {
      changePlayer()
    }
  }
}

function checkForTie() {
  return placedSigns === size * size
}

function placedSign(row, col) {
  const cell = table.rows[row].cells[col]
  if (cell.textContent !== '')
    return false

  cell.textContent = sign
  placedSigns++
  return true
}

const isInPlayerArea = (row, col) => row < size && row >= 0 && col < size && col >= 0
const getCellSign = (row, col) => table.rows[row].cells[col].textContent

function countInDirection(row, col, rowX, colX) {
  let count = 0
  while (isInPlayerArea(row, col) && getCellSign(row, col) === sign) {
    count++
    row += rowX
    col += colX
  }
  return count
}

function checkForWin(row, col) {
  const directions = [[0, 1], [1, 0], [1, 1], [1, -1]]
  for (const [rowX, colX] of directions) {
    const count = countInDirection(row + rowX, col + colX, rowX, colX)
      + countInDirection(row - rowX, col - colX, -rowX, -colX) + 1
    if (count >= 5)
      return true
  }
  return false
}

function changePlayer() {
  sign === 'X' ? sign = 'O' : sign = 'X'
  output.textContent = `${sign === 'X' ? name1 : name2}'s turn`
}
