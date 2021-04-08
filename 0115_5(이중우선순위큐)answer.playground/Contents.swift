import Foundation

func solution(_ operations:[String]) -> [Int] {
    var arr:[Int] = []
    
    for i in 0..<operations.count {
        if operations[i] == "D 1" {
            if arr.isEmpty { continue }
            let max = Int(arr.max()!)
            for j in 0..<arr.count {
                if arr[j] == max {
                    let idx = arr.index(arr.startIndex, offsetBy: j)
                    arr.remove(at: idx)
                    break
                }
            }
        } else if operations[i] == "D -1" {
            if arr.isEmpty { continue }
            let min = Int(arr.min()!)
            for j in 0..<arr.count {
                if arr[j] == min {
                    let idx = arr.index(arr.startIndex, offsetBy: j)
                    arr.remove(at: idx)
                    break
                }
            }
        } else {
            let idx = Array(operations[i])[2..<operations[i].count]
            arr.append(Int(String(idx))!)
        }
    }
    if arr.isEmpty {
        return [0,0]
    } else {
        return [arr.max()!,arr.min()!]
    }
}

solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])
//solution(["I 7","I 5","I -5","D -1"])
//solution(["I 16","D 1"])
