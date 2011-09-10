#
# User model
class User
  include MongoMapper::Document
  
  key :name, String
  key :email, String
  
  timestamps!
end