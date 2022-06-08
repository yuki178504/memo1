require "csv"


class Newmemo
  
 def new_memo
   puts "【新規のファイル名を入力してください】"
   memo_type = gets.to_s.chomp

   csv = CSV.open("#{memo_type}.csv","w")

   puts "【本文を入力してください】"
   puts "【完了したらCtrl+Dを押してください】"

   memo_main = $stdin.read

   csv.puts "#{memo_main}"

   csv.close
 end

end

new = Newmemo.new

class Existingmemo
  
  def existing_memo
    puts "【編集したいファイル名を入力してください】"
    
    call_memo = gets.to_s.chomp
    
    csv = CSV.open("#{call_memo}.csv","r+")
    puts "【編集する内容を入力してください】"
    puts "【完了したらCtrl+Dを押してください】"
    
    existing_memo_main = STDIN.read
    
    p csv.puts csv.read
    
    csv.close
  end
end    

existing = Existingmemo.new

loop do

puts "①(新規でメモを作成)②(既存のメモを編集する)"

number = gets.to_i

if number == 1
  
  new.new_memo()
  break
  
elsif number == 2
  begin
  existing.existing_memo()
rescue
  puts "ファイルが存在しません！"
  retry
end
break

else 
  puts "対応するキーがありません"
end

end