import Foundation

let values = input
    .split(whereSeparator: \.isNewline)
    .map(String.init)
    .map(Array.init)

let coloumnCount = values.count
let rowCount = values[0].count
let adjacentPairs = [(-1,-1),(-1,0), (-1,1),
                     (0,-1),         (0,1),
                     (1,-1), (1,0),  (1,1)]

func part1() {
    var total = 0
    for (rowIdx, row) in values.enumerated() {
        for (colIdx, element) in row.enumerated() {
            var paperCount = 0
            if element.isPaperRoll {
                for d in adjacentPairs {
                    if rowIdx+d.0 >= 0 && colIdx+d.1 >= 0 && rowIdx+d.0 < rowCount && colIdx+d.1 < coloumnCount {
                        if values[rowIdx+d.0][colIdx+d.1].isPaperRoll {
                            paperCount += 1
                        }
                    }
                }

                if paperCount < 4 {
                    total += 1
                }
            }
        }
    }
    print(total)
}

func part2() {
    var total = 0
    var removed: Set<Grid> = []
    while true {
        var currentTotal = 0
        for (rowIdx, row) in values.enumerated() {
            for (colIdx, element) in row.enumerated() {
                if element.isPaperRoll {
                    guard removed.contains(Grid(row: rowIdx, col: colIdx)) == false else { continue }
                    var paperCount = 0
                    for d in adjacentPairs {
                        if rowIdx+d.0 >= 0 && colIdx+d.1 >= 0 && rowIdx+d.0 < rowCount && colIdx+d.1 < coloumnCount {
                            if values[rowIdx+d.0][colIdx+d.1].isPaperRoll && !removed.contains(Grid(row: rowIdx+d.0, col: colIdx+d.1)) {
                                paperCount += 1
                            }
                        }
                    }

                    if paperCount < 4 {
                        currentTotal += 1
                        total += 1
                        removed.insert(Grid(row: rowIdx, col: colIdx))
                    }
                }
            }
        }
        if currentTotal == 0 { break }
    }
    print(total)
}

struct Grid: Hashable {
    let row: Int
    let col: Int
}

part1() //1437
part2() //8765

extension Character {
    var isPaperRoll: Bool { self == "@" }
    var isPeriod: Bool { self == "." }
}
