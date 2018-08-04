# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
CSV.foreach(Rails.root.join("db/data/exercises.csv")) do |exercise|
  params = {
    name: exercise[0],
    description: exercise[1],
    muscle_groups: exercise[2].split(","),
    video_embed_url: exercise[3],
    image_url: exercise[4]
  }
  form = ExerciseForm.new(params)
  FindOrCreateExercise.new(form).call
end
