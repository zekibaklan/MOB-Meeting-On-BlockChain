//
//  FirestoreData.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 9.10.2023.
//

import Foundation
import FirebaseFirestore

class FirestoreModel : ObservableObject {
    
    @Published var fireStoreData: fsData? = nil
    
    private var db = Firestore.firestore()
    init()
    {
        fetchData()
    }
    func fetchData() {
   
        db.collection("roomcode:98765").document("98765").addSnapshotListener { documentSnapshot, error in
            if let error = error {
                print("Dinleme sırasında hata oluştu: \(error.localizedDescription)")
                return
            }

            guard let document = documentSnapshot else {
                print("Belge mevcut değil veya bir hata oluştu.")
                return
            }

            guard let data = document.data() else {
                print("Belge verisi boş.")
                return
            }

           
           

            if let eventDateTimestamp = data["eventDate"] as? Timestamp {
                
                // Timestamp'i Date'e çevir
                let eventDate = eventDateTimestamp.dateValue()
                
                // Veriyi kullanmak için burada gerekli işlemleri yapabilirsiniz
                self.fireStoreData = fsData(id: "--", fireStoreUid: data["fireStoreUid"] as? String ?? "",
                                            eventTitle: data["eventTitle"] as? String ?? "",
                                            eventDate: eventDate,
                                            roomCode: data["roomCode"] as? String ?? "",
                                            createrPublickey: data["createrPublickey"] as? String ?? "")
            }
        }

    }
    
}
