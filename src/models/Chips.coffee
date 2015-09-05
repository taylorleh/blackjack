class window.Chips extends Backbone.Model

  initialize:->
    @set 'count', 500
    @set 'lastBet', 0


  spend: (num)=>
    console.log 'spending dbig bucks'
    @trigger 'spend', num
    @set 'count', @get('count') - num
    @set 'lastBet', num

  earn: (num)=>
    @set 'count', @get('count') + num