import UIKit

class ViewController: UIViewController {
    
    var x = UIView()
    var y = UIView()
    
    var containerView = UIView()
    
    let animationDuration = 1.5;
    let delayTime = 0.25;
    
    let animationTime = 0.25;

    override func viewDidLoad() {
        func setupSquares() {
            x.frame = CGRectMake(50, 50, 100, 100)
            x.backgroundColor = UIColor.redColor()
            
            y.frame = CGRectMake(150, 150, 100, 100)
            y.backgroundColor = UIColor.blueColor()
            
            view.addSubview(x)
            view.addSubview(y)
        }
        super.viewDidLoad()
        
        setupSquares()
        
        originalX   = self.view.frame.origin.x
        originalY   = self.view.frame.origin.y
        frameHeight = self.view.frame.height
        frameWidth  = self.view.frame.width
        
        containerView.frame = CGRectMake(frameWidth, originalY, 250, frameHeight)
        containerView.backgroundColor = UIColor.redColor()
        
        view.addSubview(containerView)
    }
    
    var originalX : CGFloat!
    var originalY : CGFloat!
    var frameHeight : CGFloat!
    var frameWidth : CGFloat!
    
    @IBAction func push() {
        UIView.animateWithDuration(animationTime, delay: 0, options: .CurveLinear, animations: {
            self.view.frame = CGRectMake(self.originalX - 250, self.originalY, self.view.frame.width, self.view.frame.height)
            self.containerView.frame = CGRectMake(self.frameWidth, self.originalY, 250, self.frameHeight)
        }, completion: nil)
    }
    
    @IBAction func pull() {
        UIView.animateWithDuration(animationTime, delay: 0, options: .CurveLinear, animations: {
            self.view.frame = CGRectMake(self.originalX, self.originalY, self.view.frame.width, self.view.frame.height)
            self.containerView.frame = CGRectMake(self.frameWidth, self.originalY, 250, self.frameHeight)
        }, completion: nil)
    }
    
    
    @IBAction func reset() {
        x.removeFromSuperview()
        y.removeFromSuperview()
       
        x = UIView()
        x.frame = CGRectMake(50, 50, 100, 100)
        x.backgroundColor = UIColor.redColor()
        
        y = UIView()
        y.frame = CGRectMake(150, 150, 100, 100)
        y.backgroundColor = UIColor.blueColor()
        
        view.addSubview(x)
        view.addSubview(y)
    }
    
    
    @IBAction func action() {
        UIView.animateWithDuration(animationDuration,
            animations: {
                self.x.backgroundColor = UIColor.greenColor()
                self.x.frame = CGRectMake(50, 150, 100, 100)
                
                self.y.backgroundColor = UIColor.greenColor()
                self.y.frame = CGRectMake(150, 50, 100, 100)
                
            },
            completion: { (var b) in
                UIView.animateWithDuration(self.animationDuration, delay: self.delayTime / 2, options: .CurveEaseOut, animations: {
                    self.x.backgroundColor = UIColor.purpleColor()
                    self.x.frame = CGRectMake(150, 150, 100, 100)
                    
                    self.y.backgroundColor = UIColor.purpleColor()
                    self.y.frame = CGRectMake(50, 50, 100, 100)
                    
                    }, completion: { (var b) in
                        UIView.animateWithDuration(self.animationDuration, delay: self.delayTime / 4, options: .CurveEaseOut, animations: {
                            self.x.backgroundColor = UIColor.redColor()
                            self.x.frame = CGRectMake(50, 50, 100, 100)
                            
                            self.y.backgroundColor = UIColor.blueColor()
                            self.y.frame = CGRectMake(150, 150, 100, 100)
                            
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
        self.x.frame = CGRectMake(50, 50, 100, 100)
        self.y.frame = CGRectMake(150, 150, 100, 100)
        self.x.transform = CGAffineTransformMakeRotation(angle)
        self.y.transform = CGAffineTransformMakeRotation(-angle)
    }
}

