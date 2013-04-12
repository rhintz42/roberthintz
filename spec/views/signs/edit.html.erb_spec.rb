require 'spec_helper'

describe "signs/edit" do
  before(:each) do
    @sign = assign(:sign, stub_model(Sign,
      :name => "MyString",
      :chapter => 1,
      :right_handshape_begin => "MyString",
      :right_handshape_end => "MyString",
      :left_handshape_begin => "MyString",
      :left_handshape_end => "MyString",
      :photo_path => "MyString"
    ))
  end

  it "renders the edit sign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sign_path(@sign), "post" do
      assert_select "input#sign_name[name=?]", "sign[name]"
      assert_select "input#sign_chapter[name=?]", "sign[chapter]"
      assert_select "input#sign_right_handshape_begin[name=?]", "sign[right_handshape_begin]"
      assert_select "input#sign_right_handshape_end[name=?]", "sign[right_handshape_end]"
      assert_select "input#sign_left_handshape_begin[name=?]", "sign[left_handshape_begin]"
      assert_select "input#sign_left_handshape_end[name=?]", "sign[left_handshape_end]"
      assert_select "input#sign_photo_path[name=?]", "sign[photo_path]"
    end
  end
end
