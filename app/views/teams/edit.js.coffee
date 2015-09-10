form = "<%= j( render 'form', team: @team) %>"
$('#team_<%=@team.id %> .form-placeholder').html(form).hide().slideDown()

