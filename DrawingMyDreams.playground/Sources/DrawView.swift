
import UIKit

public class DrawView: UIView
{
    private var touch : UITouch!
    
    private var lineArray : [[CGPoint]] = [[CGPoint]()]
    
    private var colorArray:[UIColor] = []
    
    private var lineWidthArray:[Int] = []
    
    private var index = -1
    
    private let model = DataModel.shared
    
    public func clear()
    {
        lineArray.removeAll()
        
        colorArray.removeAll()
        
        lineWidthArray.removeAll()
        
        lineArray = [[CGPoint]()]
        
        colorArray = []
        
        lineWidthArray = []
        
        index = -1
        
        drawArt(self.frame)
        
    }
    
    override public init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        self.layer.borderColor = model.borderDrawViewColor.cgColor
        
        self.layer.borderWidth = 2
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        touch = touches.first! as UITouch
        
        let lastPoint = touch.location(in: self)
        
        index += 1
        
        lineArray.append([CGPoint]())
        
        lineArray[index].append(lastPoint)
        
        colorArray.append(model.selectedColor)
        
        lineWidthArray.append(model.selectedLineWidth)
        
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        touch = touches.first! as UITouch
        
        let currentPoint = touch.location(in: self)
        
        self.setNeedsDisplay()
        
        lineArray[index].append(currentPoint)
        
    }
    
    private func drawArt(_ rect: CGRect)
    {
        if(index >= 0)
        {
            let context = UIGraphicsGetCurrentContext()
            
            context!.setLineCap(.round)
            
            var j = 0
            
            while( j <= index )
            {
                context!.beginPath()
                
                var i = 0
                
                context?.move(to: lineArray[j][0])
                
                while(i < lineArray[j].count)
                {
                    context?.addLine(to: lineArray[j][i])
                    
                    i += 1
                }
                
                if model.crazyModeIsActive && index >= 0
                {
                    
                    let randLineWidth = arc4random_uniform(UInt32(50))
                    
                    let randColor = arc4random_uniform(UInt32(model.colors.count))
                    
                    let randAlpha = CGFloat(arc4random_uniform(UInt32(10)))/10
                    
                    context?.setAlpha(randAlpha)
                    context!.setStrokeColor((model.colors[Int(randColor)]).cgColor)
                    context!.setLineWidth(CGFloat(randLineWidth))
                    
                }
                else
                {
                    context!.setStrokeColor((colorArray[j]).cgColor)
                    
                    context!.setLineWidth(CGFloat(lineWidthArray[j]))
                }
                
                context!.strokePath()
                j += 1
            }
        }
        else
        {
            let context = UIGraphicsGetCurrentContext()
            
            context?.clear(rect)
            
            context?.flush()
            
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect)
    {
        drawArt(rect)
    }
}
