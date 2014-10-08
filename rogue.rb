class Rogue < Fighter
	def initialize(name, health, damage)
		super(name, health, damage)
	end

	def fight(target)
		target.health -= @damage;
		puts @name + " stabs " + target.name + " for " + @damage.to_s + " | Health left: " +  target.health.to_s
	end

end