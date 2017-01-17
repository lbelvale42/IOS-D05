//
//  SecondViewController.swift
//  Map
//
//  Created by Lucas BELVALETTE on 10/10/16.
//  Copyright © 2016 Lucas BELVALETTE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToPin" {
            let cell = sender as! TableViewCell!
            let vc = segue.destinationViewController as! FirstViewController
            vc.indexToZoom = cell.index
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Points.points.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell") as! TableViewCell
        cell.nameLabel.text = Points.points[indexPath.row].name
        cell.index = indexPath.row
        return cell
    }
}

