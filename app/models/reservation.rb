class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review



  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :host_is_not_guest

  validate :available

  def available
    binding.pry
    

    open = false
    conflicts = []

    listing.reservations.each do |existing_reservation|
      if ((checkin <= existing_reservation.checkout)  &&  (checkout >= existing_reservation.checkin))
        conflicts << existing_reservation
      end
    end

    if conflicts.empty?
      open = true
    end

    end
    open
  end


  def duration
    self.checkout - self.checkin
  end

  def total_price
    self.listing.price * duration
  end

  def host_is_not_guest
    if guest_id == listing.host_id
     errors.add(:guest_id, "You can't book your own apartment.")
   end


  end


end
