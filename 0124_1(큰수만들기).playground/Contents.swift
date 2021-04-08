import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var num = number.map{Character(String($0))}
    
    for _ in 0..<k {
        for j in 0..<num.count - 1 {
            if num[j] < num[j+1] {
                num.remove(at: j)
                break
            }
        }
    }
    
    return String(num)
}

solution("1924", 2)
