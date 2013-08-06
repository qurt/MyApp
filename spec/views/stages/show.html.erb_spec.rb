require 'spec_helper'

describe "stages/show.html.erb" do
  before(:each) do
    @stage = assign(:stage, stub_model(Stage,
      :project_id => 1,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
