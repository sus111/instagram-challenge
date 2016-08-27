# def extract_dimensions
#   return unless image?
#   tempfile = upload.queued_for_write[:original]
#   unless tempfile.nil?
#     geometry = Paperclip::Geometry.from_file(tempfile)
#     self.dimensions = [geometry.width.to_i, geometry.height.to_i].join('x')
#   end
#
# width, height = @asset.dimensions
