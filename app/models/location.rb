class Location < ApplicationRecord
geocoded_by: address
after_calidation :geocode, if: :address_changed?
end
