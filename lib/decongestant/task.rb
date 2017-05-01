require 'rake'
require 'rake/sprocketstask'
require 'sprockets/manifest'

module Decongestant
  class Task < Rake::SprocketsTask
    def define
      namespace :decongestant do
        desc "Load asset compile environment"
        task :environment do
          Rails.application.config.assets.configure do |env|
            env.cache = ActiveSupport::Cache.lookup_store(:null_store)
          end
          Rake::Task['environment'].invoke
          @environment = Rails.application.assets
        end

        desc "Compile all the assets named in Decongestant.build_precompile"
        task :compile => :environment do
          with_logger do
            manifest.compile(assets)
            manifest.remove_digests
          end
        end
      end
    end
  end
end

module DigestlessFiles
  def remove_digests
    files.each do |(digest_path, info)|
      full_digest_path = File.join dir, digest_path
      full_digest_gz_path = "#{full_digest_path}.gz"
      full_non_digest_path = File.join dir, info['logical_path']
      full_non_digest_gz_path = "#{full_non_digest_path}.gz"

      if File.exist? full_digest_path
        logger.debug "Writing #{full_non_digest_path}"
        FileUtils.mv full_digest_path, full_non_digest_path
      else
        logger.debug "Could not find: #{full_digest_path}"
      end
      if File.exist? full_digest_gz_path
        logger.debug "Writing #{full_non_digest_gz_path}"
        FileUtils.mv full_digest_gz_path, full_non_digest_gz_path
      else
        logger.debug "Could not find: #{full_digest_gz_path}"
      end
    end
  end
end

module Sprockets
  class Manifest
    include DigestlessFiles
  end
end
