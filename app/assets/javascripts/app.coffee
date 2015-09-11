manaflare = angular.module('manaflare', ['templates', 'ui.router'])

class GameController
  constructor: (@$scope) ->
    example_card_data =
      "layout": "normal"
      "type": "Sorcery"
      "types": ["Sorcery"]
      "colors": ["Green"]
      "multiverseid": 23145
      "name": "Restock"
      "originalType": "Sorcery"
      "cmc": 5
      "rarity": "Rare"
      "artist": "Daren Bader"
      "manaCost": "{3}{G}{G}"
      "text": "Return two target cards from your graveyard to your hand. Exile Restock."
      "originalText":"Return two target cards from your graveyard to your hand. Remove Restock from the game."
      "flavor": "\"We hid such stockpiles all over Rath. We should continue that practice here.\"\n—Lin Sivvi"
      "number":"206"
      "imageName":"restock"
      "foreignNames":[{"language":"French", "name":"Restockage", "multiverseid":"185498"}]
    $scope.active_cards = [example_card_data]
    $scope.ctrl = @
  
  @draw_card: ->
    @$scope.active_cards.push(@example_card_data)

manaflare.controller('GameController', ['$scope', GameController])

manaflare.directive 'card', () ->
  restrict: 'E'
  templateUrl: 'card.html'
  replace: true
  link: (scope, elem, attrs) ->
    x = 0
    y = 0
    drag_move_listener = (event) ->
      x += event.dx
      y += event.dy
      $(elem).css({x: x + 'px', y: y + 'px'})

    draggable_params =
      snap:
        targets: [interact.createSnapGrid({ x: 10, y: 10 })]
        range: Infinity
        relativePoints: [{x: 0, y: 0}]
      inertia: false
      restrict:
        restriction: '.viewport'
        elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
        endOnly: true
      onmove: drag_move_listener

    interact('.card')
      .draggable(draggable_params)
      .on('doubletap', (event) ->
        event.preventDefault()
        if $(elem).css('rotate') == '90deg'
          $(elem).transition({rotate: '0deg'}, 500, 'snap')
        else
          $(elem).transition({rotate: '90deg'}, 500, 'snap')
      )
      .gesturable(
        onmove: (event) ->
          if $(elem).css('rotate') == '90deg' and event.da < -30
            $(elem).transition({rotate: '0deg'}, 500, 'snap')
          else if $(elem).css('rotate') == '0deg' and event.da > 30
            $(elem).transition({rotate: '90deg'}, 500, 'snap')
      )