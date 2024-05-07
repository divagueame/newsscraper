class Entry < ApplicationRecord
  validates_presence_of :title, :position

  ORDER_BY = {
    position_asc: 'position ASC',
    position_desc: 'position DESC',
    comments_desc: 'comments DESC',
    points_desc: 'points DESC'
  }

end
