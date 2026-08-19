require "swagger_helper"

RSpec.describe "api/v1/artists", type: :request do
  path "/api/v1/artists" do
    get "List artists" do
      tags "Artists"
      produces "application/json"

      response "200", "artists found" do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   ArtistId: { type: :integer },
                   Name: { type: :string }
                 }
               }

        run_test!
      end
    end
  end

  path "/api/v1/artists/{id}" do
    get "Get artist" do
      tags "Artists"
      produces "application/json"

      parameter name: :id,
                in: :path,
                type: :integer,
                required: true,
                description: "Artist ID"

      response "200", "artist found" do
        schema type: :object,
               properties: {
                 ArtistId: { type: :integer },
                 Name: { type: :string }
               }

        let(:id) { 1 }

        run_test!
      end

      response "404", "artist not found" do
        let(:id) { 999999 }

        run_test!
      end
    end
  end
end