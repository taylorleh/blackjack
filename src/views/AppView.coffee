class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="chips"></div> 
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    # 'click .stand-button': -> @model.get('playerHand').stand()
    'click .stand-button': -> @model.get('dealerHand').stand()

  initialize: ->
    @render()
    @model.on('refresh', @render, @)

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.chips').html new ChipsView(model: @model.get 'chips').el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

