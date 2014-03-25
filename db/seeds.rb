counter = 4

FactoryGirl.create_list(:beacon_with_item, counter)
#users = FactoryGirl.create_list(:user, counter)
FactoryGirl.create(:user,
                   first_name: "User",
                   last_name: "1",
                   email: "user1@testemail.com",
                   password: "12345678")
FactoryGirl.create(:user,
                   first_name: "User",
                   last_name: "2",
                   email: "user2@testemail.com",
                   password: "12345678")

