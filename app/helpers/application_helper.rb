module ApplicationHelper
  def image_or_stub(model, stub)
    if model.photo
      cl_image_path model.photo.path, height: 500, width: 500, crop: :crop
    else
      cl_image_path stub, height: 500, width: 500, crop: :fit
    end
  end
end
