import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

@objc extension BaseViewController {
    func setupViews() {}
    func setupConstraints() {}
}
