# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
SpecialityDoc.destroy_all
Speciality.destroy_all

cities = []
20.times do |x|
	city = City.create!(city: Faker::Address.city)
	cities << city
end

doctors_array=[]
50.times do  
doctors_array << Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: cities.sample.id, zip_code: Faker::Address.zip_code)
end



patients_array =[]
50.times do 
 patients_array << Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: cities.sample.id)
end


50.times do
    Appointment.create(doctor_id: doctors_array.sample.id, patient_id: patients_array.sample.id, date: Faker::Date.in_date_period, city_id: cities.sample.id)
end


cities_array = []
30.times do
cities_array << City.create(city: Faker::Address.city)
end

Speciality.destroy_all
specialities_array=["Anesthesiology", "Dermatology", "Radiology", "Internal medicine"]
specialityDoc_array = []
specialities_array.each do |x|
  specialityDoc_array  << Speciality.create(speciality: x)
end


30.times do
SpecialityDoc.create(doctor_id: doctors_array.sample.id, speciality_id: specialityDoc_array.sample.id)
end
