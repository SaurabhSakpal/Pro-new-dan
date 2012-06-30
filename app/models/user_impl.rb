class UserImpl < ActiveRecord::Base
belongs_to :user

  attr_accessible :fname, :lname, :user_id
end
