require 'curses'
include Curses

# class Array_2D
# 	def initialize(width,height)
# 		@data = Array.new(width){Array.new(height)}
# 	end

# 	def [](x,y)
# 		@data[x][y]
# 	end

# 	def []=(x,y,value)
# 		@data[x][y] = value
# 	end
# end

init_screen()
start_color()
cbreak()
curs_set(0)
noecho
stdscr.keypad(true)

char_x = 1
char_y = 1

map_width = 20
map_height = 20

game_map = Array.new(map_width) {Array.new(map_height){2}}

while true

	case Curses.getch()
	when Curses::Key::DOWN
		if char_y < map_height-1
			char_y += 1
		else
			char_y = 0
		end
	when Curses::Key::RIGHT
		if char_x < map_width-1
			char_x += 1
		else
			char_x = 0
		end
	when Curses::Key::LEFT
		if char_x > 0
			char_x -= 1
		else
			char_x = map_width-1
		end
	when Curses::Key::UP
		if char_y > 0
			char_y -= 1
		else
			char_y = map_height-1
		end
	end

	for x_iter in 0...map_width
		for y_iter in 0...map_height
			setpos(y_iter,x_iter)
			if game_map[x_iter][y_iter] == 1
				addstr("#")
			elsif game_map[x_iter][y_iter] == 2
				addstr(".")
			end
		end
	end

	deleteln()
	setpos(char_y, char_x)
	addstr("@")

	doupdate

end