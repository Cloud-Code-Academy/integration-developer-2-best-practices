/**
 * @description Wrapper class to deserialize the JSON response from the Exchange Rate API
 * Students will implement the properties and methods to process the data
 */
public class ExchangeRateWrapper {
    
    // TODO: Implement properties to match the JSON structure of the API response
    // Sample response:
    // {
    //   "base": "USD",
    //   "date": "2023-02-27",
    //   "time_last_updated": 1677456002,
    //   "rates": {
    //     "EUR": 0.9488,
    //     "GBP": 0.8393,
    //     "JPY": 136.57,
    //     ...
    //   }
    // }
    
    // Add properties for base currency
    // public String base;
    
    // Add property for date
    // public String date;
    
    // Add property for time last updated
    // public Long timeLastUpdated;
    
    // Add property for rates (using a map)
    // public Map<String, Decimal> rates;
    
    /**
     * @description Converts the wrapper data to a list of Exchange_Rate__c records
     * @return List<Exchange_Rate__c> The list of exchange rate records
     */
    public List<Exchange_Rate__c> toExchangeRates() {
        // TODO: Implement the method to convert the wrapper data to Exchange_Rate__c records
        // 1. Create a list to hold the Exchange_Rate__c records
        // 2. Iterate through the rates map
        // 3. For each rate, create an Exchange_Rate__c record
        // 4. Return the list of records
        
        return null; // Replace with actual implementation
    }
    
    /**
     * @description Static method to parse the JSON response into the wrapper class
     * @param jsonResponse The JSON response from the API
     * @return ExchangeRateWrapper The parsed wrapper instance
     */
    public static ExchangeRateWrapper parse(String jsonResponse) {
        // TODO: Implement the method to parse the JSON response
        // Use JSON.deserialize or JSON.deserializeStrict to parse the response
        
        return null; // Replace with actual implementation
    }
}