import Foundation

enum DownloadError: Error {
    case invalidID
}

func downloadData(resourceID: Int) async throws -> String {
    // Убрали песочные часы
    print("START: Loading resource #\(resourceID)...")
    
    for i in 1...3 {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        // Убрали иконку загрузки
        print("   PROGRESS [\(resourceID)]: \(i * 33)%")
    }
    
    if resourceID < 0 { throw DownloadError.invalidID }
    
    // Убрали зеленую галочку
    return "SUCCESS: Resource #\(resourceID) loaded."
}

@main
struct App {
    static func main() async {
        // Убрали ракету
        print("LOG: Simulation started...")
        let ids = [101, -1, 103]
        
        await withTaskGroup(of: Void.self) { group in
            for id in ids {
                group.addTask {
                    do {
                        let result = try await downloadData(resourceID: id)
                        print(result)
                    } catch {
                        // Убрали красный крестик
                        print("ERROR: Failed to load #\(id): Invalid ID")
                    }
                }
            }
        }
        // Убрали финишный флаг
        print("LOG: All processes completed.")
    }
}