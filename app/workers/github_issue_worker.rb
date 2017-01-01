class GithubIssueWorker
  include Sidekiq::Worker
  sidekiq_options queue: :low, unique: :until_executed

  def perform(name_with_owner, issue_number, token = nil)
    GithubIssue.update_from_github(name_with_owner, issue_number, token)
  end
end
