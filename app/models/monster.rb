class Monster < ApplicationRecord
  has_many :monster_abilities
  belongs_to :monster_set
  serialize :skills, Hash
  serialize :saving_throws, Hash

  CR_XP = {
    "0" => 10,
    "1/8" => 25,
    "1/4" => 50,
    "1/2" => 100,
    "1" => 200,
    "2" => 450,
    "3" => 700,
    "4" => 1100,
    "5" => 1800,
    "6" => 2300,
    "7" => 2900,
    "8" => 3900,
    "9" => 5000,
    "10" => 5900,
    "11" => 7200,
    "12" => 8400,
    "13" => 10000,
    "14" => 11500,
    "15" => 13000,
    "16" => 15000,
    "17" => 18000,
    "18" => 20000,
    "19" => 22000,
    "20" => 25000,
    "21" => 33000,
    "22" => 41000,
    "23" => 50000,
    "24" => 62000,
    "25" => 75000,
    "26" => 90000,
    "27" => 105000,
    "28" => 120000,
    "29" => 135000,
    "30" => 155000
  }

  # calculate the ability modifier for a given ability scote
  #
  # :param score: (int) the score for the abillity in question
  #
  # :return: the modifier for that score
  def ability_mod(score)
    return ((score - 10) / 2).floor
  end

  def to_param
    self.slug
  end
end
