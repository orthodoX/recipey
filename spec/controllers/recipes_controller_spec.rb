require "rails_helper"

RSpec.describe RecipesController do
  describe "#index" do
    it "returns http success" do
      get :index

      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    context "when content is found" do
      let(:id) { Content::Loader.new.recipes.first.id }

      it "returns http success" do
        get :show, params: { id: id }

        expect(response.status).to eq(200)
      end
    end

    context "when content is not found" do
      it "returns http not found" do
        get :show, params: { id: 0 }

        expect(response.status).to eq(404)
      end
    end
  end
end
