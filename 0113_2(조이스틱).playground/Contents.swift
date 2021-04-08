import Foundation

func solution(_ name:String) -> Int {
    var ans = 0
    
    for i in 0..<name.count {
        let str = String(Array(name)[i])
        let idx = Int(UnicodeScalar(str)!.value)
        
        if idx <= 78 {
            ans += idx - 65
        } else {
            ans += 91 - idx
        }
    }
    
    var min = name.count - 1
    
    for i in 0..<name.count {
        if Array(name)[i+1] == "A" {
            var tmpCnt = i//+i+1
            
            for j in (i+1..<name.count).reversed() {
                
            }
        }
    }
    
    return 0
}

func solution2(_ name:String) -> Int {
    var answer = 0
    var start = 0
    var zero = [[Int]]()
    let n = name.utf8.map{$0-64}
    for i in 0..<n.count{
        if n[i] < 15 {
                answer += Int(n[i]) - 1
        }else{
            answer += 27 - Int(n[i])
        }
    }
    print(n)
    
    if name.contains("A"){
        if name == "A" {
            return 0
        }
    for i in 0..<n.count{
        if n[i] == 1 && i > 0{
            if start == 0 {
            start = i+1
            }
        }else{
            if start != 0 {
                zero.append([start,i])
                start = 0
            }else{
                continue
            }
        }
    }
        print(<#T##items: Any...##Any#>)
        return 0
    if start != 0 {
        zero.append([start,name.count])
    }
    let max = zero.map{$0.reduce(0){$1-$0}}
    for i in 0...max.count-1{
        if max[i] == max.max(){
            if zero[i][0] == 2 {
               answer += n.count - zero[i][1]
                break
            }else if zero[i][1] == n.count{
                answer += zero[i][0] - 2
 
            }else{
                let middleanswer = answer + name.count - 1
                if zero[i][0]-1 > name.count - zero[i][1]{
                    answer += (name.count - zero[i][1]) * 2 + zero[i][0] - 2
                }else{
                    answer += (zero[i][0] - 2) * 2 + name.count - zero[i][1]
                }
 
                if answer > middleanswer {
                    return middleanswer
                }
            }
 
        }
    }
        return answer
    }else{
        return answer + name.count-1
    }
}

solution2("JAN")

