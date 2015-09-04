class window.Game extends Backbone.Model
  initialize: (args)->
    #debugger;
    @set 'deck', args.deck
    @set 'playerHand', args.deck.dealPlayer()
    @set 'dealerHand', args.deck.dealDealer()

