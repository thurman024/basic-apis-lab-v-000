class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
    end
    results = JSON.parse(resp.body)
    @repos = results['items']
    render 'search'
  end
end
