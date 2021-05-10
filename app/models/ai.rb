class Ai < ApplicationRecord
  validates :name,
            :weight,
            :factory_date,
            presence: true
end
