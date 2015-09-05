assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      hand = deck.dealPlayer()
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'deal dealer', ->
    it 'should deal cards to dealerHand', ->
      dealerHand = deck.dealDealer()
      assert.strictEqual dealerHand.isDealer, true

  describe 'deal player', ->
      it 'should deal cards to playerHand', ->
        Hand = deck.dealPlayer()
        assert.strictEqual Hand.isDealer, undefined
      
        