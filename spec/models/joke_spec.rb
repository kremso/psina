require 'spec_helper'

describe Joke do
  it 'finds similar jokes' do
    FactoryGirl.create(:joke, body: 'Idu dve babky po pusti a padne na ne balkon')
    FactoryGirl.create(:joke, body: 'Sniezik sa nam chumeli..')

    similar_jokes = Joke.find_similar('Idu dve babky po Sahare a padne na ne kvetinac')

    similar_jokes.should have(1).joke
    similar_jokes.map(&:body).should == ['Idu dve babky po pusti a padne na ne balkon']
  end
end
