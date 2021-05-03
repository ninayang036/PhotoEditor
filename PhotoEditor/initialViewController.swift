//
//  initialViewController.swift
//  PhotoEditor
//
//  Created by Yang Nina on 2021/4/22.
//

import UIKit

class initialViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var showphotoImg: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        showphotoImg.image = image
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        openLibrary()
    }
    
    @IBAction func choosephoto(_ sender: Any) {
        openLibrary()
    }
    
    func openLibrary(){
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    //圖片至editPhotoViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let controller = segue.destination as! editPhotoViewController
            let data = FilterSetting(pic: showphotoImg.image)
            controller.parameter = data
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
