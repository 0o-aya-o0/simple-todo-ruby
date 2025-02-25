todos = [] # 空の配列を作る。これがないと何も追加できない。

loop do
    puts "1: 追加, 2: 表示, 3: 削除, 4: 終了" # 文字列
    choice = gets.to_i # getsでユーザーの入力を受け取り、.to_iで文字列を整数に変換する。変数choiceに入力された数値を代入

    case choice # if文よりスッキリ書けるため、case。choiceは変数
    when 1 # choiceが1のとき
        puts "追加するTo-Doを入力"
        todos << gets.chomp # getsでユーザーの入力を受け取り、.chompで文字列の最後の行にある改行(\n)を削除。<<で配列に要素を追加する
    when 2
        puts "=== To-Do リスト ==="
        todos.each_with_index { |todo, i| puts "#{i+1}. #{todo}"} # each_with_indexで配列の要素を1つずつ取り出しながら、その要素のインデックスも取得する。
    when 3
        puts "削除する番号を入力:"
        index = gets.to_i - 1 # ユーザーが入力した番号(1,2,3)をインデックス(0,1,2)に変換
        todos.delete_at(index) if index.between?(0, todos.size - 1)
    when 4
        puts "終了します"
        break
    else
        puts "無効な入力です"
    end
end