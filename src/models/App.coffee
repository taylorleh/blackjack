# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()

    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @setEvents()
  
    

  newGame: (deck)->
    @attributes.playerHand.reset()
    @attributes.dealerHand.reset()

    # This creates a new deck if needed
    if @get('deck').length < 15
      alert 'A new deck is being used'
      @.set 'deck', deck = new Deck()

    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @setEvents()
    @trigger('refresh')


  setEvents: (deck)-> 
    @.attributes.playerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('finished', => 
      @newGame(deck: deck))
    