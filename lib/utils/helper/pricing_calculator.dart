

class AppPricingCalculator{

  static double getTaxRateFromLocation(String location){
    return 0.10;
  }

  static double getShippingCost(String location){
    return 5.0;
  }


  // calculate pricing based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateFromLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //calculate tax
  static double calculateTax(double productPrice, String location){
    double taxRate = getTaxRateFromLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount;
  }


}