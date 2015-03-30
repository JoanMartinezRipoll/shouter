class PhotoShoutsController < ApplicationController
  def create
    content = build_content
    create_shout(content)
  end

  private

  def build_content
    PhotoShout.new(photo_shout_parameters)
  end

  def photo_shout_parameters
    params.require(:photo_shout).permit(:image)
  end
end
