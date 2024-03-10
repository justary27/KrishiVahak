import { createStore, combineReducers } from "redux";
import app from "./app";

const rootReducer = combineReducers({
    app: app,
    // Add other reducers here
});

const store = createStore(rootReducer);

export  {store, rootReducer};
