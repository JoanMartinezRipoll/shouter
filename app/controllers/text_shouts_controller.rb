class TextShoutsController < ShoutsController
  def create
    content = build_content
    create_shout(content)
  end

  private

  def build_content
    TextShout.new(text_shout_parameters)
  end

  def text_shout_parameters
    params.require(:text_shout).permit(:body)
  end
end
