import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var totalPictures = 0
    var pictureSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Picture \(pictureSelected) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendApp))


        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
//    @objc func shareTapped() {
//        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
//            print("No image found")
//            return
//        }
//        
//        let vc = UIActivityViewController(activityItems: [image, selectedImage?.replacingOccurrences(of: ".jpg", with: "")], applicationActivities: [])
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        present(vc, animated: true)
//    }
    
    @objc func recommendApp() {
        let textToShare = "Check out this app!"
        let appLink = "https://apps.apple.com/us/app/facebook/id284882215"
        let objectToShare = [textToShare, appLink]
        let vc = UIActivityViewController(activityItems: objectToShare, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.backBarButtonItem
        present(vc, animated: true)
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
