require 'factory_girl'

FactoryGirl.define do
  factory :joke do
    title 'Joke title'
    body 'Joke body'
    advice 'Joke advice'
    author 'Fero Mrkva'
    email 'fero@mrkva.sk'
  end
end
