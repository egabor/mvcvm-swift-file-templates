//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import RxCocoa
import RxSwift

class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController {
    
    // MARK: - let constants
    
    let disposeBag = DisposeBag()
    
    // The viewmodel must be let! To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel: ___FILEBASENAMEASIDENTIFIER___ViewModel = ___FILEBASENAMEASIDENTIFIER___ViewModel()
    
    
    // MARK: - var variables
    
    
    // MARK: - Interface Builder Outlets
    
    
    // MARK: - UIViewController Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Do the viewmodel binding here
        
    }
    
    deinit {
        // Don't forget to remove the observers here
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Helper Methods

}

// MARK: - Interface Builder Actions

extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    
}

// MARK: - Notification handlers can be placed here

extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    
}
