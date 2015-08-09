import UIKit

protocol SimpleTableViewControllerDelegate {
    func didSelectRowAtIndexPath(indexPath: NSIndexPath)
}

class SimpleTableViewController: UITableViewController {
    
    var delegate : SimpleTableViewControllerDelegate?
    
    var items  = ["Ginger", "Lime"]

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        NSLog("[SimpleTableViewController] numberOfSectionsInTableView")
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("[SimpleTableViewController] numberOfRowsInSection - \(items.count)")
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("[SimpleTableViewController] cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        NSLog("[SimpleTableViewController] heightForRowAtIndexPath")
        return 45.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("[SimpleTableViewController] didSelectRowAtIndexPath")
        delegate?.didSelectRowAtIndexPath(indexPath)
    }

}
