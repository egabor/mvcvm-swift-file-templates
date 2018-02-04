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
import RxDataSources

class ___VARIABLE_moduleName___ViewController: UIViewController {

    // MARK: - let constants

    let disposeBag = DisposeBag()

    // The viewmodel must be let!
    // To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel = ___VARIABLE_moduleName___ViewModel()

    // MARK: - var variables

    lazy var dataSource = RxTableViewSectionedReloadDataSource<TableViewSection>(configureCell: { [weak self] dataSource, tableView, indexPath, item in
        return (self?.bindCell(tableView, item))!
    })

    // MARK: - Interface Builder Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - ViewController Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = nil

        // Uncomment if the cells are self-sizing
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 140

        setUpBindings()
    }

    deinit {
        // Don't forget to remove the observers here
    }

    func setUpBindings() {

        // MARK: - Section Binding

        viewModel.sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        // MARK: - Selection Handling

        tableView.rx
            .modelSelected(Bindable.self)
            .subscribe(onNext: { value in
                print("Tapped `\(value)`")
            })
            .disposed(by: disposeBag)

        /*
        tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                print("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)
        */

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

    func bindCell(_ tableView: UITableView, _ item: Bindable) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(type(of: item))Cell")
        if let bindableCell = cell as? ReactiveBindable {
            bindableCell.bind(to: item)
        }
        return cell!
    }

}

// MARK: - Interface Builder Actions

extension ___VARIABLE_moduleName___ViewController {

}

// MARK: - Notification handlers can be placed here

extension ___VARIABLE_moduleName___ViewController {

}
