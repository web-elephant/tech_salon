require 'rails_helper'

describe Cliant do
  describe '#password=' do
    example '文字列を与えると、hashed_passwordは長さ60の文字列になる' do
      cliant = Cliant.new
      cliant.password =  'password'
      expect(cliant.hashed_password).to be_kind_of(String)
      expect(cliant.hashed_password.size).to eq(60)
    end

    example 'nilを与えると、hashed_passwordはnilになる' do
      cliant = Cliant.new(hashed_password: 'x')
      cliant.password = nil
      expect(cliant.hashed_password).to be_nil
    end
  end
end
