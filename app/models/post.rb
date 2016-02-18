class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  if ENV['VCAP_SERVICES']
    services = JSON.parse ENV['VCAP_SERVICES']
    elasticsearch = services["searchly"].first["credentials"]["uri"]
  end

  client = Elasticsearch::Client.new url: elasticsearch ||
    'http://localhost:9200'
  Elasticsearch::Model.client = client
end
