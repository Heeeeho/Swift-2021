import Foundation

func solution(_ n:Int) -> Int
{
    var idx = n+1
    let ncount = String(n,radix: 2).map{$0}.filter{$0 == "1"}.count
    
    while true {
        let scount = String(idx,radix: 2).map{$0}.filter{$0 == "1"}.count
        if ncount == scount {
            return idx
        }
        idx += 1
    }
}

solution(78)




