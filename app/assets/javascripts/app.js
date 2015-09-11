// Generated by CoffeeScript 1.8.0
var GameController, manaflare;

manaflare = angular.module('manaflare', ['templates', 'ui.router']);

GameController = (function() {
  function GameController($scope) {
    var example_card_data;
    this.$scope = $scope;
    example_card_data = {
      "layout": "normal",
      "type": "Sorcery",
      "types": ["Sorcery"],
      "colors": ["Green"],
      "multiverseid": 23145,
      "name": "Restock",
      "originalType": "Sorcery",
      "cmc": 5,
      "rarity": "Rare",
      "artist": "Daren Bader",
      "manaCost": "{3}{G}{G}",
      "text": "Return two target cards from your graveyard to your hand. Exile Restock.",
      "originalText": "Return two target cards from your graveyard to your hand. Remove Restock from the game.",
      "flavor": "\"We hid such stockpiles all over Rath. We should continue that practice here.\"\n—Lin Sivvi",
      "number": "206",
      "imageName": "restock",
      "foreignNames": [
        {
          "language": "French",
          "name": "Restockage",
          "multiverseid": "185498"
        }
      ]
    };
    $scope.active_cards = [example_card_data];
    $scope.ctrl = this;
  }

  GameController.draw_card = function() {
    return this.$scope.active_cards.push(this.example_card_data);
  };

  return GameController;

})();

manaflare.controller('GameController', GameController);

manaflare.directive('card', function() {
  return {
    restrict: 'E',
    templateUrl: 'card.html',
    replace: true,
    link: function(scope, elem, attrs) {
      var drag_move_listener, draggable_params, x, y;
      x = 0;
      y = 0;
      drag_move_listener = function(event) {
        x += event.dx;
        y += event.dy;
        return $(elem).css({
          x: x + 'px',
          y: y + 'px'
        });
      };
      draggable_params = {
        snap: {
          targets: [
            interact.createSnapGrid({
              x: 10,
              y: 10
            })
          ],
          range: Infinity,
          relativePoints: [
            {
              x: 0,
              y: 0
            }
          ]
        },
        inertia: false,
        restrict: {
          restriction: '.viewport',
          elementRect: {
            top: 0,
            left: 0,
            bottom: 1,
            right: 1
          },
          endOnly: true
        },
        onmove: drag_move_listener
      };
      return interact('.card').draggable(draggable_params).on('doubletap', function(event) {
        event.preventDefault();
        if ($(elem).css('rotate') === '90deg') {
          return $(elem).transition({
            rotate: '0deg'
          }, 500, 'snap');
        } else {
          return $(elem).transition({
            rotate: '90deg'
          }, 500, 'snap');
        }
      }).gesturable({
        onmove: function(event) {
          if ($(elem).css('rotate') === '90deg' && event.da < -30) {
            return $(elem).transition({
              rotate: '0deg'
            }, 500, 'snap');
          } else if ($(elem).css('rotate') === '0deg' && event.da > 30) {
            return $(elem).transition({
              rotate: '90deg'
            }, 500, 'snap');
          }
        }
      });
    }
  };
});