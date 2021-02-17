require "rails_helper"

RSpec.describe Content::Loader do
  let(:content_loader) { described_class.new }
  let(:recipes) { content_loader.recipes }

  describe "#recipes" do
    it "fetches entries into an array" do
      expect(recipes).to be_a Contentful::Array
    end

    it "maps entries to Recipe model" do
      expect(recipes.first).to be_a Recipe
      expect(recipes.last).to be_a Recipe
    end
  end

  describe "#entry" do
    context "when the entry exists" do
      subject { content_loader.entry(recipes.first.id) }

      it { is_expected.not_to be nil }
    end

    context "when the entry doesn't exist" do
      it "raises a not found exception" do
        expect { content_loader.entry(0) }.to raise_error Content::Errors::NotFound
      end
    end
  end
end
