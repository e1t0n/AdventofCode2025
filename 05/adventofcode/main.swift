import Foundation
import Collections

let values = input
    .split(separator: "\n\n")
    .map { $0.split(whereSeparator: \.isNewline) }
    .map { $0.map(String.init) }

func part1() {
    let freshRanges = Set(values[0]).map { ($0.lower, $0.upper) }
    let inventory = values[1].map { Int($0)! }
    var freshCount = 0
    for inventoryItem in inventory {
        for freshRange in freshRanges {
            //print(freshRange, inventoryItem)
            if inventoryItem >= freshRange.0 && inventoryItem <= freshRange.1 {
                freshCount += 1
                break
            }
        }
        //print(freshCount)
    }
    print(freshCount)
}

func part2() {
    let freshRanges: [ClosedRange<Int>] = Set(values[0])
        .map { $0.lower...$0.upper }
        .sorted { $0.lowerBound < $1.lowerBound }

    var distinctRange: [ClosedRange<Int>] = []
    for freshRange in freshRanges {
        if distinctRange.isEmpty {
            distinctRange.append(freshRange)
            continue
        }

        let lastRange = distinctRange.removeLast()
        if lastRange.overlaps(freshRange) {
            distinctRange.append(
                min(lastRange.lowerBound, freshRange.lowerBound)...max(lastRange.upperBound, freshRange.upperBound)
            )
        } else {
            distinctRange.append(contentsOf: [lastRange, freshRange])
        }
    }

//    print(distinctRange)
    let result = distinctRange.reduce(0) { $0 + ($1.upperBound - $1.lowerBound) + 1 }
    print(result)
}

part1() //652
part2() //341753674214273

extension String {
    var lower: Int { Int(split(separator: "-")[0])! }
    var upper: Int { Int(split(separator: "-")[1])! }
}
