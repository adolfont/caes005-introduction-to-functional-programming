-- Solution for the Eight Queens Problem
-- Adapted from Roberto Ierusalimchy's Programming in Lua, Fourth Edition https://amzn.to/3CccLTZ

N = 8 -- board size

-- check whether position (line, column) is free from attacks
local function is_place_ok(board, line, column)
    for i = 1, line - 1 do                       -- for each queen already placed
        if (board[i] == column) or               -- same column?
            (board[i] - i == column - line) or   -- same diagonal?
            (board[i] + i == column + line) then -- same diagonal?
            return false                         -- place can be attacked
        end
    end
    return true -- no attacks; place is OK
end

local function print_board(board)
    for i = 1, N do     -- for each row
        for j = 1, N do -- and for each column
            -- write "X" or "-" plus a space
            io.write(board[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

local function add_queen(board, line) 
    if line > N then -- all queens have been placed?
        print_board(board) 
    else -- try to place line-th queen
        for column = 1, N do
            if is_place_ok(board, line, column) then
                board[line] = column -- place line-th queen at 'column'
                add_queen(board, line + 1)
                board[line] = nil -- backtrack: remove queen
            end
        end
    end   
end

-- run the program
add_queen({}, 1)
