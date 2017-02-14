require_relative "Board"

class Board_Manager
	def initialize(size,sym_a,sym_b)
		@Board=Board.new(size,sym_a,sym_b)
	end

	def perform(x,y,sym)
		pos=(@Board.size*(y-1)+x)-1
		@Board.elements[pos]=sym
		@Board.display()
		if(Board_Manager.wincheck(sym,@Board.size,@Board.elements)==1)
			return 1
		elsif(Board_Manager.drawcheck(@Board.size,@Board.elements)==1)
			return 2
		else
			return 0
		end

	end

	def elecheck(x,y)
		if(x>@Board.size||y>@Board.size)
			puts "Coordinates Invalid, please enter new coordinates"
			return 1
		end
		pos=(@Board.size*(y-1)+x)-1
		if(@Board.elements[pos]==nil)
			return 0
		else
			puts "Space already occupied, please enter new coordinates"
			return 1
		end
	end

	def self.wincheck(sym,size,elements)
		pos=0
		count=0
	    for i in 0..(size-1) #Diagonal1 Check
	    	if(elements[pos]==sym)
	    		pos=pos+size+1
	    		count=count+1
	    	else
	    		break
	    	end
	    end
	    if(count==size)
	    	return 1
	    end

		for i in 0..(size-1) #Column Check
			pos=i
			count=0
			for j in 0..(size-1)
				if(elements[pos]==sym)
					count=count+1
					pos=pos+size
				else
					break
				end
			end
			if(count==size)
				return 1
			else
				next
			end
		end

		for i in 0..size-1#Row Check
			pos=size*i
			count=0
			for j in 0..(size-1)
				if(elements[pos]==sym)
					count=count+1
					pos=pos+1
				else
					break
				end
			end
			if(count==size)
				return 1
			else
				next
			end
		end

		pos=size-1
		count=0
		for j in 0..(size-1)
			if(elements[pos]==sym)
				count=count+1
				pos=pos+size-1
			else
				break
			end
		end
		if(count==size)
			return 1
		end
		return 0

	end

	def self.drawcheck(size,elements)
		for pos in 0..size*size-1
			if(elements[pos]==nil)
				return 0
			end
		end
		return 1
	end


end

