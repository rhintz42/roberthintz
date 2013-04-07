require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :buyer => "MyString",
      :price => "9.99",
      :type => "",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_buyer[name=?]", "transaction[buyer]"
      assert_select "input#transaction_price[name=?]", "transaction[price]"
      assert_select "input#transaction_type[name=?]", "transaction[type]"
      assert_select "input#transaction_description[name=?]", "transaction[description]"
    end
  end
end
