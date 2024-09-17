import { A, Router } from '@solidjs/router'
import { FileRoutes } from '@solidjs/start/router'
import { For, Suspense } from 'solid-js'
import './app.css'

export default function App() {
  const routes = FileRoutes()
  return (
    <Router
      root={props => (
        <>
          {/* create links for every mathed file route: */}
          <ul class="notes-list">
            <For each={routes}>
              {route => (
                <li class="notes-list-item">
                  <A href={route.path} class="notes-list-item-link">
                    {route.id}
                  </A>
                </li>
              )}
            </For>
          </ul>
          <Suspense>{props.children}</Suspense>
        </>
      )}
    >
      <FileRoutes />
    </Router>
  )
}
