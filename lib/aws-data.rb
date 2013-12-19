%w[
  aws-data/transport

  aws-data/base
  aws-data/metadata
  aws-data/dynamic
].each do |f|
  require File.expand_path("../#{f}", __FILE__)
end
