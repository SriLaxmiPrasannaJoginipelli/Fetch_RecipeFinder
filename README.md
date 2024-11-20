***FetchRecipeApp***

*Description*

FetchRecipeApp is an iOS application that fetches a list of recipes from an external API and displays them in a clean and user-friendly interface. The app allows users to view a list of recipes and refresh the recipe list. The app uses SwiftUI for the UI and incorporates best practices such as image caching and asynchronous data fetching.

The app is built with modern iOS technologies, including Swift, UIKit, Combine, and SwiftUI. It also includes automated UI tests to ensure the correct loading of the recipe list and other components.

*Features*

Recipe List View: Displays a list of recipes fetched from an external API.
Image Caching: Recipes include images that are cached for faster loading.
Error Handling: Displays an error message if the app fails to fetch recipes.
Loading State: Shows a loading spinner while fetching data.
Refresh Button: Allows the user to refresh the recipe list manually.
Automated UI Testing: Includes UI tests to verify the proper functioning of the app.
Technologies Used

SwiftUI: For building the user interface.
UIKit: Used for legacy UI components and integrating with SwiftUI.
Combine: For managing the reactive data flow.
XCTest: For writing unit and UI tests.
URLSession: For fetching data from a remote API.
NSCache: For caching images to improve performance.
Installation

***To run the FetchRecipeApp on your local machine, follow these steps:***

*Clone the repository:*
git clone https://github.com/SriLaxmiPrasannaJoginipelli/Fetch_RecipeFinder.git

*Open the project in Xcode:*
open FetchRecipeApp.xcodeproj
Run the app in the iOS simulator or on a physical device.

*Usage*

Launch the app: Upon launching, the app will fetch the list of recipes.
Browse recipes: Scroll through the list of recipes.
Refresh the list: Press the "Refresh" button to fetch the list of recipes again.
