class window.ChipsView extends Backbone.View
  template: _.template '
    <div class="value">Chip Count: <%= count %>
      <input placeholder=5 value="5" min=5 max=<%= count %> class="bet" type="number" /><button>Place Bet</button> 
      </div>
  '

  events:
    'click button': 'bet'

  initialize: ->
    # debugger
    @render()
    @model.on 'change:count', =>@render()

  render:->

    @$el.html @template @model.attributes

  bet:=>
    
    amt = @$el.find('.bet').val()
    @model.spend(amt)



