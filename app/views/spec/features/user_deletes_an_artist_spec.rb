require 'rails_helper'

RSpec.feature "user deletes an existing artist" do
  scenario "they see the artists index page and do not see the deleted artist name" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: "Bob Marley", image_path: artist_image_path)

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content "Bob Marley"
    expect(page).to_not have_css("img[src=\"#{artist_image_path}\"]")
  end
end
