class RepositoryUsageWorker
  include Sidekiq::Worker
  sidekiq_options lock: :until_executed, lock_expiration: 1.day.to_i

  def perform(repository_id)
    repository = Repository.find(repository_id)
    RepositoryUsage.from_repository(repository) if repository
  end
end