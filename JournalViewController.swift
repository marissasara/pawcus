import UIKit

class JournalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMicrophone" {
            guard let microphoneVC = segue.destination as? MicViewController else {
                // Handle the case where the cast fails
                return
            }
            // Pass the selected object to the new view controller.
            // You can perform additional setup for microphoneVC here
        }
    }

}
