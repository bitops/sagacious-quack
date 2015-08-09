import UIKit

protocol SimpleTableViewControllerDelegate {
    func didSelectRowAtIndexPath(indexPath: NSIndexPath)
}

class SimpleTableViewController: UITableViewController {
    
    var delegate : SimpleTableViewControllerDelegate?
    
    var items  = ["Ginger", "Lime", "Tiger", "Zazen", "Plant"]
    var colors = [UIColor.brownColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.orangeColor(), UIColor.cyanColor()]

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        NSLog("[SimpleTableViewController] numberOfSectionsInTableView")
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("[SimpleTableViewController] numberOfRowsInSection - \(items.count)")
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("[SimpleTableViewController] cellForRowAtIndexPath")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.backgroundColor = colors[indexPath.row]
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectRowAtIndexPath(indexPath)
    }

}
