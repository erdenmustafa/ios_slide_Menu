

import UIKit
import ENSwiftSideMenu

class ViewController: UIViewController, ENSideMenuDelegate, UIPopoverPresentationControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    @IBAction func btnPopup(_ sender: UIButton) {
        addCategory()
    }
    
    func addCategory() {

        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "NewCategory"))! as UIViewController
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: 200, height: 300)
        popover!.delegate = self
        popover!.sourceView = self.view
        let w = view.frame.width - 100
        popover!.sourceRect = CGRect(x: w, y: 100, width: 0, height: 0)

        self.present(nav, animated: true, completion: nil)

   }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {

            return UIModalPresentationStyle.none
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleSideMenuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
}

