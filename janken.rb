# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    while true
      if ["0","1","2"].include?(input_hand)
        return input_hand.to_i
      else
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    rand(3)
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    point = (player_hand - enemy_hand + 3)%3
    if point == 0
      puts "あいこ"
      return true
    elsif point == 1
      puts "あなたの負けです"
      return false
    elsif point == 2
      puts "あなたの勝ちです"
      return false
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
