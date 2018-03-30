//
//  WebController.swift
//  HuntingLicense
//
//  Created by Duncan Stanton on 3/27/18.
//  Copyright © 2018 Charlie Stanton. All rights reserved.
//

import UIKit

struct State: Decodable {
    let name: String
    let url: String
}

class WebController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Picker
    @IBOutlet weak var pickerView: UIPickerView!
    //Submit btn
    @IBOutlet weak var submitBtn: UIButton!
    //State label
    @IBOutlet weak var stateLabel: UILabel!
    //URL label
    @IBOutlet weak var urlLabel: UILabel!
    //WebView - Testing to pass url value from pickerview to webview as the url that is launched (URLRequest)
    @IBOutlet weak var webPageView: UIWebView!
    
    var selectedURL = ""
    var states = [State]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let urlString = URL(string: "https://raw.githubusercontent.com/duncan1717/States-Wildlife-Url-List/master/StatesURL.json")
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            if error == nil {
                do{
                  self.states = try JSONDecoder().decode([State].self, from: data!)
                }catch {
                    print("Parse Error")
                }
                DispatchQueue.main.async {
                    self.pickerView.reloadComponent(0)
                }
            }
        }.resume()
    }//end viewDidLoad

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //UIPickerViewDataSource, UIPickerViewDelegate, delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
      return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row].name
    }
    
    //delegate method
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Kansas has an index of 19 in the pickerview
        let selectedState = states[row].name
        let selectedURL = states[row].url
        stateLabel.text = selectedState
        urlLabel.text = selectedURL
        //let myURL = NSURL(string:selectedURL)
        
        //if(row == 0)
        //{
        //Alabama
         //self.webPageView.loadRequest(URL(string: selectedURL))
         //Try this next
             //---- let myURL = NSURL(string: “http://www.Alabama.com”);
        //} else if(row == 1) //Alaska
        //{
            //let myURL = NSURL(string: "http://www.Alaska.com");
        }
        
        //let url = URL(string: urlString)!
        
        ///////////
        //if let urlString = self.urlString, let url = URL(string: urlString)
        //{
          //  self.webBrowser.loadRequest(URLRequest(url: url))
       // }
    //}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let browserController = segue.destination as! BrowserController
        
        let text = selectedURL
        if text != nil{
            browserController.text = text
        } else{
            print("Error")
        }
        
    }
    
    //Click Submit btn  - Should take url value (string from JSON file) assigned to selected PickerView, assign url value to variable, when button is clicked the url variable should be sent to the BrowserController and used as URL - hence selecting an item in pickerview, hitting submit, and launching selected pickerview url in another page automatically
   // @IBAction func clickSubmitBtn(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "BrowserSegue", sender: nil)
       // let browserController = BrowserController()
       // browserController.text = selectedURL
       // self.present(browserController, animated: true, completion: nil)
   // }
    
    

}//end WebController
