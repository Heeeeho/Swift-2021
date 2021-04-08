import Foundation

var setArr:Set<Int> = []

func DFS(_ num:String,_ idx:Int,_ str:String) {
    setArr.insert(Int(str)!)
    
    for i in 1..<num.count {
        if idx + i >= num.count { continue }
        DFS(num, idx + i, str + String(Array(num)[i+idx]))
    }
}

func solution(_ numbers:String) -> Int {
    var numbers = numbers
    
    for _ in 0..<numbers.count {
        DFS(numbers, 0, String(Array(numbers)[0]))
        let first = Array(numbers)[0]
        numbers.removeFirst()
        numbers.append(first)
    }
    print(setArr.sorted(by:<))
    print("-------")
    
    let setArrMax = setArr.max()!
    var bool:[Bool] = Array.init(repeating: true, count: setArrMax+1)
    bool[0] = false
    bool[1] = false
    
    for i in 2...setArrMax/2 {
        if bool[i] == false { continue }
        for j in stride(from: i*i, to: setArrMax+1, by: i) {
            bool[j] = false
        }
    }
    
    var ans = 0
    for i in 0..<setArr.count {
        if bool[Array(setArr)[i]] == true {
            print(Array(setArr)[i])
            ans += 1
        }
    }
    return ans
}


solution("1234")
