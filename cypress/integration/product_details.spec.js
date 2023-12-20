describe("products", () => {
  it("should visit homepage", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("displays product details", () => {
    cy.get(".products article").within(() => {
      cy.get("h1 span").first().should("exist");
      cy.get("h1 span").last().should("exist");
      cy.get("img").should("exist");
    });
  });

  it("adding to cart for available products", () => {
    cy.get(".products article").within(() => {
      cy.get(".btn").contains("Add").click({ force: true });
    });
  });
  it("displays 'Sold Out' for out-of-stock products", () => {
    cy.get(".products article").within(() => {
      // Assuming the 'Sold Out' button has the class 'soldout'
      cy.get(".soldout").should("exist"); // Checking if 'Sold Out' button exists
      cy.get(".btn.disabled").should("exist"); // Checking if 'Add to Cart' button is disabled
    });
  });
});
