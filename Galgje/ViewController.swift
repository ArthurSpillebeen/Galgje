//
//  ViewController.swift
//  Galgje
//
//  Created by docent on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pvResult: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "tableVC")
        //(vc as! PlayerTableViewController).users = ["xxx", "yyy"]
        //self.navigationController?.pushViewController(vc!, animated: true)
        pvResult.selectedRow(inComponent: 0)
        PvDatasourceDelegate.getLetter(pvResult.delegate as! PvDatasourceDelegate)
        
    }


}

