import UIKit
import PureLayout

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let menuView = MenuView()
    private var menuViewBottomInset: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        self.view.addSubview(menuView)
        menuView.buttonPressedAction = { [weak self] in
            // 上下のアニメーション
            self?.view.layoutIfNeeded()
            self?.changeMenuViewBottomInset()
            UIView.animate(withDuration: 0.3, animations: {
                self?.view.layoutIfNeeded()
            })
        }
        menuViewBottomInset = menuView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        changeMenuViewBottomInset()
        menuView.autoAlignAxis(toSuperviewAxis: .vertical)
        menuView.autoSetDimensions(to: CGSize.init(width: self.view.frame.width, height: 90))
    }

    func changeMenuViewBottomInset() {
        menuViewBottomInset.constant = menuView.isShowFull ? 0 : menuView.view.frame.height
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: UITableViewDelegate, UITableViewDataSource

extension ViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }

}
