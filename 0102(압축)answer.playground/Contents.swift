import Foundation

func solution(_ msg:String) -> [Int] {
    var ans:[Int] = []
    var dic:[[String:Int]] = [[:]]
    
    for i in 0..<26 {
        if let idx = UnicodeScalar(i+65) {
            dic[0][String(idx)] = i+1
        }
    }
    
    var idx = 0
    var addCnt = 27
    var flag = false
    
    while true {
        var w = ""
        var prnt = 0
        var str = ""
        for i in idx..<dic.count+idx {
            if i == msg.count { break }
            str += String(Array(msg)[i])
        }
        
        for i in (0..<str.count).reversed() {    //현재입력(w) 골라내기
            if let tmp = dic[i][str] {
                prnt = tmp
                w = str
                if idx + i+1 == msg.count {
                    flag = true
                    break
                }
                break
            }
            str.removeLast()
        }
        
        ans.append(prnt)
        if flag { break }
        
        let wc = "\(w)\(String(Array(msg)[idx+w.count]))"
        if  wc.count > dic.count {
            dic.append([:])
        }
        
        if dic[wc.count-1][wc] == nil {
            dic[wc.count-1][wc] = addCnt
            addCnt += 1
        }
        idx += w.count
    }
    
    return ans
}

print(solution("ABABABABABABABAB"))


/*
 
 for i in 0..<dic.count {    //현재입력(w) 골라내기
     var str = ""
     
     for j in idx..<idx+i+1 {
         str += String(Array(msg)[j])
     }
     if let tmp = dic[i][str] {
         prnt = tmp
         w = str
         if idx + i+1 == msg.count {
             flag = true
             break
         }
     }
 }
 */

//var a:[[String:Int]] = [[:]]

//a[0]["as"] = 1
//
//if let b = a[0]["asd"] {
//    print("as")
//}

//func solution(_ msg:String) -> [Int] {
//    var dic:[[String:Int]] = [[:]]
//
//    for i in 0..<26 {
//        if let idx = UnicodeScalar(i+65) {
//            dic[0][String(idx)] = i+1
//        }
//    }
//
//    print(dic)
//
//    return []
//}
//
//solution("a")
//
//var a:[[String:Int]] = [[:]]
//var b:[String:Int] = [:]
//
//b["ab"] = 2
//b["ab"]
//a[0]["abc"] = 2
//a[0]["abcd"] = 3
//a.append([:])
//a[1]["aa"]
//a[1]["aa"] = 1
//a.count
