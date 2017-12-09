import UIKit

final class MenuView: UIView {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var view: UIView!
    var shouldShowFull: Bool = false
    var buttonPressedAction: (() -> Void)?
    var bottomInset: NSLayoutConstraint!

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }

    func commonInit(){
        guard let view = UINib(nibName: "MenuView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        button.addTarget(self, action: #selector(self.moveButtonPressed), for: .touchUpInside)
        self.addSubview(view)
    }

    @objc func moveButtonPressed() {
        self.shouldShowFull = !shouldShowFull
        buttonPressedAction?()
    }
}
