Product.destroy_all
Tag.destroy_all

Product.create!([{
  title: "Shoes",
  quantity: 123
},
{
  title: "Shirt",
  quantity: 345
},
{
  title: "Pants",
  quantity: 45
},
{
  title: "Socks",
  quantity: 56
}])

Tag.create!([{
  category: "Sale",
},
{
  category: "Men",
},
{
  category: "Women",
},
{
  category: "Children",
}])

Product.first.tags << Tag.first 
Product.first.tags << Tag.second 
Product.first.tags << Tag.third

Product.second.tags << Tag.second
Product.second.tags << Tag.third

Product.third.tags << Tag.fourth

Product.fourth.tags << Tag.first
Product.fourth.tags << Tag.fourth



puts "Success: Seed data loaded"
