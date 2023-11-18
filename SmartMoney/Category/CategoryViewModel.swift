import Foundation
import FirebaseAuth
import FirebaseFirestore

class CategoryViewModel {
    let service: CategoryService = CategoryService()
    let firebaseAuth = Auth.auth()
    let firestore = Firestore.firestore()
    private var categoryList:[CategoryModel]  = []
    
    public var numberOfRowsInSection: Int {
        return categoryList.count
    }
    
    private var delegate: CategoryViewModelProtocol?
    
    public func delegate(delegate: CategoryViewModelProtocol?) {
        self.delegate = delegate
    }
    
    
    public func getListCategory() {
        let idUser = firebaseAuth.currentUser?.uid ?? ""
        service.getListCategory(idUser: idUser) { result in
            switch result {
                case .success(let success):
                    self.categoryList = success
                    self.delegate?.sucessGetListCategory(listCategory: success)
                case .failure(_):
                    self.delegate?.errorGetListCategory()
            }
        }
    }
    
    
    func loadCurrentCategory(indexPath: IndexPath) -> CategoryModel {
        return categoryList[indexPath.row]
    }
    
    
}
