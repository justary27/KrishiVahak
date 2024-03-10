interface Action {
  type: string;
  payload?: any;
}

const initialState = {
    user: null,
    error: null,
}

const app = (state = initialState, action: Action) => {
    switch(action.type){
        default:
            return state;
    }
}

export default app;
