# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_user = User.create(email: 'johndoe@test.com', password: 'password')

neck = Region.create(title: "Neck" )
MuscleGroup.create( muscle_title: "Levator scapulae", region_id: neck.id)
MuscleGroup.create( muscle_title: "Sternocleidomastoid (SCM) ", region_id: neck.id)
MuscleGroup.create( muscle_title: "Erector spinae ", region_id: neck.id)
MuscleGroup.create( muscle_title: "Deep cervical flexors", region_id: neck.id)
MuscleGroup.create( muscle_title: "Suboccipitals", region_id: neck.id)

chest = Region.create(title: "Chest" )
pec = MuscleGroup.create( muscle_title: "Pectoralis Major", region_id: chest.id)
MuscleGroup.create( muscle_title: "Pectoralis Minor", region_id: chest.id)
MuscleGroup.create( muscle_title: "Serratus Anterior", region_id: chest.id)
MuscleGroup.create( muscle_title: "Subclavius", region_id: chest.id)

shoulders = Region.create(title: "Shoulders" )
MuscleGroup.create( muscle_title: "anterior deltoid", region_id: shoulders.id)
MuscleGroup.create( muscle_title: "lateral deltoid", region_id: shoulders.id)
MuscleGroup.create( muscle_title: "tposterior deltoid", region_id: shoulders.id)
MuscleGroup.create( muscle_title: "trapezius", region_id: shoulders.id)


back = Region.create(title: "Back" )
MuscleGroup.create( muscle_title: "Latissimus Dorsi", region_id: back.id)
MuscleGroup.create( muscle_title: "Levator Scapulae", region_id: back.id)
MuscleGroup.create( muscle_title: "Rhomboids", region_id: back.id)

core = Region.create(title: "Core" )
MuscleGroup.create( muscle_title: "transversus abdominis", region_id: core.id)
MuscleGroup.create( muscle_title: "rectus abdominis", region_id: core.id)
MuscleGroup.create( muscle_title: "external oblique muscles", region_id: core.id)
MuscleGroup.create( muscle_title: "internal oblique muscles", region_id: core.id)


legs = Region.create(title: "Legs" )
quad = MuscleGroup.create( muscle_title: "Quadriceps", region_id: legs.id)
ham = MuscleGroup.create( muscle_title: "Hamstrings", region_id: legs.id)
MuscleGroup.create( muscle_title: "Calves", region_id: legs.id)
glute = MuscleGroup.create( muscle_title: "Glutes", region_id: legs.id)

arms = Region.create( title: 'Arms')
MuscleGroup.create( muscle_title: "Bicep", region_id: arms.id)
tri = MuscleGroup.create( muscle_title: "Tricep", region_id: arms.id)
MuscleGroup.create( muscle_title: "Forearm", region_id: arms.id)

Exercise.create(user_id: admin_user.id, title: 'squat', primary_muscle: glute.id, secondary_muscle: quad.id, region_id: legs.id, primary_exercise: true, accessory_exercise: false)
Exercise.create(user_id: admin_user.id, title: 'bench', primary_muscle: pec.id, secondary_muscle: tri.id, region_id: chest.id, primary_exercise: true, accessory_exercise: false)
Exercise.create(user_id: admin_user.id, title: 'deadlift', primary_muscle: quad.id, secondary_muscle: ham.id, region_id: legs.id, primary_exercise: true, accessory_exercise: false)

# 3 by 10, 4 by 12 
threeTen = Repetition.create(user_id: admin_user.id, title: '3 by 10')
RepetitionCollection.create(repetition_id: threeTen.id, set_value: 75, percent_based: true, rep_value: 10)
RepetitionCollection.create(repetition_id: threeTen.id, set_value: 75, percent_based: true, rep_value: 10)
RepetitionCollection.create(repetition_id: threeTen.id, set_value: 75, percent_based: true, rep_value: 10)

fourTwelve = Repetition.create(user_id: admin_user.id, title: '4 by 12')
RepetitionCollection.create(repetition_id: fourTwelve.id, set_value: 70, percent_based: true, rep_value: 12)
RepetitionCollection.create(repetition_id: fourTwelve.id, set_value: 70, percent_based: true, rep_value: 12)
RepetitionCollection.create(repetition_id: fourTwelve.id, set_value: 70, percent_based: true, rep_value: 12)
RepetitionCollection.create(repetition_id: fourTwelve.id, set_value: 70, percent_based: true, rep_value: 12)







