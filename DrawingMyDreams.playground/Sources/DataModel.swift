import UIKit

public class DataModel
{
    static public var shared = DataModel()
    
    public var selectedColor:UIColor = .black
    
    public var colors:[UIColor] = []
    
    public var backgroundColor:UIColor = .white
    
    public var selectedLineWidth:Int = 5
    
    public var lineWidths:[Int] = []
    
    public var myDrawViews:[DrawViewEffect] = []
    
    public var sizeButtons:Int = 50
    
    public var borderDrawViewColor:UIColor = .gray
    
    public var twoTapsRecognizerIsActive = true
    
    public var gradientColorsFrom:[UIColor] = []
    
    public var gradientColorsTo:[UIColor] = []
    
    public var introIsActive:Bool = true
    
    public var crazyModeIsActive = false
    
    public var gradientIsActive = true
    
    init()
    {
        
    }
}

