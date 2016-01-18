package 'httpd' do
  action :install
end

%w[/var /var/www /var/www/apache /var/log/apache].each do |path|
   directory path do
  #Directory '/var/www/apache' do
   action :create
   owner 'root'
   group 'root'
   mode '0755'
end
end

template '/etc/httpd/conf.d/sibu.conf' do
  source 'httpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
#  notifies :restart, 'service[httpd]', :delayed
end

cookbook_file '/etc/httpd/conf.d/cert.txt' do
  source 'cert.txt'
  owner 'root'
  group 'root'
  mode '0755'
end
