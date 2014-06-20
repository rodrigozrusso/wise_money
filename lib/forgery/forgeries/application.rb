class Forgery::Application < Forgery

  def self.shuffle(dictionary)
    dictionaries[dictionary].random.unextend
  end

  def self.capital_name
    shuffle(:capital_names)
  end

end
