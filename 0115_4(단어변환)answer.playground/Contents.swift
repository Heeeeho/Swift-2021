import Foundation

var min = 100
var count = 0

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    count = words.count
    DFS(begin, 0, 0, target, words, begin.count)
    return min == 100 ? 0 : min
}

func DFS(_ str:String, _ idx:Int, _ step:Int, _ target:String, _ words:[String], _ wCount:Int) {
    if str == target {
        if step < min {
            min = step
        }
        return
    }
    if idx == count { return }
    
    var flag = false
    
    for i in 0..<wCount {
        if words[idx].contains(Array(target)[i]) && Array(str)[i] != Array(target)[i] {
            flag = true
            var tmpStr = str
            let index = tmpStr.index(tmpStr.startIndex, offsetBy: i)
            tmpStr.remove(at: index)
            tmpStr.insert(Array(target)[i], at: index)
            print("\(idx): \(str) -> \(Array(target)[i]) = \(tmpStr)")
            DFS(tmpStr, idx + 1, step + 1, target, words, wCount)
        }
    }
    if !flag {
        DFS(str, idx + 1, step, target, words, wCount)
    }
}

solution("hit", "wow", ["hot", "dog", "dot","wow"])
//solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
