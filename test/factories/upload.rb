FactoryGirl.define do
  factory :upload do |upload|
    upload.document {open(Rails.root.join('test/fixtures/valid.tab'))}
  end
end

