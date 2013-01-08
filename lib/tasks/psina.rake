require 'import/leela_import'

namespace :psina do
  task :import => :environment do
    LeelaImport.import!
  end
end
