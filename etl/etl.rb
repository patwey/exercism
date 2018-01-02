class ETL
  def self.transform(old_scores)
    old_scores.each_with_object({}) do |(score, letters), result|
      letters.each { |l| result[l.downcase] = score }
    end
  end
end
