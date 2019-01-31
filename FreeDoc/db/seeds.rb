# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker' #la gem permettant le remplissage automatique

# Permettent de clear toutes les entrées dans la database
Doctor.destroy_all 
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctors'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patients'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'appointments'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'specialties'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'join_table_speciality_doctors'")

# Création de 5 villes
10.times do |city|
	City.create!(name: Faker::Address.unique.city)
end

# Création de 10 spécialités
10.times do |specialty|
	Specialty.create!(name: Faker::Beer.unique.name)
end

# Création de 10 docteurs
10.times do |doctor|
	Doctor.create!(first_name: Faker::GreekPhilosophers.unique.name, last_name: Faker::Color.unique.color_name, zip_code: Faker::Number.number(5), city_id: (rand(City.first.id..City.last.id)))
end

# Création des 20 patients
20.times do |patient|
	Patient.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, city_id: (rand(City.first.id..City.last.id)))
end

# Création des 40 rdv
40.times do |appointment|
	Appointment.create!(date: Faker::Time.forward(20, :day), doctor_id: (rand(Doctor.first.id..Doctor.last.id)), patient_id: (rand(Patient.first.id..Patient.last.id)), city_id: (rand(City.first.id..City.last.id)))
end

# Création de 10 diplomes
10.times do |diploma|
	Diploma.create!(doctor_id: (rand(Doctor.first.id..Doctor.last.id)), specialty_id: (rand(Specialty.first.id..Specialty.last.id)))
end