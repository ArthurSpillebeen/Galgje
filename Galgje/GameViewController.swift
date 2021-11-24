//
//  GameViewController.swift
//  Galgje
//
//  Created by docent on 24/11/2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var playPicker: UIPickerView!
    @IBOutlet weak var btnStartSpel: UIButton!
    @IBOutlet weak var imgGalgje: UIImageView!
    @IBOutlet weak var lblHistory: UILabel!
    
    var galgjeSpel : GalgjeEngine? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    @IBAction func clickBtnPlay(_ sender: UIButton) {
        var index = playPicker.selectedRow(inComponent: 0)
        var result = PvDatasourceDelegate.getLetter(playPicker.delegate as! PvDatasourceDelegate)(index: index)
       
        var speelinfo = galgjeSpel?.speel(letter: result)
        imgGalgje.image = (UIImage)(named:speelinfo!.image)
        var word = ""
        for letter in speelinfo!.woordArray
        {
            word += letter
        }
        lblHistory.text! += word
        
        
        
    }
    @IBAction func clickBtnStartGame(_ sender: UIButton) {
        let instellenWoord = UIAlertController(title: "GALGJE", message: "Geef woord van 6 letters...", preferredStyle: UIAlertController.Style.alert);
        instellenWoord.addAction(UIAlertAction(title: "Annuleer", style: UIAlertAction.Style.default, handler: nil))
        //alert.addAction(UIAlertAction(title: "Bewaar",style: UIAlertAction.Style.default, handler: nil))
        instellenWoord.addTextField { (textField) in textField.text = "woord"}
        
        
        let OK = UIAlertAction(title: "OK", style: .default) { [self] (alertAction) in
                let textField = instellenWoord.textFields![0] as UITextField
                
                if textField.text?.count == 6 {
                    galgjeSpel = (GalgjeEngine(newWord: textField.text!) )
                    
                 
                }
            else {
                
                
            }
        }
        
        
        instellenWoord.addAction(OK)
        self.present(instellenWoord, animated: true, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
