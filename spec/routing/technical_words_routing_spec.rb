require "rails_helper"

RSpec.describe TechnicalWordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/technical_words").to route_to("technical_words#index")
    end

    it "routes to #new" do
      expect(:get => "/technical_words/new").to route_to("technical_words#new")
    end

    it "routes to #show" do
      expect(:get => "/technical_words/1").to route_to("technical_words#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/technical_words/1/edit").to route_to("technical_words#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/technical_words").to route_to("technical_words#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/technical_words/1").to route_to("technical_words#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/technical_words/1").to route_to("technical_words#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/technical_words/1").to route_to("technical_words#destroy", :id => "1")
    end

  end
end
