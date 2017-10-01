//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import RxCocoa
import RxSwift

class ___VARIABLE_moduleName___FooterCell: UITableViewCell {

    // MARK: - let constants

    let disposeBag = DisposeBag()

    // The viewmodel must be let!
    // To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel = ___VARIABLE_moduleName___FooterCellViewModel()

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

    // MARK: - Helper Methods

}

// MARK: - Reacive Bindable Implementation

extension ___VARIABLE_moduleName___FooterCell: ReactiveBindable {

    func setUpBindings() {
        // TODO: Do the viewmodel binding here
    }

    func bind(to model: Bindable?) {
        guard let model = model as? ___VARIABLE_moduleName___Footer else { return }
        viewModel.model = model
    }

}

// MARK: - Interface Builder Actions

extension ___VARIABLE_moduleName___FooterCell {

}

// MARK: - Notification handlers can be placed here

extension ___VARIABLE_moduleName___FooterCell {

}
