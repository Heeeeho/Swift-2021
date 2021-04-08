import Foundation

func Max(_ start:Int,_ end:Int,_ number:String) -> [Int] {
    var max:Int = 0
    var index = end
    
    for i in start...end {
        let str = Int(String(Array(number)[i]))!
        if str > max {
            index = i
            max = str
        }
    }
    return [max,index]
}

    
func solution(_ number:String, _ k:Int) -> String {
    var k = k
    var arr:String = ""
    var start = 0
    var end = k
    
    while k > 0 {
        let idx = Max(start, end, number)
        arr += String(idx[0])
        k -= idx[1] - start
        
        start = idx[1] + 1
        end = start + k
        if number.count - start == k {
            return arr
        }
//        print(arr,k,start,end)
    }
    
    arr += Array(number)[start..<number.count]
    
    return arr
}
let a = "11559791"
solution(a, 5)





//func solution2(_ number:String, _ k:Int) -> String {
//    var num = number
//
//    for _ in 0..<k {
//        for j in 0..<num.count - 1 {
//            if Array(num)[j] < Array(num)[j+1] {
//                let idx = num.index(num.startIndex, offsetBy: j)
//                num.remove(at: idx)
//                break
//            }
//
//        }
//    }
//
//    return num
//}

//solution2(a, 5)






//func solution(_ number:String, _ k:Int) -> String {
//    var k = k
//    var arr:String = ""
//    var start = 0
//    var end = k
//
//    while k > 0 {
//        let idx = Max(start, end, number)
//        arr += String(idx[0])
//        k -= idx[1] - start
//
//        start = idx[1] + 1
//        end = number.count - 1
//        if number.count - start == k {
//            return arr
//        }
//    }
//
//    arr += Array(number)[start..<number.count]
//
//    return arr
//}
