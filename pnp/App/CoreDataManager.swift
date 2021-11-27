//
//  CoreDataManager.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import CoreData
import UIKit

final class CoreDataManager {

    lazy var persistentContainer: NSPersistentContainer = {
        let persistenContainer = NSPersistentContainer(name: "PnpApp")
        persistenContainer.loadPersistentStores { (_, error) in
            print(error?.localizedDescription ?? "")
        }
        return persistenContainer
    }()

    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}

// MARK: - Campaign

extension CoreDataManager {
    func saveCampaign(title: String, description: String, image: Data?, totalAmount: Decimal, reachedAmound: Decimal) {
        let campaign = Campaign(context: moc)
        campaign.setValue(title, forKey: "title")
        campaign.setValue(description, forKey: "subtitle")
        campaign.setValue(image, forKey: "imageData")
        campaign.setValue(totalAmount, forKey: "totalAmount")
        campaign.setValue(reachedAmound, forKey: "reachedAmount")

        do {
            try moc.save()
        } catch {
            print(error)
        }
    }

    func fetchCampaigns() -> [Campaign] {
        do {
            let fetchRequest = NSFetchRequest<Campaign>(entityName: "Campaign")
            let campaigns = try moc.fetch(fetchRequest)
            return campaigns
        } catch {
            print(error)
            return []
        }
    }
}

// MARK: - User

extension CoreDataManager {
    func saveUser(username:String, password: String, token: Int) {
        let user = User(context: moc)
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        user.setValue(token, forKey: "izToken")

        do {
            try moc.save()
        } catch {
            print(error)
        }
    }

    func fetchUsers() -> [User] {
        do {
            let fetchRequest = NSFetchRequest<User>(entityName: "User")
            let users = try moc.fetch(fetchRequest)
            return users
        } catch {
            print(error)
            return []
        }
    }
}
