import Foundation

func solution(_ board:[[Int]]) -> Int {
    let xy = [board[0].count, board.count]
    let square = xy.min()!


    for i in (1...square).reversed() {
        for y in 0...xy[1]-i {
            for x in 0...xy[0]-i {
                var flag = true
                for j in y..<y+i {
                    if board[j][x..<x+i].contains(0) {
                        flag = false
                        break
                    }
                }
                if flag == true {
                    return i*i
                }
            }
        }
    }

    return 1
}

solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])
