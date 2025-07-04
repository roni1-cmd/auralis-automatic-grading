class PackageUsageSyncWorker
  include Sidekiq::Worker
  sidekiq_options lock: :until_executed, lock_expiration: 1.day.to_i

  def perform(package_usage_id)
    PackageUsage.find_by_id(package_usage_id).try(:sync)
  end
end