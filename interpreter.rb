load 'lexer.rb'
puts "Please input the path of the file you would like to compile: "
filetointerpret = gets.chomp
code = File.open(filetointerpret, "r").lex
compiled = "def runcodecompiled() \n"

code.each do |line|
    #pp line
    case line[0]
    when 'bought'
        unless line[2].include?'...'
            compiled.concat "#{line[1]} = #{line[2].gsub(/['$', '!']/, '')}  \n"
        else
            compiled.concat "#{line[1]} = \"#{(line[2].gsub(/['$', '...']/, '')).to_i.chr}\"  \n"
        end
    when 'drove'
        
    when 'showed'
        compiled.concat "puts #{line[1]} \n"
    when 'went'
        
    when 'coup'
        unless line[1].include?'$'
            compiled.concat "#{line[2]}=#{line[2]}-(#{line[2]}*0.#{line[1].sub('%', '')}) \n"
        else
            compiled.concat "#{line[2]}=#{line[2]}-#{line[1].sub('$', '')} \n"
        end
    when 'asked'
        
    else
        #fail 'Unknown Action attempted!'
    end
end
compiled = compiled.concat'end'
#puts compiled
File.open("output.rb", "a+") {|f| f.write(compiled) }
load 'output.rb'
runcodecompiled()
File.delete("output.rb")