import UIKit

let sections: [Section] = [
    milk,
    yogurt,
    butter,
    cheese,
    cottageCheese,
    condensedMilk,
    iceCream,
    whey
]

final class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(SectionHeaderView.nib, forHeaderFooterViewReuseIdentifier: SectionHeaderView.reuseIdentifier)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        
        cell.year = row.year
        cell.amount = row.amount
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].notes
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.reuseIdentifier) as? SectionHeaderView else {
            return nil
        }
        
        view.textLabel?.text = sections[section].title
        view.imageView?.image = sections[section].image

        return view
    }
}
