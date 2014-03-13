counter = 50

beacons = FactoryGirl.create_list(:beacon_with_item, counter)
users = FactoryGirl.create_list(:user, counter)

beacons.each do |beacon|
  users.each do |user|
    FactoryGirl.create(:detection, beacon: beacon, user: user)
  end
end