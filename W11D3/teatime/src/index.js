import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import configureStore from './store'
import { receiveTea, receiveTeas, removeTea } from './store/teas';
import { Provider } from 'react-redux';

const store = configureStore();

// window testing
window.store = store;
window.receiveTea = receiveTea;
window.receiveTeas = receiveTeas;
window.removeTea = removeTea;
// store.dispatch(receiveTea({id: 1, flavor: "English Breakfast", price: 1.99}))

/* 
store.dispatch(receiveTeas(
  {
    1: { id: 1, flavor: "Green", price: 0.99},
    2: { id: 2, flavor: "Bubble", price: 7.99},
    3: { id: 3, flavor: "Mint", price: 3.99},
    4: { id: 4, flavor: "Gunpowder", price: 10000},
    5: { id: 5, flavor: "Coffee", price: 9.99}
  }
));
*/

const Root = () => (
  <Provider store={store}>
    <App />
  </Provider>
);



ReactDOM.render(
  <React.StrictMode>
    <Root />
  </React.StrictMode>,
  document.getElementById('root')
);
