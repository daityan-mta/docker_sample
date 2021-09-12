require 'rails_helper'

RSpec.describe Test, type: :model do  # Test モデルについて記述（describe）する
  it "is valid with a name and email" # name と email を保持していることが正である
  it "is invalid without a name"      # name が無いと無効である
end
