#define :openssh_tunnel do
#  include_recipe "openssh"
#
#  openssh_tunnel "MongoDB_replica_member_#{member.name.gsub(/\./,'_')}" do
#    host member.name
#    forwarding "-L#{member[:mongodb][:server][:port]}:localhost:#{member[:mongodb][:server][:port]}"
#    key '/root/.ssh/tunnel_id_rsa'
#    user 'tunnel'
#  end
#
#end

