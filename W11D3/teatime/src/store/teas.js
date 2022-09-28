const RECEIVE_TEA = 'TEAS/RECEIVE_TEA';
const RECEIVE_TEAS = 'TEAS/RECEIVE_TEAS';
const REMOVE_TEA = 'TEAS/REMOVE_TEA'

// ACTION CREATORS return ACTIONS

export const receiveTea = tea => ({
    type: RECEIVE_TEA,
    tea // tea: tea
});

export const receiveTeas = teas => ({
    type: RECEIVE_TEAS,
    teas // teas: teas
})

export const removeTea = teaId => ({
    type: REMOVE_TEA,
    teaId
})

// SELECTOR

export const getTeas = state => {
    return state.teas ? Object.values(state.teas) : [];
}

// REDUCER handles the teas slice of state

const teaReducer = (state = {}, action) => {
    Object.freeze(state);
    const nextState = {...state}

    switch(action.type) {
        case RECEIVE_TEA:
            nextState[action.tea.id] = action.tea;
            return nextState;
        case RECEIVE_TEAS:
            return { ...nextState, ...action.teas }
        case REMOVE_TEA:
            delete nextState[action.teaId];
            return nextState;
        default: 
            return state;
    }
}

export default teaReducer;
