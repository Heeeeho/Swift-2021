import Foundation

var cnt = 0

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    DFS(0, 0, [m - 1,n - 1])
    
    return cnt
}

func DFS(_ yPoint:Int, _ xPoint:Int, _ finish:[Int]) {
    
    if yPoint == finish[0] && xPoint == finish[1] {
        cnt += 1
        return
    }
    
    if yPoint + 1 <= finish[0] {
        DFS(yPoint+1, xPoint, finish)
    }
    if xPoint + 1 <= finish[1] {
        DFS(yPoint, xPoint + 1, finish)
    }
}


func uniquePaths1(_ m: Int, _ n: Int) -> Int {
    
    var arr:[Int] = Array.init(repeating: 1, count: m)
    
    for _ in 1..<n {
        for i in 1..<m {
            arr[i] += arr[i - 1]
        }
    }
    
    return arr[m - 1]
}

//uniquePaths1(3, 7)
