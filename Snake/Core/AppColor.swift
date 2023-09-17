import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {

    var uiColor: UIColor {
        UIColor.init(named: rawValue) ?? .white
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case snakeHead = "snakeHeadColor"
    case snakeBody = "snakeBodyColor"
    case grid = "gridColor"
}
