# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :ad do |f|
  f.user_id "MyString"
  f.name "MyString"
  f.width 1
  f.height 1
  f.ad_style_id 1
  f.state "MyString"
  f.link "MyString"
end
