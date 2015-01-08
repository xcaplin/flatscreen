# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flat.delete_all
[
{
	location: "Upper Street",
	price: 450,
	image: 0,

},
{
	location: "Essex Road",
	price: 400,
	image: 1,
},
{
	location: "Essex Road",
	price: 380,
	image: 2,
},
{
	location: "Packington Street",
	price: 380,
	image: 3,
},
{
	location: "Killick Street",
	price: 410,
	image: 4,
	
},
{
	location: "Margery Street",
	price: 450,
	image: 5,

}
].each { |attrs| Flat.create! attrs}