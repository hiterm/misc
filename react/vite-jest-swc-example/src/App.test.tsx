import {render} from '@testing-library/react'
import '@testing-library/jest-dom'
import App from './App'

test('renders a message', () => {
  const {container, getByText} = render(<App />)
  expect(getByText('Hello, world!')).toBeInTheDocument()
  expect(container.firstChild).toMatchInlineSnapshot(`
    <h1>Hello, World!</h1>
  `)
})
