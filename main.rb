require_relative 'arena'

def main

	arena = Arena.new

	while (arena.getFighterCount > 1)
		arena.battleStep
	end

	puts "Today's champion is ... " + arena.getChampion
end

main






