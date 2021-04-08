import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic:[String:Int] = [:]
    
    for i in 0..<clothes.count {
        let tmp = String(Array(Array(clothes)[i])[1])
        if dic[tmp] == nil {
            dic[tmp] = 1
        } else {
            let cnt = dic[tmp]!
            dic[tmp] = cnt + 1
        }
    }
    let cnt = dic.mapValues{$0}.values
    return cnt.map{$0+1}.reduce(1, *) - 1
}

solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
