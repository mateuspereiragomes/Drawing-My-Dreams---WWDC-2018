
import UIKit

public enum TranslationType
{
    case horizontal
    
    case vertical
    
    case diagonal1
    
    case diagonal2
    
    case rotation1
    
    case rotation2
}

public class ViewController:UIViewController
{
    internal let model = DataModel.shared
    
    internal var introView:IntroView?
    
    
    internal var parallaxEffectActive:Bool = false
    
    internal var configurationActive:Bool = false
    
    internal var justOneViewIsActive:Bool = false
    
    
    internal var buttonViews:[MyButton] = []
    
    internal var buttonColors:[MyButton] = []
    
    internal var buttonLineWidths:[MyButton] = []
    
    internal var buttonPanel:[PanelButton] = []
    
    
    internal var colorsView:UIView!
    
    internal var lineWidthsView:UIView!
    
    internal var selectViewViews:UIView!
    
    internal var panelView:UIView!
    
    
    internal var buttonPlayStopEffect:PanelButton!
    
    internal var buttonBug:PanelButton!
    
    internal var clearButton:PanelButton!
    
    internal var buttonJustOneView:PanelButton!
    
    internal var buttonGradient:PanelButton!
    
    
    internal var colorButtonSelectedIndex:Int!
    
    internal var viewButtonSelectedIndex:Int!
    
    internal var lineWidthSelectedIndex:Int!
    
    
    internal var gradient: CAGradientLayer!
    
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = model.backgroundColor
        
        addViews()
        
        if model.twoTapsRecognizerIsActive
        {
            addTapRecognizer()
        }

        addButtonsViews()

        addButtonColor()
        
        addButtonLineWidth()

        initializePanelButtons()

        if model.gradientIsActive
        {
            insertGradient()
        }

        if model.introIsActive
        {
            introView = IntroView(frame: self.view.frame)

            self.view.addSubview(introView!)
        }

    }
    
    override public func viewWillAppear(_ animated: Bool)
    {
        if model.introIsActive
        {
            self.introView!.loadEffects()
        }
    }
    
    
    override public func viewDidLayoutSubviews()
    {
        let size = model.sizeButtons
        
        lineWidthsView.layer.position = CGPoint(x: size, y: Int(self.view.frame.midY))
        
        colorsView.layer.position = CGPoint(x: self.view.frame.midX, y: CGFloat(self.view.frame.maxY) - CGFloat(size + 10))

        
        selectViewViews.layer.position = CGPoint(x: CGFloat(self.view.frame.maxX) - CGFloat(size), y: self.view.frame.midY)
        
        configurationActive = false
        
        
        if model.gradientIsActive
        {
             gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }

        panelView.layer.position = CGPoint(x: self.view.frame.midX, y: CGFloat(size)*1.2)
        
        if model.introIsActive
        {
            introView!.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }
    }
    
    internal func addTapRecognizer()
    {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(twoTapsDetected))
        
        tapRecognizer.numberOfTapsRequired  = 2
        
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc internal func twoTapsDetected()
    {
       
        if !configurationActive
        {
            UIView.animate(withDuration: 1, animations:
                {
                    self.lineWidthsView.layer.position = CGPoint(x: self.lineWidthsView.layer.position.x - 200, y:  self.lineWidthsView.layer.position.y)
                    
                    self.selectViewViews.layer.position = CGPoint(x: self.selectViewViews.layer.position.x + 200, y:  self.selectViewViews.layer.position.y)
                    
                    self.colorsView.layer.position = CGPoint(x: self.colorsView.layer.position.x, y:  self.colorsView.layer.position.y + 200)
                    
                    self.panelView.layer.position = CGPoint(x: self.panelView.layer.position.x, y:  self.panelView.layer.position.y - 200)
                    
            }) { (bool) in
                
                
            }
            
            configurationActive = !configurationActive
        }
        else
        {
            UIView.animate(withDuration: 1, animations:
                {
                    self.lineWidthsView.layer.position = CGPoint(x: self.lineWidthsView.layer.position.x + 200, y:  self.lineWidthsView.layer.position.y)
                    
                    self.selectViewViews.layer.position = CGPoint(x: self.selectViewViews.layer.position.x - 200, y:  self.selectViewViews.layer.position.y)
                    
                    self.colorsView.layer.position = CGPoint(x: self.colorsView.layer.position.x, y:  self.colorsView.layer.position.y - 200)
                    
                    self.panelView.layer.position = CGPoint(x: self.panelView.layer.position.x, y:  self.panelView.layer.position.y + 200)
                    
            }) { (bool) in
                
                
            }
            
            configurationActive = !configurationActive
        }
        
    }
    
    internal func addViews()
    {
        for i in 0..<model.myDrawViews.count
        {
            var myDrawView = model.myDrawViews[i].drawView
            
            myDrawView!.frame = self.view.frame
            
            self.view.addSubview(myDrawView!)
            
        }
    }
    
    internal func addButtonLineWidth()
    {
        let size = model.sizeButtons
        
        let count = model.lineWidths.count
        
        let space = 8
        
        var frame = CGRect(x: 0, y: 0, width: size, height: (size + space) * count)
        
        lineWidthsView = UIView(frame: frame)
        
        lineWidthsView.layer.position = CGPoint(x: size, y: Int(self.view.frame.midY))
        
        lineWidthsView.backgroundColor = .clear
        
        for i in 0..<count
        {
            frame = CGRect(x: 0, y: (size + space) * i, width: size, height: size)
            
            let buttonLineWidth = MyButton(frame: frame)
            
            buttonLineWidth.tag = i
            
            buttonLineWidth.addTarget(self, action: #selector(buttonLineWidthClicked(sender:)), for: .touchUpInside)
            
            buttonLineWidth.titleLabel?.font = UIFont(name: "Arial", size: 20)
            
            var radius = CGFloat(model.lineWidths[i])
            
            if radius >= round(CGFloat(size)/2.0)
            {
                
                buttonLineWidth.setTitle(String(Float(radius/round(CGFloat(size)/2.0))), for: .normal)
                
                radius = round(CGFloat(size)/2.0)
                
            }
            
            if i == 0
            {
                buttonLineWidth.layer.borderColor = UIColor.black.cgColor
                
                model.selectedLineWidth = model.lineWidths[i]
                
                lineWidthSelectedIndex = i
                
                buttonLineWidth.selectedIsActive = true
            }
            else
            {
                buttonLineWidth.layer.borderColor = UIColor.gray.cgColor
            }
            
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: size/2,y: size/2), radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            
            let shapeLayer = CAShapeLayer()
            
            shapeLayer.path = circlePath.cgPath
            
            shapeLayer.fillColor = UIColor.gray.cgColor
            
            self.buttonLineWidths.append(buttonLineWidth)
            
            self.lineWidthsView.addSubview(buttonLineWidth)
            
            buttonLineWidth.layer.insertSublayer(shapeLayer, at: 1000)
        }
        
        self.view.addSubview(lineWidthsView)
    }
    
    @objc internal func buttonLineWidthClicked(sender: MyButton)
    {
        for i in 0..<model.lineWidths.count
        {
            if sender.tag == i
            {
                model.selectedLineWidth = model.lineWidths[i]
                
                self.lineWidthSelectedIndex = i
                
                if !sender.selectedIsActive
                {
                    sender.selectedIsActive = true
                }
                
            }
            else
            {
                if buttonLineWidths[i].selectedIsActive
                {
                    buttonLineWidths[i].selectedIsActive = false
                }
            }
        }
    }
    
    internal func addButtonColor()
    {
        let size = model.sizeButtons
        
        let count = model.colors.count
        
        let space = 8
        
        var frame = CGRect(x: 0 , y:  0, width: CGFloat(size + space) *  CGFloat(count), height: CGFloat(size))
        
        colorsView = UIView(frame: frame)
        
        colorsView.layer.position = CGPoint(x: self.view.frame.midX, y: CGFloat(self.view.frame.maxY) - CGFloat(size + 10))
        
        colorsView.backgroundColor = .clear
        
        for i in 0..<count
        {
            frame = CGRect(x: (size + space) * i, y: 0, width: size, height: size)
            
            let buttonColor = MyButton(frame: frame)
            
            buttonColor.backgroundColor = model.colors[i]
            
            buttonColor.tag = i
            
            if i == 0
            {
                self.colorButtonSelectedIndex = i
                
                buttonColor.selectedIsActive = true
                
                model.selectedColor = model.colors[i]
            }
            
            buttonColor.addTarget(self, action: #selector(buttonColorClicked(sender:)), for: .touchUpInside)
            
            self.buttonColors.append(buttonColor)
            
            self.colorsView.addSubview(buttonColor)
            
        }
        
        self.view.addSubview(colorsView)
    }
    
    @objc internal func buttonColorClicked(sender: MyButton)
    {
        
        for i in 0..<model.colors.count
        {
            if sender.tag == i
            {
                if !sender.selectedIsActive
                {
                    sender.selectedIsActive = true
                }
                
                model.selectedColor = model.colors[i]
                
                colorButtonSelectedIndex = i
            }
            else
            {
                if buttonColors[i].selectedIsActive
                {
                    buttonColors[i].selectedIsActive = false
                }
            }
        }
    }
    
    internal func addButtonsViews()
    {
        let size = model.sizeButtons
        
        let count = model.myDrawViews.count
        
        let space = 8
        
        var frame = CGRect(x:0.0, y: 0.0, width: CGFloat(size) , height: CGFloat(size + space) * CGFloat(count))
        
        selectViewViews = UIView(frame: frame)
        
        selectViewViews.layer.position = CGPoint(x: CGFloat(self.view.frame.maxX) - CGFloat(size), y: self.view.frame.midY)
        
        selectViewViews.backgroundColor = .clear
        
        for i in 0..<count
        {
            frame = CGRect(x: 0, y: (size + space) * i, width: size, height: size)
            
            var buttonView:MyButton = MyButton(frame: frame)
            
            buttonView.tag = i
            
            buttonView.setTitle(String(i+1), for: .normal)
            
            if i == 0
            {
                model.myDrawViews[i].drawView.isUserInteractionEnabled = true
                
                viewButtonSelectedIndex = i
                
                buttonView.selectedIsActive = true
            }
            else
            {
                model.myDrawViews[i].drawView.isUserInteractionEnabled = false
            }
            
            buttonView.addTarget(self, action: #selector(buttonSelectViewDrawClicked(sender:)), for: .touchUpInside)
            
            self.buttonViews.append(buttonView)
            
            self.selectViewViews.addSubview(buttonView)
            
        }
        
        self.view.addSubview(selectViewViews)
        
    }
    
    @objc internal func buttonSelectViewDrawClicked(sender: MyButton)
    {
        self.viewButtonSelectedIndex = sender.tag
        
        for i in 0..<model.myDrawViews.count
        {
            model.myDrawViews[i].drawView.isUserInteractionEnabled = false
            
            if sender.tag == i
            {
                if !sender.selectedIsActive
                {
                    sender.selectedIsActive = true
                }
            }
            else
            {
                if buttonViews[i].selectedIsActive
                {
                    buttonViews[i].selectedIsActive = false
                }
            }
            
        }
        
        model.myDrawViews[sender.tag].drawView.isUserInteractionEnabled = true
        
        
        
        if justOneViewIsActive
        {
            
            setViewsIsHiddenTrue()
            
            
            self.model.myDrawViews[sender.tag].drawView.isHidden = false
            
            UIView.animate(withDuration: 1, animations:
                {
                    self.model.myDrawViews[sender.tag].drawView.layer.opacity = 1.0
                    
            }) { (bool) in
                
                
            }
        }
        
        
    }
    
    
    internal func refreshDrawViews()
    {
        for i in 0..<model.myDrawViews.count
        {
            print(model.myDrawViews[i].drawView.isHidden)
        }
    }
    
    internal func removeAllAnimations()
    {
        
        for i in 0..<model.myDrawViews.count
        {
            model.myDrawViews[i].drawView.layer.removeAllAnimations()
        }
        
    }
    
    internal func addAllParallax()
    {
        
        for i in 0..<model.myDrawViews.count
        {
            let drawView = model.myDrawViews[i].drawView
            
            let duration = CFTimeInterval(model.myDrawViews[i].duration)
            
            let translationType = model.myDrawViews[i].translationType
            
            addParallax(drawView: drawView!, duration: duration, translationType: translationType!)
        }
    }
    
    internal func addParallax(drawView: DrawView, duration: CFTimeInterval, translationType: TranslationType)
    {
        
        var key:String = "position"
        
        var fromValue:Any!
        
        var toValue:Any!
        
        var autoreverses:Bool!
        
        var isCumulative:Bool = false
        
        switch translationType
        {
        case .vertical:
            
            autoreverses = true
            
            fromValue   = NSValue(cgPoint: CGPoint(x: drawView.center.x, y: drawView.center.y - 100))
            
            toValue =  NSValue(cgPoint: CGPoint(x: drawView.center.x, y: drawView.center.y + 100))
            break
            
        case .horizontal:
            
            autoreverses = true
            
            fromValue =  NSValue(cgPoint: CGPoint(x: drawView.center.x - 100, y: drawView.center.y))
            
            toValue =  NSValue(cgPoint: CGPoint(x: drawView.center.x + 100, y: drawView.center.y))
            break
            
        case .diagonal1:
            
            autoreverses = true
            
            fromValue = NSValue(cgPoint: CGPoint(x: drawView.center.x + 100, y: drawView.center.y - 100))
            
            toValue =  NSValue(cgPoint: CGPoint(x: drawView.center.x - 100, y: drawView.center.y + 100))
            break
            
        case .diagonal2:
            
            autoreverses = true
            
            fromValue =  NSValue(cgPoint: CGPoint(x: drawView.center.x + 100, y: drawView.center.y + 100))
            
            toValue =  NSValue(cgPoint: CGPoint(x: drawView.center.x - 100, y: drawView.center.y - 100))
            break
            
        case .rotation1:
            
            key = "transform.rotation"
            
            autoreverses = false
            
            toValue = 0
            
            fromValue = NSNumber(value: -(Double.pi * 2.0))
            
            isCumulative = true
            
            drawView.layer.bounds = self.view.frame
            
            drawView.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
            
            drawView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            drawView.setNeedsDisplay()
            
            break
            
        case .rotation2:
            
            key = "transform.rotation"
            
            autoreverses = false
            
            toValue = 0
            
            fromValue = NSNumber(value: (Double.pi * 2.0))
            
            isCumulative = true
            
            drawView.layer.bounds = self.view.frame
            
            drawView.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
            
            drawView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            drawView.setNeedsDisplay()
            
            break
            
        default:
            
            autoreverses = true
            
            fromValue = NSValue(cgPoint: CGPoint(x: drawView.center.x - 100, y: drawView.center.y))
            
            toValue = NSValue(cgPoint: CGPoint(x: drawView.center.x + 100, y: drawView.center.y))
            break
            
        }
        
        var animation:CABasicAnimation = CABasicAnimation(keyPath: key)
        
        animation.autoreverses = autoreverses
        
        animation.fromValue = fromValue
        
        animation.toValue = toValue
        
        animation.duration = duration
        
        animation.repeatCount = .infinity
        
        drawView.layer.add(animation, forKey: key)
        
        
    }
    
    internal func insertGradient()
    {
        gradient = CAGradientLayer()
        
        let colors = model.gradientColorsFrom.map({
            (value:UIColor) -> CGColor in
            
            return value.cgColor
        })
        
        gradient.colors = colors
        
        gradient.locations = [0.0 , 1.0]
        
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
        
        var fromColors = gradient?.colors
        
        var toColors =  model.gradientColorsTo.map({
            (value:UIColor) -> CGColor in
            
            return value.cgColor
        })
        
        gradient!.colors = toColors
        
        var animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        
        animation.fromValue = fromColors
        
        animation.toValue = toColors
        
        animation.duration = 4.00
        
        animation.repeatCount = Float.infinity
        
        animation.autoreverses = true
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        gradient?.add(animation, forKey:"animateGradient")
        
    }
    
}
