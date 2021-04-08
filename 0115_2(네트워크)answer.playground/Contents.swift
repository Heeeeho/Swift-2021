import Foundation

var check:[[Bool]] = []

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var ans = 0
    check = Array.init(repeating:Array.init(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        if !check[i][i] {
            DFS(i, n, computers)
            ans += 1
        }
    }
    
    return ans
}

func DFS(_ idx:Int, _ n:Int, _ computers:[[Int]]) {
    
    for i in 0..<n {
        if idx == i {
            check[i][i] = true
            continue
        }
        if computers[idx][i] == 1{
            if computers[i][idx] == 1{
                if !check[idx][i] && !check[i][idx] {
                    check[idx][i] = true
                    check[i][idx] = true
                    DFS(i, n, computers)
                }
            }
        }
    }
}

solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])
