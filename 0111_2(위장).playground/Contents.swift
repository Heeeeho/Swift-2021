import Foundation

var ans = 0

func DFS(_ clothes:[[String]],_ idx:Int,_ type:[String]) {
    
    for i in 1..<clothes.count {
        if idx + i >= clothes.count { break }
        let tmp = Array(Array(clothes)[idx])[1]
        if !type.contains(tmp) {
            var type = type
            type.append(tmp)
            ans += 1
            DFS(clothes, idx + i, type)
        }
    }
    
}

func solution(_ clothes:[[String]]) -> Int {
    for i in 0..<clothes.count {
        ans += 1
        DFS(clothes, 0, [Array(Array(clothes[i]))[1]])
    }
    
    return ans
}

solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
