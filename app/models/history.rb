require 'elasticsearch/model'

class History < ApplicationRecord

  belongs_to :user

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mapping do
    indexes :url, index: 'not_analyzed'
    indexes :origin_url, index: 'not_analyzed'
    indexes :target_url, index:'not_analyzed'
    indexes :lang, index:'not_analyzed'
    indexes :image,index: 'not_analyzed'
  end
end

History.__elasticsearch__.client = Elasticsearch::Client.new host:'elasticsearch:9200'
History.import force: true
