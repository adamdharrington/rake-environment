require 'rake'
require 'fileutils'
require File.expand_path('_scripts/imageprocess.rb')
require File.expand_path('_scripts/htmlprocess.rb')

include FileUtils

$ROOT = File.expand_path(File.dirname(__FILE__))
$PUBLIC = File.expand_path($ROOT + 'public')

# rake Tasks

task :default => ['markdown:markdownbuild',
                   'images:imagebuild']

desc "process images from specified directory"
namespace :images do
  task :imagebuild do
    ImageProcess.reduce width: "335", image_repository: "_imageinbox", image_directory: "public/img/"
  end
end

namespace :markdown do
  task :markdownbuild do
    HTMLProcess.begin
  end
end