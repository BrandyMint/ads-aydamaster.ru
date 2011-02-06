# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :campaign do |f|
  f.place_id 1
  f.ad_id 1
  f.state "MyString"
  f.start_at "2011-01-19 18:54:47"
  f.stop_at "2011-01-19 18:54:47"
end
