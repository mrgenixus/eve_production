require 'spec_helper'

describe Produceable do
  subject { create :produceable }

  it { should respond_to :cost }
  it { subject.cost.should == subject.value}
  it { subject.produceable_components.count.should eq 0 }

  context "with a single produceable_component" do
    let!(:produceable_component) { create :produceable_component, product: subject, qty: 1}

    it "should use the value of the component instead of its own value" do
      subject.cost.should eq produceable_component.cost + subject.blueprint_cost
    end
  end

  context "with a single produceable_component having a multiple qty" do
    let!(:produceable_component) { create :produceable_component, product: subject, qty: 2}

    it "should use the value of the component instead of its own value" do
      subject.cost.should eq produceable_component.cost + subject.blueprint_cost
    end
  end

  context "with multiple produceable_components" do
    let!(:produceable_components) { create_list :produceable_component, 2, product: subject, qty: 1}

    it "should use the aggrefate value of the components instead of its own values" do
      subject.cost.should eq produceable_components[0].cost + produceable_components[1].cost + subject.blueprint_cost
    end
  end


end
