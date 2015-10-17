# encoding=utf-8
class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    actions = ['R', 'P', 'S']
    action1 = player1[1]
    action2 = player2[1]
    # 动作必须是R,P,S之一
    if actions.include?(action1) && actions.include?(action2)
        distance = actions.index(action1) - actions.index(action2)
        # player1胜利的情况是，distance=1或者0或者-2
        if distance == 0 || distance == 1 || distance == -2
            return player1
        else
            return player2
        end
    else
        raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a? String
        return self.winner(tornament[0], tornament[1])
    end
    return self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
  end

end
