import React from 'react'
import { Provider } from 'react-redux'
import App from './app'

const Root = ({store}) => (
  <Provider store={store}>
    <App store={store}/>
  </Provider>
); 

export default Root; 