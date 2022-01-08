require 'rails_helper'

RSpec.describe "WorksSearch", type: :system do
    let(:user) { FactoryBot.create(:user) }
    let(:work) { FactoryBot.create(:work) }

    scenario 'it succeeds search if exit work' do
        login_as(user)
        find('.menu').click
        click_link "アニメ検索"
        fill_in 'search',    with: work.title
        click_button "検索"
        expect(has_css?('.my-anime-article')).to be_truthy
    end

    scenario 'it succeeds register and delete ' do
        login_as(user)
        find('.menu').click
        click_link "アニメ検索"
        fill_in 'search',    with: work.title
        click_button "検索"
        find('.silver').click
        expect(page).to have_selector '.my-anime-rank-result', text: 'Silver'
        find('.bronze').click
        expect(page).to have_selector '.my-anime-rank-result', text: 'Bronze'
        find('.gold').click
        expect(page).to have_selector '.my-anime-rank-result', text: 'Gold'
        find('.trash').click
        expect(page).to have_selector '.my-anime-none', text: 'None'
    end
end