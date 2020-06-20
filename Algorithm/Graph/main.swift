//
//  main.swift
//  Graph
//
//  Created by ggl on 2020/6/17.
//  Copyright © 2020 ggl. All rights reserved.
//

import Foundation

print("============图==============")
print("============邻接矩阵==============")
/**
 无向图
 A ---(5)--- C ---(1)--- E
 |         / |           |
 |       /   |           |
 (1)   /(6)  |(7)        |(8)
 |   /       |           |
 | /         |           |
 B ---(3)--- D ---(4)--- F
 */
// 无向图邻接矩阵
let udMGraph = MatrixGraph<String>(type: .Undirected)
udMGraph.addVertex("A").addVertex("B").addVertex("C")
udMGraph.addVertex("D").addVertex("E").addVertex("F")
udMGraph.addEdge(from: "A", to: "B", weighted: 1)
udMGraph.addEdge(from: "A", to: "C", weighted: 5)
udMGraph.addEdge(from: "B", to: "C", weighted: 6)
udMGraph.addEdge(from: "B", to: "D", weighted: 3)
udMGraph.addEdge(from: "C", to: "D", weighted: 7)
udMGraph.addEdge(from: "C", to: "E", weighted: 1)
udMGraph.addEdge(from: "D", to: "F", weighted: 4)
udMGraph.addEdge(from: "E", to: "F", weighted: 8)
udMGraph.print()
print("")

/**
 有向图(2和4相互指向，5指向3)
 1 ------> 2 -----> 3
 ^      ~/~|      ~/~
 |     /   |     /
 |    /    |   /
 | ~/~     ⌵ /
 4 <------ 5
 */
// 有向图的邻接矩阵
let dMGraph = MatrixGraph<Int>(type: .Directed)
dMGraph.addVertex(1).addVertex(2).addVertex(3)
dMGraph.addVertex(4).addVertex(5)
dMGraph.addEdge(from: 1, to: 2)
dMGraph.addEdge(from: 2, to: 3)
dMGraph.addEdge(from: 2, to: 4)
dMGraph.addEdge(from: 2, to: 5)
dMGraph.addEdge(from: 4, to: 1)
dMGraph.addEdge(from: 4, to: 2)
dMGraph.addEdge(from: 5, to: 3)
dMGraph.addEdge(from: 5, to: 4)
dMGraph.print()

print("\n\n============邻接表==============")
/**
无向图
A ---(5)--- C ---(1)--- E
|         / |           |
|       /   |           |
(1)   /(6)  |(7)        |(8)
|   /       |           |
| /         |           |
B ---(3)--- D ---(4)--- F
*/
// 无向图的邻接表
let udListGraph = ListGraph<String>(type: .Undirected)
udListGraph.addVertex("A").addVertex("B").addVertex("C")
udListGraph.addVertex("D").addVertex("E").addVertex("F")
udListGraph.addEdge(from: "A", to: "B", weighted: 1)
udListGraph.addEdge(from: "A", to: "C", weighted: 5)
udListGraph.addEdge(from: "B", to: "C", weighted: 6)
udListGraph.addEdge(from: "B", to: "D", weighted: 3)
udListGraph.addEdge(from: "C", to: "D", weighted: 7)
udListGraph.addEdge(from: "C", to: "E", weighted: 1)
udListGraph.addEdge(from: "D", to: "F", weighted: 4)
udListGraph.addEdge(from: "E", to: "F", weighted: 8)
udListGraph.print()
print("")

/**
有向图(2和4相互指向，5指向3)
1 ------> 2 -----> 3
^      ~/~|      ~/~
|     /   |     /
|    /    |   /
| ~/~     ⌵ /
4 <------ 5
*/
// 有向图的邻接表
let dListGraph = ListGraph<Int>(type: .Directed)
dListGraph.addVertex(1).addVertex(2).addVertex(3)
dListGraph.addVertex(4).addVertex(5)
dListGraph.addEdge(from: 1, to: 2)
dListGraph.addEdge(from: 2, to: 3)
dListGraph.addEdge(from: 2, to: 4)
dListGraph.addEdge(from: 2, to: 5)
dListGraph.addEdge(from: 4, to: 1)
dListGraph.addEdge(from: 4, to: 2)
dListGraph.addEdge(from: 5, to: 3)
dListGraph.addEdge(from: 5, to: 4)
dListGraph.print()

print("\n============邻接矩阵搜索==============")
udMGraph.bfs(from: "A", to: "F")
udMGraph.dfs(from: "A", to: "F")
dMGraph.bfs(from: 1, to: 5)
dMGraph.dfs(from: 1, to: 5)

print("\n============邻接表搜索==============")
udListGraph.bfs(from: "A", to: "F")
udListGraph.dfs(from: "A", to: "F")
dListGraph.bfs(from: 1, to: 5)
dListGraph.dfs(from: 1, to: 5)


print("\n============Dijkstra(迪杰斯特拉)算法==============")
/**
 有向图Dijkstra算法演示(V4指向V6，V5指向V6)
 示例链接：https://blog.csdn.net/qq_35644234/article/details/60870719
 V2 ---(5)----> V3 <---(10)--- V1 --(100)--> V6
                |              |         ♐︎  ♐︎
                |              |      ♐︎   ♐︎
               (50)           (30)     (60)
                |     (10)♐︎    |      ♐︎
                ⌵  ♐︎           ⌵    ♐︎
                V4 <---(20)--- V5
 */
let dListGraph1 = ListGraph<String>(type: .Directed)
dListGraph1.addVertex("V1").addVertex("V2").addVertex("V3")
dListGraph1.addVertex("V4").addVertex("V5").addVertex("V6")
dListGraph1.addEdge(from: "V1", to: "V3", weighted: 10)
dListGraph1.addEdge(from: "V1", to: "V5", weighted: 30)
dListGraph1.addEdge(from: "V1", to: "V6", weighted: 100)
dListGraph1.addEdge(from: "V2", to: "V3", weighted: 5)
dListGraph1.addEdge(from: "V3", to: "V4", weighted: 50)
dListGraph1.addEdge(from: "V4", to: "V6", weighted: 10)
dListGraph1.addEdge(from: "V5", to: "V4", weighted: 20)
dListGraph1.addEdge(from: "V5", to: "V6", weighted: 60)
dListGraph1.print()

print("")
dListGraph1.dijkstra(from: "V1")

/**
 无向图Dijkstra算法演示
 示例链接：http://wangkuiwu.github.io/2013/04/14/dijkstra-java/
 */
let udListGraph1 = ListGraph<String>(type: .Undirected)
udListGraph1.addVertex("A").addVertex("B").addVertex("C").addVertex("D")
udListGraph1.addVertex("E").addVertex("F").addVertex("G")
udListGraph1.addEdge(from: "A", to: "B", weighted: 12)
udListGraph1.addEdge(from: "A", to: "F", weighted: 16)
udListGraph1.addEdge(from: "A", to: "G", weighted: 14)
udListGraph1.addEdge(from: "B", to: "C", weighted: 10)
udListGraph1.addEdge(from: "B", to: "F", weighted: 7)
udListGraph1.addEdge(from: "G", to: "F", weighted: 9)
udListGraph1.addEdge(from: "G", to: "E", weighted: 8)
udListGraph1.addEdge(from: "F", to: "C", weighted: 6)
udListGraph1.addEdge(from: "F", to: "E", weighted: 2)
udListGraph1.addEdge(from: "C", to: "D", weighted: 3)
udListGraph1.addEdge(from: "C", to: "E", weighted: 5)
udListGraph1.addEdge(from: "E", to: "D", weighted: 4)
udListGraph1.print()

print("")
udListGraph1.dijkstra(from: "D")