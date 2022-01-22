require "rails_helper"

RSpec.describe TimeSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/time_sessions").to route_to("time_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/time_sessions/new").to route_to("time_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/time_sessions/1").to route_to("time_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/time_sessions/1/edit").to route_to("time_sessions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/time_sessions").to route_to("time_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/time_sessions/1").to route_to("time_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/time_sessions/1").to route_to("time_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/time_sessions/1").to route_to("time_sessions#destroy", id: "1")
    end
  end
end
