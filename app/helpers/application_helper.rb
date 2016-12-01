module ApplicationHelper
  def generate_profile_image(user)
    if user.picture?
      cl_image_tag(user.picture.path, { class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown", crop: :thumb, gravity: :face })
    elsif user.facebook_picture_url?
      image_tag(user.facebook_picture_url, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown")
    else
      image_tag("http://placehold.it/150x150", class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown")
    end
  end
end



