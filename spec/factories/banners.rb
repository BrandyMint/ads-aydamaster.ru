Factory.define :banner_image, :class => Banner do |b|
  include ActionDispatch::TestProcess

  b.name "banner_400x100"
  b.user {|u| u.association(:joe) }
  b.banner { fixture_file_upload "spec/fixtures/banner_400x100.png", "image/png" }
end

Factory.define :banner_flash, :class => Banner do |b|
  include ActionDispatch::TestProcess

  b.name "banner_flash"
  b.user {|u| u.association(:ben) }
  b.banner { fixture_file_upload "spec/fixtures/banner_flash.swf", "application/x-shockwave-flash" }
end
