class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->

    @collection.on 'add', => @render()

    @collection.on 'remove', => @render()
    @collection.on 'change', => @render()
    @collection.on 'reset', => @render()
    @collection.on 'set', => @render()
    @render()

  render: ->
    @$el.children().detach()
    console.dir(@collection)
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

