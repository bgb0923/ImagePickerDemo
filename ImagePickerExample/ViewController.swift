//
//  ViewController.swift
//  ImagePickerExample
//
//  Created by William Brancato on 3/15/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let picker: UIImagePickerController = UIImagePickerController()
    
    let cameraButton = UIButton()
    let libraryButton = UIButton()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.view.backgroundColor = UIColor.white
        self.buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func goToCamera() {
        if UIImagePickerController.availableCaptureModes(for: .front) != nil {
            self.picker.allowsEditing = false
            self.picker.sourceType = UIImagePickerControllerSourceType.camera
            self.picker.cameraCaptureMode = .photo
            self.picker.modalPresentationStyle = .fullScreen
            self.present(picker, animated: true, completion: nil)
        } else {
            let noCameraAlert = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            noCameraAlert.addAction(okAction)
            self.present(noCameraAlert, animated: true, completion: nil)
        }
    }
    
    func goToLibrary() {
        self.picker.allowsEditing = false
        self.picker.sourceType = .photoLibrary
        self.picker.modalPresentationStyle = .popover
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = chosenImage
        self.dismiss(animated: true, completion: nil)
    }

    func buildView() {
        
        // set UI element constraints
        self.view.addSubview(self.cameraButton)
        self.cameraButton.translatesAutoresizingMaskIntoConstraints = false
        self.cameraButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        self.cameraButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.cameraButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        self.cameraButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.40).isActive = true
        
        self.view.addSubview(self.libraryButton)
        self.libraryButton.translatesAutoresizingMaskIntoConstraints = false
        self.libraryButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        self.libraryButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.libraryButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        self.libraryButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.40).isActive = true
        
        self.view.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.cameraButton.topAnchor, constant: -20).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.imageView.backgroundColor = UIColor.gray
        
        // set button titles
        self.cameraButton.setTitleColor(.blue, for: .normal)
        self.cameraButton.setTitleColor(.black, for: .highlighted)
        self.cameraButton.titleLabel?.lineBreakMode = .byWordWrapping
        self.cameraButton.titleLabel?.textAlignment = .center
        self.cameraButton.setTitle("Take Photo\nWith Camera", for: .normal)
        
        self.libraryButton.setTitleColor(.blue, for: .normal)
        self.libraryButton.setTitleColor(.black, for: .highlighted)
        self.libraryButton.titleLabel?.lineBreakMode = .byWordWrapping
        self.libraryButton.titleLabel?.textAlignment = .center
        self.libraryButton.setTitle("Select Photo\nFrom Library", for: .normal)
        
        // set button borders
        self.cameraButton.layer.borderColor = UIColor.black.cgColor
        self.cameraButton.layer.borderWidth = 1
        self.cameraButton.layer.cornerRadius = 10
        
        self.libraryButton.layer.borderColor = UIColor.black.cgColor
        self.libraryButton.layer.borderWidth = 1
        self.libraryButton.layer.cornerRadius = 10
        
        // add button targets
        self.cameraButton.addTarget(self, action: #selector(self.goToCamera), for: .touchUpInside)
        self.libraryButton.addTarget(self, action: #selector(self.goToLibrary), for: .touchUpInside)
    }
}

