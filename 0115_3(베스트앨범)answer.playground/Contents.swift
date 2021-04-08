import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var ans:[Int] = []
    var dic:[String:[[Int:Int]]] = [:]
    var dicValue:[String:Int] = [:]
    
    for i in 0..<genres.count {
        if dic[genres[i]] == nil {
            dic[genres[i]] = [[plays[i]:i]]
            dicValue[genres[i]] = plays[i]
        } else {
            let tmp = dicValue[genres[i]]
            dicValue[genres[i]] = tmp! + plays[i]
            dic[genres[i]]?.append([plays[i]:i])
        }
    }
    
    let key = dicValue.sorted{$0.1 > $1.1}.map{ $0.0 }
    
    for str in key {
        let value = dic[str]!.sorted{
            if Array($0)[0].0 == Array($1)[0].0 {
                return Array($0)[0].1 < Array($1)[0].1
            } else {
                return Array($0)[0].0 > Array($1)[0].0
            }
        }.map{ Array($0)[0].1 }
        
        for i in 0..<value.count {
            ans.append(value[i])
            if i == 1 {
                break
            }
        }
    }
    
    return ans
}

solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])


