class DonationsController < ApplicationController
  def create
  @donation  = Donation.new(amount: params[:amount], state: 'paid')
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @donation.amount_cents, # or amount_pennies
    description:  "Payment for donation to Rise Kindness for order #{@donation.id}",
    currency:     @donation.amount.currency
  )

  @donation.payment = charge.to_json
  @donation.save
  redirect_to donation_path(@donation)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_donation_path

  end

  def show
  @donation = Donation.where(state: 'paid').find(params[:id])
end

end
