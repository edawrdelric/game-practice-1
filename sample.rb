require 'curses'
include Curses

class Array2D
	def init(width,height)
		@data = Array.new(width){Array.new(height)}
	end

	def [](x,y)
		@data[x][y]
	end

	def []=(x,y,value)
		@data[x][y] = value
	end
end

init_screen()
start_color()
cbreak()
curs_set(0)
noecho

char_x = 1
char_y = 1

map_width = 20
map_height = 20

map = Array2D.init(map_width,map_height)

while true

	keypress = getch()

	if keypress == "s"
		if char_y < map_height
			char_y += 1
		else
			char_y = 0
		end
	elsif keypress == "d"
		if char_x < map_width
			char_x += 1
		else
			char_x = 0
		end
	elsif keypress == "a"
		if char_x > 0
			char_x -= 1
		else
			char_x = map_width
		end
	elsif keypress == "w"
		if char_y > 0
			char_y -= 1
		else
			char_y = map_height
		end
	end

	map.each{|x|
		x.each{|y|
			setpos(y,x)
			if y == 1
				addstr("#")
			end
		}
	}

	deleteln()
	setpos(char_y, char_x)
	addstr("@")

	doupdate

end