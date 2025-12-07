import Foundation
import Collections

let values = input
    .split(whereSeparator: \.isNewline)
    .map { Array($0) }
    .map { $0.map(String.init) }

func part1() {
    var sIndex: [Set<Int>] = [[values[0].firstIndex(of: "S")!]]
    var count = 0
    for (i, row) in values.enumerated() where i > 0 {
//        print(row)
        for index in sIndex {
//            print(sIndex)
            var newIndex: Set<Int> = []

            for idx in index {
                if row[idx].isSplitter {
                    count += 1
                    if idx-1 >= 0 {
                        newIndex.insert(idx-1)
                    }
                    if idx+1 < row.count {
                        newIndex.insert(idx+1)
                    }
                } else {
                    newIndex.insert(idx)
                }
            }

            if !newIndex.isEmpty {
                sIndex = [newIndex]
            }
        }
    }
    print(count)
}

part1() //1524

extension String {
    var isSplitter: Bool { self == "^" }
}
