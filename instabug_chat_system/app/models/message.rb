class Message < ApplicationRecord
  belongs_to :chat


  validates_presence_of :app_token, :chat_number, :message

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name    'instabugmessage'
  document_type 'message'

  es_index_settings = {
    'analysis': {
      'filter': {
        'trigrams_filter': {
          'type':'ngram',
          'min_gram': 3,
          'max_gram': 3
        }
      },
      'analyzer': {
        'trigrams': {
          'type': 'custom',
          'tokenizer': 'standard',
          'filter': [
            'lowercase',
            'trigrams_filter'
          ]
        }
      }
    }
  }

  settings es_index_settings do
    mapping do
      indexes :message, type: 'string', analyzer: 'trigrams'
    end
  end
end
