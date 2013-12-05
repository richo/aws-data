%w[
  aws-data/transport
  aws-data/metadata
].each do |f|
  require File.expand_path("../#{f}", __FILE__)
end
