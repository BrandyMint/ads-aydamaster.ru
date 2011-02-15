# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :joe, :class => User do |f|
  f.email  "joe@smith.com"
  f.password "cooljoe"
  f.password_confirmation "cooljoe"
end

Factory.define :ben, :class => User do |f|
  f.email "ben@black.com"
  f.password "coolben"
  f.password_confirmation "coolben"
end
