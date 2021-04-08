import Foundation

var arr:[String] = []

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var strArr:[[Character]] = []
    var result:[String] = []
    
    for str in orders {
        let tmpArr = str.map{Character(String($0))}.sorted{ $0 < $1 }
        strArr.append(tmpArr)
    }
    
    for cs in course {
        var dic:[String:Int] = [:]
        
        for str in strArr {
            let sCount = str.count
            if sCount < cs { continue }
            
            for i in 0...sCount - cs{
                DFS(1, i, String(str[i]), str, cs, sCount)
            }
        }
        
        for str in arr {
            if dic[str] == nil {
                dic[str] = 1
            } else {
                let idx = dic[str]!
                dic[str] = idx + 1
            }
        }
        
        let sortDic = dic.sorted{ $0.value > $1.value }
        let fvalue = sortDic.first?.value
        
        if fvalue != 1 {
            for D in sortDic {
                if fvalue == D.value {
                    result.append(D.key)
                }
            }
        }
        
        arr.removeAll()
    }
    
    return result.sorted{ $0 < $1 }
}

func DFS(_ cnt:Int, _ depth:Int, _ str:String, _ orders:[Character], _ course:Int, _ oCount:Int) {
    if cnt == course {
        arr.append(str)
        return
    }
    
    for i in 1..<oCount {
        if depth + i >= oCount { continue }
        DFS(cnt + 1, depth + i, str + String(orders[depth + i]), orders, course, oCount)
    }
}

solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
