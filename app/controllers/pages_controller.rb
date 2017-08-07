class PagesController < ApplicationController
  def home
    @feedbacks = [{name: "Sebastien",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit magni eaque tenetur rerum hic obcaecati sapiente quo consectetur, soluta animi ipsum repellendus, ab nobis iste? Quidem vitae hic velit doloribus.",
  role: "farmer",
  picture: "sebastien.jpg"},
  {name: "Boris",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa velit ipsa quisquam, amet facere magni. Rerum, esse. Sequi hic debitis, doloremque consectetur, dolor, dicta veniam non quaerat assumenda sapiente tenetur!",
  role: "lap dancer",
  picture: ""},
  { name: "Romain",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo, magnam natus neque velit repudiandae quos, praesentium laborum reiciendis odit saepe doloribus. Et tempore quisquam consequuntur, molestiae saepe eaque corrupti reprehenderit.",
  role: "chiller",
  picture: ""}]
  end
end

