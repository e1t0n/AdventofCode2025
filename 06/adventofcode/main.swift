import Foundation
import Algorithms

var lines = input
    .split(whereSeparator: \.isNewline)
    .map(String.init)
var values = lines
    .map { $0.split(separator: " ") }
    .map { $0.map(String.init) }

let symbols = values.removeLast()

func part1() {
    var result = 0
    for i in 0..<values[0].count {
        result += values.map { Int($0[i])! }
            .reduce(symbols[i].initialValue, symbols[i].function)
    }
    print(result)
}

func part2() {
    lines.removeLast()
    var i = 0
    var parsed: [[String]] = []
    while i < lines[0].count {
        parsed.append(
            lines.map {
                let chars = Array($0)
                return chars[i].isWhitespace ? "" : chars[i].description
            }
        )
        i += 1
    }
    var leftToRight: [[Int]] = []
    var chunks: [Int] = []
    for row in parsed {
        if row.joined().isEmpty {
            leftToRight.append(chunks)
            chunks = []
        } else {
            chunks.append(Int(row.joined())!)
        }
    }
    if !chunks.isEmpty { leftToRight.append(chunks) }    

    var result = 0
    for s in 0..<symbols.count {
        result += leftToRight[s]
            .reduce(symbols[s].initialValue, symbols[s].function)
    }
    print(result)
}

part1() //5782351442566
part2() //10194584711842

extension String {
    var function:  (Int, Int) -> Int {
        switch self {
        case "+": return (+)
        case "*": return (*)
        default: fatalError()
        }
    }

    var initialValue: Int {
        switch self {
        case "+": return 0
        case "*": return 1
        default: fatalError()
        }
    }
}
