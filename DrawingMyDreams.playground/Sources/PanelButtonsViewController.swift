import UIKit

extension ViewController
{
    internal func initializePanelButtons()
    {
        let size = CGFloat(model.sizeButtons) * 1.2
        
        buttonPanel.append(addButtonGradient(size: size))
        
        buttonPanel.append(addButtonBug(size: size))
        
        buttonPanel.append(addButtonPlay(size: size*1.2))
        
        buttonPanel.append(addButtonJustOneView(size: size))
        
        buttonPanel.append(addButtonClearViewButton(size: size))
        
        
        let count = buttonPanel.count
        
        let frame = CGRect(x:0, y: 0, width: CGFloat(count)*(size + 10), height: size)
        
        panelView = UIView(frame: frame)
        
        for i in 0..<count
        {
            buttonPanel[i].layer.position = CGPoint(x: (size/2.0) + 5 + (size + 10)*CGFloat(i) , y: size/2.0)
            
            panelView.addSubview(buttonPanel[i])
        }
        
        panelView.layer.position = CGPoint(x: self.view.frame.midX, y: CGFloat(size)*1.2)
        
        self.view.addSubview(panelView)
    }
    
    internal func addButtonGradient(size: CGFloat) -> PanelButton
    {
        let frame = CGRect(x:0, y: 0, width: size, height: size)
        
        buttonGradient = PanelButton(frame: frame)
        
        buttonGradient.setTitle("Gradient", for: .normal)
        
        buttonGradient.addTarget(self, action: #selector(buttonGradientClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        if model.gradientIsActive
        {
            buttonGradient.selectedIsActive = true
        }
        
        return buttonGradient
    }
    
    @objc internal func buttonGradientClicked(sender: PanelButton)
    {
        if model.gradientIsActive
        {
            gradient.removeFromSuperlayer()
            
            sender.selectedIsActive = false
        }
        else
        {
            insertGradient()
            
            sender.selectedIsActive = true
        }
        
        model.gradientIsActive = !model.gradientIsActive
    }
    
    
    
    internal func addButtonJustOneView(size: CGFloat) -> PanelButton
    {
        let frame = CGRect(x:0, y: 0, width: size, height: size)
        
        buttonJustOneView = PanelButton(frame: frame)
        
        buttonJustOneView.setTitle("View", for: .normal)
        
        buttonJustOneView.addTarget(self, action: #selector(buttonJustOneViewClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return buttonJustOneView
    }
    
    @objc internal func buttonJustOneViewClicked(sender: PanelButton)
    {
        if justOneViewIsActive
        {
            setViewsIsHiddenFalse()
            
            sender.selectedIsActive = false
            
        }
        else
        {
            setViewsIsHiddenTrue()
            
            sender.selectedIsActive = true
            
        }
        
        justOneViewIsActive = !justOneViewIsActive
    }
    
    internal func setViewsIsHiddenTrue()
    {
        for i in 0..<model.myDrawViews.count
        {
            if viewButtonSelectedIndex != i
            {
                UIView.animate(withDuration: 1, animations:
                    {
                        self.model.myDrawViews[i].drawView.layer.opacity = 0.0
                        
                }) { (bool) in
                    
                    self.model.myDrawViews[i].drawView.isHidden = true
                }
            }
        }
    }
    
    internal func setViewsIsHiddenFalse()
    {
        for i in 0..<model.myDrawViews.count
        {
            
            self.model.myDrawViews[i].drawView.isHidden = false
            
            UIView.animate(withDuration: 1, animations:
                {
                    self.model.myDrawViews[i].drawView.layer.opacity = 1.0
                    
            }) { (bool) in
                
                
            }
            
        }
        
    }
    
    @objc internal func buttonPlayClicked(sender: PanelButton)
    {
        if parallaxEffectActive
        {
            sender.selectedIsActive = false
            
            buttonPlayStopEffect.setTitle("Play", for: .normal)
            
            removeAllAnimations()
            
            parallaxEffectActive = !parallaxEffectActive
        }
        else
        {
            sender.selectedIsActive = true
            
            buttonPlayStopEffect.setTitle("Stop", for: .normal)
            
            addAllParallax()
            
            parallaxEffectActive = !parallaxEffectActive
        }
    }
    
    internal func addButtonPlay(size: CGFloat) -> PanelButton
    {
        let frame = CGRect(x:0, y: 0, width: size, height: size)
        
        buttonPlayStopEffect = PanelButton(frame: frame)
        
        buttonPlayStopEffect.setTitle("Start", for: .normal)
        
        buttonPlayStopEffect.addTarget(self, action: #selector(buttonPlayClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return buttonPlayStopEffect
    }
    internal func addButtonBug(size: CGFloat) -> PanelButton
    {
        let frame = CGRect(x:0, y: 0, width: size, height: size)
        
        buttonBug = PanelButton(frame: frame)
        
        buttonBug.setTitle("Bug", for: .normal)
        
        buttonBug.addTarget(self, action: #selector(buttonBugClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return buttonBug
    }
    
    @objc internal func buttonBugClicked(sender: PanelButton)
    {
        if model.crazyModeIsActive
        {
            sender.selectedIsActive = false
            
        }
        else
        {
            sender.selectedIsActive = true
        }
        
        model.crazyModeIsActive = !model.crazyModeIsActive
        
        refreshDrawViews()
    }
    
    internal func addButtonClearViewButton(size: CGFloat) -> PanelButton
    {
        let frame = CGRect(x:0, y: 0, width: size, height: size)
        
        clearButton = PanelButton(frame: frame)
        
        clearButton.setTitle("Clear", for: .normal)
        
        clearButton.addTarget(self, action: #selector(buttonClearViewClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        return clearButton
    }
    
    @objc internal func buttonClearViewClicked(sender: PanelButton)
    {
       
        UIView.animate(withDuration: 0.3, animations:
            {
              self.model.myDrawViews[self.viewButtonSelectedIndex].drawView.layer.opacity = 0.0
                
        }) { (bool) in
            self.model.myDrawViews[self.viewButtonSelectedIndex].drawView.clear()
            self.model.myDrawViews[self.viewButtonSelectedIndex].drawView.layer.opacity = 1.0
        }
    }
}

