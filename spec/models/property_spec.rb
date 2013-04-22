require 'spec_helper'

# TODO: Add more tests? Test filter_by_params here too.
describe Property do
  it 'gets address reverse geocded' do
    Property.find(1).address.should_not be_nil
  end
end