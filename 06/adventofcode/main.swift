import Foundation

var values = input
    .split(whereSeparator: \.isNewline)
    .map { $0.split(separator: " ") }
    .map { $0.map(String.init) }

let symbols = values.removeLast()

func part1() {
//    print(values)
//    print(symbols)
    var result = 0
    for i in 0..<values[0].count {
        result += values.map { Int($0[i])! }
            .reduce(symbols[i].initialValue, symbols[i].function)
    }
    print(result)
}

part1() //5782351442566


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
