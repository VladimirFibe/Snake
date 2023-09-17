import Foundation

enum MovingDirection {
    case left
    case up
    case right
    case down
}

class SnakeBoard {
    static let columns = 20
    static let rows = 39
    var addPoint = SnakeCell(column: 10, row: 10)
    var snake: [SnakeCell] = [.init(column: 10, row: 19)]
    func randomSnake() {
        var emptyCells = Set(0...Self.columns * Self.rows)
        snake.forEach { emptyCells.remove($0.column + $0.row * Self.columns)}
        guard let cell = emptyCells.randomElement() else { return }
        addPoint = SnakeCell(column: cell / Self.columns, row: cell % Self.columns)
    }

    func moveSnake(_ move: MovingDirection) {
        guard var head = snake.first else { return }
        switch move {
        case .left: head.column -= 1
        case .right: head.column += 1
        case .up: head.row -= 1
        case .down: head.row += 1
        }
        snake.insert(head, at: 0)
        if head == addPoint {
            randomSnake()
            print(addPoint)
        } else {
            snake.removeLast()
        }
    }

    var getSnake: [SnakeCell] {
        snake
    }

    var getAddPoint: SnakeCell {
        addPoint
    }
}
