import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    func binarySearch(start: Int64, end: Int64) -> Int64 {
        if start > end { return -1 } // 잘못된 입력이 들어오면 -1 반환
        
        let mid = (start+end)/2
        let midSum = available(in: mid)
        print("mid:\(mid) midsum:\(midSum)")
        // midSum >= n 일 경우
        if midSum >= n {
            if available(in: mid-1) < n {
                print("return \(mid)")
                return mid
            }
            print("1")
            return binarySearch(start: 0, end: mid-1)
        }
        
        // midSum < n 일 경우
        if available(in: mid+1) >= n {
            return mid+1
        }
        print("2")
        return binarySearch(start: mid+1, end: end)
    }
    
    // minute분동안 입국심사를 완료할 수 있는 인원 수
    func available(in minute: Int64) -> Int64 {
        var sum: Int64 = 0
        for i in 0..<times.count {
            sum += minute/Int64(times[i])
        }
        return sum
    }
    
    let min = Int64(times.min()!)
    let max = Int64(n) * Int64(times.max()!)
    return binarySearch(start: min, end: max)
}

solution(6, [7,10])
