class UserForm
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def model_attributes
    {
      provider: attributes.provider,
      uid: attributes.uid,
      first_name: attributes.info.first_name,
      last_name: attributes.info.last_name,
      email: attributes.info.last_name,
      profile_image_url: attributes.info.image
    }.compact
  end
end
