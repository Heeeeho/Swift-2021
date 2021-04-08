import Foundation

var MX = 0

func BFS(_ G: inout [[Int]], _ C: inout [Int], _ CC: inout [Int]) {
    // Int 큐
    var Q = [Int]()
    // 1번 노드는 시작노드이므로 이후 방문할 필요가 없습니다. 사전에 방문 처리 후 시작합니다.
    C[1] = 1
    // 큐의 커서를 가리킵니다. 큐의 pop해야할 위치를 표현하며, Q.count 범위를 벗어나면 큐가 비었음을 의미합니다
    var cur = 0
    // 1번 노드부터 시작하므로 큐에 1을 넣은 뒤 BFS를 돌립니다.
    Q.append(1)
    
    // 큐(Q)에 요소가 존재할때까지 너비 우선 탐색을 진행합니다
    while cur < Q.count {
        // Q의 끝(cur 위치) 를 pop하고 cur를 증가시켜 큐의 pop과 동일한 동작을 수행합니다.
        let now = Q[cur]
        cur += 1
        // 현재 순회하는 노드에 연결되어 있는 모든 노드를 확인합니다. (가령 처음에는 1번노드와 연결된 노드를 탐색합니다)
        for i in G[now].indices {
            // 연결되어 있는 노드를 가져와 이미 방문했는지 유무를 체크합니다
            let next = G[now][i]
            if C[next] == 0 {
                // 인접 노드를 방문하지 않았다면 now 노드 기준으로 1만큼 거리가 있는 노드임을 아래와 같이 표시합니다.
                C[next] = C[now] + 1
                // 현재 방문한 노드의 1번노드 간 거리가 N일때, N의 거리를 가진 노드의 갯수를 CC에 카운팅합니다
                CC[C[next]] += 1
                // 1번노드 - 현재 인접노드 간 거리가 현재까지 순회한 거리 중 최댓값인지를 확인하고 갱신합니다
                MX = MX < C[next] ? C[next] : MX
                //현재 방문한 인접노드는 큐에 다시 넣어 BFS를 이어 진행합니다
                Q.append(next)
            }
        }
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    // G는 양 방향 그래프의 정보를 기록할 2차원 배열 입니다
    var G = [[Int]](repeating: [Int](), count: n + 1)
    // C는 i번째 노드의 방문여부 체크를 위해 사용합니다
    // ez) C[1]은 1번노드의 방문여부가 있음
    var C = [Int](repeating: 0, count: n + 1)
    // CC는 노드의 방문 거리 수치 별 빈도수를 기록합니다
    // 최대 방문거리가 확인 되면 CC변수의 빈도수 정보를 통해 답을 반환 합니다
    var CC = [Int](repeating: 0, count: n + 1)
    
    for i in edge.indices {
        G[edge[i][0]].append(edge[i][1])
        G[edge[i][1]].append(edge[i][0])
    }
    
    print(G)
    
    // BFS를 수행합니다
    BFS(&G, &C, &CC)
    return CC[MX]
}

solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])
