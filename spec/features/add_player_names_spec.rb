require 'rails_helper'

RSpec.describe "Add player names", type: :feature do
  
  scenario 'A user can add the names of one player in African cup of Nation sweepstake 1' do
    competition = Competition.create(name: "Africa Cup of Nations")
    team = Team.create(name: "Algeria", competition_id: competition.id)
    visit "/competitions"
    click_link "Create Sweepstake"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Set up your sweepstake"
    fill_in 'player_player1', with: 'John'
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
  end

  scenario "a user can add 2 names for the african cup of nations" do
    competition = Competition.create(name: "Premier League")
    team = Team.create(name: "Arsenal", competition_id: competition.id)
    team2 = Team.create(name: "Aston Villa", competition_id: competition.id)
    visit "/competitions"
    click_link "Create Sweepstake"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Set up your sweepstake"
    fill_in 'player_player1', with: 'John'
    fill_in 'player_player2', with: 'Dave'  
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
    expect(page).to have_content('Dave')
  end
end
