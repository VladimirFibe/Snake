import UIKit

class ViewController: BaseViewController {
    private let boardView = BoardView()
    private let game = SnakeBoard()
    private var direction = MovingDirection.left

    func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.down, .up, .left, .right]
        directions.forEach {

            let swipe = UISwipeGestureRecognizer(
                target: self,
                action: #selector(handleSwipe)
            )
            swipe.direction = $0
            view.addGestureRecognizer(swipe)
        }
    }

    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up: direction = .up
        case .down: direction = .down
        case .left: direction = .left
        default: direction = .right
        }
    }

    private func movingSnake() {
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { _ in
            self.game.moveSnake(self.direction)
            self.updateUI()
        }
    }

    func updateUI() {
        boardView.configure(with: game.getAddPoint, snake: game.getSnake)
    }

    override func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(boardView)
        addSwipe()
        movingSnake()
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            boardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            boardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            boardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            boardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

