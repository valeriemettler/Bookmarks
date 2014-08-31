require 'rails_helper'

RSpec.describe "bookmarks/edit", :type => :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!(
      :url => "MyString"
    ))
  end

  it "renders the edit bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmark_path(@bookmark), "post" do

      assert_select "input#bookmark_url[name=?]", "bookmark[url]"
    end
  end
end
