import constants from './constants';
const { IDS, BLUEPRINTS } = constants;

const blueprint_id = '78e17ed4-6d54-41dd-8186-ddc4c727b82d';
const state = {
  materials: [
    { id: IDS.ISOGEN, cost: 82.5 },
    { id: IDS.MEGACYTE, cost: 1545.0 },
    { id: IDS.MEXALLON, cost: 65.0 },
    { id: IDS.NOCXIUM, cost: 425.0 },
    { id: IDS.PYERITE, cost: 9.45 },
    { id: IDS.TRITANIUM, cost: 6.25 },
    { id: IDS.ZYDRINE, cost: 1120.5 },
    { id: IDS.MORPHITE, cost: 10 },
    { id: IDS.CONSTRUCTION_BLOCKS, cost: 10 },
    {
      id: IDS.ANTIMATTER_REACTOR_UNIT, cost: 11, build_cost: 10,
      blueprint_id: IDS.ANTIMATTER_REACTOR_UNIT_BLUEPRINT
    },
    {
      id: IDS.FUSION_THRUSTER, cost: 11, build_cost: 10,
      blueprint_id: IDS.FUSION_THRUSTER_BLUEPRINT
    },
    {
      id: IDS.HARBINGER, cost: 11, build_cost: 10,
      blueprint_id: IDS.HARBINGER_BLUEPRINT
    },
    {
      id: IDS.MYRMIDON, cost: 10, build_cost: 11,
      blueprint_id: IDS.MYRMIDON_BLUEPRINT
    },
    {
      id: IDS.LINEAR_SHIELD_EMITTER, cost: 11, build_cost: 10,
      blueprint_id: IDS.LINEAR_SHIELD_EMITTER_BLUEPRINT
    },
    {
      id: IDS.NANOELECTRICAL_MICROPROCESSOR, cost: 11, build_cost: 10,
      blueprint_id: IDS.NANOELECTRICAL_MICROPROCESSOR_BLUEPRINT
    },
    {
      id: IDS.RADAR_SENSOR_CLUSTOR, cost: 11, build_cost: 10,
      blueprint_id: IDS.RADAR_SENSOR_CLUSTOR_BLUEPRINT
    },
    {
      id: IDS.TESSERACT_CAPACITOR_UNIT, cost: 11, build_cost: 10,
      blueprint_id: IDS.TESSERACT_CAPACITOR_UNIT_BLUEPRINT
    },
    {
      id: IDS.TUNGSTEN_CARBIDE_ARMOR_PLATE, cost: 11, build_cost: 10,
      blueprint_id: IDS.TUNGSTEN_CARBIDE_ARMOR_PLATE_BLUEPRINT
    },
    {
      id: IDS.CRYSTALLINE_CARBONIDE_ARMOR_PLATE, cost: 10, build_cost: 11,
      blueprint_id: IDS.CRYSTALLINE_CARBONIDE_ARMOR_PLATE_BLUEPRINT
    },
    {
      id: IDS.FUSION_REACTOR_UNIT, cost: 10, build_cost: 11,
      blueprint_id: IDS.FUSION_REACTOR_UNIT_BLUEPRINT
    },
    {
      id: IDS.ION_THRUSTER, cost: 10, build_cost: 11,
      blueprint_id: IDS.ION_THRUSTER_BLUEPRINT
    },
    {
      id: IDS.MAGNETOMETRIC_SENSOR_CLUSTER, cost: 10, build_cost: 11,
      blueprint_id: IDS.MAGNETOMETRIC_SENSOR_CLUSTER_BLUEPRINT
    },
    {
      id: IDS.OSCILLATOR_CAPACITOR_UNIT, cost: 10, build_cost: 11,
      blueprint_id: IDS.OSCILLATOR_CAPACITOR_UNIT_BLUEPRINT
    },
    {
      id: IDS.PARTICLE_ACCELERATOR_UNIT, cost: 10, build_cost: 11,
      blueprint_id: IDS.PARTICLE_ACCELERATOR_UNIT_BLUEPRINT
    },
    {
      id: IDS.PHOTON_MICROPROCESSOR, cost: 10, build_cost: 11,
      blueprint_id: IDS.PHOTON_MICROPROCESSOR_BLUEPRINT
    },
    {
      id: IDS.PLASMA_PULSE_GENERATOR, cost: 10, build_cost: 11,
      blueprint_id: IDS.PLASMA_PULSE_GENERATOR_BLUEPRINT
    },
    {
      id: IDS.PULSE_SHIELD_EMITTER, cost: 10, build_cost: 11,
      blueprint_id: IDS.PULSE_SHIELD_EMITTER_BLUEPRINT
    },
  ],
  blueprints: _.values(BLUEPRINTS)
}


function calculateBlueprintCost(state, material_state=[]) {
  const materials = _.get(state, 'materials', []);
  return material_state.reduce((memo, {material_id:id, qty, _name}) => {
    const build_cost = _.get(_.find(materials, {id}), 'build_cost');
    let cost = _.get(_.find(materials, {id}), 'cost', 0);

    if(typeof build_cost !== 'undefined') {
      cost = cost > build_cost ? build_cost : cost;
    }

    return memo + (cost * qty);
  }, 0);
}

context('cost caluculation', function() {
  it('adds up material costs for blueprints', function() {
    let cost = calculateBlueprintCost(state, [
      { material_id: IDS.ISOGEN, qty: 1 },
      { material_id: IDS.MEGACYTE, qty: 1 },
      { material_id: IDS.MEXALLON, qty: 1 },

      { material_id: IDS.NOCXIUM , qty: 1 },
      { material_id: IDS.PYERITE, qty: 1 },
      { material_id: IDS.TRITANIUM, qty: 1 },
      { material_id: IDS.ZYDRINE, qty: 1 },
    ]);

    expect(cost).to.eq(82.5 + 1545.0 + 65.0 + 425.0 + 9.45 + 6.25 + 1120.5);
  });

  it('adds up build_costs for components', function() {
    let cost = calculateBlueprintCost(state, BLUEPRINTS.ABSOLUTION.materials);
    const build_cost = 158260;
    expect(cost).to.eq(build_cost);
  });

  it('adds up the costs if build_costs are higher', function() {
    const cost = calculateBlueprintCost(state, BLUEPRINTS.EOS.materials);
    const build_cost = 153690;
    expect(cost).to.eq(build_cost);
  });
});
