//
//  ViewController.swift
//  machineTest-Vivek
//
//  Created by Admin on 30/08/21.
//
//   obj c Ref 1: https://stackoverflow.com/questions/3928862/instagram-image-filters-on-iphone
//  swift ref: https://blog.avenuecode.com/how-to-use-uikit-for-low-level-image-processing-in-swift
//

import UIKit


class ViewController: UIViewController  {

    @IBOutlet weak var imgHolder: UIImageView!
    
    var imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func btnAcnSelectImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("open Gallery")
            imgPicker.delegate = self
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = false
            present(imgPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnAcnFilterRed(_ sender: UIButton){
        
//        self.imgHolder.image = ImageFilter().applyFilter(.redScaleUp, to: imgHolder.image!)
        self.imgHolder.image = imgHolder.image?.adjust(2, g: 0, b: 0)
        self.imgHolder.contentMode = .scaleAspectFill
    }
    
    
}

extension ViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        self.imgHolder.image = selectedImage
        self.imgHolder.contentMode = .scaleAspectFill
    
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled Gallery")
        self.dismiss(animated: true, completion: nil)
    }
    
}

