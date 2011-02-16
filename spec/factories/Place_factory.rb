# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :place_1, :class => Place do |p|
  p.association(:format)
  p.association(:joe)
  p.name "place_1"
end

Factory.define :place_2, :class => Place do |p|
  p.association(:format)
  p.association(:ben)
  p.name "place_2"
end
