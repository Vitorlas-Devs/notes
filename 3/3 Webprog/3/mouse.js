const px = document.getElementById('px')
const time = document.getElementById('time')

let prevX = 0
let prevY = 0
let distSum = 0
let clicks = 0

let prevT = 0
let tSum = 0

document.addEventListener('click', (e) => {
  clicks++
  calcAvgDist(e)
  calcAvgTime(e)
})

function calcAvgDist(e) {
  distSum += Math.sqrt((e.clientX - prevX) ** 2 + (e.clientY - prevY) ** 2)
  px.textContent = `px: ${Math.round(distSum / clicks)}`
  prevX = e.clientX
  prevY = e.clientY
}

function calcAvgTime(e) {
  const t = e.timeStamp
  tSum += t - prevT
  prevT = t
  time.textContent = `time: ${tSum / clicks / 1000}`
}
