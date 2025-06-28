namespace :import do
  
  desc 'import github repositories from libraries.io open data release'
  task github_from_libraries_io: :environment do

    host = Host.find_by_name ('GitHub')
    return if host.repositories.count > 0 # only run this on an empty database

    ## TODO check number of database records and skip existing lookups if count is zero

    path = "libraries-1.6.0-2020-01-12/repositories-1.6.0-2020-01-12.csv"

    if !File.exist?(path)
      ## TODO rehost repos csv for faster/smaller download
      url = 'https://zenodo.org/record/3626071/files/libraries-1.6.0-2020-01-12.tar.gz?download=1' # 36.6 million repos
      `wget -O libraries-1.6.0-2020-01-12.tar.gz 'https://zenodo.org/record/3626071/files/libraries-1.6.0-2020-01-12.tar.gz?download=1'`
      `tar -xf libraries-1.6.0-2020-01-12.tar.gz`
    end

    repos = []
    count = 0
    Repository.delete_all

    CSV.foreach(path, headers: true) do |row|
      if row['Host Type'] == 'GitHub'

        hash = {}.with_indifferent_access
        hash['id'] = row['ID']
        hash['owner'] = {"login" => row['Name with Owner'].split('/').first}
        hash['full_name'] = row['Name with Owner']
        hash['description'] = row['Description']
        hash['fork'] = row['Fork']
        hash['created_at'] = row['Created Timestamp']
        hash['updated_at'] = row['Updated Timestamp']
        hash['pushed_at'] = row['Last pushed Timestamp']
        hash['homepage'] = row['Homepage URL']
        hash['size'] = row['Size']
        hash['stargazers_count'] = row['Stars Count']
        hash['language'] = row['Language']
        hash['has_issues'] = row['Issues enabled']
        hash['forks_count'] = row["Forks Count"]
        hash['mirror_url'] = row["Mirror URL"]
        hash['open_issues_count'] = row["Open Issues Count"]
        hash['default_branch'] = row["Default branch"]
        hash['subscribers_count'] = row["Watchers Count"]
        hash['uuid'] = row["UUID"]
        hash['source_name'] = row["Fork Source Name with Owner"]
        hash['license'] = {"key" => row["License"]}
        hash['status'] = row["Status"]
        hash[''] = row["Last Synced Timestamp"]
        hash['scm'] = row["SCM type"]
        hash['pull_requests_enabled'] = row["Pull requests enabled"]
        hash['topics'] = row[nil].split(',')
        
        repo_hash = host.host_instance.map_repository_data(hash)
        repo_hash[:host_id] = host.id
        repo_hash[:last_synced_at] = row["Last Synced Timestamp"]

        repos << repo_hash

        if repos.length > 999
          Repository.insert_all(repos)

          count += repos.length
          puts "inserted #{count} repos"

          repos = []
        end

      end

      count += repos.length
      Repository.insert_all(repos)
      host.repositories_count = count
      host.save
    end
  end

  desc 'import github repositories from timeline.ecosyste.ms api'
  task github_from_timeline: :environment do
    Host.find_by_name!('GitHub').import_github_repos_from_timeline(ENV['BEFORE'])
  end
end

