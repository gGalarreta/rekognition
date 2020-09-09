module ImageHelper
  def image_url( args = {} )
    args[:size] = args[:size].to_sym if args[:size].present?
    "https:" + self.send(args[:field]).url(args[:size])
  end

end