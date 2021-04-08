import Foundation

var eCount:Int!
//var maxDepth = 0
//var setArr:Set<Int> = []
var depthArr:[Int] = []

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    eCount = edge.count
    let checkArr = Array.init(repeating: false, count: eCount)
    depthArr = Array.init(repeating: -1, count: n + 1)
    
    DFS(0, 1, checkArr, edge)
    
    let max = depthArr.max()
    var cnt = 0
    
    for i in depthArr {
        if max == i { cnt += 1 }
    }
    
    print(depthArr)
    
    return cnt
}

func DFS(_ depth:Int, _ Index:Int, _ checkArr:[Bool], _ edge:[[Int]]) {
    
    if depthArr[Index] == -1 {
        depthArr[Index] = depth
    } else if depthArr[Index] > depth {
        depthArr[Index] = depth
    }
    
    for i in 0..<eCount {
        if !checkArr[i] && (Index == edge[i][0] || Index == edge[i][1]) {
            var tmpcheckArr = checkArr
            var tmpIndex = 0
            if Index == edge[i][0] { tmpIndex = edge[i][1]}
            else { tmpIndex = edge[i][0] }
            
            tmpcheckArr[i] = true
            
            print("dep:\(depth), Idx:\(Index), ch:\(tmpcheckArr)")
            DFS(depth + 1, tmpIndex, tmpcheckArr, edge)
        }
    }
    
//    if maxDepth < depth {
//        setArr.removeAll()
//        setArr.insert(Index)
//        maxDepth = depth
//    } else if maxDepth == depth {
//        setArr.insert(Index)
//    }
}

solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])

