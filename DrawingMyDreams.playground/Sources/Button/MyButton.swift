import UIKit

public class MyButton: UIButton, CAAnimationDelegate
{
    var borderColor:CGColor = UIColor.gray.cgColor
    
    var selectedIsActive:Bool = false
    {
        didSet{
            
            let transform = self.transform
            
            var newTransform:CGAffineTransform!
            
            if selectedIsActive
            {
                newTransform = transform.scaledBy(x: 1.2, y: 1.2)
                
                borderColor = UIColor.darkGray.cgColor
            }
            else
            {
                
                newTransform = transform.scaledBy(x: 0.83333, y: 0.83333)
                
                borderColor = UIColor.gray.cgColor
            }
            
           // animateBorder(toValue: borderColor)
            
            UIView.animate(withDuration: 0.5, animations:
                {
                    self.transform = newTransform
                    
                    self.layer.borderColor = self.borderColor
                    
            }) { (bool) in
                
            }
        }
    }
    
    override public func awakeFromNib()
    {
        super.awakeFromNib()
        
        setInitialConfigurations()
    }
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setInitialConfigurations()
    }
    
    func setInitialConfigurations()
    {
        self.backgroundColor = .white
        
        self.setTitleColor(.gray, for: .normal)
        
        self.layer.borderWidth = 3
        
        self.layer.cornerRadius = self.frame.width/2
        
        self.layer.borderColor = UIColor.gray.cgColor
        
        self.layer.opacity = 0.93
    }
    
    
    
    func animateBorder(toValue: CGColor)
    {
        let color = CABasicAnimation(keyPath: "borderColor")
        
        color.fromValue = self.layer.borderColor
        
        color.toValue = toValue
        
        color.duration = 0.5
        
        color.repeatCount = 1
        
        color.delegate = self
        
        color.isRemovedOnCompletion = false
        
        self.layer.add(color, forKey: "borderColor")
    }
    
    public func animationDidStop(_ anim: CAAnimation,
                                 finished flag: Bool)
    {
        self.layer.borderColor = borderColor
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
    }
    
}
