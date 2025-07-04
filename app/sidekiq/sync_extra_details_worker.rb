class SyncExtraDetailsWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'extra', lock: :until_executed, lock_expiration: 1.day.to_i

  def perform(repository_id)
    Repository.find_by_id(repository_id).try(:sync_extra_details)
  end
end
