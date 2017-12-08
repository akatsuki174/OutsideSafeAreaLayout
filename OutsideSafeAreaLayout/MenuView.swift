import UIKit

final class MenuView: UIView {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var view: UIView!

    class func instance() -> MenuView {
        if let view = UINib(nibName: "MenuView", bundle: nil).instantiate(withOwner: self, options: nil).first as? MenuView {
            return view
        }
        fatalError()
    }
}
