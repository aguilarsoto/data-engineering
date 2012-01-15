FactoryGirl.define do
  factory :upload do |upload|
    upload.document {open(Rails.root.join('test/fixtures/valid.tab'))}
    upload.partial 0
    upload.error nil
    upload.total 0
  end
end

