# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  # Create a comment
  $("#new_comment")
    .on "ajax:beforeSend", (evt, xhr, settings) ->
      $(this).find('textarea')
        .addClass('disabled')
        .attr('disabled', 'disabled');
    .on "ajax:success", (data, status, xhr) ->
      parsed = data.detail[0];
      $(this).find('textarea')
        .removeClass('disabled')
        .removeAttr('disabled', 'disabled')
        .val('');
      $('#comment-box')
        .prepend(
          $('<div>')
            .addClass('row')
            .append($('<div>')
              .addClass('media d-block d-md-flex mt-4')
              .append($('<img>')
                .addClass('card-img-64 d-flex mx-auto mb-3')
                .attr('src', 'https://i.imgur.com/1P7lRoq.gif'))
              .append($('<div>')
                .addClass('media-body text-center text-md-left ml-md-3 ml-0')
                .append($('<h5>')
                  .addClass('font-weight-bold mt-0')
                  .append($('<a>')
                    .attr('href', '')
                      .text(parsed.comment.author)))
                .append(parsed.comment.contents))));

# Delete
jQuery ->
  $(document).ready ->
    $(document)
      .on "click", ".delete-button", ->
        $(this).fadeTo('fast', 0.5)
      .on "ajax:success", ".comment-form", ->
        $(this).hide('fast')
      .on "ajax:error", ".comment-form", ->
        $(this).fadeTo('fast', 1)


