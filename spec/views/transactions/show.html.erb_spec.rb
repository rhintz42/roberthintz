require 'spec_helper'

describe "transactions/show" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :buyer => "Buyer",
      :price => "9.99",
      :type => "Type",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Buyer/)
    rendered.should match(/9.99/)
    rendered.should match(/Type/)
    rendered.should match(/Description/)
  end
end
