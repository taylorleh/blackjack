class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if(@scores()[0] > 21)
      @bust()
    @last()

  stand: ->
    @each (card) ->
      card.flip() if card.get('revealed') is false

    while @scores()[0] < 17
        @hit()


    alert('Finished')
    @trigger('finished')
    

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  bust: ->
    if @isDealer is true
      # alert "Dealer Bust"
    else
      # alert "Player Bust"
    
    @trigger('bust')
