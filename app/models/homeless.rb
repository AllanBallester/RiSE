class Homeless < ApplicationRecord
  after_create :send_add_rised_email
  before_update :log_position_history, if: :location_changed?

  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :intentions
  has_many :position_histories
  belongs_to :riser

  validates :name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates_uniqueness_of :name, :scope => [:last_name]

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def send_add_rised_email
    UserMailer.add_rised(riser, self).deliver_now
  end

  def log_position_history
    self.position_histories.create(location: self.location_was)
  end

end

