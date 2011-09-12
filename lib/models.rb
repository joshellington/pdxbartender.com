#
# Bartender model
class Bartender
  include MongoMapper::Document

  key :name, String
  key :creator, String
  key :status, String
  key :locations, Array

  timestamps!
end

#
# User model
class User
  include MongoMapper::Document
  
  key :name, String
  key :uid, String
  key :email, String
  key :reviews, Array
  
  timestamps!
end