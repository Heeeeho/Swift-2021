import Foundation

var ans:[String] = ["ICN"]
var tCount:Int!
var flag:Bool = false

func solution(_ tickets:[[String]]) -> [String] {
    let begin = "ICN"
    
    tCount = tickets.count
    navigate(begin, [], tickets)
    
    return ans
}

func navigate (_ begin:String,_ arr:[String], _ tickets:[[String]]) {
    var tmpArr:[Int:String] = [:]
    
    if flag { return }
    for i in 0..<tickets.count {
        if begin == tickets[i][0] {
            tmpArr[i] = tickets[i][1]
        }
    }
    
    if tickets.count == 1 && tmpArr.count == 1 {
        for i in 0..<arr.count {
            ans.append(arr[i])
        }
        ans.append(tickets[0][1])
        flag = true
    }
    let sortArr = tmpArr.sorted{
//        for i in 0...2 {
//            if Array($0.value)[i] == Array($1.value)[i] {
//                continue
//            }
//            return Array($0.value)[i] < Array($1.value)[i]
//        }
        return $0.value < $1.value
    }.map{$0.0}
    
    
    for i in 0..<sortArr.count {
        print("\(begin) : \(sortArr) -> \(tickets)")
        for j in 0..<tickets.count {
            var tickets = tickets
            if tickets[sortArr[i]][1] == tickets[j][0] {
                let value = tickets[sortArr[i]][1]
                let idx = tickets.index(tickets.startIndex, offsetBy: sortArr[i])
                var tArr = arr
                tickets.remove(at: idx)
                tArr.append(value)
                print(sortArr,tickets)
                navigate(value, tArr, tickets)
            }
        }
    }
}


//print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))

//print(solution([["ICN", "A"], ["ICN", "B"], ["B", "ICN"]]))
//print(solution([["ICN", "A"],["ICN", "A"],["ICN", "A"],["A", "ICN"],["A", "ICN"]] ))
print(solution([["ICN", "COO"], ["ICN", "BOO"], ["COO", "ICN"], ["BOO", "DOO"]]))



//    for _ in 0..<tCount {
//        var tmpArr:[Int:String] = [:]
//        for i in 0..<tickets.count {
//            if begin == tickets[i][0] {
//                tmpArr[i] = tickets[i][1]
//            }
//        }
//        let sortArr = tmpArr.sorted{
//            for i in 0...2 {
//                if Array($0.value)[i] == Array($1.value)[i] {
//                    continue
//                }
//                return Array($0.value)[i] < Array($1.value)[i]
//            }
//            return true
//        }.map{$0.0}
//
//        for i in 0..<sortArr.count {
//            var flag = false
//
//            for j in 0..<tickets.count {
//                if sortArr[i] == j { continue }
//                if tickets[sortArr[i]][1] == tickets[j][0] {
//                    let value = tickets[sortArr[i]][1]
//                    let idx = tickets.index(tickets.startIndex, offsetBy: sortArr[i])
//                    tickets.remove(at: idx)
//                    begin = value
//                    ans.append(value)
//                    flag = true
//                    break
//                }
//            }
//            if flag { break }
//        }
//    }
//    ans.append(tickets[0][1])
