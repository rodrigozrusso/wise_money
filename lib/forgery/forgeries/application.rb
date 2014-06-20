class Forgery::Application < Forgery

  def self.shuffle(dictionary)
    dictionaries[dictionary].random.unextend
  end

  def self.capital_name
    shuffle(:capital_names)
  end

  def self.transaction_description
    shuffle(:transaction_descriptions)
  end

end
