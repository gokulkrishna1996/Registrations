//
//  ViewController.swift
//  Registration
//
//  Created by Gokulkrishna Jayachandran on 14/2/21.
//

var carRegos = [RegistrationModel]()
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var regoResultsTable: UITableView!
    var index: Int = 0
    override func viewDidLoad() {
        
        regoResultsTable.delegate = self
        regoResultsTable.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //Initialising
        carRegos = []
        
        performRequest()
    }
    //Table Row Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carRegos.count
    }
    
    //Table Conent
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registrationCell", for: indexPath)as! MainTableViewCell
        self.index = indexPath.row
        cell.regoLabel?.text = carRegos[indexPath.row].registration
        cell.carDetailsLabel?.text = String("\(carRegos[indexPath.row].make) \(carRegos[indexPath.row].model)")
        if(carRegos[indexPath.row].expired == true)
        {
            cell.regoStatusLabel?.text = "Expired"
            cell.regoStatusLabel.textColor = UIColor.red
        }else{
            cell.regoStatusLabel?.text = "On Going"
            cell.regoStatusLabel.textColor = UIColor.systemGreen
        }
        
        
        return cell
    }
    
    //Table cell on selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath.row
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    //Sending variables though segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.index = index
            destinationVC.carDetails = carRegos
            
        }
    }
    
    
    //API CALL to https://dl.dropboxusercontent.com/s/wcp5aajrrx533bp/snsw_registrations_api.json
    func performRequest() {
                if let url = URL(string: "https://dl.dropboxusercontent.com/s/wcp5aajrrx533bp/snsw_registrations_api.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                if let safeData = data {
                    if let registration = self.parseJSON(safeData) {
                    }
                }
            }
            task.resume()
        }
    }
    //Parseing JSON data
    func parseJSON(_ regoData: Data) -> RegistrationModel? {

        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RegistrationData.self, from: regoData)
            let regos = decodedData.registrations
            for data in regos{
                let rego = data.plate_number
                let status = data.registration.expired
                let expirary = data.registration.expiry_date
                let type = data.vehicle.type
                let make = data.vehicle.make
                let model = data.vehicle.model
                let colour = data.vehicle.colour
                let vin = data.vehicle.vin
                let tare_weight = data.vehicle.tare_weight
                let gross_mass = data.vehicle.gross_mass
                let name = data.insurer.name
                let code = data.insurer.code
                
                //Date format Conversion
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
                let date = dateFormatter.date(from:expirary)!
                dateFormatter.dateFormat = "dd MMMM yy"
                let fromattedDate = dateFormatter.string(from: date)
                
                //Remaining Months Calculation
                let currentDate = Date()
                let diffs = Calendar.current.dateComponents([.year, .month, .day], from: currentDate, to: date)
            
                let remainingMonths = diffs.month!
                
                //Storing Data to structmodel
                let registration = RegistrationModel(cregistration: rego, cexpired: status, cexpiryDate: fromattedDate, ctype: type, cmake: make, cmodel: model, ccolour: colour, cvin: vin, ctare_weight: tare_weight, cgross_mass: gross_mass, cname: name, ccode: code, cremainingMonths: remainingMonths)
                
                carRegos.append(registration)
                DispatchQueue.main.async {
                    self.regoResultsTable.reloadData()
                }

            }

            return nil
            } catch {
                print("error")
                return nil
            }
        
        }
        
        
    }



