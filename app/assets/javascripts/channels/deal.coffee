App.deal = App.cable.subscriptions.create "DealChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#dealMessage').empty().append data['message']
    $('#dealMessageContainer').fadeIn()
    
    clearMessage = () ->
      $('#dealMessageContainer').fadeOut()
    
    setTimeout(clearMessage, 1000)

  new: (message) ->
    @perform 'new', message: message

originalMessage = 'Enter a message to display it on the dashboards'
errorMessage = 'Input can\'t be blank!'
messageSent = 'Message sent!'

$(document).on 'click', '#dealSubmit', (e) ->
  if ($('#dealInput').val() != '')
    switchClass('alert-danger', 'alert-info')
    $('#dealInfoMessage').text(originalMessage)
    $('#dealInput').parent().removeClass('has-error')

    App.deal.new($('#dealInput').val())
    $('#dealInput').val('')
    switchClass('alert-info', 'alert-success')
    $('#dealInfoMessage').text(messageSent)

    successMessage = () ->
      switchClass('alert-success', 'alert-info')
      $('#dealInfoMessage').text(originalMessage)
    
    setTimeout(successMessage, 1000)

  else
    switchClass('alert-info', 'alert-danger')
    $('#dealInput').parent().addClass('has-error')
    $('#dealInfoMessage').text(errorMessage)

switchClass = (one, two) ->
  $('#dealInfoMessage').removeClass(one).addClass(two)