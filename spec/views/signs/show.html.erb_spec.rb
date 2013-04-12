require 'spec_helper'

describe "signs/show" do
  before(:each) do
    @sign = assign(:sign, stub_model(Sign,
      :name => "Name",
      :chapter => 1,
      :right_handshape_begin => "Right Handshape Begin",
      :right_handshape_end => "Right Handshape End",
      :left_handshape_begin => "Left Handshape Begin",
      :left_handshape_end => "Left Handshape End",
      :photo_path => "Photo Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Right Handshape Begin/)
    rendered.should match(/Right Handshape End/)
    rendered.should match(/Left Handshape Begin/)
    rendered.should match(/Left Handshape End/)
    rendered.should match(/Photo Path/)
  end
end
