const tables = document.querySelectorAll('table')

/**
 * Sets up sorting functionality for a table with winner-loser data
 * @param {HTMLTableElement} table - The table element to make sortable
 * @example
 * const table = document.querySelector('table');
 * setupSortableTable(table);
 */
function setupSortableTable(table) {
  const tbody = table.querySelector('tbody')
  const thead = table.querySelector('thead')

  const data = [...tbody.querySelectorAll('tr')].map(tr => ({
    winner: tr.cells[0].textContent,
    loser: tr.cells[1].textContent,
  }))

  data.sort((a, b) => a.winner.localeCompare(b.winner))

  render()

  thead.addEventListener('click', (e) => {
    const th = e.target.closest('th')
    if (!th)
      return

    const index = [...thead.querySelectorAll('th')].indexOf(th)
    const key = index === 0 ? 'winner' : 'loser'

    data.sort((a, b) => a[key].localeCompare(b[key]))
    render()
  })

  function render() {
    tbody.innerHTML = data.map(({ winner, loser }) => `
<tr>
  <td>${winner}</td>
  <td>${loser}</td>
</tr>
`).join('')
  }
}

tables.forEach(setupSortableTable)
