class Entry < ApplicationRecord
  validates_presence_of :title, :position
end
