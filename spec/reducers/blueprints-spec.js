import subject from 'reducers/blueprints';

describe('Blueprints reducer', function() {
  itShouldBehaveLike.aReducer(subject);
  context('ADD_BLUEPRINT', function(){
    it('adds a blueprint', function() {
      const stateBefore = [];
      const action = {type: 'ADD_BLUEPRINT', name: 'Armageddon'};
      const stateAfter = [{name: 'Armageddon', materials: []}];

      deepFreeze(stateBefore)
      deepFreeze(action);

      expect(subject(stateBefore, action)).to.deep.equal(stateAfter);
    });
  });

  context('ADD_MATERIAL', function() {
    const id = 'cbf2eac7-982e-4cdd-8bf4-a8554dba4061';
    const material_id = '1d3f0b09-bc15-45f8-b260-2c4c25439e05';
    const blueprint_id = '9f813c2c-bd56-4aa2-89aa-5e254c9141bf';

    it('adds a material to the blueprint', function() {

      const stateBefore = [{
        id: blueprint_id,
        name: 'Armageddon',
        materials: []
      },{
        id: '49dfcd96-d8cd-40f5-af90-ef17d56dda00',
        name: 'Apocalypse',
        materials: []
      }];

      const action = deepFreeze({
        type: 'ADD_MATERIAL',
        id, material_id, blueprint_id,
        qty: 11
      });

      const stateAfter = [{
        id: blueprint_id,
        name: 'Armageddon',
        materials: [{
          id, material_id, qty: 11
        }]
      },{
        id: '49dfcd96-d8cd-40f5-af90-ef17d56dda00',
        name: 'Apocalypse',
        materials: []
      }];

      deepFreeze(stateBefore)
      deepFreeze(action);

      expect(subject(stateBefore, action)).to.deep.equal(stateAfter);
    });
  });
});
