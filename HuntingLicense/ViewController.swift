//
//  ViewController.swift
//  HuntingLicense
//
//  Created by Duncan Stanton on 3/25/18.
//  Copyright © 2018 Charlie Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var imgDriverLicense: UIImageView!
    
    @IBOutlet weak var btnChooseImage: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    //Picker view for State **********************************************************************************************************************
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var selectionBtn: UIButton!
    
    let states = [
        [
        "title": "Alabama",
         "link": "https://www.alabamainteractive.org/dcnr_hf_license/welcome.action?apk=hf"
        ],
        ["title": "Alaska"],
        ["title": "Arizona"],
        ["title": "Arkansas"],
        ["title": "California"],
        ["title": "Colorado"],
        ["title": "Connecticut"],
        ["title": "Deleware"],
        ["title": "Florida"],
        ["title": "Georgia"],
        ["title": "Hawaii"],
        ["title": "Idaho"],
        ["title": "Illinois"],
        ["title": "Indiana"],
        ["title": "Iowa"],
        ["title": "Kansas",
         "link": "https://www.kshuntfishcamp.com/home.page"],
        ["title": "Kentucky"],
        ["title": "Louisiana"],
        ["title": "Maine"],
        ["title": "Maryland"],
        ["title": "Massachusetts"],
        ["title": "Michigan"],
        ["title": "Minnesota"],
        ["title": "Mississippi"],
        ["title": "Missouri"],
        ["title": "Montana"],
        ["title": "Nebraska"],
        ["title": "Nevada"],
        ["title": "New Hampshire"],
        ["title": "New Jersey"],
        ["title": "New Mexico"],
        ["title": "New York"],
        ["title": "North Carolina"],
        ["title": "North Dakota"],
        ["title": "Ohio"],
        ["title": "Oklahoma"],
        ["title": "Oregon"],
        ["title": "Pennsylvania"],
        ["title": "Rhode Island"],
        ["title": "South Carolina"],
        ["title": "South Dakota"],
        ["title": "Tennessee"],
        ["title": "Texas"],
        ["title": "Utah"],
        ["title": "Vermont"],
        ["title": "Virginia"],
        ["title": "Washington"],
        ["title": "West Virginia"],
        ["title": "Wisconsin"],
        ["title": "Wyoming"]
        
    ]
    
    @IBAction func selectPressed(_ sender: UIButton) {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }//numberOfComponents
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return states.count
    }//pickerView(numberOfRowsInComponent)
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]["title"]
    }//pickerView(titleForRow)
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  selectionBtn.setTitle(states[row], for: .normal)
        pickerView.isHidden = true
    }//pickerView(didSelectRow)
    
    //end picker view for state ************************************************************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//end viewDidLoad()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imgDriverLicense.layer.cornerRadius = imgDriverLicense.bounds.width
        self.imgDriverLicense.layer.borderWidth = 0
        self.imgDriverLicense.layer.borderColor = UIColor.lightGray.cgColor
        self.btnChooseImage.layer.cornerRadius = 0
    }//end viewDidLayoutSubviews()
    
    @IBAction func btnChooseImageOnClick(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        //If you want work actionsheet on opad then you have to use popoverPresentationController to present the actionsheet, otherwise the app will crash in an iPad
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = sender.bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        self.present(alert, animated: true, completion: nil)
    }//end btnChooseImageOnClick()
    
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            //if you dont want to edit the photo then you can set allowsEditing to false
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        } else{
            let alert = UIAlertController(title: "Warning", message: "You don't have a camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }//end openCamera
    
    
    func openGallery(){
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //if you dont want to edit the photo then you can set allowsEditing to false
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    }//end openGallery
    
//MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //Get the image from the info dictionary
        //if no need to edit the photo, use UIImagePickerControllerOriginalImage instead of UIImagePickerControllerEditedImage
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            self.imgDriverLicense.image = editedImage
    }
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
}//end UIImagePickerControllerDelegate
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled")
    }//end imagePickerControllerDidCancel

}//end ViewController

