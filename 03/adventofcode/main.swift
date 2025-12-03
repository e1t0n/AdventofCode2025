import Foundation

let values = input
    .split(whereSeparator: \.isNewline)
    .map { String($0) }
    .map { chars in
        chars.compactMap { char in Int(String(char)) }
    }

func part1(_ banks: [[Int]]) {
    let result = banks
        .map {
            let max1 = $0.max()!
            let splits = $0.split(maxSplits: 1, omittingEmptySubsequences: false) { $0 == max1 }
//            print(splits)
            if splits[0].count == 0 || splits[1].count > 0 {
                return Int("\(max1)\(splits[1].max()!)")!
            } else {
                return Int("\(splits[0].max()!)\(max1)")!
            }
        }
        .reduce(0, +)

    print(result)
}

part1(values) //17031
