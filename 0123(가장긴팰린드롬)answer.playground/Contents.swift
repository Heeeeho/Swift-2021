import Foundation

func solution(_ s:String) -> Int {
    let sCount = s.count
    
    if sCount == 1 { return 1 }
    
    let str = s.map{Character(String($0))}
    
    for i in (2...sCount).reversed() {
        for j in 0...sCount - i {
            if compare(j, i+j, str) {
                return i
            }
        }
    }
    
    return 1
}


func compare(_ start:Int, _ end:Int, _ str:[Character]) -> Bool {
    var s = start
    var e = end - 1
    
    while e - s >= 1 {
        if str[s] != str[e] {
            return false
        }
        s += 1
        e -= 1
    }
    return true
}

solution("abcdcba")
