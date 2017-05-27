$ ->
  if $('.pagination').length && $('#projects').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
        $('.pagination').html '<img class="center" src="/assets/spinningwheel.gif" />'
        $.getScript(url)
    $(window).scroll()
