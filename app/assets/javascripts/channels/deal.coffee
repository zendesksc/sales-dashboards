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

$(document).on 'click', '#dealSubmit', (e) ->
  if ($('#dealInput').val() != '')
    $('#dealInfoMessage').removeClass('alert-danger').addClass('alert-info')
    $('#dealInfoMessage').text('Enter a message to display it on the dashboards')
    $('#dealInput').parent().removeClass('has-error')

    App.deal.new($('#dealInput').val())
    $('#dealInput').val('')
    $('#dealInfoMessage').removeClass('alert-info').addClass('alert-success')
    $('#dealInfoMessage').text('Message sent!')

    successMessage = () ->
      $('#dealInfoMessage').removeClass('alert-success').addClass('alert-info')
      $('#dealInfoMessage').text('Enter a message to display it on the dashboards')
    
    setTimeout(successMessage, 1000)

  else
    $('#dealInfoMessage').removeClass('alert-info').addClass('alert-danger')
    $('#dealInput').parent().addClass('has-error')
    $('#dealInfoMessage').text('Input can\'t be blank')