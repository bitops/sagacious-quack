import UIKit

class ViewController: UIViewController, SimpleTableViewControllerDelegate {
    
    var x = UIView()
    var y = UIView()
    
    var containerView = UIView()
    
    let animationDuration = 1.5;
    let delayTime = 0.25;
    
    let animationTime = 0.25;
    
    var tableViewController = SimpleTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSquares()
        
        originalX   = self.view.frame.origin.x
        originalY   = self.view.frame.origin.y
        frameHeight = self.view.frame.height
        frameWidth  = self.view.frame.width
        
        containerView.frame = CGRectMake(frameWidth, originalY, 250, frameHeight)
        containerView.backgroundColor = UIColor.magentaColor()
        containerView.clipsToBounds = false
        
        view.addSubview(containerView)
        
        tableViewController.delegate = self
        tableViewController.tableView.frame = containerView.bounds
        tableViewController.tableView.backgroundColor = UIColor.lightGrayColor()
        tableViewController.tableView.scrollsToTop = false
        tableViewController.tableView.separatorStyle = .None
        tableViewController.tableView.contentInset = UIEdgeInsets(top: 64.0, left: 0, bottom: 0, right: 0)
        tableViewController.tableView.reloadData()

        addChildViewController(tableViewController)
        containerView.addSubview(tableViewController.tableView)
        tableViewController.didMoveToParentViewController(self)
    }
    
    func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
        NSLog("[ViewController] invoked didSelectRowAtIndexPath with \(indexPath.row)")
    }
    
    func setupSquares() {
        x.frame = CGRectMake(100, 100, 100, 100)
        x.backgroundColor = UIColor.redColor()
        
        y.frame = CGRectMake(200, 200, 100, 100)
        y.backgroundColor = UIColor.blueColor()
        
        view.addSubview(x)
        view.addSubview(y)
    }
    
    var originalX : CGFloat!
    var originalY : CGFloat!
    var frameHeight : CGFloat!
    var frameWidth : CGFloat!
    
    @IBAction func push() {
        UIView.animateWithDuration(animationTime, delay: 0, options: .CurveLinear, animations: {
            self.view.frame = CGRectMake(self.originalX - 250, self.originalY, self.view.frame.width, self.view.frame.height)
            self.containerView.frame = CGRectMake(self.frameWidth, self.originalY, 250, self.frameHeight)
            }, completion: { (var b) -> Void in
                
        })
    }
    
    @IBAction func pull() {
        UIView.animateWithDuration(animationTime, delay: 0, options: .CurveLinear, animations: {
            self.view.frame = CGRectMake(self.originalX, self.originalY, self.view.frame.width, self.view.frame.height)
            self.containerView.frame = CGRectMake(self.frameWidth, self.originalY, 250, self.frameHeight)
            }, completion: { (var b) -> Void in
                
        })
    }
    
    
    @IBAction func reset() {
        x.removeFromSuperview()
        y.removeFromSuperview()
       
        x = UIView()
        x.frame = CGRectMake(100, 100, 100, 100)
        x.backgroundColor = UIColor.redColor()
        
        y = UIView()
        y.frame = CGRectMake(200, 200, 100, 100)
        y.backgroundColor = UIColor.blueColor()
        
        view.addSubview(x)
        view.addSubview(y)
    }
    
    
    @IBAction func action() {
        UIView.animateWithDuration(animationDuration,
            animations: {
                self.x.backgroundColor = UIColor.greenColor()
                self.x.frame = CGRectMake(100, 200, 100, 100)
                
                self.y.backgroundColor = UIColor.greenColor()
                self.y.frame = CGRectMake(200, 100, 100, 100)
                
            },
            completion: { (var b) in
                UIView.animateWithDuration(self.animationDuration, delay: self.delayTime / 2, options: .CurveEaseOut, animations: {
                    self.x.backgroundColor = UIColor.purpleColor()
                    self.x.frame = CGRectMake(200, 200, 100, 100)
                    
                    self.y.backgroundColor = UIColor.purpleColor()
                    self.y.frame = CGRectMake(100, 100, 100, 100)
                    
                    }, completion: { (var b) in
                        UIView.animateWithDuration(self.animationDuration, delay: self.delayTime / 4, options: .CurveEaseOut, animations: {
                            self.x.backgroundColor = UIColor.redColor()
                            self.x.frame = CGRectMake(100, 100, 100, 100)
                            
                            self.y.backgroundColor = UIColor.blueColor()
                            self.y.frame = CGRectMake(200, 200, 100, 100)
                            
                            }, completion: { (var b) in
                                UIView.animateWithDuration(1.5) {
                                    self.rotate()
                                }
                        })
                    })
            })
    }
    
    private func rotate() {
        let angle : CGFloat = 90.0;
        self.x.frame = CGRectMake(100, 100, 100, 100)
        self.y.frame = CGRectMake(200, 200, 100, 100)
        self.x.transform = CGAffineTransformMakeRotation(angle)
        self.y.transform = CGAffineTransformMakeRotation(-angle)
    }
}

