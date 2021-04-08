import Foundation

func solution(_ s:String) -> [Int] {
    var dic:[String:Int] = [:]
    var str = ""
    var key = true
    
    for idx in s {
        if idx == "{" {
            str = ""
            key = true
            continue
        } else if idx == "}" || idx == "," {
            if key == false { continue }
            
            if dic[str] == nil {
                dic[str] = 1
            } else {
                dic[str] = dic[str]! + 1
            }
            if idx == "," { key = true }
            else { key = false }
            str = ""
        } else {
            str += String(idx)
        }
    }
    
    return dic.sorted{ $0.1 > $1.1}.map{(key:String,value:Int) -> Int in Int(key)!}
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
