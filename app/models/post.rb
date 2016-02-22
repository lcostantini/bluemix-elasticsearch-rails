class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  client = Elasticsearch::Client.new url: ENV['SEARCHLY_URL'] ||
    'http://localhost:9200'
  Elasticsearch::Model.client = client
end
