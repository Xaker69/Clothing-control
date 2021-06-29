import UIKit
import Kingfisher

class ThingViewController: UIViewController {

    var mainView: ThingView {
        return view as! ThingView
    }
    
    override func loadView() {
        let view = ThingView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.plusButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
    }
    
    @objc private func addPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
    
}

extension ThingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            mainView.imageView.image = image
            mainView.plusButton.isHidden = true
            picker.dismiss(animated: true)
        }
    }
    
}
