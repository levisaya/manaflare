manaflare = angular.module('manaflare',[
])

manaflare.directive 'card', () ->
  restrict: 'E'
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

    interact('card')
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
#
#    $(elem).bind 'contextmenu', (event) ->
#      if event.which == 3
#        if $(this).css('rotate') == '90deg'
#          $(this).transition({rotate: '0deg'}, 500, 'snap')
#        else
#          $(this).transition({rotate: '90deg'}, 500, 'snap')
#        return false
#      return true