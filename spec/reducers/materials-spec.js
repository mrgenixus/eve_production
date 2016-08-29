import subject from 'reducers/materials';

describe('Materials reducer', function() {
  itShouldBehaveLike.aReducer(subject);

  context('ADD_MATERIAL', function() {
    const id = 'cbf2eac7-982e-4cdd-8bf4-a8554dba4061';
    const material_id = '1d3f0b09-bc15-45f8-b260-2c4c25439e05';
    const blueprint_id = '9f813c2c-bd56-4aa2-89aa-5e254c9141bf';
    it('adds a material', function() {
      const beforeState = deepFreeze([]);
      const action = deepFreeze({
        type: 'ADD_MATERIAL',
        id, material_id, blueprint_id,
        qty: 11
      });

      const afterState = [{
        id, material_id, qty: 11
      }];

      expect(subject(beforeState, action)).to.deep.equal(afterState);
    });
  });
});
