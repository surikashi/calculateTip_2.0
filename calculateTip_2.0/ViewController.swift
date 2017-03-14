//
//  ViewController.swift
//  calculateTip_2.0
//
//  Created by Surabhi on 3/7/17.
//  Copyright © 2017 Surabhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var billLabel: UITextField!

    @IBOutlet weak var tipLabel: UILabel!
   
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalTitle: UITextField!
    @IBOutlet weak var tipTitle: UITextField!
    
    @IBOutlet weak var settingsBut: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        
        //set the tip to the default value set in settings page
        let defaults = UserDefaults.standard
        let tipValue = defaults.integer(forKey: "defaultTipSelection")
        tipControl.selectedSegmentIndex = tipValue
        calculateTip(self)
        
        //play with animations
        //secondView.center.x = view.bounds.width
        //set the default theme selected
        let themeValue = defaults.integer(forKey:"defaultThemeSelection")
        if (themeValue == 1)
        {
            lightTheme()
        }
        if(themeValue == 2)
        {
            darkTheme()
        }
        if(themeValue==0)
        {
            originalTheme()
        }
        
    }
    func lightTheme()
    {
        let lightbgColor = UIColor(red:255.0/255, green:249.0/255,blue:239.0/255,alpha:1.0)
        secondView.backgroundColor = lightbgColor
        let frlightbgColor = UIColor(red:255.0/255,green:249.0/255, blue:216.0/255,alpha :1.0)
        firstView.backgroundColor = frlightbgColor
        let lightTintColor = UIColor(red:84.0/255,green:101.0/255,blue:131.0/255,alpha:1.0)
        tipControl.tintColor = lightTintColor
        
        tipLabel.textColor = lightTintColor
        tipTitle.textColor = lightTintColor
        totalLabel.textColor = lightTintColor
        totalTitle.textColor = lightTintColor
        settingsBut.tintColor = lightTintColor
        
    }
    func darkTheme()
    {
        secondView.backgroundColor = UIColor.gray
        firstView.backgroundColor = UIColor.lightGray
        tipLabel.textColor = UIColor.white
        totalLabel.textColor = UIColor.white
        tipControl.tintColor = UIColor.white
        tipTitle.textColor = UIColor.white
        totalTitle.textColor = UIColor.white
        settingsBut.tintColor = UIColor.white
        
    }
    func originalTheme()
    {
        let customColor = UIColor (red:255.0/255, green:239.0/255, blue:253.0/255 ,alpha:1.0)
        let frCustomColor = UIColor(red:255.0/255, green:198.0/255, blue:228.0/255,alpha:1.0)
        firstView.backgroundColor = frCustomColor
        secondView.backgroundColor = customColor
        let defaultTextColor = UIColor(red:255.0/255, green:101.0/255, blue:131.0/255,alpha:1.0)
        tipLabel.textColor = defaultTextColor
        totalLabel.textColor = defaultTextColor
        tipControl.tintColor = defaultTextColor
        tipTitle.textColor = defaultTextColor
        totalTitle.textColor = defaultTextColor
        settingsBut.tintColor = defaultTextColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.secondView.alpha = 0
       }
    
    @IBAction func changeTip(_ sender: Any) {
        calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.15,0.18,0.2]
        
        let bill = Double(billLabel.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func beginTyping(_ sender: Any) {
        //self.firstView.alpha = 0
        //self.secondView.alpha = 1
        
        UIView.animate(withDuration: 1.0, animations:{
            self.firstView.alpha = 1
            self.secondView.alpha = 1
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        [self.billLabel .becomeFirstResponder()]
    }
    
}

