# def extract_dimensions
#   return unless image?
#   tempfile = upload.queued_for_write[:original]
#   unless tempfile.nil?
#     geometry = Paperclip::Geometry.from_file(tempfile)
#     self.dimensions = [geometry.width.to_i, geometry.height.to_i].join('x')
#   end
#
# width, height = @asset.dimensions

def leave_comment(thoughts: "Looks beautiful!")
  visit '/pictures'
  click_link 'Comment'
  fill_in "Thoughts", with: thoughts
  click_button "Leave Comment"
end

def add_picture
  visit '/pictures'
  click_link 'Add Picture'
  fill_in 'Title', with: 'Beach life!'
  click_button 'Create Picture'
end
