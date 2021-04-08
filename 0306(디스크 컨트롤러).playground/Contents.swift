import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    
    let jCount = jobs.count
    var jobs = jobs.sorted{
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }
    var time = 0
    var avrT = 0
    
    for _ in 0..<jCount {
        var minIdx = 0
        var minValue = 0.0
        for i in 0..<jobs.count {
            guard jobs[i][0] <= time else { break }
            let idx1 = jobs[i][0]
            let idx2 = jobs[i][1]
            
            let waitT = time - jobs[i][0]
            let serviceT = idx2 - idx1
            let Oop = Double(Double(waitT + serviceT) / Double(serviceT))
            
            if minValue < Oop {
                minIdx = i
                minValue = Oop
            }
        }
        print(jobs[minIdx][0], jobs[minIdx][1])
        
        time += jobs[minIdx][1]
        avrT += time - jobs[minIdx][0]
        jobs.remove(at: minIdx)
    }
    
    return avrT / jCount
}

solution([[0, 3], [1, 9], [2, 6]])
