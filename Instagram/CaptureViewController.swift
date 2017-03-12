//
//  CaptureViewController.swift
//  Instagram
//
//  Created by Sean Nam on 3/9/17.
//  Copyright © 2017 Sean Nam. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    var resizeImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //captionField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChoosePicButton(_ sender: Any) {
        print("[DEBUG] onchoosepicbutton")
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //vc.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func captionLabelEditingDidEnd(_ sender: Any) {
        print("[DEBUG] caption \(captionField.text)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: newSize))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    /* let parent = self.parentViewController!
     
     parent.dismissViewControllerAnimated(true, completion: {
     let vc = self.storyboard?.instantiateViewControllerWithIdentifier("OrderViewController")
     parent.presentViewController(vc!, animated: true, completion: nil)
     })
     */
    
    @IBAction func onSubmitPostButton(_ sender: Any) {
        let caption = captionField.text
        print("[DEBUG] resizeimage \(self.resizeImage) with caption \(caption)")

        Post.postUserImage(image: resizeImage, withCaption: caption) {(success: Bool, error: Error?) in
            
            if success {
                print("[DEBUG] successfully posted image \(self.resizeImage) with caption \(caption)")
                // Dismiss UIImagePickerController to go back to your original view controller
                //let homeVC = self.parent?.childViewControllers.first
                self.dismiss(animated: true, completion: nil)
                
                var tabBar = UITabBarController()
                tabBar = self.tabBarController!
                
                print("[DEBUG] tabBarController.selectedIndex = \(tabBar.selectedIndex)")
                
                tabBar.selectedIndex = 0
                
                print("[DEBUG] tabBarController.selectedIndex = \(tabBar.selectedIndex)")
                
                self.captionField.text = ""
                self.postImageView.image = nil
                                
            } else {
                print("[DEBUG] error while trying to post image \(self.resizeImage) with caption \(caption)")
            }
        }
    }
    
}
extension CaptureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        postImageView.image = originalImage
        print("[DEBUG] imagePickerController - choose \(originalImage)")
        let size = originalImage.size
        
        // Do something with the images (based on your use case)
        
        let smallerWidth = size.width * 0.7
        let smallerHeight = size.height * 0.7
        
        var smallerSize = CGSize()
        smallerSize.width = smallerWidth
        smallerSize.height = smallerHeight
        
        self.resizeImage = resize(image: originalImage, newSize: smallerSize)
        
        dismiss(animated: true, completion: nil)
    }
}
