import UIKit

public class PanelButton: UIButton
{
    var textColor:UIColor = UIColor.gray
    var backColor:UIColor = .white
    
    var selectedIsActive:Bool = false
    {
        didSet{
            
            if selectedIsActive
            {
                textColor = UIColor.white
                
                backColor = .gray
            }
            else
            {
                textColor = UIColor.gray
                
                backColor = .white
            }
            
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve , animations:
                {
                    
                    self.setTitleColor(self.textColor, for: .normal)
                    
                    
                    self.backgroundColor = self.backColor
                    
            }, completion: nil)
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
        self.layer.borderColor = UIColor.gray.cgColor
        
        self.layer.borderWidth = 1
        
        self.backgroundColor = .white
        
        self.setTitleColor(.gray, for: .normal)
        
        self.layer.cornerRadius = self.frame.size.width/2
        
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.layer.opacity = 0.93
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
    }
    
}
