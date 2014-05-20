# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
flip_len = 60000

jQuery -> 
  if $("#tap0").length
    do_flip($("#tap0"))
    setInterval((->do_flip($("#tap0"))),4*flip_len)
    
  if $("#tap1").length
    setTimeout((->do_flip($("#tap1"))),1*flip_len)
    setTimeout((->setInterval((->do_flip($("#tap1"))),4*flip_len)),1*flip_len)
    
  if $("#tap2").length
    setTimeout((->do_flip($("#tap2"))),2*flip_len)
    setTimeout((->setInterval((->do_flip($("#tap2"))),4*flip_len)),2*flip_len)
      
do_flip = (parent) -> 
  parent.children('.flip-container')[0].classList.toggle('hover')
  setTimeout((->do_flip_back(parent)), 1*flip_len)
  
do_flip_back = (parent) -> 
  parent.children('.flip-container')[0].classList.toggle('hover')  