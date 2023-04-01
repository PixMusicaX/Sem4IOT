def print_board(board):
    for row in board:
        print(" ".join(row))
 
def is_valid(board, row, col, N):
    # Check this row on left side
    for i in range(col):
        if board[row][i] == "Q":
            return False
 
    # Check upper diagonal on left side
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j] == "Q":
            return False
 
    # Check lower diagonal on left side
    for i, j in zip(range(row, N), range(col, -1, -1)):
        if board[i][j] == "Q":
            return False
 
    return True
 
def solve(board, col, N):
    if col >= N:
        return True
 
    for i in range(N):
        if is_valid(board, i, col, N):
            board[i][col] = "Q"
            if solve(board, col + 1, N):
                return True
            board[i][col] = "-"
 
    return False
 
def n_queens(N):
    board = [["-" for _ in range(N)] for _ in range(N)]
 
    if not solve(board, 0, N):
        print("No solution exists")
        return False
 
    print_board(board)
    return True

N = int(input("Enter number of queens: "))
print(f"\nN Queens Problem Using Backtracking ({N} queens):\n")
n_queens(N)