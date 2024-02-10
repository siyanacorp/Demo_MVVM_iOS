//
//  MarvelSuperHeroVM.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Combine
import Foundation
/// ViewModel for a list of Marvel superheroes, responsible for fetching the superheroes from a web service and providing access to them for display.
class MarvelSuperHeroListVM: ObservableObject {
    /// superHeros: An array of MarvelSuperHeroModel objects representing the superheroes.
    @Published var superHeros: [MarvelSuperHeroModel]?
    
    /// manager: The web service manager responsible for making network requests.
    private let manager = WebServiceManager.shared
    
    /// allSuperHeros: A static resource representing the endpoint to fetch all superheroes from the web service.
    static var allSuperHeros: Resource<[MarvelSuperHeroModel]> = {
        let urlString = "https://simplifiedcoding.net/demos/marvel/"
        var resource = Resource<[MarvelSuperHeroModel]>(url: urlString)
        resource.httpMethod = HttpMethod.get
        resource.body = nil
        return resource
    }()
    
    /**
     Performs an asynchronous operation to fetch superheroes from a web service endpoint.
     
     - Task: Asynchronously fetches superheroes using the manager's request method.
     - @MainActor: Ensures execution on the main actor for UI safety.
     - Parameters: None.
     - Returns: None.
     - Throws: Any error encountered during the request or decoding process.
     */
    @MainActor func fetchSuperHeros(){
        GlobalLoader.shared.showLoader(title: AppText.shared.loadingTitle)
        Task{
            do{
                let superHeros:[MarvelSuperHeroModel] = try await manager.request(resource: MarvelSuperHeroListVM.allSuperHeros)
                self.superHeros = superHeros
                GlobalLoader.shared.hideLoader()
            }catch let error as DataError {
                GlobalLoader.shared.hideLoader()
                switch error {
                case .invalidResponse(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .invalidURL(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .invalidData(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .connectivityError(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .network(let underlyingError):
                    if let error = underlyingError {
                        print("🛑 Network error: \(error.localizedDescription)")
                        ToastManager.shared.showToast(message: "🛑 Network error: \(error.localizedDescription)")
                        // Handle network error case
                    } else {
                        print("🛑 Network error")
                        ToastManager.shared.showToast(message: "🛑 Network error")
                        // Handle generic network error case
                    }
                }
            } catch {
                GlobalLoader.shared.hideLoader()
                print("🛑 \(error)")
                print("🛑 \(error.localizedDescription)")
                ToastManager.shared.showToast(message: "🛑 \(error.localizedDescription)")
                // Handle other types of errors
            }
        }
    }
}

extension MarvelSuperHeroListVM {
    /// superHerosPublisher is a publisher that emits an optional array of MarvelSuperHeroModel instances or never fails. It receives updates from the superHeros property, dispatches events on the main thread, and erases its type to AnyPublisher.
    var superHerosPublisher: AnyPublisher<[MarvelSuperHeroModel]?, Never> {
        $superHeros
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


extension MarvelSuperHeroListVM{
    /// Returns the number of sections in the list of Marvel superheroes, which is always 1.
    var numberOfSections:Int{
        return 1
    }
    
    /**
     Returns the number of rows in the specified section of the list of Marvel superheroes, which is equal to the count of superhero models in the array.
     
     - Parameter section: The section index for which the number of rows is requested.
     - Returns: The number of rows in the specified section.
     */
    func numberOfRowsInSection(_ section: Int) -> Int{
        return self.superHeros?.count ?? 0
    }
    
    /**
     Retrieves the view model for the Marvel superhero at the specified index in the list.
     
     - Parameter index: The index of the superhero in the list.
     - Returns: The view model representing the superhero at the specified index.
     */
    func superHeroAtIndex(_ index: Int) -> MarvelSuperHeroVM?{
        guard let superHero = self.superHeros?[index] else{
            return nil
        }
        return MarvelSuperHeroVM(superHero)
    }
}


/// ViewModel for a Marvel superhero, providing access to various properties like bio, name, image URL, etc.
struct MarvelSuperHeroVM {
    private let superHero: MarvelSuperHeroModel
}

extension MarvelSuperHeroVM{
    /**
     Initializes the MarvelSuperHeroVM with a MarvelSuperHeroModel instance.
     
     - Parameter superHero: The MarvelSuperHeroModel instance to be encapsulated by the view model.
     */
    init(_ superHero: MarvelSuperHeroModel){
        self.superHero = superHero
    }
}

extension MarvelSuperHeroVM{
    var bio: String{
        return self.superHero.bio ?? String()
    }
    
    var createdby: String{
        return self.superHero.createdby ?? String()
    }
    
    var firstappearance: String{
        return self.superHero.firstappearance ?? String()
    }
    
    var imageurl: String{
        return self.superHero.imageurl ?? String()
    }
    
    var name: String{
        return self.superHero.name ?? String()
    }
    
    var publisher: String{
        return self.superHero.publisher ?? String()
    }
    
    var realname: String{
        return self.superHero.realname ?? String()
    }
    
    var team: String{
        return self.superHero.team ?? String()
    }
}
