class Save < ApplicationRecord
  belongs_to :board
  belongs_to :pin
end
