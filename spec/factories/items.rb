FactoryGirl.define do
  factory :item do
    description "This is a to do item"
    list nil
  end
end

# FactoryGirl.define do
#   factory :item do
#     sequence :description do |n|
#       "Create your # #{n} to do item"
#     end
#     list nil
#   end
# end
