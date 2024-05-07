class Entry < ApplicationRecord
  validates_presence_of :title, :position

  ORDER_BY = {
    position_asc: 'position ASC',
    position_desc: 'position DESC',
    comments_desc: 'comments DESC',
    points_desc: 'points DESC'
  }

  scope :with_title_word_count_greater_than, lambda { |count|
    where("ARRAY_LENGTH(string_to_array(title, ' '), 1) > ?", count)
  }
  scope :with_title_word_count_less_than, lambda { |count|
    where("ARRAY_LENGTH(string_to_array(title, ' '), 1) < ?", count)
  }
end
