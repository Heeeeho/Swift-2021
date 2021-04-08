import Foundation

func solution(_ s:String) -> Int{
    var stack:[Character] = []
    
    for str in s {
        if stack.isEmpty {
            stack.append(str)
        } else {
            if str == stack.last {
                stack.removeLast()
            } else {
                stack.append(str)
            }
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

solution("baabaa")


// 1 9 ~ 13
// 0.44 0.03 0.58 0.04
