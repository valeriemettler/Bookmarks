require 'rails_helper'

RSpec.describe UserBookmarksController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET eidt" do
    it "returns http success" do
      get :eidt
      expect(response).to be_success
    end
  end

end
