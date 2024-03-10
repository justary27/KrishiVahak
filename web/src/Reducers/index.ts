import { createStore, combineReducers } from 'redux';
import app from './app';

const rootReducer = combineReducers({
    app: app,
});

const store = createStore(rootReducer);

<<<<<<< Updated upstream
export  {store, rootReducer};
=======
export { rootReducer, store };
>>>>>>> Stashed changes
