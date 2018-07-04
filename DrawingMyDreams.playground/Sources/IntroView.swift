import UIKit

public class IntroView:UIView
{
    var circleView:UIView = UIView()
    
    var projectName:UILabel!
    
    var touchLabel:UILabel!
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        
        addCircleView()
        
        addLabel()
    }
    public override func layoutSubviews()
    {
        super.layoutSubviews()
        
        circleView.layer.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        touchLabel.layer.position = CGPoint(x: self.frame.midX, y:  self.frame.midY)
    }
    
    public func loadEffects()
    {
       
        let originalTransform = circleView.transform
        
        let scaledTransform = originalTransform.scaledBy(x: 50, y: 50)
        
        UIView.animate(withDuration: 2, animations:
            {
                self.circleView.backgroundColor = .white
                
        }) { (value) in
            
            UIView.animate(withDuration: 1.5, delay: 1, options: [], animations: {
                
                self.circleView.transform = scaledTransform
                
            }, completion: { (bool) in
                
                self.backgroundColor = .white
                
                self.circleView.removeFromSuperview()
                
                self.addTapRecognizer()
                
                UIView.animate(withDuration: 1.5, delay: 1, options: [], animations: {
                    
                    self.touchLabel.layer.opacity = 1
                    
                }, completion: { (bool) in
                    
                    self.animateFadeInOut(label: self.touchLabel)
                    
                })
                
            })
        }
    }
    
    internal func addTapRecognizer()
    {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        
        tapRecognizer.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tapRecognizer)
    }
    @objc func tapDetected()
    {
        UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: {
            
            self.touchLabel.layer.opacity = 0.0
            
        }, completion: { (bool) in
            
            UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
                
                self.layer.opacity = 0.0
                
            }, completion: { (bool) in
                
                self.removeFromSuperview()
                
            })
        })
    }
    
    func addCircleView()
    {
        
        circleView.frame = CGRect(x: self.frame.midX, y: self.frame.midY, width: 50, height: 50)
        
        circleView.layer.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        circleView.backgroundColor = .white
        
        circleView.layer.masksToBounds = true
        
        circleView.clipsToBounds = true
        
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        
        self.addSubview(circleView)
        
    }
    
    func addProjectNameLabel()
    {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        projectName = UILabel(frame: frame)
        
        projectName.text = "DrawingMyDreams"
        
    }
    
    func addLabel()
    {
        let frame = CGRect(x: self.frame.midX, y: self.frame.midY, width: self.frame.width, height: 100)
        
        touchLabel = UILabel(frame: frame)
        
        touchLabel.text = "touch me"
        
        touchLabel.textAlignment = .center
        
        touchLabel.font = UIFont(name: "Arial", size: 30)
        
        touchLabel.textColor = .gray
        
        touchLabel.layer.opacity = 0.0
        
        self.addSubview(touchLabel)
        
    }
    
    func animateFadeInOut(label: UILabel)
    {
        let fadeInOut = CABasicAnimation(keyPath: "opacity")
        
        fadeInOut.fromValue = (1.0)
        
        fadeInOut.toValue = (0.0)
        
        fadeInOut.duration = 2
        
        fadeInOut.repeatCount = .infinity
        
        fadeInOut.isRemovedOnCompletion = false
        
        fadeInOut.autoreverses = true
        
        label.layer.add(fadeInOut, forKey: "opacity")
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

