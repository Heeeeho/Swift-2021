import Foundation

var arr:[[Int]] = []
var sheet:[[Int]] = []

func Init() {
    //[1] =  Y [2] = X
    sheet[0][0] = 2
    sheet[0][1] = 1
    sheet[0][2] = 1
    
    sheet[1][0] = 3
    sheet[1][1] = 1
    sheet[1][2] = 2
    
    sheet[2][0] = 1
    sheet[2][1] = 2
    sheet[2][2] = 2
    
    sheet[2][0] = 2
    sheet[2][1] = 3
    sheet[2][2] = 1
}

func Incheck(_ puck_c:[[Int]], _ sheet_c:[Int]) -> Bool {
    for i in 1...2 {
        let py = abs(puck_c[0][0] - puck_c[i][0])
        let px = abs(puck_c[0][1] - puck_c[i][1])
        let pRoot = sqrt(Double(py * py + px * px))
        let pCos = Double(py) / pRoot
        
        let sy = abs(puck_c[0][0] - sheet_c[0])
        let sx = abs(puck_c[0][1] - sheet_c[1])
        let sRoot = sqrt(Double(sy * sy + sx * sx))
        let sCos = Double(sy) / sRoot
        
        if i == 1 {
            if sCos <= pCos { return false }
        } else {
            if sCos >= pCos { return false }
        }
    }
    return true
}

func checkTriangle(_ Pn:[Int],_ t1:[Int],_ t2:[Int],_ t3:[Int]) -> Bool{
    for i in 0..<Pn.count {
        let l1 = (sheet[Pn[i]][1] - t1[1]) * (t3[0] - t1[0]) - (t3[1] - t1[1]) * (sheet[Pn[i]][0] - t1[0])
        let l2 = (sheet[Pn[i]][1] - t2[1]) * (t1[0] - t2[0]) - (t1[1] - t2[1]) * (sheet[Pn[i]][0] - t2[0])
        let l3 = (sheet[Pn[i]][1] - t3[1]) * (t2[0] - t3[0]) - (t2[1] - t3[1]) * (sheet[Pn[i]][0] - t3[0])
        guard (l1 > 0 && l2 > 0 && l3 > 0) || (l1 < 0 && l2 < 0 && l3 < 0) else{ return false }
    }
    return true
}

//func XYconvert(_ y:Int, _ x:Int) -> Int {
//    return y*5 + x
//}
//
//func DIRconvert(_ array:[Int]) -> [Int] {
//    var sArr:[Int] = []
//
//    for i in 0..<3 {
//        sArr.append(XYconvert(sheet[array[i]][1], sheet[array[i]][2]))
//    }
//
//    return sArr
//}

func MakeTriangle(_ Pn:[Int], _ cnt:Int, _ tArr:[[Int]]) {
//    let dir:[Int] = [-6,-5,-4,-1,1,4,5,6]
//    let sArr = DIRconvert(Pn)
//
//    while true {
//        // 줄일부분
//        for i in 0..<8 {
//            for j in 0..<8 {
//                for z in 0..<8 {
//                    var pArr:[Int] = []
//                    pArr.append(sArr[0] - dir[i])
//                    pArr.append(sArr[1] - dir[j])
//                    pArr.append(sArr[2] - dir[z])
//                }
//            }
//        }
//
//
//        break //
//    }
    if cnt == 3 {
        if checkTriangle(Pn, tArr[0], tArr[1], tArr[2]) {
            
        } else {
            return
        }
    }
    let Dir:[Int] = [-1,0,1]
    
    for y in 0..<3 {
        let yy = sheet[Pn[cnt]][1] - Dir[y]
        for x in 0..<3 {
            let xx = sheet[Pn[cnt]][2] - Dir[x]
            var tA = tArr
            tA.append([yy,xx])
            
            MakeTriangle(Pn, cnt + 1,tA)
        }
    }
}

func MakeThreePoint() {
    for i in 0..<2 {
        for j in i+1..<3 {
            for z in j+1..<4 {
                let Pn = [i,j,z]
                MakeTriangle(Pn,0,[])
            }
        }
    }
}



func main() {
    arr = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    
}

Incheck([[1,4],[4,0],[3,3]], [2,4])
