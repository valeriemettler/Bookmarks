require 'rails_helper'

RSpec.describe "bookmarks/show", :type => :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!(
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
  end
end
