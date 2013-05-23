# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery -> 

  # Current keg page
  if window.location.pathname == "/kegs/current"
    current_keg_id = -1
    $.ajax(
      url: '/kegs/current.json',
      cache: false
    ).done ( data ) ->
      if data
        current_keg_id = data['id']
      
    setInterval( ->
      $.ajax(
        url: '/kegs/current.json',
        cache: false
      ).done ( data ) ->
        if data && current_keg_id != data['id']
          location.reload();
    , 5000)

  # new keg page    
  if $("#beer-search-input").length
    if $("#beer-search-input").val().length > 0
      instantSearch()
    $("#beer-search-input").keydown (event) ->
      code = if event.keyCode then event.keyCode else event.which
      if code != 13 and code != 12
        $('#beerlist').stop().fadeTo(50, .5)
  
    $("#beer-search-input").keyup (event) -> 
      code = if event.keyCode then event.keyCode else event.which
      if code != 13 and code != 12
        instantSearch()
    
    $("#beer-search-form").bind('submit', ->
       $("#beer-search-btn").attr("disabled", true)
    )
     
    $("#beer-search-form").bind('ajax:success', (e, data, status, xhr) ->
      if !data.html or data.html.length <= 1
        $('#beerlist tbody').html('<tr><td colspan=6 style="text-align:center;color:#AAA">no results found</td></tr>')
      else
        $('#beerlist tbody').html(data.html)  
      $('#beerlist').stop().fadeTo(50, 1)

    )

    $("#beer-search-form").bind('ajax:complete', ->
      $("#beer-search-btn").attr("disabled", false) 
    )

instantSearch = ->
  if $("#beer-search-input").val().length == 0
    $('#beerlist tbody').html('<tr><td colspan=6 style="text-align:center;color:#AAA">search for beer</td></tr>')
    $('#beerlist').stop().fadeTo(50, 1);
  else
    $.ajax(
      url: '/beers/instant',
      data: {q: $("#beer-search-input").val()},
      cache: false
    ).done ( data ) ->
      if !data.html or data.html.length <= 1
        $('#beerlist tbody').html('<tr><td colspan=6 style="text-align:center;color:#AAA">press enter to search</td></tr>')
      else
        $('#beerlist tbody').html(data.html)  
      $('#beerlist').stop().fadeTo(50, 1)

