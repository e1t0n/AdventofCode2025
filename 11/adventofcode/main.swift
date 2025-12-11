import Foundation

let values = input
    .split(whereSeparator: \.isNewline)
    .map { String($0) }
    .reduce(into: [:]) { partialResult, row in
        partialResult[row.device] = row.outputs
    }

func part1() {
    var racks = [[String]]()
    racks.append(values["you"]!)
    var path = 0

    while !racks.isEmpty {
        var rack = racks.removeFirst()
        let device = rack.removeFirst()

        if device == "out" {
            path += 1
        } else {
            racks.append(values[device]!)
        }

        if !rack.isEmpty { racks.append(rack) }
    }

    print(path)
}

part1() //724

extension String {
    var device: String {
        let sp = split(separator: ":")
        return String(sp[0])
    }

    var outputs: [String] {
        let sp = split(separator: ":")
        return sp[1].split(separator: " ").map(String.init)
    }
}
