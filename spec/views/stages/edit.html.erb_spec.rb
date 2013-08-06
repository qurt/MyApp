require 'spec_helper'

describe "stages/edit.html.erb" do
  before(:each) do
    @stage = assign(:stage, stub_model(Stage,
      :project_id => 1,
      :title => "MyString"
    ))
  end

  it "renders the edit stage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stages_path(@stage), :method => "post" do
      assert_select "input#stage_project_id", :name => "stage[project_id]"
      assert_select "input#stage_title", :name => "stage[title]"
    end
  end
end
