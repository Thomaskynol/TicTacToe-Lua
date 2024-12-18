-- Tic-Tac-Toe Game in Lua

-- Initialize the board
local board = {{" ", " ", " "}, {" ", " ", " "}, {" ", " ", " "}}

-- Function to print the board
local function printBoard(b)
    for i = 1, #b do
        for j = 1, #b[i] do
            io.write(b[i][j])
            if j < #b[i] then io.write(" | ") end
        end
        if i < #b then print("\n---------") end
    end
    print("\n")
end

-- Function to check for a win
local function checkWin(b)
    -- Check rows, columns, and diagonals
    for i = 1, 3 do
        if b[i][1] == b[i][2] and b[i][2] == b[i][3] and b[i][1] ~= " " then return b[i][1] end
        if b[1][i] == b[2][i] and b[2][i] == b[3][i] and b[1][i] ~= " " then return b[1][i] end
    end
    if b[1][1] == b[2][2] and b[2][2] == b[3][3] and b[1][1] ~= " " then return b[1][1] end
    if b[1][3] == b[2][2] and b[2][2] == b[3][1] and b[1][3] ~= " " then return b[1][3] end
    return nil
end

-- Main game loop
local player = "X"
while true do
    printBoard(board)
    print("Player " .. player .. "'s turn.")
    print("Enter row and column (1-3):")
    local row, col = io.read("*n", "*n")
    if board[row][col] == " " then
        board[row][col] = player
        if checkWin(board) then
            printBoard(board)
            print("Player " .. player .. " wins!")
            break
        end
        player = player == "X" and "O" or "X"
    else
        print("That space is already taken!")
    end
end
