//
//  NewCampaignViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class NewCampaignViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var viewModel: NewCampaignViewModel!
    @IBOutlet weak var newCampaignButton: UIButton!
    @IBOutlet weak var campaignDescriptionTextfield: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var campaignNameTextField: UITextField!
    @IBOutlet weak var targetAmounTextField: UITextField!
    private var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    private func prepareUI() {

    }

    @IBAction func newCampaignButtonAction(_ sender: Any) {
        viewModel.fireNewCampaign(
            title: campaignNameTextField.text,
            subtitle: campaignDescriptionTextfield.text,
            targetAmount: targetAmounTextField.text,
            image: imageView.image?.jpegData(compressionQuality: 0.4)
        )
    }
    @IBAction func uploadImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }

    }
}

// MARK: - Image picker delegate

extension NewCampaignViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
            imageView.image = image
        }

        picker.dismiss(animated: true, completion: nil);
    }
}
