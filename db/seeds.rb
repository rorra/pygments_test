Category.create!(name: 'Cat 1', description: "Test")
c = Category.create!(name: 'Cat 2', description: "Test")

s1 = Category.create!(name: "Cat 2 SubCat 1", description: "Test 1", parent: c)
s2 = Category.create!(name: "Cat 2 SubCat 2", description: "Test 2", parent: c)

s1.items.create!(name: "AA Item 1", description: "LALALA")
s1.items.create!(name: "AA Item 2", description: "LALALA")
s1.items.create!(name: "AB Item 3", description: "LALALA")

s2.items.create!(name: "AA Item 4", description: "LALALA")
s2.items.create!(name: "AB Item 5", description: "LALALA")
s2.items.create!(name: "BB Item 6", description: "LALALA")