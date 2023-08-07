class Plot < ApplicationRecord
  validates_presence_of :number,
                        :size,
                        :direction
  belongs_to :garden
end