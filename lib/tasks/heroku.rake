# frozen_string_literal: true

namespace :heroku do
  desc 'Ensure environment is one we wish to spread seed in'
  task :ensure_review_app do
    abort 'This is not a Heroku Review App' unless review_app?
  end

  desc 'Seeds a review app with a subset of realistic-looking data'
  task :seed, [] => %w[
    ensure_review_app
    environment
    db:seed
  ] do
    Rails.logger.tagged('Seed App') { |l| l.info("Finished seeding new Review App: #{ENV['HEROKU_APP_NAME']}") }
  end

  def review_app?
    # https://devcenter.heroku.com/articles/github-integration-review-apps#injected-environment-variables
    !!ENV['HEROKU_APP_NAME']
  end
end