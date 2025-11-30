import Foundation

let calibrationValues = input
    .split(whereSeparator: \.isNewline)
    .map { String($0) }
