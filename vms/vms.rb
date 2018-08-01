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

  def self.add(sett)
    sett.each do |key, value|
      if @@settings[key]
        @@settings.merge!(value)
      else
        @@settings.merge!({key => value})
      end
    end
  end

  
  def self.network(node, sett)
    sett[:network]&.each{|net_sett| node.vm.network *net_sett}
  end
end