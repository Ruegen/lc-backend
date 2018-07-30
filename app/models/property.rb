class Property < ApplicationRecord
  has_one :address
  belongs_to :local_government_area, optional: true
end
