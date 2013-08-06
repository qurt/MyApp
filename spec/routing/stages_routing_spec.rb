require "spec_helper"

describe StagesController do
  describe "routing" do

    it "routes to #index" do
      get("/stages").should route_to("stages#index")
    end

    it "routes to #new" do
      get("/stages/new").should route_to("stages#new")
    end

    it "routes to #show" do
      get("/stages/1").should route_to("stages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stages/1/edit").should route_to("stages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stages").should route_to("stages#create")
    end

    it "routes to #update" do
      put("/stages/1").should route_to("stages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stages/1").should route_to("stages#destroy", :id => "1")
    end

  end
end
