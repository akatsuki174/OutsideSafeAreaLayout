import UIKit
import PureLayout

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let menuView = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        self.view.addSubview(menuView)
        menuView.buttonPressedAction = { [weak self] in
            // 上下のアニメーション
            self?.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.3, animations: {
                self?.menuView.changeBottomInset()
                self?.view.layoutIfNeeded()
            })
        }
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            menuView.bottomInset = menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            menuView.bottomInset?.isActive = true
        } else {
            menuView.bottomInset = menuView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        }
        menuView.changeBottomInset()
        menuView.autoAlignAxis(toSuperviewAxis: .vertical)
        menuView.autoSetDimensions(to: CGSize.init(width: self.view.frame.width, height: 90))
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
