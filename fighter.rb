
class Fighter
	attr_accessor(:name, :health, :damage)
	def initialize(name, health, damage)
		@name = name;
		@health = health;
		@damage = damage;
	end

	def fight(target)
		target.health -= @damage;
		puts @name + " hits " + target.name + " for " + @damage.to_s + " | Health left: " +  target.health.to_s
	end
end
