class ExerciseForm
  PERMITTED_PARAMS = %i(description image_url muscle_groups name video_embed_url).freeze
  include ActiveModel::Model

  attr_accessor *PERMITTED_PARAMS

  validates :muscle_groups, :name, :image_url, presence: true

  def model_attributes
    {
      name: name,
      description: description,
      video_embed_url: video_embed_url,
      image_url: image_url
    }.compact
  end
end
