class Attachment < ActiveRecord::Base
  # Cuando se pone post:references se genera el belongs_to
  belongs_to :post
  include Picturable
end
