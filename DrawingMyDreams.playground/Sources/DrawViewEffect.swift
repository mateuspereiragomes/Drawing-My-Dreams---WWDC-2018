import UIKit

public class DrawViewEffect
{
    public var drawView:DrawView!
    
    public var translationType:TranslationType!
    
    public var duration:CFTimeInterval!
    
    public init(translationType: TranslationType, duration: CFTimeInterval, backgroundColor: UIColor)
    {
        drawView = DrawView()
        
        drawView.layer.backgroundColor = backgroundColor.cgColor
        
        self.translationType = translationType
        
        self.duration = duration
    }
}

