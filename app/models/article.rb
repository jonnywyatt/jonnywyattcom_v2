class Article < ActiveRecord::Base
  default_scope order('date_published DESC')
end
