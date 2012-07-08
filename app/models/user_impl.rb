class UserImpl < ActiveRecord::Base
belongs_to :user
def self.convert_currency(from_currency, to_currency)
    response = Nestful.get "http://www.google.com/ig/calculator", :params => {:hl => "en", :q => "1#{from_currency}=?#{to_currency}"}
    r = response.gsub('rhs:', '"rhs":').gsub('lhs:', '"lhs":').gsub('error:', '"error":').gsub('icc:', '"icc":')
    return JSON.parse(r)["rhs"].partition(" ")[0]
  end
  attr_accessible :fname, :lname, :user_id
end
#