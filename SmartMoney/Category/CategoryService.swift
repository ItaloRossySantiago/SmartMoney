

import Foundation
class CategoryService {
    public func getListCategory(idUser:String, completion: @escaping(Result<CategoryList,NetworkError>) -> Void) {
        let idUser = idUser
        let categoryRequest = CategoryRequest(firebaseId: idUser)
        let endPoint:Endpoint = Endpoint(url: "/listCategory", method: .post, headers: nil, parameters: .encodable(categoryRequest))
        
        APIClient.shared.request(with: endPoint, decodeType: CategoryList.self) { result in
            switch result {
                case .success(let success):
                    completion(.success(success))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
}
