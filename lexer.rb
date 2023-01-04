class File
def lex
file = self
lines = []
commands = ['bought', 'showed', 'drove', 'went', 'coupon', 'put']
i = 0
file.each_line do |li|
    line = []
    li.slice! 'to'; li.slice! 'the'; li.slice! 'a'; li.slice! 'that'; li.slice! 'my'; li.slice! 'friend'; li.slice! 'off'; li.slice! 'to'; li.slice! 'the'; li.slice! 'a'; li.slice! 'that'; li.slice! 'my'; li.slice! 'friend'; li.slice! 'off'; li.slice! 'on'; li.slice! 'used'; li.slice! 'on';
    li = li.split(' ')
    if not((li.include? '    ') || (li.include? '*')) 
        line[0] = li[2]
        line[1] = li[3]
        if (li[4] == 'cost' || li[4] == 'plus'); line[2] = li[5]; end;
        if (li[4] == 'plus'); line[3] = li[6]; end;
        if (li[3] == 'coup'); line[0] = li[3]; line[1] = li[2]; line[2] = li[-1]; end;
        
        lines[i] = line
    end
    i+=1
end

    
lines.map{|a| a.compact!}
lines.delete_if{|x| x.empty?}
end
end