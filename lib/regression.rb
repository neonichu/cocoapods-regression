require 'regression/builder'
require 'regression/version'
require 'regression/xcode'

module CocoaPods
  module Regression
    def self.clone(git_url, name)
      target_dir = "#{ENV['TMPDIR']}/#{name}"
      return target_dir if Dir.exist?(target_dir)

      puts "Cloning #{git_url}..."
      execute("git clone #{git_url} '#{target_dir}'")

      target_dir
    end

    def self.execute(command)
      puts `#{command}`

      if $? != 0
        $stderr.puts "`#{command}` failed to execute."
        exit(2)
      end
    end
  end
end
