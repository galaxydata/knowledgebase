yum install -y environment-modules

MODULESDIR="<%= modules.directory %>/modulefiles"

<% if (modules.is_server rescue false) -%>
mkdir $MODULESDIR
echo '<%= modules.directory %>    <%= networks.pri.network %>/<%= networks.pri.netmask %>(rw,no_root_squash,sync)' >> /etc/exports
exportfs -a
<% end -%>

echo "$MODULESDIR" >> /usr/share/Modules/init/.modulespath
<% if (!modules.is_server rescue true) -%>
echo '<%= modules.server %>:<%= modules.directory %>  <%= modules.directory %>  nfs  defaults  0 0' >> /etc/fstab
<% end -%>
