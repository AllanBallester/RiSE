class PagesController < ApplicationController
  def home
    @feedbacks = [{name: "Alexandre",
  description: " As it happened we ordered too much at restaurant. Instead of wasting we asked for a dobbybag, plug Rise, find Miguel and give it to him. He was actually super cool and greetful.",
  location: "Lille - France",
  picture: "alexandre.png"},
  {name: "Lea",
  description: " Rise was very simple for me. I had to throw 3 tee shirts . I used to put them on the bin straight. Instead I just find Pedro, contact him and give it hand by hand.Now everyday",
  location: "Ho Chi minh-Vietnam",
  picture: "lea.png"},
  { name: "Romain",
  description: " I asked Tom which I give food everyday when was his last shower ? I end even cutting his beard and my wife insisted him to stay for dinner. Was very thoughtful and simple moment ",
  location: "New York - United States",
  picture: "romain.png"}]
  end
end

