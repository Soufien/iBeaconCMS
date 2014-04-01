#Users

#users = FactoryGirl.create_list(:user, counter)
users = FactoryGirl.create_list(:user, 2)


#Apps
a1 = FactoryGirl.create(:app,
                        name: "Sephora",
                        description: "Sephora app",
                        user: users[0])

#a2 = FactoryGirl.create(:app,
#                        name: "Levis",
#                        description: "Levis app",
#                        user: users[1])

#Beacons
counter = 5
FactoryGirl.create_list(:beacon_with_item, counter, uuid: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", app: a1)
#FactoryGirl.create_list(:beacon_with_item, counter, uuid: "B9407F30-F5F8-466E-AFF9-ABCDEFGHILMN", app: a2)



