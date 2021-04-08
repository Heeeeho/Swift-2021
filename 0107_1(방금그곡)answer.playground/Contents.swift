import Foundation

var cnt = 0

func timeSampling(_ str:String) -> Int{
    var time:[Int] = []
    
    for i in stride(from: 0, to: 10, by: 3) {
        let T = Int(Array(str)[i...i+1].map{String($0)}.reduce("", +))!
        time.append(T)
    }
    return (time[2]-time[0])*60+time[3]-time[1]
}

func Sampling(_ start:Int,_ str:String) -> String{
    var arr:String = ""
    let shap:[String:String] = [ "C":"c", "D":"d", "F":"f", "G":"g", "A":"a" ]
    var idx = start
    cnt = 0
    
    while idx < str.count {
        let s = Array(str)
        if s[idx] == "," { break }
        if idx+1 != str.count && s[idx+1] == "#" {
            if shap[String(s[idx])] == nil {
                arr.append("@")
            } else {
                arr.append(shap[String(s[idx])]!)
            }
            idx += 1
            cnt += 1
        } else {
            arr.append(s[idx])
        }
        idx += 1
        cnt += 1
    }
    
    return arr
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let mArr = Sampling(0, m)
    var timeCount = 0
    var answer = ""
    
    for i in 0..<musicinfos.count {
        let index = Array(musicinfos)[i]
        let time = timeSampling(index)
        let name = Sampling(12, index)
        let sheetMusic = Sampling(cnt+13, index)
        var str = ""
        
        for _ in 0..<time/sheetMusic.count {
            str += sheetMusic
        }
        for j in 0..<time%sheetMusic.count {
            str += String(Array(sheetMusic)[j])
        }
        print(str)
        if str.contains(mArr) {
            if timeCount < time {
                answer = name
                timeCount = time
            }
        }
    }
    
    return answer != "" ? answer:"(None)"
}

//solution("ABCDEFG", ["12:00,12:16,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"])

//var a = "cdcdcdf"
//
//a.contains("cdcdff")

//        var idx = 0
//
//        for j in 0..<time {
//            if sheetMusic[j%sheetMusic.count] == mSheet[idx] {
//                idx += 1
//                if idx == mSheet.count {
//                    if timeCount < time {
//                        answer = name
//                        timeCount = time
//                    }
//                    break
//                }
//            } else {
//                idx = 0
//            }
//        }
