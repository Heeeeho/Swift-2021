import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var ans = 0
    let jCount = jobs.count
    var time = 0
    var sortJob = jobs.sorted{
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }
    
    for _ in 0..<jCount {
        var index = 0
        var min = 1001

        for i in 0..<sortJob.count {
            if sortJob[i][0] <= time {
                if sortJob[i][1] < min {
                    index = i
                    min = sortJob[i][1]
                }
            } else {
                break
            }
        }
        if min == 1001 {
            time = sortJob[index][0]
            min = sortJob[index][1]
            ans += time - ans
        } else {
            time += min
        }
        
//        print("idx = \(index) , \(min)")
        
//        time = min
        ans += time - sortJob[index][0]
        
        let idx = sortJob.index(sortJob.startIndex, offsetBy: index)
        sortJob.remove(at: idx)
    }
    
    
    return ans / jCount
}


////solution([[0, 3], [1, 9], [2, 6]])
//print(1,solution([[0, 10], [2, 10], [9, 10], [15, 2]]), 14)
//print(2,solution([[0, 10], [2, 12], [9, 19], [15, 17]]), 25)
//print(3,solution([[0, 3], [1, 9], [2, 6]]), 9)
//print(4,solution([[0, 1]]), 1)
//print(5,solution([[1000, 1000]]), 1000)
//print(6,solution([[0, 1], [0, 1], [0, 1]]), 2)
//print(7,solution([[0, 1], [0, 1], [0, 1], [0, 1]]), 2)
//print(8,solution([[0, 1], [1000, 1000]]), 500)
//print(9,solution([[100, 100], [1000, 1000]]), 500)
//print(10,solution([[10, 10], [30, 10], [50, 2], [51, 2]]), 6)
//print(11,solution([[0, 3], [1, 9], [2, 6], [30, 3]]), 7)
//print(12,solution([[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]]),72)

print(10,solution([[10, 10], [30, 10], [50, 2], [51, 2]]), 6)
