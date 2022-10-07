import csrfFetch from "./csrf"

const SET_BENCHES = 'benches/SET_BENCHES';
const ADD_BENCH = 'benches/ADD_BENCH';

export const setBenches = (benches) => ({ 
    type: SET_BENCHES,
    benches
})

export const addBench = (bench) => ({
    type: ADD_BENCH,
    bench
})

// export const getBenches = 

export const fetchBenches = () => async dispatch => {
    const res = await csrfFetch('/api/benches');
    const data = await res.json();
    dispatch(setBenches(data));
}

export const fetchBench = (benchId) => async dispatch => {
    const res = await csrfFetch(`/api/benches/${benchId}`);
    const data = await res.json();
    dispatch(addBench(data));
    console.log(data);
}

export const createBench = (benchData) => async dispatch => {
    const res = await csrfFetch('api/benches', {
        method: 'POST',
        body: JSON.stringify(benchData),
        headers: {
            'Content-Type': 'application/json'
        }
    });

    const data = await res.json();
    dispatch(addBench(data));
    // console.log(data);
}

// const initialState = {benches: {}}

const benchesReducer = (state = {}, action) => {

    Object.freeze(state);
    const nextState = {...state}

    switch (action.type) {
        case SET_BENCHES:
            return {...nextState, ...action.benches};
        case ADD_BENCH:
            nextState[action.bench.id] = action.bench;
            return nextState;
        default: 
            return state;
    }
}

export default benchesReducer;