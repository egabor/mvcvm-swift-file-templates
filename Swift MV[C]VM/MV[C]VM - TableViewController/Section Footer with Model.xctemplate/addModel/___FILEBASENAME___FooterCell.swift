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

class ___FILEBASENAMEASIDENTIFIER___FooterCell: UITableViewCell, ReactiveBindable {
    
    // MARK: - let constants
    
    let disposeBag = DisposeBag()
    
    // The viewmodel must be let!
    // To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel = ___FILEBASENAMEASIDENTIFIER___FooterCellViewModel()
    
    // MARK: - var variables
    
    // MARK: - Interface Builder Outlets
    
    // MARK: - UITableViewCell Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpBindings()
    }
    
    deinit {
        // Don't forget to remove the observers here
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUpBindings() {
        // TODO: Do the viewmodel binding here
    }
    
    func bind(to model: Bindable?) {
        guard let data = (model as? ___FILEBASENAMEASIDENTIFIER___Footer) else {
            return
        }
        viewModel.model = data
    }
    
    // MARK: - Helper Methods
    
}

// MARK: - Interface Builder Actions

extension ___FILEBASENAMEASIDENTIFIER___FooterCell {
    
}

// MARK: - Notification handlers can be placed here

extension ___FILEBASENAMEASIDENTIFIER___FooterCell {
    
}
