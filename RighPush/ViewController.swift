import UIKit

class ViewController: UIViewController {
    
    let x = UIView()
    let y = UIView()
    
    let animationDuration = 3.5;
    let delayTime = 1.5;

    override func viewDidLoad() {
        super.viewDidLoad()
        x.frame = CGRectMake(50, 50, 100, 100)
        x.backgroundColor = UIColor.redColor()
        
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
                //self.x.transform = CGAffineTransformMakeRotation(45.0)
                
                self.y.backgroundColor = UIColor.greenColor()
                self.y.frame = CGRectMake(150, 50, 100, 100)
                //self.y.transform = CGAffineTransformMakeRotation(45.0)
            },
            completion: { (var b) in
                UIView.animateWithDuration(self.animationDuration, delay: self.delayTime / 2, options: .CurveEaseOut, animations: {
                    self.x.backgroundColor = UIColor.purpleColor()
                    self.x.frame = CGRectMake(150, 150, 100, 100)
                    //self.x.transform = CGAffineTransformMakeScale(1.5, 2.5)
                    
                    self.y.backgroundColor = UIColor.purpleColor()
                    self.y.frame = CGRectMake(50, 50, 100, 100)
                    //self.y.transform = CGAffineTransformMakeScale(2.5, 1.5)
                    }, completion: { (var b) in
                        UIView.animateWithDuration(self.animationDuration, delay: self.delayTime / 4, options: .CurveEaseOut, animations: {
                            self.x.backgroundColor = UIColor.redColor()
                            self.x.frame = CGRectMake(50, 50, 100, 100)
                            //self.x.transform = CGAffineTransformMakeTranslation(5.0, 5.0)
                            
                            self.y.backgroundColor = UIColor.blueColor()
                            self.y.frame = CGRectMake(150, 150, 100, 100)
                            //self.y.transform = CGAffineTransformMakeTranslation(5.0, 5.0)
                            }, completion: { (var b) in
                                
                        })
                    })
            })
    }
}

