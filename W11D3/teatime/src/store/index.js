import { createStore, combineReducers } from 'redux';
import teaReducer from './teas';

const rootReducer = combineReducers({
    teas: teaReducer
});
/* const dummyReducer = (state, action) => ({}); */

const configureStore = (preloadedState = {}) => {
    return createStore(rootReducer, preloadedState)
}




export default configureStore;