import Foundation
import Algorithms

let ranges = input
    .split(separator: ",")
    .map { String($0.trimmingCharacters(in: .newlines)) }
    .map { $0.lower...$0.upper }

func part1() {
    var invalid = 0
    for range in ranges {
        for i in range.lowerBound...range.upperBound {
            if isRepeating(i) {
                invalid += i
            }
        }
    }

    func isRepeating(_ val: Int) -> Bool {
        guard val.description.count % 2 == 0 else { return false }
        let divisor = Int(pow(10.0, Double(val.description.count / 2)))
        return val % divisor == val / divisor
    }

    print(invalid)
}

func part2() {
    var invalid = 0
    for range in ranges {
        for i in range.lowerBound...range.upperBound {
            if isRepeating(i) {
                invalid += i
            }
        }
    }

    func isRepeating(_ val: Int) -> Bool {
        let string = val.description
        let count = string.count
        guard count > 1 else { return false }
        if count == 2 {
            return Set(string.chunks(ofCount: 1)).count == 1
        } else if count % 2 == 0 {
            let divisor = Int(pow(10.0, Double(count / 2)))
            if val % divisor == val / divisor { return true }
            return Set(string.chunks(ofCount: 2)).count == 1
        } else if count == 3 {
            return Set(string.chunks(ofCount: 1)).count == 1
        } else if count % 3 == 0 {
            return Set(string.chunks(ofCount: 3)).count == 1
        }
        return Set(string.chunks(ofCount: 1)).count == 1
    }

    print(invalid)
}

part1() //18595663903
part2() //19058204438


extension String {
    var lower: Int { Int(split(separator: "-")[0])! }
    var upper: Int { Int(split(separator: "-")[1])! }
}
