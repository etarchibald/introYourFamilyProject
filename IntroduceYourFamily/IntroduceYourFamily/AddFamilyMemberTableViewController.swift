//
//  AddFamilyMemberTableViewController.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 10/25/23.
//

import UIKit

protocol NewFamilyMember {
    func newFamilyMember(name: String, picture: String, moreInfo: String)
}

class AddFamilyMemberTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moreInfoTextView: UITextView!
    
    var delagate: NewFamilyMember?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func choosePhotoPressed(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source:", message: nil, preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.sourceView = sender
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                imageController.sourceType = .camera
                self.present(imageController, animated: true)
            }
            alertController.addAction(cameraAction)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            imageController.sourceType = .photoLibrary
            self.present(imageController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let base64 = imageView.image!.base64
        
        if let name = nameTextField.text, let moreInfo = moreInfoTextView.text {
            delagate?.newFamilyMember(name: name, picture: base64!, moreInfo: moreInfo)
        }
    }
}

extension AddFamilyMemberTableViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        imageView.image = selectedImage
        dismiss(animated: true)
    }
    
}

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)!.base64EncodedString()
    }
}
