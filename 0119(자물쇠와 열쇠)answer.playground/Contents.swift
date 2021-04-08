import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let lCount = lock.count
    let kCount = key.count
    let tmplock = InitLock(lCount, lock)
    
    var keyPointArr:[[Int]] = []
    var lockPointArr:[[Int]] = []
    var keyFlag = false
    var lockFlag = false
    
    for y in 0..<kCount {
        for x in 0..<kCount {
            if key[y][x] == 1 {
                if !keyFlag { keyFlag = true }
                keyPointArr.append([y,x])
            }
        }
    }
    
    for y in 0..<lCount {
        for x in 0..<lCount {
            if lock[y][x] == 0 {
                if !lockFlag { lockFlag = true }
                lockPointArr.append([y + lCount,x + lCount])
            }
        }
    }
    
    if !lockFlag { return true }
    if !keyFlag && lockFlag { return false }
    if keyPointArr.count < lockPointArr.count { return false }
    
    for loop in 0..<4 {
        for i in 0..<lockPointArr.count {
            for j in 0..<keyPointArr.count {
                let y = lockPointArr[i][0] - keyPointArr[j][0]
                let x = lockPointArr[i][1] - keyPointArr[j][1]
                
                var flag = true
                var pass = 1
                
                for z in 0..<keyPointArr.count {
                    if j == z { continue }
                    
                    let y1 = keyPointArr[z][0] + y
                    let x1 = keyPointArr[z][1] + x
                    
                    if tmplock[y1][x1] == 1{
                        flag = false
                        break
                    } else if tmplock[y1][x1] == 0 {
                        pass += 1
                    }
                }
                if flag == true && pass == lockPointArr.count {
                    return true
                }
            }
        }
        
        if loop == 3 { break }
        
        var tmpKeyPointArr:[[Int]] = []
        for r in 0..<keyPointArr.count {
            let arr = rotate(keyPointArr[r][0], keyPointArr[r][1], kCount)
            tmpKeyPointArr.append([arr[0],arr[1]])
        }
        keyPointArr = tmpKeyPointArr
    }
    return false
}

func InitLock(_ lCount:Int, _ lock:[[Int]]) -> [[Int]] {
    var arr:[[Int]] = Array.init(repeating: Array.init(repeating: -1, count: lCount * 3), count: lCount * 3)
    
    for y in 0..<lCount {
        for x in 0..<lCount {
            arr[y+lCount][x+lCount] = lock[y][x]
        }
    }
    
    return arr
}

func rotate(_ y:Int, _ x:Int, _ kCount:Int) -> [Int] {
    let yy = x
    let xx = kCount - 1 - y
    
    return [yy , xx]
}


//solution([[1,1],[1,0]], [[1, 1, 1], [1, 1, 1], [1, 0, 0]])
solution([[0, 1, 0], [0, 1, 1], [0, 0, 1]],
         [[1, 1, 1, 1, 1], [1, 1, 0, 0, 1],[1, 0, 0, 1, 1],[1, 1, 1, 1, 1],[1, 1, 1, 1, 1]])
//solution([[1]], [[1, 1],[1, 1]])



//InitLock(4, [[1, 1, 1, 1], [1, 1, 1, 1], [1, 0, 0, 1], [1, 0, 0, 1]])
