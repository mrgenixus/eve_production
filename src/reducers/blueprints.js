import materials from './materials';

export default function(state=[], action) {
  switch(action.type) {
    case 'ADD_BLUEPRINT':
      return [...state, {
        materials: [],
        ..._.pick(action, 'name', 'materials')
      }];

    case "ADD_MATERIAL":
      return state.map(function(state) {
        if(state.id !== action.blueprint_id) return state;

        return {...state, materials: materials(state.materials, action) || []};
      });
  }

  return state;
}
