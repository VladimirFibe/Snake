import UIKit

class BoardView: BaseView {
    private let originX = 0.0
    private let originY = 0.0
    private var cellSide = 0.0
    var addPoint = SnakeCell(column: 0, row: 0)
    var snake: [SnakeCell] = []

    func configure(with addPoint: SnakeCell, snake: [SnakeCell]) {
        self.addPoint = addPoint
        self.snake = snake
        setNeedsDisplay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellSide = frame.width / Double(SnakeBoard.columns)
    }

    override func setupViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

    override func draw(_ rect: CGRect) {
        drawGrid()
        drawSnake()
        drawAddPoint()
    }

    private func drawGrid() {
        let gridPath = UIBezierPath()
        for i in 0...SnakeBoard.rows {
            let y = cellSide * Double(i) + originY
            let x = cellSide * Double(SnakeBoard.columns) + originX
            gridPath.move(to: .init(x: originX, y: y))
            gridPath.addLine(to: .init(x: x, y: y))
        }
        for i in 0...SnakeBoard.rows {
            let y = cellSide * Double(SnakeBoard.rows) + originY
            let x = cellSide * Double(i) + originX
            gridPath.move(to: .init(x: x, y: originY))
            gridPath.addLine(to: .init(x: x, y: y))
        }
        AppColor.grid.uiColor.setStroke()
        gridPath.stroke()
    }

    private func drawSnake() {
        guard snake.count > 0 else { return }
        for i in 0..<snake.count {
            let head = snake[i]
            if i == 0 {
                AppColor.snakeHead.uiColor.setFill()
            } else {
                AppColor.snakeBody.uiColor.setFill()
            }
            let headRect = CGRect(
                x: originX + Double(head.column) * cellSide,
                y: originY + Double(head.row) * cellSide,
                width: cellSide,
                height: cellSide)
            let headPath = UIBezierPath(roundedRect: headRect, cornerRadius: 5)
            headPath.fill()
        }
    }

    private func drawAddPoint() {
        AppColor.addPoint.uiColor.setFill()
        let headRect = CGRect(
            x: originX + Double(addPoint.column) * cellSide,
            y: originY + Double(addPoint.row) * cellSide,
            width: cellSide,
            height: cellSide)
        let headPath = UIBezierPath(roundedRect: headRect, cornerRadius: 5)
        headPath.fill()
    }
}
