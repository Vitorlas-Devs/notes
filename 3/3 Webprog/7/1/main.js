const loc = document.getElementById('loc')
const lat = document.getElementById('lat')
const lon = document.getElementById('lon')
const table = document.getElementById('table')

const wtrDiv = document.getElementById('weather')

const locBtn = document.getElementById('locbtn')
const wtrBtn = document.getElementById('wtrbtn')

locBtn.addEventListener('click', () => getCoordinates(loc.value))
wtrBtn.addEventListener('click', () => getWeather())

const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

async function getCoordinates(location) {
  const response = await fetch(`https://nominatim.openstreetmap.org/search?q=${location}&format=json`)
  const data = (await response.json())[0]
  console.log('data', data)
  lat.value = data.lat
  lon.value = data.lon
  console.log('Coordinates:', lat.value, lon.value)
  wtrDiv.hidden = false
}

async function getWeather() {
  const response = await fetch(`https://api.openweathermap.org/data/2.5/forecast?lat=${lat.value}&lon=${lon.value}&units=metric&lang=hu&appid=e4e2f880a497d44e56bacd76053336b1`)
  const data = await response.json()
  console.log('Weather:', data)

  fillTable(data.list)
}

function fillTable(list) {
  for (let i = 0; i < 10; i++) {
    console.log('list', list[i])
    const date = new Date(list[i].dt * 1000)
    let cell = table.rows[0].insertCell()
    cell.innerHTML = days[date.getDay()]
    cell = table.rows[1].insertCell()
    cell.appendChild(document.createElement('img')).src = `http://openweathermap.org/img/wn/${list[i].weather[0].icon}@2x.png`
    cell = table.rows[2].insertCell()
    cell.innerHTML = list[i].weather[0].description
    cell = table.rows[3].insertCell()
    cell.innerHTML = `${list[i].main.temp}°C`
    cell = table.rows[4].insertCell()
    cell.innerHTML = `${list[i].clouds.all}%`
    cell = table.rows[5].insertCell()
    cell.innerHTML = date.toLocaleTimeString('hu').slice(0, -3)
  }
}
