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

#  LOGIC

#	 Find users
#	 Select users with email id blank, Fetch email from responsible party table for those users  
#	 Find relationship ()
#	 Give one family id to the members

#___________________________________________________________________________________________________________________________

require 'rubygems'
require 'active_record'
require 'logger'
require 'postgres'

ActiveRecord::Base.logger = Logger.new(STDERR)
#ActiveRecord::Base.colorize_logging = false

#___________________________________________________________________________________________________________________________
@@counter = 10
def settings
	conn = ActiveRecord::Base.establish_connection(
		:adapter  => 'postgresql',
		:database => 'osmdb',
		:host => '24.229.182.156',
		:port => '5432',
		:username => 'osmuser',
		:password => '$ee$'	
	)
end

def conn
puts  "counter = #{@@counter}"
settings.connection
rescue ActiveRecord::ConnectionNotEstablished
	puts  "counter = #{@@counter}"
	puts "Exception1 Occured: Trying Again"
	@@counter-=1
	if @@counter < 1
	 puts "Exiting"
	 exit 0
  end
	settings.disconnect
	conn
rescue PGError
 puts  "counter = #{@@counter}"
 puts "Exception2 Occured: Trying Again"
 @@counter-=1
 if @@counter < 1
	 puts "Exiting"
	 exit 0
 end
 conn
rescue Exception => e
	puts "Exception Caught #{e}"
	@@counter-=1
 if @@counter < 1
	 puts "Exiting"
	 exit 0
 end
end
conn
#___________________________________________________________________________________________________________________________


def fetch
	@counter||=9
	begin
	sql = "Select * from patient_responsible_parties" 
	output = ActiveRecord::Base.connection.execute(sql)
	output.each{|o| 
		p o
		print "\n"
	}
	rescue ActiveRecord::ConnectionNotEstablished
		puts  "counter = #{@counter}"
		puts "Exception1 Occured: Trying Again"
	rescue PGError
	 puts  "counter = #{@counter}"
	 puts "Exception2 Occured: Trying Again"
	rescue Exception
		puts "Exception Caught"
	end
end
fetch


