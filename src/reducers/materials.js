export default function(state=[], action) {
  switch(action.type) {
    case 'ADD_MATERIAL':
      return [...state, _.pick(action, 'id', 'material_id', 'qty')];
  };

  return state;
}
