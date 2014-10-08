require_relative 'fighter'
require_relative 'rogue'

class Arena 
	@@intro = "Welcome to the arena where brave gladiators will fight for glory and power."
	@@names = Array[ "Korgath", "Lional", "Darius", "Sion", "Hercules", "Odin", "Thor", "Zeus", "Ares"]

private 

	def createAllFighters(count)
		for i in 0..count
			fighter = Fighter.new(@@names[Random.new.rand(0..(@@names.length-1))], 100, 12);
			@fighterArr << fighter
		end
	end

	def throwInARogue
		newRogue = Rogue.new("Rouge", 70, 22)
		@fighterArr << newRogue
	end

public

	def initialize
		@random = Random.new
		@fighterArr = Array.new
		fighterCount = @random.rand(2..4)

		puts "Fighter count " + fighterCount.to_s
		puts @intro

		createAllFighters(fighterCount)

		puts "Coming onto the stage ... "
		for i in 0..fighterCount	
			 puts @fighterArr[i].name + " "
		end

		throwInARogue
		puts "A rogue has entered the arena!"
	end

	def battleStep
		fighterEnd = @fighterArr.length - 1
		fighterA = @fighterArr[@random.rand(0..fighterEnd)];
		fighterB = @fighterArr[@random.rand(0..fighterEnd)];

		while(fighterA == fighterB) do
			fighterB = @fighterArr[@random.rand(0..fighterEnd)];
		end

		fighterA.fight(fighterB)
		if(fighterB.health <= 0) 
			@fighterArr.delete(fighterB)
			puts "===================================="
			puts  fighterB.name + " has been slain"
			puts "===================================="

		end
	end

	def battleToTheDeath
		while(@fighterArr.length > 1) do	# only one can survive ...
			battleStep
		end
		puts "Today's champion is ... " + @fighterArr[0].name
	end

#accessors
	def getFighterCount
		return @fighterArr.length
	end

	def getChampion
		if(@fighterArr.length > 1)
			 @fighterArr.each{ |temp| puts temp.name}
			return "Multiple combatants left. The battle continues!"
		else
			return @fighterArr[0].name
		end
	end
end