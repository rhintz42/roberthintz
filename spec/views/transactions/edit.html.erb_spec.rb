require 'spec_helper'

describe "transactions/edit" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :buyer => "MyString",
      :price => "9.99",
      :type => "",
      :description => "MyString"
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do
      assert_select "input#transaction_buyer[name=?]", "transaction[buyer]"
      assert_select "input#transaction_price[name=?]", "transaction[price]"
      assert_select "input#transaction_type[name=?]", "transaction[type]"
      assert_select "input#transaction_description[name=?]", "transaction[description]"
    end
  end
end
