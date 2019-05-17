require 'rails_helper'

describe Book, type: :model do
  let(:author) { Author.create(first_name: 'Jon', last_name: 'Snow', active: true) }
  subject { described_class.new(title: 'Harry Potter', description: 'Wizard', author: author) }

  context 'validation tests' do
    it 'should be valid with valid values' do

      expect(subject).to be_valid
    end

    it 'ensures title is present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end


    it 'ensure description is present' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end

  context 'scope test' do
    let(:params) { {title: 'Harry Potter', description: 'Wizard', author: author, active: true} } 

    before do
      Book.create(params)
      Book.create(params)
      Book.create(params)
      Book.create(params.merge(active: false))
      Book.create(params.merge(active: false))
    end

    it 'should return inactive books' do
      expect(Book.inactive.size).to eq(2)
    end
  end

  context 'association test' do
    it 'should belongs to an author' do
      expect(described_class.reflect_on_association(:author).macro).to eq :belongs_to
    end
  end
end
