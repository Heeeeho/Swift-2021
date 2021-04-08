//: [Previous](@previous)

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    let INF: Int = 987654321
    var answer = 0
    var matrix: [[Int]] = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

    for i in 0..<n {
        matrix[i][i] = 0
    }

    results.forEach{ result in
        matrix[result.first! - 1][result.last! - 1] = 1
    }
    
    for a in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = min(matrix[i][j], matrix[i][a] + matrix[a][j])
            }
        }
    }
    
    // 플로이드-와샬 알고리즘
    var flag = [Bool](repeating: true, count: n)
    for i in 0..<n {
        for j in 0..<n {
            if i == j { continue }
            if matrix[i][j] == INF {
                if matrix[j][i] == INF {
                    flag[i] = false
                    break
                }
            }
        }
    }
    
    for i in 0..<n {
        print(matrix[i])
    }
    print("------")
    print(flag)
    
    flag.forEach{ if $0 { answer += 1 } }

    return answer
}

solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])

//: [Next](@next)
