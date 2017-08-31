class Donation < ApplicationRecord
  monetize :amount_cents
end
