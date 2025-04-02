import AnimalCard from './components/AnimalCard'
import { animals } from './db/animals.json'

export default function App() {
  console.log(animals)
  return (
    <div class="bg-yellow-100 w-full items-center flex flex-col font-nunito">
      <h1 class="text-yellow-800 mt-5 text-5xl font-bold">AniDex</h1>
      <div
        id="animal-container"
        class="mt-5 flex items-center justify-center flex-row flex-wrap gap-10 "
      >
        {animals.map(animal => (
          <AnimalCard
            key={animal.name}
            {...animal}
          />
        ))}
      </div>
    </div>
  )
}
