alohaeditor_dirname = "alohaeditor-#{Aloha::VERSION}"

namespace :aloha do

  desc "Update Aloha Editor to version specified in gem"
  task :update do
    print "Downloading zip archive ..."
    puts "Downloading https://github.com/downloads/alohaeditor/Aloha-Editor/#{alohaeditor_dirname}.zip ..."
    `mkdir -p tmp`
    `curl -L -# https://github.com/downloads/alohaeditor/Aloha-Editor/#{alohaeditor_dirname}.zip -o tmp/#{alohaeditor_dirname}.zip`
    puts " DONE"

    print "Extracting core files ..."
    `rm -rf tmp/#{alohaeditor_dirname}`
    `unzip -u tmp/#{alohaeditor_dirname}.zip -d tmp`
    puts " DONE"

    # Processing of core files (i.e. removeing some plugins) goes here...

    print "Copying core files ..."
    `rm -rf vendor/assets/javascripts/aloha`
    `mv tmp/#{alohaeditor_dirname}/aloha vendor/assets/javascripts/.`
    puts " DONE"

  end
end
