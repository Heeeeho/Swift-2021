import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id
    
    if !id.isEmpty {
        id = id.lowercased()
        
        var idx = 0
        while idx < id.count {
            let value = UnicodeScalar(String(Array(id)[idx]))!.value
            
            if (value >= 97 && value <= 122) || (value >= 48 && value <= 57) || value == 45 || value == 46 || value == 95 {
                idx += 1
            } else {
                let index = id.index(id.startIndex, offsetBy: idx)
                id.remove(at: index)
            }
        }
        
        idx = 0
        while idx < id.count {
            if idx + 1 < id.count && Array(id)[idx] == "." && Array(id)[idx+1] == "." {
                let index = id.index(id.startIndex, offsetBy: idx)
                id.remove(at: index)
            } else {
                idx += 1
            }
        }
        
        while true {
            if id.first == "." {
                id.removeFirst()
            } else if id.last == "." {
                id.removeLast()
            } else {
                break
            }
        }
    }
    if id.isEmpty {
        id.append("a")
    }
    
    if id.count >= 16 {
        var tmp = ""
        for i in 0..<15 {
            tmp += String(Array(id)[i])
        }
        while true {
            if tmp.last == "." {
                tmp.removeLast()
            } else {
                break
            }
        }
        
        id = tmp
    }
    
    if id.count <= 2 {
        let last = id.last!
        
        while id.count < 3 {
            id += String(last)
        }
    }
    
    return id
}

solution("abcdefghijklmn.p")



func solution1(_ new_id:String) -> String {
    var myID: String = new_id

    //1차
    myID = myID.lowercased()

    //2차
    var newID: String = ""
    for i in myID {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "." {
            newID.append(i)
        }
    }

    //3차
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }

    //4차
    while newID.hasPrefix(".") {
        newID.removeFirst()
    }

    while newID.hasSuffix(".") {
        newID.removeLast()
    }

    //5차
    if newID == "" {
        newID = "a"
    }

    //6차
    if newID.count >= 16 {
        let index = newID.index(newID.startIndex, offsetBy: 15)
        newID = String(newID[newID.startIndex..<index])
        if newID.hasSuffix(".") {
            newID.removeLast()
        }
    }

    //7차
    if newID.count <= 2 {
        while newID.count != 3 {
            newID = newID + String(newID.last!)
        }
    }

    return newID
}


//48 45 95 46
