# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    #THIS SHOULD BE USED FOR REMOVING THE BELOW DUPLICATE CODE
    # @newGame(deck: deck)


    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @set 'game', game = new Game({deck:deck})

    @.attributes.playerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('finished', => 
      @newGame(deck: deck))
    

  newGame: (deck)->
    # CHECKS FOR DECK LENGTH WHEN REFACTORING
    # if deck.deck.models.length is undefined
    @attributes.playerHand.reset()
    @attributes.dealerHand.reset()
    #LAZY CHECK FOR SHRINKING DECK

    # if @deck.models.length < 15
    #   deck = new Deck()

    @set 'playerHand', @get('deck').dealPlayer()
    console.dir @get 'playerHand'
    @set 'dealerHand', @get('deck').dealDealer()
    @trigger('refresh')

    @.attributes.playerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('finished', => 
      @newGame(deck: deck))