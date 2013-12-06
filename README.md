aws-data
========

A rubygem for fetching data from AWS's user and metadata endpoints from ec2.

### API

```ruby

data = AWSData::Metadata.new

=begin

The constructor reaches out to the network to enumerate all the endpoints.
It'll block for a bit and then throw exceptions if you're not on EC2, or better
still do random undefined things if someone's chosen  to make 169.254/24
routable on your network

=end

data.instance-id #=> i-xxxxxxx

data.methods #=>
# ...
# 'ami_id',
# 'ami_launch_index',
# 'ami_manifest_path',
# 'block_device_mapping',
# 'hostname',
# 'instance_action',
# 'instance_id',
# 'instance_type',
# 'kernel_id',
# 'local_hostname',
# 'local_ipv4',
# 'mac',
# 'metrics',
# 'network',
# 'placement',
# 'profile',
# 'public_hostname',
# 'public_ipv4',
# 'public_keys',
# 'reservation_id',
# ...

=begin

Note that some of these will return a new Transport object, eg network, which has finder methods for it's keys

=end
```


See: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html
