FactoryBot.define do
  factory :order_address do
    postal_code                { '123-4567' }
    prefecture_id              { 2 }
    city                       { '東京都' }
    address_line               { '番地1' }
    phone                      { 12_345_678_901 }
    token                      { 'tok_abcdefghijk00000000000000000' }
  end
end
