class Board

	attr_accessor :elements,:size

	def initialize(size,sym_a,sym_b)
		@elements=[]
		@size=size
		@sym_a=sym_a
		@sym_b=sym_b
		for i in 1..@size
			for j in 1..@size+1
				print "| "
			end
			puts ""
		end
	end

	def display()
		k=0
		for i in 1..@size
			for j in 1..@size
				print "|"
				if(@elements[k]==@sym_a)
					print @sym_a
				elsif(@elements[k]==@sym_b)
					print @sym_b
				else
					print " "
				end
				k=k+1
			end
			print "|"
			puts ""
		end
	end

end