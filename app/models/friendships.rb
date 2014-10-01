class Friendships < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :friend
end
