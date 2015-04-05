require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "textarea#note_content[name=?]", "note[content]"

      assert_select "input#note_user_id[name=?]", "note[user_id]"
    end
  end
end
