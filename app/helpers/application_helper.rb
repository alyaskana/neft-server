module ApplicationHelper
  def image_blob_url(image)
    rails_blob_url(image, Rails.application.config.action_controller.default_url_options)
  end
end
