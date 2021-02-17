module Content
  class Loader
    def initialize
      @client = Contentful::Client.new(
        space: ENV.fetch("CONTENTFUL_SPACE_ID"),
        access_token: ENV.fetch("CONTENTFUL_ACESS_TOKEN"),
        dynamic_entries: :auto,
        entry_mapping: {
          "recipe" => Recipe
        }
      )
    end

    def recipes
      @client.entries content_type: "recipe"
    end

    def entry(id)
      entry = @client.entry id

      raise Content::Errors::NotFound if entry.blank?

      entry
    end
  end
end
