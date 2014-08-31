require 'rails_helper'

RSpec.describe "bookmarks/index", :type => :view do
  before(:each) do
    assign(:bookmarks, [
      Bookmark.create!(
        :url => "Url"
      ),
      Bookmark.create!(
        :url => "Url"
      )
    ])
  end

  it "renders a list of bookmarks" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
