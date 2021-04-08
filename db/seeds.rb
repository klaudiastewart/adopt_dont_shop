# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  # ActiveRecord::Base.connection.reset_pk_sequence!('applications')
  # Shelter.destroy_all
  # ApplicationPet.destroy_all
  # Application.destroy_all

  pound = Shelter.find_or_create_by!(foster_program: true,
                                      name: "da pound",
                                      city: "Denver",
                                      rank: 3,
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )
  happy_place = Shelter.find_or_create_by!(foster_program: true,
                                      name: "appple jack",
                                      city: "Denver",
                                      rank: 1,
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )
  half_way = Shelter.find_or_create_by!(foster_program: true,
                                      name: "zone one",
                                      city: "Denver",
                                      rank: 4,
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )

  dog = pound.pets.find_or_create_by!(name: "Bob",
                                      adoptable: true,
                                      age: 1,
                                      breed: "smol",
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )
  cat = pound.pets.find_or_create_by!(name: "Mr. Bob",
                                      adoptable: true,
                                      age: 1,
                                      breed: "smol",
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )
  mouse = pound.pets.find_or_create_by!(name: "Bobby",
                                      adoptable: true,
                                      age: 1,
                                      breed: "smol",
                                      created_at: Time.now,
                                      updated_at: Time.now
                                      )

  applicant = Application.find_or_create_by!(name: "Klaw",
                                              street_address: "123 way",
                                              city: "Denver",
                                              state: "Colorado",
                                              zip_code: 80204,
                                              description: "I like dogs",
                                              status: "In Progress",
                                              created_at: Time.now,
                                              updated_at: Time.now
                                              )

ApplicationPet.find_or_create_by!(application: applicant, pet: dog)
ApplicationPet.find_or_create_by!(application: applicant, pet: cat)
ApplicationPet.find_or_create_by!(application: applicant, pet: mouse)
