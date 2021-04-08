import Foundation

func solution(_ n:Int) -> Int {
    
    var ans:[Int64] = Array.init(repeating: 0, count: n + 1)
    
    ans[0] = 1
    ans[1] = 1
    
    if n > 1 {
        for i in 2...n {
            ans[i] = (ans[i - 1] % 1234567 + ans[i - 2] % 1234567) % 1234567
        }
    }
    
    return Int(ans[n])
}

solution(6)
