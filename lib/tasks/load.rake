require 'csv'

namespace :load do
  desc "Load Teams"
  task :teams => :environment do
    team_csv = Rails.root.join('teams.csv')

    CSV.foreach(team_csv, :headers => true) do |row|
      Team.find_or_create_by(name: row[0], division: row[1])
    end

    Team.consistent_name
    teams = Team.all

    teams.each do |team|
      team.update_attribute(:name, team.name.strip)
    end
  end
end
