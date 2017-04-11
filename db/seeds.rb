# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create(:address => '東京都港区芝公園4丁目2-8') #東京タワー
Location.create(:address => '東京都墨田区押上1丁目1−2') #スカイツリー
Location.create(:address => '千葉県千葉市美浜区中瀬2−1') #幕張メッセ
Location.create(:address => '京都府京都市北区金閣寺町1') #金閣寺
Location.create(:address => '広島県広島市中区大手町1−10') #原爆ドーム
Location.create(:address => '石川県金沢市丸の内1-1') #金沢城
