require 'rubygems'
require 'active_record'
require 'logger'
require 'postgres'

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = false

#LOGIC

#1. Find users
#2.
#3. Find relationship

conn = ActiveRecord::Base.establish_connection(
	:adapter  => 'postgresql',
	:database => 'osmdb',
	:host => '24.229.182.156',
	:port => '5432',
	:username => 'osmuser',
	:password => '$eed$'	
)

sql = "Select * from patients" 
output = ActiveRecord::Base.connection.execute(sql)

output.each{|o| 
	p o
	print "\n"
}

#http://efreedom.com/Question/1-2410373/Run-Sql-Script-Ruby
#http://oldwiki.rubyonrails.org/rails/pages/PostgreSQL
#http://ar.rubyonrails.org/
#http://snippets.dzone.com/posts/show/5570
#http://weare.buildingsky.net/2006/12/06/multiple-concurrent-database-connections-with-activerecord
#http://snippets.dzone.com/posts/show/3097
#http://magicmodels.rubyforge.org/dr_nic_magic_models/ - > magic models
#postgresql_autodoc -h 24.229.182.156 -d osmdb -u osmuser --password='$eed$'
#dot -Tpng osmdb.dot > focusdirect-2.png
#http://net.tutsplus.com/tutorials/ruby/setting-up-a-rails-server-and-deploying-with-capistrano-on-fedora-from-scratch/
