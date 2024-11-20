import XCTest

final class FetchRecepieAppUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    // Test for checking if the recipe list is loaded
    @MainActor
    func testRecipeListLoaded() throws {
        // Give the app some time to render the RecipeListView
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let table = self.app.tables["RecipeListView"]
            
            // Wait for the table to exist
            let exists = table.waitForExistence(timeout: 20)
            
            // Assert that the table exists
            XCTAssertTrue(exists, "The recipe list table should appear within the timeout.")
        }
    }


}
