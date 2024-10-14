current_path = File.dirname(__FILE__)
FILE_PATH_SOCCER = current_path + "/data_soccer/soccer_games.txt"

module FileReader
  def init_file(path_to_file)
    if File.exist?(path_to_file)
      file_soccer_results = File.new(path_to_file, "r:UTF-8")
      res = file_soccer_results.readlines
      file_soccer_results.close
      res
    else
      puts "File not found"
    end
  end
end

class SoccerResults
  include FileReader

  def initialize(file_path)
    @file_path = file_path
  end

  # Method for getting the command index
  def get_index(arr_teams, target_team)
    arr_teams.index { |x| x[:title] == target_team }
  end

  # Scoring method
  def count_result(games, teams)
    games.each do |game|
      first_team = game.first.delete("^A-Za-z ").to_s.strip
      second_team = game.last.delete("^A-Za-z ").to_s.strip
      first_count = game.first.delete("^0-9").to_i
      second_count = game.last.delete("^0-9").to_i

      if first_count > second_count
        teams[get_index(teams, first_team)][:result] += 3
      elsif first_count < second_count
        teams[get_index(teams, second_team)][:result] += 3
      else
        teams[get_index(teams, first_team)][:result] += 1
        teams[get_index(teams, second_team)][:result] += 1
      end
    end
  end

  # Method of displaying and sorting commands by rating
  def sort_and_print(arr)
    arr.sort! { |x, y| x[:result] <=> y[:result] }.reverse!
    arr.each do |item|
      puts "#{item[:title]}, #{item[:result]} #{item[:result] == 1 ? "pt" : "pts"}"
    end
  end

  def calculate_and_show
    # Reading data from a file
    results = init_file(@file_path)
    # Pairing games
    pairs = results.map do |pair|
      pair.split(", ")
      pair.tr("^A-Za-z, 0-9", "").split(", ")
    end
    # Preparing an array with fields command and result of games
    arr = results.map { |team| "#{team}" }.join(",").tr("^A-Za-z, ", "").split(",").map(&:strip).uniq
    teams_array = arr.map do |title|
      { title: title, result: 0 }
    end
    # Working with results
    count_result(pairs, teams_array)
    sort_and_print(teams_array)
  end
end

seria_a_results = SoccerResults.new(FILE_PATH_SOCCER)
seria_a_results.calculate_and_show
