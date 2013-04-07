require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :buyer => "Buyer",
        :price => "9.99",
        :type => "Type",
        :description => "Description"
      ),
      stub_model(Transaction,
        :buyer => "Buyer",
        :price => "9.99",
        :type => "Type",
        :description => "Description"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Buyer".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
