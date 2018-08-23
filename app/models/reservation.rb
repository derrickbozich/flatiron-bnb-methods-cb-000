class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review
  


  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :host_is_not_guest


  def duration
    self.checkout - self.checkin
  end

  def total_price
    self.listing.price * duration
  end

  def host_is_not_guest
    guest.id != listing.host.id
    binding.pry
  end


end
