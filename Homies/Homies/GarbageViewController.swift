//
//  GarbageViewController.swift
//  Homies
//
//  Created by Eva on 4/24/16.
//  Copyright © 2016 samkhano. All rights reserved.
//

import UIKit

class GarbageViewController: UIViewController {
    
    var delegate : LoginDelegate?
    
    @IBOutlet weak var loserNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loserNameLabel.text = (delegate?.getCurrentUser().userHouse.getLoserName())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}