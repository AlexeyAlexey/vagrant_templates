require 'fileutils'

module Vms
  @@settings = {}

  def self.settings=(sett = {})
    #@@settings = sett   
    sett.each do |key, value|
      if @@settings[key]
        @@settings[key].merge!(value)
      else
        @@settings[key] = value
      end
    end
  end

  def self.settings
    @@settings
  end

  def self.create_dirs(dirs = [])
    root = File.expand_path("..", File.dirname(__FILE__))
    dirs.each do |dir|
      dirname = root + "/#{dir}"
      FileUtils.mkdir_p(dirname) if !Dir.exist?(dirname)
    end
  end
  
  def self.network(node, sett)
    sett[:network]&.each{|net_sett| node.vm.network *net_sett}
  end
end