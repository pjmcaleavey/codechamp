module Codechamp

  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @auth_token = get_auth_token
      @headers = {
        "Authorization" => "token #{@auth_token}",#github needs in request to auth me
        "User-Agent"    => "HTTParty"
      }
    end

    def get_auth_token
      puts "What is your auth token?"
      gets.chomp
    end

    def get_owner
      puts "Whos is the owner?"
      @owner = gets.chomp
    end

    def get_repo
      puts "What org/repo do you want to get data about from github?"
      @repo = gets.chomp
    end

    # def list_teams(organization)
    #   Github.get("/orgs/#{organization}/teams", headers: @headers)
    # end
    #GET /repos/:owner/:repo/stats/contributors
    def get_contributions
      Github.get("/repos/#{@owner}/#{@repo}/stats/contributors", headers: @headers)#getting a web address
    end

  end

end





    # Prompt the user for an auth token
    # Ask the user what org/repo to get data about from github
    # Print a table of contributions ranked in various ways
    # Ask the user if they'd like to fetch another or quit.

    # Get the list of contributions for the specified repo. Get the information on lines added, deleted,
    # and the commit count. Note: You don't have to track contributions by week, just sum them to get a total.
    #
    # Once all the contributions have been collected for a repo, offer to sort the users by:
    #
    # 1) lines added 2) lines deleted 3) total lines changed 4) commits made
    #
    # Then print the commit counts in a table as below:
    #
    # ## Contributions for 'owner/repo'
    #
    # Username      Additions     Deletions     Changes
    # User 1            13534          2954        6249
    # User 2             6940           913        1603
    # ...
    #
    # Finally, ask the user if they'd like to sort the data differently, fetch another repo, or quit.
