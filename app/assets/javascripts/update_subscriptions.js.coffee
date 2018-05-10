$(document).on 'turbolinks:load', ->
  $('.js-button').on 'click', ->
    authToken = $('meta[name=csrf-token]').attr('content');
    $.ajax
      url: '/subscriptions/'
      type: 'GET'
      dataType: 'json'
      # data: { subscription: { paid_for: true }, authenticity_token: authToken }
      success: (data) ->
        $('body').css('background', 'red')
