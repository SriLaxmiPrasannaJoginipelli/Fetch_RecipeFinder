
import XCTest
@testable import FetchRecepieApp

class RecipeViewModelTests: XCTestCase {
    var viewModel: RecipeViewModel!
    var mockNetworkManager: MockNetworkManager!

    override func setUpWithError() throws {
        // Initialize your view model and mock network manager
        mockNetworkManager = MockNetworkManager()
        viewModel = RecipeViewModel(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        // Clean up any resources after each test
        viewModel = nil
        mockNetworkManager = nil
    }

    func testFetchRecipesFailure() {
        // Arrange: Simulate error in the mock network manager
        mockNetworkManager.shouldReturnError = true
        
        // Create an expectation for the asynchronous task
        let expectation = XCTestExpectation(description: "Fetch recipes should fail")
        
        // Act: Call the fetch method
        viewModel.fetchRecipes()
        
        // Observe changes in the ViewModel's state (waiting for completion)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Assert: Check that the recipes list is empty
            XCTAssertTrue(self.viewModel.recipes.isEmpty, "Recipes should be empty on failure.")
            
            // Assert: Check that errorMessage is not nil and contains expected text
            XCTAssertNotNil(self.viewModel.errorMessage, "Error message should be set on failure.")
            XCTAssertTrue(self.viewModel.errorMessage!.contains("Failed to load recipes"), "Error message should contain 'Failed to load recipes'.")
            
            // Fulfill the expectation to indicate the async task has completed
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled (giving enough time for the async operation to complete)
        wait(for: [expectation], timeout: 2.0)
    }
}



class MockNetworkManager: NetworkingProtocol {
    var shouldReturnError = false
    
    // Mocked recipes data based on the updated `Recipe` struct
    var mockRecipes: [Recipe] = [
        Recipe(
            id: UUID(uuidString: "0c6ca6e7-e32a-4053-b824-1dbf749910d8")!, // Generating a UUID here
            cuisine: "Italian",
            name: "Pasta",
            photoUrlSmall: nil // Assuming photoUrlSmall can be nil (optional)
        ),
        Recipe(
            id: UUID(uuidString: "a87f7b22-ff69-4ac3-bb4f-5bbdfde0f87f")!,
            cuisine: "Mexican",
            name: "Tacos",
            photoUrlSmall: URL(string: "https://example.com/tacos.jpg") // Example URL for photoUrlSmall
        )
    ]

    func fetchRecipes(from url: URL, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        if shouldReturnError {
            // Simulate an error
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch recipes"])
            completion(.failure(error))
        } else {
            // Return mocked data
            completion(.success(mockRecipes))
        }
    }
}
