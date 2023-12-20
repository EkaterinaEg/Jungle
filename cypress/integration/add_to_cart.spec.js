describe("addToCart", () => {
  it("should visit homepage", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("should confirm that the count of the cart button changes when adding products to it", () => {
    cy.get(".products article").within(() => {
      cy.get(".btn").contains("Add").click({ force: true });
    });
    cy.wait(2000);
    cy.get(".nav-item.end-0").within(() => {
      cy.get(".nav-link").invoke("text").should("include", `My Cart (1)`);
    });
  });
});
