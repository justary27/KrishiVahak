import { combineReducers } from 'redux';
import { createStore } from 'redux';

interface AppState {
    vehicleRequests: number;
}

const initialState: AppState = {
    vehicleRequests: 0,
};

function reducer(state = initialState, action: any): AppState {
    switch (action.type) {
        case 'SET_VEHICLE_REQUESTS':
            return {
                ...state,
                vehicleRequests: action.payload,
            };
        default:
            return state;
    }
}

const rootReducer = combineReducers({
    app: reducer, 
});

const store = createStore(rootReducer);

export default store;

export type RootState = ReturnType<typeof rootReducer>;
