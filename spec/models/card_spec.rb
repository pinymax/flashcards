require 'rails_helper'

describe Card do
  it "Checks the compare method" do
    card = Card.new(original_text: "hause",translated_text: "battle")
    expect(card.checker("hAlel")).to be false
  end

  it "Checks the compere method with bad argument" do
    card = Card.new(original_text: "hause",translated_text: "battle")
    expect(card.checker("   BAttlE")).to be false
  end

  it "Checks the compere method with good argument" do
    card = Card.new(original_text: "hause",translated_text: "battle")
    expect(card.checker("battle")).to be true
  end

  it "Checks the date setter" do
    card = Card.create(original_text:"house", translated_text: "ha")
    expect(card.review_date == Date.today + 3.days).to be true
  end

  it "Checks, if params between fields is not the same" do
    card = Card.create(original_text: "house", translated_text: "house")
    expect(card).not_to be_valid
  end
end
