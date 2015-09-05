assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52
  
describe 'size of deck', ->
  it 'should continue using cards from a single deck', ->
    deck = new Deck()
    hand = deck.dealPlayer()
    while deck.length > 15
      hand.hit()
    assert.strictEqual deck.length, 15