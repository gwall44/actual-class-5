# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
#item-potent so we are allowed to re-run this code over and over 

# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file
puts "there are #{Salesperson.all.count} companies" # companies: 0
# 2. insert new rows in companies table
new_person = Salesperson.new
new_person["first_name"] = "Greta"
new_person["last_name"] = "Wall"
p new_person
new_person.save #this save step is critical
#this does the whole INSERT INTO with SQL for us automatically, which is pretty nice
puts "there are #{Salesperson.all.count} companies" # companies: 1

person= Salesperson.new
person["first_name"] = "Carol"
person["last_name"] = "Finke"
person.save
person2= Salesperson.new
person2["first_name"] = "Lucy"
person2["last_name"] = "Lytle"
person2.save
puts "there are #{Salesperson.all.count} companies" # companies: 3
# 3. query companies table to find all row with California company
all_salespeople= Salesperson.all
p all_salespeople
# 4. query companies table to find single row for Apple
#use find by when we're just looking for the one thing
greta = Salesperson.find_by({ "first_name" => "Greta" })
#puts greta.inspect
# 5. read a row's column value
#it's an array 
#p greta["last_name"]
# 6. update a row's column value
greta = Salesperson.find_by({ "first_name" => "Greta","last_name"=> "Wall" })
greta["email"] = "greta.wall@northwestern.edu"
p greta["email"] # OR amazon.url = "https://www.amazon.com/"
greta.save
puts greta.inspect
# FINDBY ONLY GIVES YOU THE FIRST RECORD

# 7. delete a row
lucy = Salesperson.find_by({ "first_name" => "Lucy" })
lucy.destroy

p all_salespeople

#CRUD create, read, update, destroy

# CHALLENGE:
# 5. write code to display each salesperson's full name
for person in Salesperson.all
first_name= person["first_name"]
last_name = person["last_name"]
p"#{first_name} #{last_name}"
end