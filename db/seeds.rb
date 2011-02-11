# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# http://bannermaker.chaika.net.ua/formats.php
# http://fleek.org/standartnye-razmery-bannerov/

if Format.count==0
  %w[728-90-ведущий_стенд
468-60-длинный_баннер
336-280-большой_прямоугольник
300-250-прямоугольник_средней_величины
300-600-объявление_на_полстраницы
250-250-всплывающий_квадрат
240-400-вертикальный_прямоугольник
234-60-половина_длинного_баннера
180-150-прямоугольник
160-600-широкий_небоскреб
125-125-квадратная_кнопка
120-600-небоскреб
120-240-вертикальный_баннер
120-90-кнопка_1
120-60-кнопка_2
88-31-микро_полоса
200-200].each do |s|
    s.gsub!('_',' ')
    a=s.split('-')
    Format.create!({
                     :width => a[0],
                     :height => a[1],
                     :name => a[2]
                   })
  end
end

# Website.destroy_all


BLOGGER_EMAIL = 'blogger@aydamaster.ru'
#BLOGGER_EMAIL = 'danil@orionet.ru'

user = User.find_by_email(BLOGGER_EMAIL) || User.create!(:email=>BLOGGER_EMAIL,:password=>'test',:password_confirmation=>'test')
z = user.websites.find_by_domain('zhazhda.ru') || user.websites.create!( :domain=>'zhazhda.ru' )

[{ :name=>'right01',
   :geometry=>'200x200' }, 
 { :name=>'right02',
   :geometry=>'200x200' },
 { :name=>'top',
   :geometry=>'468x60' }, 
 { :name=>'bottom',
   :geometry=>'468x60' }, 
 { :name=>'middle',
   :geometry=>'468x60' }
].each do |g|
  g[:user] = user
  z.places.create! g
end

(1..9).each do |i|
  z.places.create!(
                   :user => user,
                   :name=>"left0#{i}",
                   :geometry=>'120x90'
                   )
end

