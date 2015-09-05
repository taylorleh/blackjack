# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'chips', chips = new Chips()

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


  setEvents: ->
    currentBet = 0
    @.attributes.playerHand.on('bust', => 
      @newGame(deck: deck))

    @.attributes.dealerHand.on('bust', => 
      replenish = @get('deck').get('currentBet')
      console.log replenish
      @newGame(deck: deck))

    @.attributes.dealerHand.on('finished', => 
      @findWinner()
      @newGame(deck: deck))

    @attributes.chips.on 'spend',(amt) =>
      
  
  findWinner: => 
    
    playerScores = @get('playerHand').scores()
    if playerScores[1] > 21
      playerScore = playerScores[0]
    else
      playerScore = playerScores[1]
  
    dealerScores = @get('dealerHand').scores()
    if dealerScores[1] >  21
      dealerScore = dealerScores[0]
    else
      dealerScore = dealerScores[1]

    if playerScore > dealerScore
      alert "YOU WIN!!!"
    else if dealerScore > playerScore
      alert "You lost!"
    else
        alert "It's a tie"