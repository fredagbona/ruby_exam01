class Player
    def hand
      # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
      puts "Veuillez saisir un nombre.
  "
      puts "
  0: Goo, 1: Choki , 2: Par
  "
      input_hand = gets.chomp
      # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
      while true
        see_container = ["0","1","2"].include?(input_hand)

        if see_container
            return input_hand.to_i
        else
            puts "Veuillez entrer un nombre compris entre 0 et 2"
            input_hand = gets.chomp
        end
      end
    end
end
  # 相手が「0~2」の値をランダムに生成するロジックを書きます。
  class Enemy
    def hand
      # Goo、Choki、Parの値をランダムに取得する。
      return rand(0..2)
    end
  end
  # プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
  class Janken
    def pon(player_hand, enemy_hand)
      # Remplacez ["goo", "choki", "par"] la variable "janken".
  
  
      janken = ["Goo", "Choki", "Par"]
      #「相手の手は#{相手の手}です。」と出力させます。
      puts " La main de l'adversaire est : #{janken[enemy_hand]}。"
      if player_hand == enemy_hand
        # "Aiko" est sorti.
        puts "Egalité entre les deux joueurs"
        return true
        # Renvoie "true" pour exécuter à plusieurs reprises des roche-papier-ciseaux.
        # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
      elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        # (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        #「あなたの勝ちです」を出力します。
        #「false」を返してじゃんけんを終了させます。
        puts "Vous avez gagné"
      else
        #「あなたの負けです」を出力します。
        #「false」を返してじゃんけんを終了させます。
        puts "Vous avez perdu"
        return false
      end
    end
  end
  # Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
  class GameStart
    # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
    def self.jankenpon
      # Remplacez le Player instancié par la variable "player".
  
  
      player = Player.new
      #Assignez une instanciation d'Enemy à la variable "ennemi".
  
  
  
      enemy = Enemy.new
      #Assignez une instanciation de Janken à la variable "janken".
  
  
      janken = Janken.new
      # 変数「next_game」に「true」を代入しましょう。
      # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
      next_game = true
      while next_game == true do
        # J'utilise des roche papier ciseaux avec "janken.pon (player.hand, ennemi.hand)".
        #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        next_game = janken.pon(player.hand, enemy.hand)
      end
    end
  end
  # Appelez la méthode jankenpon avec le nom de la classe.
  GameStart.jankenpon