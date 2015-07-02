filename = ARGV.first

lines = File.foreach(filename).first(100)  
    lines.each do |i|
        cmd = %x$'knife node delete #{i} --yes'$    
        puts %x{ #{cmd} }
        #cmd = "knife client delete #{i} -y"
        #puts `#{cmd}`
       end
