//
//  SettingsViewController.swift
//  calculateTip_2.0
//
//  Created by Surabhi on 3/8/17.
//  Copyright © 2017 Surabhi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var settingsPage: UIView!
    
    @IBOutlet weak var defaultTip: UISegmentedControl!

    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var defaultTheme: UISegmentedControl!
    
    @IBOutlet weak var defaultThemeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        //The default Tip selected by the user should be persistent
        let tipValue = defaults.integer(forKey: "defaultTipSelection")
        defaultTip.selectedSegmentIndex = tipValue
        //Theme seleted by the user should be persistent
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let themeValue = defaults.integer(forKey: "defaultThemeSelection")
        defaultTheme.selectedSegmentIndex = themeValue
        defaults.set(defaultTheme.selectedSegmentIndex,forKey: "defaultThemeSelection")
        print("settings page")
        print (defaultTheme.selectedSegmentIndex)
        if (defaultTheme.selectedSegmentIndex == 1)
        {
            lightTheme()
        }
        if(defaultTheme.selectedSegmentIndex == 2)
        {
            darkTheme()
        }
        if(defaultTheme.selectedSegmentIndex==0)
        {
            originalTheme()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func setDefault(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "defaultTipSelection")
        print ("settings page")
        print(defaultTip.selectedSegmentIndex)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setTheme(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTheme.selectedSegmentIndex,forKey: "defaultThemeSelection")
        print("settings page")
        print (defaultTheme.selectedSegmentIndex)
        if (defaultTheme.selectedSegmentIndex == 1)
        {
            lightTheme()
        }
        if(defaultTheme.selectedSegmentIndex == 2)
        {
            darkTheme()
        }
        if(defaultTheme.selectedSegmentIndex==0)
        {
            originalTheme()
        }
        
    }
    
    func lightTheme()
    {
        let lightbgColor = UIColor(red:255.0/255, green:249.0/255,blue:216.0/255,alpha:1.0)
        settingsPage.backgroundColor = lightbgColor
        
        let lightTintColor = UIColor(red:84.0/255,green:101.0/255,blue:131.0/255,alpha:1.0)
        defaultTip.tintColor = lightTintColor
        defaultTheme.tintColor = lightTintColor
        defaultTipLabel.textColor = lightTintColor
        defaultThemeLabel.textColor = lightTintColor
        
    }
    func darkTheme()
    {
        settingsPage.backgroundColor = UIColor.gray
        defaultTipLabel.textColor = UIColor.white
        defaultThemeLabel.textColor = UIColor.white
       defaultTip.tintColor = UIColor.white
        defaultTheme.tintColor = UIColor.white
    }
    func originalTheme()
    {
        let customColor = UIColor (red:255.0/255, green:239.0/255, blue:253.0/255 ,alpha:1.0)
        settingsPage.backgroundColor = customColor
        let defaultTextColor = UIColor(red:255.0/255, green:101.0/255, blue:131.0/255,alpha:1.0)
        defaultTipLabel.textColor = defaultTextColor
        defaultThemeLabel.textColor = defaultTextColor
        defaultTip.tintColor = defaultTextColor
        defaultTheme.tintColor = defaultTextColor
        
    }
}
