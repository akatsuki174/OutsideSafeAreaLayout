import UIKit
import PureLayout

final class TableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let menuView = MenuView.instance()
        self.view.addSubview(menuView)
        menuView.autoAlignAxis(toSuperviewAxis: .vertical)
        menuView.autoPinEdge(toSuperviewEdge: .bottom)
        menuView.autoSetDimensions(to: CGSize.init(width: self.view.frame.width, height: 90))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//// MARK: UITableViewDelegate, UITableViewDataSource
//
//extension TableViewController {
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = String(indexPath.row)
//        return cell
//    }
//
//}
//
