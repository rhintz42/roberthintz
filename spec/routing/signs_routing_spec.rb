require "spec_helper"

describe SignsController do
  describe "routing" do

    it "routes to #index" do
      get("/signs").should route_to("signs#index")
    end

    it "routes to #new" do
      get("/signs/new").should route_to("signs#new")
    end

    it "routes to #show" do
      get("/signs/1").should route_to("signs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/signs/1/edit").should route_to("signs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/signs").should route_to("signs#create")
    end

    it "routes to #update" do
      put("/signs/1").should route_to("signs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/signs/1").should route_to("signs#destroy", :id => "1")
    end

  end
end
