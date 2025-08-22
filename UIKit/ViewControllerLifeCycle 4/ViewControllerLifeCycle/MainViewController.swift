//
//  ViewControllerLifeCycle
//
//

import UIKit

class MainViewController: UIViewController {
      
    // loadView is called to create or load the view. Do not use this with storyboards.
//    override func loadView() {
//        super.loadView()
//    }
    
    deinit {
        print("main vc did deinit")
    }

    // this is only called once. bounds are not yet finalized.
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load called")
    }
    
    //view is about to appear. bounds defined but not final
    //resumer observers or any kind of running tasks
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
    
    //this is called when the subViews are about to be laid
    //perfect player to change layer properties like the corner radius
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layout subviews called")
    }
    
    //this is called when the subViews have been laid
    //perfect player to change layer properties like the corner radius
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layout subview called")
    }
    
    //this is when the view is visible to the user
    //perfect for startintg an animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear called")
    }
    
    //view is about to dissapear
    //stop timers or observers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will dissapear called")
    }
    
    //view is no longer visible it has dissapeard
    //stop timers or observers
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did dissapear called")
    }
    
    @IBAction func goToNextViewController(_ sender: Any) {
        performSegue(withIdentifier: "NextSegue", sender: nil)
    }
    


}

