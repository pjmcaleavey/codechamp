require "pry"
require "httparty"

require "codechamp/version"
require "codechamp/github"

module Codechamp
  class App

    def get_additions

    end

    def run
      github = Codechamp::Github.new
      github.get_owner
      github.get_repo
      contributors = github.get_contributions
      binding.pry
      # first_value = response.first#same as response[0]

      contributors.each do |contributor|
        weeks = contributor["weeks"]
        total = contributor["total"]
        author = contributor["author"]
        login = author["login"]
        # login = x["author"]["login"]
        puts "Username: " + login
        puts "Total contributions: #{total}"
        #puts "this is the author: #{author}"
        @sum_additions = 0
        @sum_deletions = 0
        @sum_commits = 0
        weeks.each do |week|
          @sum_additions += week["a"]
          @sum_deletions += week["d"]
          @sum_commits += week["a"]

        end
        puts "Weekly additions: #{@sum_additions}"
        puts "Weekly deletions: #{@sum_deletions}"
        puts "Weekly commits: #{@sum_commits}"
        puts
      end
    end

  end
end




app = Codechamp::App.new
app.run

binding.pry
