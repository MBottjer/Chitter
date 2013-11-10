class Peep 

include DataMapper::Resource 

property :id, Serial
property :post, String
property :user_name, String
property :name, String 
property :created_at, DateTime

end