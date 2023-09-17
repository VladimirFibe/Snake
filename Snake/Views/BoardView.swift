import UIKit

class BoardView: BaseView {
    private let originX = 0.0
    private let originY = 0.0
    private var cellSide = 0.0

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
    }

    func drawGrid() {
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
}
