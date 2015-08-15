import UIKit

protocol SimpleTableViewControllerDelegate {
    func didSelectRowAtIndexPath(indexPath: NSIndexPath)
}

class SimpleTableViewController: UITableViewController {
    
    var delegate : SimpleTableViewControllerDelegate?
    
    var items : Array<String>  = []

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            cell!.textLabel?.text = items[indexPath.row]
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("[SimpleTableViewController] didSelectRowAtIndexPath")
        delegate?.didSelectRowAtIndexPath(indexPath)
    }

}
