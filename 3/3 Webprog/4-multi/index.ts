import { id, init, tx } from '@instantdb/core'

// ID for app: Replace this with your actual InstantDB app ID
const APP_ID = 'e321e1b1-bccf-4089-a2e2-cd08beb4a7a1'

// Define the schema for our game
interface GameState {
  id: string
  player1: string
  player2: string
  size: number
  currentPlayer: 'X' | 'O'
  board: string[][]
  winner: string | null
  tie: boolean
}

interface Schema {
  games: GameState
}

// Initialize the database
const db = init<Schema>({ appId: APP_ID })

// DOM elements
const menuDiv = document.getElementById('menu')!
const gameDiv = document.getElementById('game')!
const name1Text = document.getElementById('name1') as HTMLInputElement
const name2Text = document.getElementById('name2') as HTMLInputElement
const sizeText = document.getElementById('size') as HTMLInputElement
const table = document.querySelector('tbody')!
const output = document.getElementById('output')!

let currentGameId: string | null = null

// Event listeners
document.querySelector('#start')!.addEventListener('click', startGame)
table.addEventListener('click', clickTile)

// Start a new game
async function startGame() {
  if (!tryReadInput())
    return

  const gameState: GameState = {
    id: id(),
    player1: name1Text.value,
    player2: name2Text.value,
    size: Number.parseInt(sizeText.value),
    currentPlayer: 'X',
    board: Array.from({ length: Number.parseInt(sizeText.value) }, () => Array.from({ length: Number.parseInt(sizeText.value) }, () => '')),
    winner: null,
    tie: false,
  }

  await db.transact(tx.games[gameState.id].update({ ...gameState }))
  currentGameId = gameState.id

  menuDiv.style.display = 'none'
  gameDiv.style.display = 'block'

  // Subscribe to game updates
  db.subscribeQuery({ games: { id: currentGameId } }, (resp) => {
    if (resp.error) {
      console.error(resp.error.message)
      return
    }
    if (resp.data && resp.data.games[0])
      renderGame(resp.data.games[0])
  })
}

function tryReadInput() {
  if (name1Text.value === ''
    || name2Text.value === ''
    || sizeText.value === ''
    || Number.parseInt(sizeText.value) < 15
    || Number.parseInt(sizeText.value) > 25)
    return false

  return true
}

function renderGame(gameState: GameState) {
  output.textContent = gameState.winner
    ? `${gameState.winner} wins!`
    : gameState.tie
      ? 'Tie!'
      : `${gameState.currentPlayer === 'X' ? gameState.player1 : gameState.player2}'s turn`

  table.innerHTML = ''
  for (let i = 0; i < gameState.size; i++) {
    const row = table.insertRow()
    for (let j = 0; j < gameState.size; j++) {
      const cell = row.insertCell()
      cell.textContent = gameState.board[i][j]
    }
  }

  if (gameState.winner || gameState.tie)
    table.removeEventListener('click', clickTile)
}

async function clickTile(e: Event) {
  if (!currentGameId)
    return

  const target = e.target as HTMLTableCellElement
  if (target.matches('td')) {
    const row = target.closest('tr')!.rowIndex
    const col = target.cellIndex

    const gameState = (await db.queryOnce({ games: { id: currentGameId } })).data.games[0]

    if (gameState.board[row][col] !== '' || gameState.winner || gameState.tie)
      return

    const newBoard = [...gameState.board]
    newBoard[row][col] = gameState.currentPlayer

    const winner = checkForWin(newBoard, row, col, gameState.size, gameState.currentPlayer)
    const tie = checkForTie(newBoard, gameState.size)

    await db.transact(tx.games[currentGameId].update({
      board: newBoard,
      currentPlayer: gameState.currentPlayer === 'X' ? 'O' : 'X',
      winner: winner ? (gameState.currentPlayer === 'X' ? gameState.player1 : gameState.player2) : null,
      tie,
    }))
  }
}

function checkForWin(board: string[][], row: number, col: number, size: number, player: string): boolean {
  const directions = [[0, 1], [1, 0], [1, 1], [1, -1]]
  for (const [rowX, colX] of directions) {
    const count = countInDirection(board, row, col, rowX, colX, size, player)
      + countInDirection(board, row, col, -rowX, -colX, size, player) - 1
    if (count >= 5)
      return true
  }
  return false
}

function countInDirection(board: string[][], row: number, col: number, rowX: number, colX: number, size: number, player: string): number {
  let count = 0
  while (row >= 0 && row < size && col >= 0 && col < size && board[row][col] === player) {
    count++
    row += rowX
    col += colX
  }
  return count
}

function checkForTie(board: string[][], _size: number): boolean {
  return board.every(row => row.every(cell => cell !== ''))
}
