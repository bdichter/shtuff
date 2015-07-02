## get nodes/names and process
## use nc as a replacement for ping

=begin
# get list of node names from chef that have not checked in for 1 hour or greater, print the i-address field, strip off last comma
cmd = "knife status --hide-healthy  | awk '{ print $4 }' | sed s'/.$//'"
status = Array.new
status = `#{cmd}`
#puts status[0...10] #issue here is that all the data = long string = ugh. Would be nice to place each column as value.
puts status
=end

#getem = "knife status --hide-healthy | awk -v q='\"' '{ print q $6 q }' | sed s'/,//'"
#'{gsub(/\\n/,"\n")}1'

# run knife status, get IP
getem = Array.new

#lines = File.foreach(filename).first(100)
getem = "knife status --hide-healthy | awk '{ print $6 }' | sed s'/\r\n/ /'"
#status = Array.new
status =`#{getem}`
#puts status.length
#puts getem.length
#puts status.length 
#puts status[2]
puts status

=begin
#'ConnectTimeout=20'
status.each do |i|
  tryem = "ssh -o 'StrictHostKeychecking=no' root\@#{getem} chef-client"
  trying = `#{tryem}`
  puts trying
end

#    lines.each do |i|
#        cmd = %x$'knife node delete #{i} --yes'$
#        puts %x{ #{cmd} }
#        #cmd = "knife client delete #{i} -y"
#        #puts `#{cmd}`
#       end

=end
