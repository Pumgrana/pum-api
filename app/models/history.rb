require 'elasticsearch/model'

class History < ApplicationRecord

  belongs_to :user

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mapping dynamic: 'false' do
    indexes :user_id, type: "string", index: 'not_analyzed'
    indexes :url, type: "string", index: 'not_analyzed'
    indexes :origin_url, type: "string", index: 'not_analyzed'
    indexes :target_url, type: "string", index:'not_analyzed'
    indexes :lang, type: "string", index:'not_analyzed'
    indexes :titre, type: "string"
    indexes :description, type: "string"
    indexes :image, type: "string", index: 'not_analyzed'
    indexes :search, type: "string"
    indexes :enter_date, type: "date", index: 'not_analyzed', format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    indexes :leave_date, type: "date", index: 'not_analyzed', format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    indexes :focus_elasped_time, type: "integer", index: 'not_analyzed'
    indexes :total_elasped_time, type: "integer", index: 'not_analyzed'
  end
end

History.__elasticsearch__.client = Elasticsearch::Client.new host:'elasticsearch:9200'
History.import force: true
