team_attributes = "<%= j(render 'teams/attributes', team: @team) %>"
$('#team_<%=@team.id %>').replaceWith(team_attributes)

