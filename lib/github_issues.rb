module GithubIssues
  include HTTParty
  base_uri 'https://api.github.com'
  
  def self.get_ideas
    get("/repos/WeeklyApps/weeklyapps.github.io/issues?label=Idea&state=open")
  end
  
  def self.get_all_issues
    get("/repos/WeeklyApps/weeklyapps.github.io/issues")
  end
end