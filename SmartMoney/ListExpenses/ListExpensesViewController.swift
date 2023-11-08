import Foundation
import UIKit

class ListExpensesViewController: UIViewController {
    let viewModel = ListExpensesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        hideKeyBoardWhenTappedAround()
        
    }
    
    
    private func setupView() {
       // view.addSubview()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
        
        
        ])
    }
    
    
}


extension ListExpensesViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: HomeCustomTableViewCell.identifier, for: indexPath) as? HomeCustomTableViewCell
       // cell?.setupHomeCell(data: homeViewModel.loadCurrentExpense(indexPath: indexPath))
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        0
    }
    
    
}
