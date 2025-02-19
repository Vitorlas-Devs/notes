/**
 * A custom HTML element that creates a sortable table.
 * @class
 * @extends HTMLElement
 * @property {HTMLTableElement} table - The table element within the component
 * @property {HTMLTableSectionElement} tbody - The table body element
 * @property {HTMLTableSectionElement} thead - The table header element
 * @property {Array<{winner: string, loser: string}>} data - Array of objects containing winner and loser data
 *
 * @fires SortableTable#click - Handles sorting when table headers are clicked
 *
 * @example
 * <sortable-table>
 *   <table>
 *     <thead>
 *       <tr><th>Winner</th><th>Loser</th></tr>
 *     </thead>
 *     <tbody>
 *       <tr><td>Team A</td><td>Team B</td></tr>
 *     </tbody>
 *   </table>
 * </sortable-table>
 */
class SortableTable extends HTMLElement {
  constructor() {
    super()
    this.handleSortBound = null
  }

  connectedCallback() {
    if (this.hasAttribute('data-initialized'))
      return

    try {
      this.init()
      this.setAttribute('data-initialized', 'true')
    }
    catch (error) {
      console.error('Failed to initialize sortable table:', error)
    }
  }

  disconnectedCallback() {
    if (this.thead && this.handleSortBound)
      this.thead.removeEventListener('click', this.handleSortBound)
  }

  init() {
    this.table = this.querySelector('table')
    if (!this.table)
      throw new Error('No table element found within sortable-table')

    this.tbody = this.table.querySelector('tbody')
    this.thead = this.table.querySelector('thead')

    if (!this.tbody || !this.thead)
      throw new Error('Table must contain both thead and tbody elements')

    this.data = [...this.tbody.querySelectorAll('tr')].map(tr => ({
      winner: tr.cells[0].textContent,
      loser: tr.cells[1].textContent,
    }))

    this.data.sort((a, b) => a.winner.localeCompare(b.winner))
    this.render()

    this.handleSortBound = this.handleSort.bind(this)
    this.thead.addEventListener('click', this.handleSortBound)
  }

  handleSort(e) {
    const th = e.target.closest('th')
    if (!th)
      return

    const index = [...this.thead.querySelectorAll('th')].indexOf(th)
    const key = index === 0 ? 'winner' : 'loser'

    this.data.sort((a, b) => a[key].localeCompare(b[key]))
    this.render()
  }

  render() {
    this.tbody.innerHTML = this.data.map(({ winner, loser }) => `
      <tr>
        <td>${winner}</td>
        <td>${loser}</td>
      </tr>
    `).join('')
  }
}

customElements.define('sortable-table', SortableTable)

// Wrap existing tables in custom element
document.querySelectorAll('table').forEach((table) => {
  const wrapper = document.createElement('sortable-table')
  table.parentNode.insertBefore(wrapper, table)
  wrapper.appendChild(table)
})
