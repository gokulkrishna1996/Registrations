//
//  ViewController.swift
//  Registrations
//
//  Created by Gokulkrishna Jayachandran on 14/2/21.
//

import UIKit

class DetailsViewController: UIViewController {
     
    var index: Int!
    var carDetails = [RegistrationModel]()
    
    @IBOutlet weak var regoLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var monthsLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var makeLabel: UILabel!
    
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var colourLabel: UILabel!
    
    @IBOutlet weak var vinLabel: UILabel!
    
    @IBOutlet weak var tareWeightLabel: UILabel!
    
    @IBOutlet weak var grossMassLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if carDetails != nil && index != nil{
            regoLabel.text = carDetails[index].registration
            statusLabel.text = String(carDetails[index].expired)
            dateLabel.text = String(carDetails[index].expiryDate)
            
            //Remaining Months Conditioning to display
            
            let monthsRemaining = carDetails[index].remainingMonths!
            if (monthsRemaining >= 0){
                monthsLabel.text = String("\(monthsRemaining) Months")
                monthsLabel.textColor  = UIColor.systemGreen
            }else{
                monthsLabel.text = String("Expired \(abs(monthsRemaining)) Months ago")
                monthsLabel.textColor  = UIColor.red
            }
            typeLabel.text = carDetails[index].type
            makeLabel.text = carDetails[index].make
            modelLabel.text = carDetails[index].model
            colourLabel.text = carDetails[index].colour
            
            //Converting VIN to display last 4 digits
            let vin = carDetails[index].vin.suffix(4)
            vinLabel.text = String("*******\(vin)")
            tareWeightLabel.text = String(carDetails[index].tare_weight)
            
            //Conditioning Gross MAss to handel NUll
            if carDetails[index].gross_mass != nil{
                
                grossMassLabel.text = String(carDetails[index].gross_mass!)
            } else{
                grossMassLabel.text = "N/A"
            }
            nameLabel.text = carDetails[index].name
            codeLabel.text = String(carDetails[index].code!)
            
        }
    }
    
}


