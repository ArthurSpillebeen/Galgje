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
    @IBOutlet weak var TV_History: UITextView!
    
    var galgjeSpel : GalgjeEngine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    @IBAction func clickBtnPlay(_ sender: UIButton) {
        var index = playPicker.selectedRow(inComponent: 0)
        var result = PvDatasourceDelegate.getLetter(playPicker.delegate as! PvDatasourceDelegate)(index: index)
       
        var speelinfo = galgjeSpel?.speel(letter: result)
        var galgjeImage = (UIImage)(named:speelinfo!.image)
        imgGalgje.image = galgjeImage
        var word = ""
        for letter in speelinfo!.woordArray
        
        {
            word += letter+" "
            
        }
        
        TV_History.text! += " \n " + word
        if(speelinfo!.correct)
        {
            let wrongAttempts = speelinfo?.numberOfWrongAttempts
            let winAlert = UIAlertController(title: "Gewonnen", message: "Geef hieronder uw naam in", preferredStyle: UIAlertController.Style.alert);
            winAlert.addTextField { (textField) in textField.text = ""}
            let OK = UIAlertAction(title: "Opslaan", style: .default) { [self] (alertAction) in
                    let textField = winAlert.textFields![0] as UITextField
                    let naam = textField.text?.count
                    if naam != 0 {
                        var userScore = String(naam!) + " - " + String(wrongAttempts!)
                        (self.navigationController?.viewControllers[0] as! ProtocolRVC).addUsers(user: userScore)
                        
                        
                        
                    
                        
                        
                     
                    }
                    else {
                        
                        
                    
                    
                }
            }
            
            winAlert.addAction(OK)
            self.present(winAlert, animated: true, completion: nil)
            
        }
        if(speelinfo!.numberOfWrongAttempts >= 11)
        {
            let lostAlert = UIAlertController(title: "Verloren", message: "Galgje verloren", preferredStyle: UIAlertController.Style.alert);
            
            let OK = UIAlertAction(title: "ok", style: .default) { [self] (alertAction) in
                    galgjeSpel = nil
                    imgGalgje.image = (UIImage)(named:"")
                    TV_History.text! = "_ _ _ _ _ _"
                    
            }
            
            lostAlert.addAction(OK)
            self.present(lostAlert, animated: true, completion: nil)
        }
        
        
        
    }
    @IBAction func clickBtnStartGame(_ sender: UIButton) {
        let instellenWoord = UIAlertController(title: "GALGJE", message: "Geef woord van 6 letters...", preferredStyle: UIAlertController.Style.alert);
        instellenWoord.addAction(UIAlertAction(title: "Annuleer", style: UIAlertAction.Style.default, handler: nil))
        //alert.addAction(UIAlertAction(title: "Bewaar",style: UIAlertAction.Style.default, handler: nil))
        instellenWoord.addTextField { (textField) in textField.text = "woord"}
        
        
        let OK = UIAlertAction(title: "OK", style: .default) { [self] (alertAction) in
                let textField = instellenWoord.textFields![0] as UITextField
            let woordTekens = textField.text?.count
            
                if woordTekens == 6 {
                    
                    galgjeSpel = (GalgjeEngine(newWord: textField.text!) )
                    print(galgjeSpel?.word,galgjeSpel?.currImage)
                
                    
                    
                 
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
