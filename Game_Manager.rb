require_relative "Player"
require_relative "Board_Manager"
puts "Welcome to game of Tic-Tac-Toe"
i=1
while i==1
	puts "Enter name for Player 1"
	name1= gets.chomp
	puts "Enter symbol for Player 1"
	symbol1= gets.chomp
	player1=Player.new(name1,symbol1)
	puts "Enter name for Player 2"
	name2= gets.chomp
	puts "Enter symbol for Player 2"
	k=0
	while k==0
		symbol2=gets.chomp
		if(symbol2==symbol1)
			puts "Please select another sybmol"
			next
		end
		k=1
	end	
	player2=Player.new(name2,symbol2)
	puts "What size of board would you like to have"
	size= gets.chomp.to_i
	BoardManager= Board_Manager.new(size,symbol1,symbol2)
	puts "Lets start the game"
	puts "Lets toss for who will get the first chance"
	puts "#{player1.name}, please choose heads(h) or tails(t)"
	coin= gets
	chance=0
	if(coin=="h")
		num=1+Random.rand(2)
		if(num==1)
			puts "#{player1.name} won the toss!"
			chance=1
		else
			puts "#{player2.name} won the toss!"
			chance=2
		end
	else
		num=1+Random.rand(2)
		if(num==2)
			puts "#{player1.name} won the toss!"
			chance=1
		else
			puts "#{player2.name} won the toss!"
			chance=2
		end
	end
	j=1
	while j==1
		if(chance==1)
			puts "#{player1.name}'s turn, Enter coordinates"
			occup=1
			while occup==1
				print "x: "
				x=gets.chomp.to_i
				print "y: "
				y=gets.chomp.to_i
				if(BoardManager.elecheck(x,y)==1)
					occup=1
				else
					occup=0
				end
			end
			z=BoardManager.perform(x,y,player1.symbol)
			if(z==0)
				puts "Chance successfully played"
				chance=2
			elsif(z==1)
				puts "#{player1.name} won"
				j=0
			elsif (z==2)
				puts "Game tied"
				j=0
			end
		elsif (chance==2)
			puts "#{player2.name}'s turn, Enter coordinates"
			occup=1
			while occup==1
				print "x: "
				x=gets.chomp.to_i
				print "y: "
				y=gets.chomp.to_i
				if(BoardManager.elecheck(x,y)==1)
					occup=1
				else
					occup=0
				end
			end
			z=BoardManager.perform(x,y,player2.symbol)
			if(z==0)
				puts "Chance successfully played"
				chance=1
			elsif(z==1)
				puts "#{player2.name} won"
				j=0
			elsif (z==2)
				puts "Game tied"
				j=0
			end 		     	 

		end

	end
	puts "Want to play again(y/n)"
	ans=gets.chomp
	if(ans=="y")
		next
	elsif(ans=="n")
		i=0
	end
end