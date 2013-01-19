carthumbnails = [
  "http://www.carbazar.net/timthumb.php?src=product/1355984493.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356241446.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356187097.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356186478.jpg&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356021646.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356019722.jpg&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1355985166.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356159079.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356161008.JPG&h=57&w=94&zc=1"
  ] 
carimages = [
  "http://www.carbazar.net/timthumb.php?src=product/1356249357.jpg&h=245&w=475&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356241271.JPG&h=245&w=475&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356187071.jpg&h=245&w=475&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356186456.jpg&h=245&w=475&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356021628.JPG&h=245&w=475&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356019798.jpg&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1355985326.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356159118.JPG&h=57&w=94&zc=1",
  "http://www.carbazar.net/timthumb.php?src=product/1356160793.JPG&h=245&w=475&zc=1"
]
mark = ["Alfa Romeo","Aston Martin","Audi","Bentley","Bizzarrini ","BMW","Bufori","Bugatti","Buick","Cadillac","Chevrolet","Chrysler","Citroen","GMC","Daewoo","Daihatsu","DeLorean","Dodge","Ferrari","Fiat","Ford","Honda","Hyundai","Infiniti","Isuzu ","Jaguar ","Kia","Lamborghini","Lancia","lexus","Lincoln ","Maserati ","Maybach","Mazda","McLaren","Mercedes-Benz","Mercury","MINI","Mitsubishi","Nissan","Opel","Oullim","Peugeot","Porsche","Proton","Renault","Rolls Royce","Rover","Saab","Seat","Skoda","Smart","Speranza","Ssang Yong","Subaru","Suzuki","TATA","Toyota","Volkswagen","Volvo","Other Make","GMC ","Hummer","Jeep ","Land Rover","hamann x6","Mitsuoka"]
model = ["DB7/DB9","DBS","Vanquish","Vantage","Rapide","Virage","Veryca","Z7","Acadia","Envoy","Jimmy","Pickup","Sierra","Suburban","Terrain","Yukon"]


userpicture = []
1.upto(100) do |i|
  base = 1489686594
  picid = base + i*100
  s1 = "https://graph.facebook.com/"
  s2 = "/picture"
  userpicture << s1+picid.to_s+s2
end

usernames = ["Sadye Crisman","Jackson Custodio","Joelle Gowans","Felipe Garon","Tabatha Halpern","Kendall Keppler","Elisabeth Napoles","Otelia Mcglone","Pura Groh","Helene Troxel","Reagan Markell","Lulu Balentine","Waneta Glass","Aide Sing","Pearle Goers","Chante Bacon","Krystin Muir","Kimberley Gulick","Toby Messick","Tammie Mei","Zenaida Ramsier","Sylvia Shurtliff","Andres Swindoll","Hang Ashcraft","Man Weber","Allene Huggard","Krystal Gullett","Jann Ratledge","Maris Yzaguirre","Traci Chenault","Lucas Keith","Ardis Piersall","Brenda Mckinley","Dina Yeadon","Basilia Fredricks","Isaiah Hartsell","Katie Storms","Irvin Gregorio","Drucilla Weller","Hal Gano","Chere Cogley","Sheilah Mcdonnell","Sunny Silcox","Yolando Cerda","Pearly Beer","Keshia Hutcherson","Paulita Vero","Tiffani Kinloch","Candida Cyphers","Christiana Fonte"]
basemobileno = "012201853"

User.delete_all
Car.delete_all
# 
# 1.upto(usernames.length-1) do |n|  
#   
  # firstname = usernames[n].split(" ").first
  # lastname = usernames[n].split(" ").second
  # mobile = basemobileno + (10+n).to_s
#   
  # User.create :firstname => firstname  , :lastname => lastname  , :mobile => mobile , :thumbnail => userpicture[n] , :pricture => userpicture[n] , :location => "cairo" , :authority => "user" 
#    
# end




1.upto(100) do |n|
  
  randomComment = 'for the most part, small car shoppers are no longer looking for a basic,  economy car  transportation appliance More likely they re seeking a vehicle that s small and economical but also stylish techfocused and fun to drive and that s what the 2013 Ford Focus is With the introduction of a completely redesigned' 
  Car.create :mark => mark[rand(mark.length)] , :model => model[rand(model.length)], :thumbnailurl => carthumbnails[rand(carthumbnails.length)],:picture => carimages[rand(carimages.length)], :cc => rand(3000) ,:kmpassed => rand(500000) , :automatic => rand(2) == 1 ,:centerlock => rand(2) == 1 , :powersteering => rand(2) == 1 , :abs => rand(2) == 1 , :electricwindow => rand(2) == 1 ,:airbag => rand(2) == 1  , :user =>  User.all[n%User.all.length], :price => rand(1000000), :comment => randomComment  
end


