const tables = document.querySelectorAll('table')

/**
 * Sets up sorting functionality for a table with winner-loser data
 * @param {HTMLTableElement} table - The table element to make sortable
 * @example
 * const table = document.querySelector('table');
 * setupSortableTable(table);
 */
function createSortableTable(table) {
  const getData = tbody =>
    [...tbody.querySelectorAll('tr')].map(tr => ({
      winner: tr.cells[0].textContent,
      loser: tr.cells[1].textContent,
    }))

  const render = (tbody, data) => {
    tbody.innerHTML = data.map(({ winner, loser }) => `
      <tr>
        <td>${winner}</td>
        <td>${loser}</td>
      </tr>
    `).join('')
  }

  const handleSort = (thead, tbody, data) => (e) => {
    const th = e.target.closest('th')
    if (!th)
      return

    const index = [...thead.querySelectorAll('th')].indexOf(th)
    const key = index === 0 ? 'winner' : 'loser'

    data.sort((a, b) => a[key].localeCompare(b[key]))
    render(tbody, data)
  }

  const tbody = table.querySelector('tbody')
  const thead = table.querySelector('thead')
  const data = getData(tbody)

  data.sort((a, b) => a.winner.localeCompare(b.winner))
  render(tbody, data)

  thead.addEventListener('click', handleSort(thead, tbody, data))
}

tables.forEach(createSortableTable)
