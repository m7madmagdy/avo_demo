import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["card"];

  async connect() {
    console.log("Filter controller connected");
    this.initializeFilters();

    // Listen for Turbo Frame reload events
    document.addEventListener("turbo:frame-load", () => {
      console.log("Turbo Frame reloaded");
    });
  }

  initializeFilters() {
    const params = new URLSearchParams(window.location.search);
    const startDate = params.get("start_date");
    const endDate = params.get("end_date");

    // Set the input values from the URL if they exist
    if (startDate) {
      document.querySelector("[name='start_date']").value = startDate;
    }
    if (endDate) {
      document.querySelector("[name='end_date']").value = endDate;
    }
  }

  async applyFilter(event) {
    event.preventDefault(); // Prevent default form submission

    // Collect filter values
    const startDate = document.querySelector("[name='start_date']").value;
    const endDate = document.querySelector("[name='end_date']").value;

    // Update the URL parameters
    const params = new URLSearchParams(window.location.search);
    if (startDate) {
      params.set("start_date", startDate);
    }
    if (endDate) {
      params.set("end_date", endDate);
    }

    window.history.pushState({}, "", `?${params.toString()}`);

    // Refresh the card content
    await this.loadCard(startDate, endDate);
  }

  async loadCard(startDate, endDate) {
    console.log("Refreshing card content...");
    console.log(`Filters: start_date=${startDate}, end_date=${endDate}`);

    try {
      const dashboardId = "dashy"; // Replace with your dashboard ID
      const cardId = "custom_card"; // Replace with your card ID
      const params = new URLSearchParams({ start_date: startDate, end_date: endDate });

      // Update Turbo Frame src
      const turboFrame = document.querySelector("turbo-frame#dashy_custom_card");
      turboFrame.src = `/avo/dashboards/${dashboardId}/cards/${cardId}?${params.toString()}`;
    } catch (error) {
      console.error("Error refreshing card content:", error);
    }
  }
}
