const tables = document.querySelectorAll('table')

/**
 * Sets up sorting functionality for a table with winner-loser data
 * @param {HTMLTableElement} table - The table element to make sortable
 * @example
 * const table = document.querySelector('table');
 * setupSortableTable(table);
 */
class SetupSortableTable {
  tbody
  thead
  data

  constructor(table) {
    this.tbody = table.querySelector('tbody')
    this.thead = table.querySelector('thead')

    this.data = [...this.tbody.querySelectorAll('tr')].map(tr => ({
      winner: tr.cells[0].textContent,
      loser: tr.cells[1].textContent,
    }))
  }

  sortData() {
    this.data.sort((a, b) => a.winner.localeCompare(b.winner))
  }

  render() {
    this.tbody.innerHTML = this.data.map(({ winner, loser }) => `
<tr>
<td>${winner}</td>
<td>${loser}</td>
</tr>
`).join('')
  }

  addEventListeners() {
    this.thead.addEventListener('click', (e) => {
      const th = e.target.closest('th')
      if (!th)
        return

      const index = [...this.thead.querySelectorAll('th')].indexOf(th)
      const key = index === 0 ? 'winner' : 'loser'

      this.data.sort((a, b) => a[key].localeCompare(b[key]))
      this.render()
    })
  }

  init() {
    this.sortData()
    this.render()
    this.addEventListeners()
  }
}

tables.forEach((table) => {
  const sortableTable = new SetupSortableTable(table)
  sortableTable.init()
})
