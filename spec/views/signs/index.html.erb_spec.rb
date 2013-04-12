require 'spec_helper'

describe "signs/index" do
  before(:each) do
    assign(:signs, [
      stub_model(Sign,
        :name => "Name",
        :chapter => 1,
        :right_handshape_begin => "Right Handshape Begin",
        :right_handshape_end => "Right Handshape End",
        :left_handshape_begin => "Left Handshape Begin",
        :left_handshape_end => "Left Handshape End",
        :photo_path => "Photo Path"
      ),
      stub_model(Sign,
        :name => "Name",
        :chapter => 1,
        :right_handshape_begin => "Right Handshape Begin",
        :right_handshape_end => "Right Handshape End",
        :left_handshape_begin => "Left Handshape Begin",
        :left_handshape_end => "Left Handshape End",
        :photo_path => "Photo Path"
      )
    ])
  end

  it "renders a list of signs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Right Handshape Begin".to_s, :count => 2
    assert_select "tr>td", :text => "Right Handshape End".to_s, :count => 2
    assert_select "tr>td", :text => "Left Handshape Begin".to_s, :count => 2
    assert_select "tr>td", :text => "Left Handshape End".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Path".to_s, :count => 2
  end
end
