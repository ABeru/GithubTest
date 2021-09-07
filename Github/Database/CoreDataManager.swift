//
//  CoreDataManager.swift
//  Github
//
//  Created by Alexandre on 03.09.21.
//

import Foundation
import CoreData
final class CoreDataManager {
    static func addFavorite(_ repos: ReposModel) {
        let context = AppDelegate.coreDataContainer.viewContext
        let eDescription = NSEntityDescription.entity(forEntityName: "Repos", in: context)
        let repositoy = Repos(entity: eDescription!, insertInto: context)
        let eDescriptio = NSEntityDescription.entity(forEntityName: "ReposOwner", in: context)
        let r = ReposOwner(entity: eDescriptio!, insertInto: context)
        r.login = repos.owner?.login
        r.avatar = repos.owner?.avatar_url
        repositoy.owner = r
        repositoy.dateCreated = repos.created_at
        repositoy.language = repos.language
        repositoy.name = repos.name
        repositoy.reposDescription = repos.description
        repositoy.url = repos.html_url
    
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    static func removeFavorite(repos: Repos, completion: @escaping (Result<Bool, Error>) -> ()) {
        let context = AppDelegate.coreDataContainer.viewContext
        context.delete(repos)

        do {
            try context.save()
            completion(.success(true))
        } catch let error {
            debugPrint(error)
            completion(.failure(error))
        }
    }


    static func fetchRepositories() -> [Repos] {
      let context = AppDelegate.coreDataContainer.viewContext
      let request: NSFetchRequest<Repos> = Repos.fetchRequest()
      do {
        let repository = try context.fetch(request)
        let repositories = repository as [Repos]
          return repositories
      } catch {
          print("ERROR: Couldn’t fetch results")
      }
      return []
    }
}

