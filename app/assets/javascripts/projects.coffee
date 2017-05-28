$(document).on 'turbolinks:load', ->
  $('.volunteer').on('click', ->
    $('#volunteer-form').removeClass('hidden')
    $('#details').addClass('hidden')
    $('.cancel').removeClass('hidden')
    $(this).parents().eq(2).toggleClass('height-up')
    return
  )

  $('.cancel').on('click', (e) ->
    $('#volunteer').removeClass('hidden')
    $('#details').removeClass('hidden')
    $('#volunteer-form').addClass('hidden')
    $('.cancel').addClass('hidden')
    debugger
    $(this).parents().eq(3).removeClass('height-up')
    e.preventDefault()
    return
  )

  if $('.pagination').length && $('#projects').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
        $('.pagination').html '<img class="center" src="/assets/spinningwheel.gif" />'
        $.getScript(url)
    $(window).scroll()
