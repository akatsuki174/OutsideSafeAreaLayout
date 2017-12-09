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
        self.addSubview(view)
        button.addTarget(self, action: #selector(self.moveButtonPressed), for: .touchUpInside)
        self.view.alpha = shouldShowFull ? 1.0 : 0.0
    }

    func changeBottomInset() {
        bottomInset.constant = shouldShowFull ? 0 : view.frame.height
    }

    @objc func moveButtonPressed() {
        self.shouldShowFull = !shouldShowFull
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = self.shouldShowFull ? 1.0 : 0.0
        })
        buttonPressedAction?()
    }
}
