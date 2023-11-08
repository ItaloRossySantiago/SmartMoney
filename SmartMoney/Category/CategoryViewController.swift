import Foundation
import UIKit

class CategoryViewController: UIViewController {
    let viewModel = CategoryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        hideKeyBoardWhenTappedAround()
        view.backgroundColor = .red
    }
    
    
    private func setupView() {
       // view.addSubview()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
        
        
        ])
    }
    
    
}


extension CategoryViewController : UITableViewDataSource, UITableViewDelegate {
    
    
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
