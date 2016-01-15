$(document).ready ->
  $('.datatable').DataTable()

  $(document).on 'click', '.add_team', ->
    _this = $(this)
    monster = $(this).parent().find('#monster_team_id').val()
    $.ajax
      type: 'POST'
      url: '/users/' + _this.data('user') + '/monsters/' + _this.data('id') + '/add_monster_in_team'
      data: team_id: monster
      success: (data) ->
        if data
          _this.parent().html data.name
        else
          alert 'something going wrong try again later'
        return
      error: (data) ->
        alert 'Error'
        false
    return
