import Foundation
import FirebaseAuth
import FirebaseFirestore


class CardViewModel {
    let service: CardService = CardService()
    let firebaseAuth = Auth.auth()
    let firestore = Firestore.firestore()
    private var cardList:[CardModel]  = []
    
    public var numberOfRowsInSection: Int {
        return cardList.count
    }
    
    private var delegate: CardViewModelProtocol?
    
    public func delegate(delegate: CardViewModelProtocol?) {
        self.delegate = delegate
    }
    
    
    public func getListCard() {
        let idUser = firebaseAuth.currentUser?.uid ?? ""
        service.getListCard(idUser: idUser) { result in
            switch result {
                case .success(let success):
                    self.cardList = success
                    self.delegate?.sucessGetListCard(listCard: success)
                case .failure(_):
                    self.delegate?.errorGetListCard()
            }
        }
    }
    
    
    func loadCurrentCategory(indexPath: IndexPath) -> CardModel {
        return cardList[indexPath.row]
    }
    
}
