class Property < ApplicationRecord
  has_one :address
  has_one :local_government_area
end
