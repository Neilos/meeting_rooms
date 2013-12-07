class Location < ActiveRecord::Base
	belongs_to :organization, :inverse_of => :locations
	has_many :rooms, :dependent => :destroy, :inverse_of => :location
	validates_associated :rooms
	validates :name, :address_line_1, :address_line_2, :town_city, :county, :postcode, :country, :organization_id, presence: :true
  validates_uniqueness_of :name, :scope => :organization_id

  def address
    address_array = []
    address_array << address_line_1 << address_line_2 << town_city << county << postcode << country
    address_array.compact.join(", ")
  end
end
