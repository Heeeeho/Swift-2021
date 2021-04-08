import Foundation

func buildArray(_ target: [Int], _ n: Int) -> [String] {
    var ans:[String] = []
    var idx = 0
    let tCount = target.count
    for i in 1...n {
        if target[idx] == i {
            ans.append("Push")
            idx += 1
            if idx == tCount {
                break
            }
        } else {
            ans.append("Push")
            ans.append("Pop")
        }
    }
    return ans
}

buildArray([1,3], 3)
