require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'when the name is longer than 100 characters' do
      it 'the record is not valid' do
        user = User.new(name: 'a' * 101)
        user.valid?
        puts user.errors.full_messages
        expect(user.errors.added?(:name, :too_long, count: 100)).to be(true)
      end
    end

    context 'when the name is less than 2 characters' do
      it 'the user is invalid' do
        user = User.new(name: 'a')
        user.valid?
        expect(user.errors.added?(:name, :too_short, count: 2)).to be(true)
      end
    end

    context 'when the name contains emojis' do
      it 'is invalid' do
        user = User.new(name: 'Hi 😄')

        user.valid? # This should be called before checking errors.
        expect(user.errors.added?(:name, :invalid)).to be(true)
      end
    end
  end
end
