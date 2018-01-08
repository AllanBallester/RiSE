class PagesController < ApplicationController
  def home
    @feedbacks = [{name: t("name1"),
      description: t("description1"),
      location: t("location1"),
      picture: "alexandre.png"},
      {name: t("name2") ,
        description: t("description2") ,
        location: t("location2"),
        picture: "lea.png"},
        { name: t("name3"),
          description: t("description3") ,
          location: t("location3"),
          picture: "edgar.png"}]
  end

  def donate
  @donation= Donation.new(amount: 5*100)
  end

end

