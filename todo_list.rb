TODO_FILE = "todos.txt"

todos = if File.exist?(TODO_FILE)
    File.readlines(TODO_FILE, chomp: true)
else
    []
end

loop do
    puts "Simple ToDo\n1: 追加, 2: 表示, 3: 削除, 4: 完了にする, 5: 終了"
    choice = gets.to_i

    case choice
    when 1
        puts "追加するTo-Doを入力"
        task = gets.chomp
        todos << "[ ] #{task}"

    when 2
        puts "=== To-Do リスト ==="
        if todos.empty?
            puts "（現在To-Doはありません）"
        else
            todos.each_with_index { |todo, i| puts "#{i+1}. #{todo}"}
        end

    when 3
        puts "削除する番号を入力:"
        index = gets.to_i - 1
        if index.between?(0, todos.size - 1)
            todos.delete_at(index)
            puts "To-Doを削除しました。"
        else
            puts "無効な番号です。"
        end

    when 4
        puts "完了にするタスクの番号を入力:"
        index = gets.to_i - 1
        if index.between?(0, todos.size - 1)
            todos[index].sub!("[ ]", "[✔️]") # 未完了 "[ ]" を 完了 "[✔️]"に変更
            puts "To-Doを完了しました！"
        else
        puts "無効な入力です"
        end

    when 5
        File.open(TODO_FILE, "w") { |file| file.puts todos }
        puts "To-Doリストを保存しました。終了します。"
        break
    else
        puts "無効な入力です"
    end
end