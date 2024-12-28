import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["card"];

  async connect() {
    console.log("Dashboard card controller connected");
    await this.refresh(); // Apply filters when the controller connects
  }

  async refresh(event) {
    let filterType;
    let filterValue;

    if (event) {
      filterType = event.target.name;
      filterValue = event.target.value;
      const params = new URLSearchParams(window.location.search);
      params.set(filterType, filterValue);
      window.history.pushState({}, '', '?' + params.toString());
    } else {
      // If no event (i.e., initial load), get the values from the current URL
      const params = new URLSearchParams(window.location.search);
      filterType = params.get("time_range") || "7 days"; // Default to "7 days" if not set
      filterValue = params.get("country") || "USA"; // Default to "USA" if not set
    }

    console.log("Selected filter type:", filterType);
    console.log("Selected filter value:", filterValue);

    // Optionally, you could make an AJAX request here to fetch the filtered data
    // For example, if you want to refresh the card content dynamically:
    this.loadCard(filterType, filterValue);
  }

  async loadCard(filterType, filterValue) {
    // Add logic to apply the filters to the card content
    console.log("Refreshing card content...");
    console.log(`Applying filter for ${filterType}: ${filterValue}`);

    // Optionally, make an AJAX request to fetch the filtered data
    // Here, for simplicity, we just simulate reloading the card
    // If you're using Rails, you can trigger a fetch to update the content
    location.reload(); // You could replace this with AJAX logic if needed
  }
}