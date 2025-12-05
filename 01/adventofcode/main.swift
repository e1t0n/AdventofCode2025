import Foundation

let rotations = input
    .split(whereSeparator: \.isNewline)
    .map { String($0) }

func part1() {
    let clicks = Array(0..<100)
    var start = 50
    var isZeroCount = 0
    for rotation in rotations {
        print(rotation, start, rotation.click)
        if rotation.isMinus {
            start = start-rotation.click < 0 ? clicks[abs(100+(start-rotation.click))] : clicks[start-rotation.click]
        } else {
            start = start+rotation.click > 99 ? clicks[abs(100-(start+rotation.click))] : clicks[start+rotation.click]
        }
        if start == 0 { isZeroCount += 1 }
    }
    print(isZeroCount)
}

func part2() {
    let clicks = Array(0..<100)
    var start = 50
    var isZeroCount = 0
    for rotation in rotations {
        isZeroCount += rotation.fullRotations

        let increment = start != 0
        if rotation.isMinus {
            if start-rotation.click < 0 {
                start = clicks[abs(100+(start-rotation.click))]
                if start != 0 && increment { isZeroCount += 1 }
            } else {
                start = clicks[start-rotation.click]
            }
        } else {
            if start+rotation.click > 99 {
                start = clicks[abs(100-(start+rotation.click))]
                if start != 0 && increment { isZeroCount += 1 }
            } else {
                start = clicks[start+rotation.click]
            }
        }
        if start == 0 { isZeroCount += 1 }
//        print(isZeroCount)
    }
    print(isZeroCount)
}

extension String {
    var isMinus: Bool { prefix(1) == "L"}
    var isPlus: Bool { prefix(1) == "R"}
    var click: Int { Int(dropFirst(1).suffix(2))! }
    var fullRotations: Int { Int(dropFirst(1).dropLast(2)) ?? 0 }
}

part1() //984
part2() //5657
