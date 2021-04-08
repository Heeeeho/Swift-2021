import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var result:[Int] = []
    var infoArr:[[[Character]]] = []
    var infoInt:[Int] = []
    var queryArr:[[[Character]]] = []
    var queryInt:[Int] = []
    
    var c = 0
    for str in info {
        infoArr.append([])
        let s = str.components(separatedBy: " ")
        for i in 0..<4 {
            infoArr[c].append([])
//            infoArr[c][i].append(contentsOf: s[i].map{Character(String($0))})
            infoArr[c][i].append(Array(s[i])[0])
        }
        infoInt.append(Int(s.last!)!)
        c += 1
    }
    
    c = 0
    for str in query {
        var tmp:[String] = []
        queryArr.append([])
        tmp.append(contentsOf: str.components(separatedBy: " and "))
        for i in 0..<3 {
            queryArr[c].append([])
//            queryArr[c][i].append(contentsOf: tmp[i].map{Character(String($0))})
            queryArr[c][i].append(Array(tmp[i])[0])
        }
        tmp = tmp.last!.components(separatedBy: " ")
        
        queryArr[c].append([])
//        queryArr[c][3].append(contentsOf: tmp[0].map{Character(String($0))})
        queryArr[c][3].append(Array(tmp[0])[0])
        queryInt.append(Int(tmp[1])!)
        
        c += 1
    }
    
    let qCount = queryArr.count
    let iCount = infoArr.count
    for i in 0..<qCount {
        var sum = 0
        for j in 0..<iCount {
            var b = true
            for z in 0..<4 {
                guard queryArr[i][z][0] == infoArr[j][z][0] || queryArr[i][z][0] == "-" else {
                    b = false
                    break
                }
            }
            if b {
                if queryInt[i] <= infoInt[j] {
                    sum += 1
                }
            }
        }
        result.append(sum)
    }
    
    return result
}

solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])

/*
 
 import Foundation

 func solution(_ info:[String], _ query:[String]) -> [Int] {
     var infoArr:[[String]] = []
     var queryArr:[[String]] = []
     var result:[Int] = []
     
     var c = 0
     for str in info {
         infoArr.append([])
         infoArr[c].append(contentsOf: str.components(separatedBy: " "))
         c += 1
     }
     
     c = 0
     for str in query {
         var tmp:[String] = []
         queryArr.append([])
         tmp.append(contentsOf: str.components(separatedBy: " and "))
         queryArr[c].append(contentsOf: tmp[0..<3])
         queryArr[c].append(contentsOf: tmp.last!.components(separatedBy: " "))
         c += 1
     }
     
     let qCount = queryArr.count
     let iCount = infoArr.count
     for i in 0..<qCount {
         var sum = 0
         for j in 0..<iCount {
             var b = true
             for z in 0..<4 {
                 guard queryArr[i][z] == infoArr[j][z] || queryArr[i][z] == "-" else {
                     b = false
                     break
                 }
             }
             if b {
                 if Int(queryArr[i][4])! <= Int(infoArr[j][4])! {
                     sum += 1
                 }
             }
         }
         result.append(sum)
     }
     
     return result
 }
 */
