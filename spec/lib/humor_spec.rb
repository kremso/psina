require 'humor'

describe Humor do
  before do
    stub_const("Joke", {})
  end

  it 'is initialized with the joke body' do
    Joke.should_receive(:new).with(body: 'trololo')
    Humor.new('trololo')
  end

  describe '#tag_with' do
    it 'assigns tags' do
      joke = mock
      Joke.stub(new: joke)
      joke.should_receive(:add_tag).with("foo")
      joke.should_receive(:add_tag).with("boo")
      humor = Humor.new('trololo')
      humor.tag_with("foo, boo")
    end
  end

  describe 'submit!' do
    it 'submits the joke' do
      joke = mock
      Joke.stub(new: joke)
      joke.should_receive(:save!)
      humor = Humor.new('trololo')
      humor.submit!
    end
  end
end
