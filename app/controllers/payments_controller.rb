class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
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

  @donation.update(payment: charge.to_json, state: 'paid')
  redirect_to order_path(@donation)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_order_payment_path(@donation)
end

private

  def set_order
    @donation = Donation.where(state: 'pending').find(params[:donation_id])
  end
end
