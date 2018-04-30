//
//  ViewController.swift
//  StopWatch
//
//  Created by Allen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var counter = 5
    
    var histories = [History] ()
    
    let userDefaults = UserDefaults.standard
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.counter = userDefaults.integer(forKey: "counter")
        
        timeLabel.text = String(counter)
        
        if let decoded  = userDefaults.object(forKey: "histories") as? Data {
            self.histories = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [History]
        }
        
        NSLog("%@", String(self.histories.count) )
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBAction func resetCounter(_ sender: UIButton) {
        self.counter = 0
        
        updateCounter(counter: counter)
        
        updateHistory(counter: counter)
    }
    
    @IBAction func descreaseCounter(_ sender: UIButton) {
        self.counter -= 1
        updateCounter(counter: counter)
        
        // print test histories
        
        if let decoded  = userDefaults.object(forKey: "histories") as? Data {
            self.histories = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [History]
        }
        
        // NSLog("print history %@", histories[0].count)
        
    }
    
    @IBAction func increaseCounter(_ sender: UIButton) {
        self.counter += 1
        
        updateCounter(counter: counter)
        
        // test print out histories
    }
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    func updateHistory(counter: Int){
        
        let from = Date()
        let to = Date()
        
        histories.append(History(id: 1, period: "test", count: 10, from: from, to: to))
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: histories)
        
        userDefaults.set(encodedData, forKey: "histories")
        
        userDefaults.synchronize()
        
    }
    
    func updateCounter(counter : Int) {
        timeLabel.text = String(counter)
        
        // persist counter
        userDefaults.set(counter, forKey: "counter")
    }
}

