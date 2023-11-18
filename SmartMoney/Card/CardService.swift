

import Foundation
class CardService {
    public func getListCard(idUser:String, completion: @escaping(Result<CardList,NetworkError>) -> Void) {
        let idUser = idUser
        let cardRequest = CardRequest(firebaseId: idUser)
        let endPoint:Endpoint = Endpoint(url: "/listCard", method: .post, headers: nil, parameters: .encodable(cardRequest))
        
        APIClient.shared.request(with: endPoint, decodeType: CardList.self) { result in
            switch result {
                case .success(let success):
                    completion(.success(success))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
    
}
