import Foundation

var min = 9

func solution(_ N:Int, _ number:Int) -> Int {
    
    let Ncnt = String(number).count
    var nstr = "\(N)"
    
    for _ in 0..<Ncnt {
        DFS(0, Int(nstr)!, Ncnt, N, number)
        nstr += "\(N)"
    }
    
    return (min == 9) ? -1 : min
}

func compute( _ idx:Int, _ value:Int, _ N:Int) -> [Int] {
    var tmpValue:Int = 0
    var tmpCnt:Int = 0
    
    switch idx {
        case 0:
            tmpValue = value + N
            tmpCnt = 1
        case 1:
            tmpValue = value - N
            tmpCnt = 1
        case 2:
            tmpValue = value * N
            tmpCnt = 1
        case 3:
            tmpValue = value / N
            tmpCnt = 1
        case 4:
            tmpValue = value + 1
            tmpCnt = 2
        default:
            break
    }
    return [tmpValue, tmpCnt]
}


func DFS( _ cnt:Int, _ value:Int, _ Ncnt:Int, _ N:Int, _ number:Int) {
    if cnt > 4 || value < 0 || String(value).count >= Ncnt { return }
    
    if value == number {
        if cnt < min {
            min = cnt
        }
        return
    }
    print(cnt,value)
    for i in 0..<5 {
        var nstr = "\(N)"
        for _ in 0..<Ncnt {
//            if value == 0 && i == 1 { continue }
//            if value == 0 && i == 2 { continue }
//            if value == 0 && i == 3 { continue }
            
            let arr = compute(i, value, Int(nstr)!)
            DFS(cnt + arr[1], arr[0], Ncnt, N, number)
            nstr += "\(N)"
        }
    }
    
}

solution(5, 12)
