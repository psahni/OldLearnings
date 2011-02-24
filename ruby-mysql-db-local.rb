require 'rubygems'
require 'activerecord'
require 'logger'
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = false

ActiveRecord::Base.establish_connection(
	:adapter  => 'mysql',
	:database => 'freysmiles_development',
	:username => 'root',
	:password => 'root'
)

sql = "Select * from users"
output = ActiveRecord::Base.connection.execute(sql)
#p output.field_tell
output.each_hash do |w|
p  w
print "\n"
end



